package com.finalc.auction;


import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
				// WAS 디스크에 저장 할 파일명.
				
				byte[] bytes = null;
				// 첨부파일을 WAS 디스크에 저장할때 사용되는 용도.
				
				long fileSize = 0;
				// 파일크기를 읽어오기 위한 용도.
				
				try {
					bytes = boardvo.getAttach().getBytes();
					// getBytes()는 첨부된 파일을 바이트 단위로 다 읽어오는 것이다.
					newFileName = fileManager.doFileUpload(bytes, boardvo.getAttach().getOriginalFilename(), path);
					// 파일을 업로드 한수 현재시간 + 나노타임. 확장자로 된 파일명을 리턴받아 newFileName으로 저장한다.
					boardvo.setFileName(newFileName);
					boardvo.setOrgFilename(boardvo.getAttach().getOriginalFilename());
					// boardvo.getAttach().getOriginalFilename()은 진짜 파일명
					// 사용자가 파일을 다운로드 할때 사용되는 파일명
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
	public String requireLogin_writeedit(HttpServletRequest req, HttpServletResponse res) {
		
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
	public String requireLogin_del(HttpServletRequest req, HttpServletResponse res) {
		
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
	

}
