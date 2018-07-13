package com.finalc.auction;


import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.finalc.auction.service.InterBoardService;
import com.finalc.auction.common.FileManager;
import com.finalc.auction.common.MyUtil;
import com.finalc.auction.model.BoardVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.CommentVO;
import com.finalc.auction.model.MemberVO;
import com.finalc.auction.model.PhotoVO;

@Controller
@Component
public class BoardController {
// 게시판 컨트롤러
	@Autowired
	private InterBoardService service;
	
	@Autowired 
	private FileManager fileManager;
	
	// 메인 페이지
	@RequestMapping(value="/index.action", method={RequestMethod.GET})  
	public String index(HttpServletRequest req) {
		HttpSession session = req.getSession();
		List<CategoryVO> categoryList = service.getCategoryList();
		
		List<CategoryVO> categoryDetailList = service.getCategoryDetailList();
		
		session.setAttribute("categoryList", categoryList);
		session.setAttribute("categoryDetailList", categoryDetailList);
		
		return "main/index.tiles";
	}
	
	// 게시판 글쓰기 폼 시작 스마트에디터 사용(07.03)
	@RequestMapping(value="/write.action", method={RequestMethod.GET})  
	public String write(HttpServletRequest req) {
		
		String boardno = req.getParameter("boardno");
		String groupno = req.getParameter("groupno");
		String deptthno = req.getParameter("deptthno");
		
		req.setAttribute("boardno", boardno);
		req.setAttribute("groupno", groupno);
		req.setAttribute("depthno", deptthno);
		
		
		return "board/write.tiles";
	} // 게시판 글쓰기 폼 스마트에디터 사용 끝(07.03)
	
	
	// 게시판 글 목록 페이지 (페이징 처리한거) 시작(07.03)
	@RequestMapping(value="/boardlist.action", method={RequestMethod.GET})  
	public String boardlist(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		session.setAttribute("viewcountPermission", "yes");
		
		List<BoardVO> boardList = null;
		
		String colname = req.getParameter("colname");
		String search = req.getParameter("search");
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("colname", colname);
		map.put("search", search);
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo");
		
		int totalCount = 0;        // 총 게시물 수
		int sizePerPage = 5;       // 한페이지 당 보여줄 페이지 수
		int currentShowPageNo = 0; // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지
		int totalPage = 0;		   // 총페이지수 (웹브라우저상에 보여줄 총 페이지 갯수)	
		
		int startRno = 0;          // 시작행 번호
		int endRno = 0;            // 끝행 번호
		
		int blockSize = 10;        // "페이지바" 에 보여줄 페이지의 갯수    
		
		
		if((colname != null && search != null) && 
		   (!colname.equals("null") && !search.equals("null")) && 
		   (!colname.trim().isEmpty() && !search.trim().isEmpty())
			) {
				totalCount = service.getTotalCount2(map); // 검색어 있는 총 게시물 수
		}
		else {
				totalCount = service.getTotalCount(); // 검색어 없는 총 게시물 수
		}
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		if(str_currentShowPageNo == null) {
			
			currentShowPageNo = 1;
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo> totalPage) {
					currentShowPageNo = 1;
				}
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		startRno = (currentShowPageNo - 1) * sizePerPage + 1;
		endRno = startRno + sizePerPage - 1;
		
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		if((colname != null && search != null) &&
			(!colname.equals("null") && !search.equals("null")) &&	
			(!colname.trim().isEmpty() && !search.trim().isEmpty())
			) {
				boardList = service.boardList2(map); // 검색어가 있는 페이징처리
			}
		else {
				boardList = service.boardList(map); // 검색어가 없는 페이징처리
		}
		
		// 페이지바
		String pagebar = "<ul>";
		pagebar += MyUtil.getSearchPageBar("boardlist.action", currentShowPageNo, sizePerPage, totalPage, blockSize, colname, search, null);
		pagebar += "<ul>";
		
		String goBackURL = MyUtil.getCurrentURL(req);
		session.setAttribute("goBackURL", goBackURL);
		
		req.setAttribute("pagebar", pagebar);
		
		req.setAttribute("boardList", boardList);
		req.setAttribute("colname", colname);
		req.setAttribute("search", search);

		return "board/boardlist.tiles";
	}// 게시판 글 목록 페이지 (페이징 처리한거) 끝(07.03)
	
	
	// 게시글 쓰기 완료 (07.03 시작)
	@RequestMapping(value="/writeEnd.action", method={RequestMethod.POST})
	public String writeEnd(BoardVO boardvo, MultipartHttpServletRequest req, HttpSession session) {
		
		// # 137. 사용자가 쓴 글에 파일이 첨부된 것인지 첨부되지 않은것인지 구분 지어야한다.
		
		//______________________________________첨부파일이 있는경우 파일업로드 하기 시작_______________________________________//
			if(!boardvo.getAttach().isEmpty()) {
			  // attach가 비어있지 않다면(첨부파일이 있는 경우라면)
				
				
				// WAS의 webapp의 절대경로를 알아야한다.
				String root = session.getServletContext().getRealPath("/");
				String path = root + "resources" + File.separator + "files"; 
				
				String newFileName = "";
			
				
				byte[] bytes = null;
				
				
				long fileSize = 0;
			
				
				try {
					bytes = boardvo.getAttach().getBytes();
				
					newFileName = fileManager.doFileUpload(bytes, boardvo.getAttach().getOriginalFilename(), path);
					
					boardvo.setFileName(newFileName);
					boardvo.setOrgFilename(boardvo.getAttach().getOriginalFilename());
				
					fileSize = boardvo.getAttach().getSize();
					
					boardvo.setFileSize(String.valueOf(fileSize));
					
				} catch (Exception e) {
					
				}
				

			}
		//______________________________________첨부파일이 있는경우 파일업로드 하기 끝_______________________________________//
		
		String content = boardvo.getContent().replaceAll("\r\n", "<br/>");
		boardvo.setContent(content);

		int n = 0;
		if(boardvo.getAttach().isEmpty()) {
			// 파일 첨부가 없다면
			n = service.write_add(boardvo);
		}
		if(!boardvo.getAttach().isEmpty()) {
			// 파일 첨부가 있다면
			n = service.write_withFile(boardvo);
		}

		req.setAttribute("n", n);
		
		return "board/writeEnd.tiles";
		
	} // 게시글 쓰기 완료 (07.03 끝)
	
	
	
	// 쓴 글 1개 보여주기 (07.05 시작)
	@RequestMapping(value="/writeview.action", method={RequestMethod.GET})
	public String writeview(HttpServletRequest req) {
		
		String boardno = req.getParameter("boardno");
		
		BoardVO boardvo = null;
		
		HttpSession session = req.getSession();
		
		if("yes".equals(session.getAttribute("viewcountPermission"))) {
			
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			
			String userid = null;
			
			if(loginuser != null) {
				
				userid = loginuser.getUserid();

			}
			
			boardvo = service.getWriteView(boardno, userid);
			
			session.removeAttribute("viewcountPermission");
		}
		else {
			
			boardvo = service.getNoviewCountWriteView(boardno);
		}
		
		String goBackURL = (String)session.getAttribute("goBackURL");
		req.setAttribute("goBackURL", goBackURL);
		session.removeAttribute("goBackURL");
		
		req.setAttribute("boardvo", boardvo);
		
		// 댓글 내용 가져오기 (07.05 시작)
		List<CommentVO> commentList = service.commentList(boardno);
		req.setAttribute("commentList", commentList);
		// 댓글 내용 가져오기 (07.05 끝)
						
		return "board/writeview.tiles";
	}// 쓴 글 1개 보여주기 (07.05 끝)
	
	// 게시글 수정하기 (07.06 12:07 시작)
	@RequestMapping(value="/writeedit.action", method={RequestMethod.GET})
	public String auctionLogin_writeedit(HttpServletRequest req, HttpServletResponse res) {
		
		String boardno = req.getParameter("boardno");
		
		BoardVO boardvo = service.getNoviewCountWriteView(boardno);
		
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
	
		if(!loginuser.getUserid().equals(boardvo.getFk_userid())) {
			String msg = "글 수정은 작성자만 가능합니다.";
			String loc = "javascript:history.back()";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}
		else {
			req.setAttribute("boardvo", boardvo);
			
			return "board/writeedit.tiles";
		}

	}// 게시글 수정하기 (07.06 12:17 끝)
	
	
	// 게시글 수정페이지 완료 (07.06 12:17 시작)
	@RequestMapping(value="/writeeditEnd.action", method={RequestMethod.POST})
	public String writeeditEnd(BoardVO boardvo, HttpServletRequest req) {
		
		String content = boardvo.getContent().replaceAll("\r,\n", "<br/>");
		
		boardvo.setContent(content);
		
		int n = service.writeedit(boardvo);
		
		req.setAttribute("n", n);
		req.setAttribute("boardno", boardvo.getBoardno());

		return "board/writeeditEnd.tiles";
	}// 게시글 수정페이지 완료 (07.06 12:26 끝)
	
	// 게시글 삭제 (07.06 17:20 시작)
	@RequestMapping(value="/writedel.action", method={RequestMethod.GET})
	public String auctionLogin_del(HttpServletRequest req, HttpServletResponse res) {
		
		// 삭제해야할 글번호 가져오기
		String boardno = req.getParameter("boardno");
		
		// 삭제되어질 글은 자신이 작성한 글이어야만 가능하다.
		// 삭제되어질 글내용을 읽어오면 작성자를 알 수 있다.
		BoardVO boardvo = service.getNoviewCountWriteView(boardno);
		
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		if(!loginuser.getUserid().equals(boardvo.getFk_userid())) {
			String msg = "게시글 삭제는 작성자만 가능합니다.";
			String loc = "javascript:history.back()";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}
		else {
			// 삭제해야할 글번호를 request 영역에 저장시켜서 view 단 페이지로 넘긴다.
			req.setAttribute("boardno", boardno);

			// view단 페이지 del.jsp 로 넘긴다.
			return "board/writedel.tiles";
			// /Board/src/main/webapp/WEB-INF/views2/board/del.jsp 파일을 생성한다. 
		}// 게시글 삭제 (07.06 17:24 끝)
		
	}
	
	// 게시글 삭제 완료 (07.06 17:28 시작)
	@RequestMapping(value="/writedelEnd.action", method={RequestMethod.POST})
	public String delEnd(HttpServletRequest req) throws Throwable {
	      
		
	/*
		 글 삭제를 하려면 원본글의 암호와 삭제시 입력해주는 암호가 일치할때만
		 삭제가 가능하도록 해야 한다.
		 서비스단에서 글삭제를 처리한 결과를 int 타입으로 받아오겠다.  
	*/
		String boardno = req.getParameter("boardno");
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("boardno", boardno);
		
		
		int n = service.writedel(map);
		// 넘겨받은 값이 1(원게시글 및 딸린 댓글까지 삭제 성공)이면 글삭제 성공,
		// 넘겨받은 값이 2(딸린 댓글없는 경우 원게시글만 삭제 성공)이면 글삭제 성공,
		// 넘겨받은 값이 0이면 글삭제 실패(암호가 틀리므로)
		
		req.setAttribute("n", n);
		
		return "board/writedelEnd.tiles";
		// /Board/src/main/webapp/WEB-INF/views2/board/delEnd.jsp 파일을 생성한다. 
	}// 게시글 삭제 완료 (07.06 17:28 끝)
	
	
	// 댓글 쓰기 (07.07 11:42 시작)
	@RequestMapping(value="/writeComment.action", method={RequestMethod.POST})
	public String auctionLogin_writeComment(HttpServletRequest req, HttpServletResponse res, CommentVO commentvo)throws Throwable {
		
		int n = service.writeComment(commentvo);
		
		JSONArray jsonarr = new JSONArray();
		String str_jsonarr = null;
		
		if(n != 0) {
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("fk_userid", commentvo.getFk_userid());
			jsonobj.put("cm_content", commentvo.getCm_content());
			jsonobj.put("cm_writeday", MyUtil.getNowTime());
			
			jsonarr.put(jsonobj);
		}
		
		str_jsonarr = jsonarr.toString();
		
		req.setAttribute("str_jsonarr", str_jsonarr);
		
		return "writeCommentEndJSON.notiles";
	}// 댓글 쓰기 (07.07 11:52 끝)
	
	// 첨부파일 다운로드 하기 (07.13 10:21 시작)
	@RequestMapping(value="/download.action", method={RequestMethod.GET})
	public void auctionLogin_download(HttpServletRequest req, HttpServletResponse res) {
		String boardno = req.getParameter("boardno");
		
		BoardVO vo = service.getNoviewCountWriteView(boardno);
		
		String fileName = vo.getFileName();
		String orgFilename = vo.getOrgFilename();
		
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/");
		String path = root + "resources" + File.separator + "files";
		
		boolean bool = false;
		bool = fileManager.doFileDownload(fileName, orgFilename, path, res);
		
		if(!bool) {
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = null;
			
			try {
				writer = res.getWriter();
				
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			writer.println("<script type='text/javascript'> alert('파일 다운로드 실패');</script>");
			
		}
		
		
	} // 첨부파일 다운로드 하기 (07.13 10:40 끝)
	
	// 첨부파일 업로드 하기 (07.13 10:40 시작)
	@RequestMapping(value="/image/photoUpload.action", method={RequestMethod.POST})
	public String photoUpload(PhotoVO photovo, HttpServletRequest req) {
	    
		String callback = photovo.getCallback();
	    String callback_func = photovo.getCallback_func();
	    String file_result = "";
	    
		if(!photovo.getFiledata().isEmpty()) {
			// 파일이 존재한다라면
			
			/*
			   1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다.
			   >>>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기
			        우리는 WAS 의 webapp/resources/photo_upload 라는 폴더로 지정해준다.
			 */
			
			// WAS 의 webapp 의 절대경로를 알아와야 한다. 
			HttpSession session = req.getSession();
			String root = session.getServletContext().getRealPath("/"); 
			String path = root + "resources"+File.separator+"photo_upload";
			// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
			
		//	System.out.println(">>>> 확인용 path ==> " + path); 
			// >>>> 확인용 path ==> C:\springworkspaceTeach\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\photo_upload
			
			// 2. 파일첨부를 위한 변수의 설정 및 값을 초기화한 후 파일올리기
			String newFilename = "";
			// WAS(톰캣) 디스크에 저장할 파일명 
			
			byte[] bytes = null;
			// 첨부파일을 WAS(톰캣) 디스크에 저장할때 사용되는 용도 
						
			try {
				bytes = photovo.getFiledata().getBytes(); 
				// getBytes()는 첨부된 파일을 바이트단위로 파일을 다 읽어오는 것이다. 
				/* 2-1. 첨부된 파일을 읽어오는 것
					    첨부한 파일이 강아지.png 이라면
					    이파일을 WAS(톰캣) 디스크에 저장시키기 위해
					    byte[] 타입으로 변경해서 받아들인다.
				*/
				// 2-2. 이제 파일올리기를 한다.
				String original_name = photovo.getFiledata().getOriginalFilename();
				//  photovo.getFiledata().getOriginalFilename() 은 첨부된 파일의 실제 파일명(문자열)을 얻어오는 것이다. 
				newFilename = fileManager.doFileUpload(bytes, original_name, path);
				
		//      System.out.println(">>>> 확인용 newFileName ==> " + newFileName); 
				
				int width = fileManager.getImageWidth(path+File.separator+newFilename);
		//		System.out.println("확인용 >>>>>>>> width : " + width);
				
				if(width > 600)
					width = 600;
		//		System.out.println("확인용 >>>>>>>> width : " + width);
				
				String CP = req.getContextPath();  // board
				file_result += "&bNewLine=true&sFileName="+newFilename+"&sWidth="+width+"&sFileURL="+CP+"/resources/photo_upload/"+newFilename; 
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			// 파일이 존재하지 않는다라면
			file_result += "&errstr=error";
		}
	    
		return "redirect:" + callback + "?callback_func="+callback_func+file_result;
		
	}// end of String photoUpload(PhotoVO photovo, HttpServletRequest req)-------------------    
	
	
	// ==== #스마트에디터2. 드래그앤드롭을 사용한 다중사진 파일업로드 ====
	@RequestMapping(value="/image/multiplePhotoUpload.action", method={RequestMethod.POST})
	public void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res) {
	    
		/*
		   1. 사용자가 보낸 파일을 WAS(톰캣)의 특정 폴더에 저장해주어야 한다.
		   >>>> 파일이 업로드 되어질 특정 경로(폴더)지정해주기
		        우리는 WAS 의 webapp/resources/photo_upload 라는 폴더로 지정해준다.
		 */
		
		// WAS 의 webapp 의 절대경로를 알아와야 한다. 
		HttpSession session = req.getSession();
		String root = session.getServletContext().getRealPath("/"); 
		String path = root + "resources"+File.separator+"photo_upload";
		// path 가 첨부파일들을 저장할 WAS(톰캣)의 폴더가 된다. 
		
	//	System.out.println(">>>> 확인용 path ==> " + path); 
		// >>>> 확인용 path ==> C:\SpringWorkspaceTeach\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Board\resources\photo_upload   
		
		File dir = new File(path);
		if(!dir.exists())
			dir.mkdirs();
		
		String strURL = "";
		
		try {
			if(!"OPTIONS".equals(req.getMethod().toUpperCase())) {
	    		String filename = req.getHeader("file-name"); //파일명을 받는다 - 일반 원본파일명
	    		
	    //		System.out.println(">>>> 확인용 filename ==> " + filename); 
	    		// >>>> 확인용 filename ==> berkelekle%ED%8A%B8%EB%9E%9C%EB%94%9405.jpg
	    		
	    		InputStream is = req.getInputStream();
	    	/*
	          	요청 헤더의 content-type이 application/json 이거나 multipart/form-data 형식일 때,
	          	혹은 이름 없이 값만 전달될 때 이 값은 요청 헤더가 아닌 바디를 통해 전달된다. 
	          	이러한 형태의 값을 'payload body'라고 하는데 요청 바디에 직접 쓰여진다 하여 'request body post data'라고도 한다.

               	서블릿에서 payload body는 Request.getParameter()가 아니라 
            	Request.getInputStream() 혹은 Request.getReader()를 통해 body를 직접 읽는 방식으로 가져온다. 	
	    	 */
	    		String newFilename = fileManager.doFileUpload(is, filename, path);
	    	
				int width = fileManager.getImageWidth(path+File.separator+newFilename);
			
				if(width > 600)
					width = 600;
				
		//		System.out.println(">>>> 확인용 width ==> " + width);
				// >>>> 확인용 width ==> 600
				// >>>> 확인용 width ==> 121
	    	
				String CP = req.getContextPath(); // board
			
				strURL += "&bNewLine=true&sFileName="; 
            	strURL += newFilename;
            	strURL += "&sWidth="+width;
            	strURL += "&sFileURL="+CP+"/resources/photo_upload/"+newFilename;
	    	}
		
	    	/// 웹브라우저상에 사진 이미지를 쓰기 ///
			PrintWriter out = res.getWriter();
			out.print(strURL);
		} catch(Exception e){
			e.printStackTrace();
		}
		
	}// end of void multiplePhotoUpload(HttpServletRequest req, HttpServletResponse res)---------------- // 스마트 에디터 다중 파일 업로드 (07.13 11:40 끝)

}
