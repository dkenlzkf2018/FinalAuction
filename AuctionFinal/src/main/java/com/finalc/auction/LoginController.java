package com.finalc.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.service.InterLoginService;
import com.finalc.auction.common.MyUtil;
import com.finalc.auction.model.MemberVO;
import com.finalc.auction.model.ZipcodeVO;

// 로그인 관련 컨트롤러

@Controller
@Component
public class LoginController {

	@Autowired
	private InterLoginService service;
	
	// ===== 로그인페이지 요청 ===== 
	@RequestMapping(value="/login.action", method= {RequestMethod.GET})
	public String login(HttpServletRequest req, HttpServletResponse res) {
		
		return "login/loginform.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/loginform.jsp 파일을 생성한다.
	}
	
	// ===== 로그인 여부 요청 ===== 
	@RequestMapping(value="/loginEnd.action", method= {RequestMethod.POST})
	public String loginEnd(HttpServletRequest req, HttpServletResponse res) {
		String userid = req.getParameter("userid");
		String passwd = req.getParameter("passwd");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("passwd", passwd);
		
		MemberVO loginuser = service.getLoginMember(map);
		
		if(loginuser != null) {
			HttpSession session = req.getSession();
			session.setAttribute("loginuser", loginuser);
			String gobackURL = (String)session.getAttribute("gobackURL");
			req.setAttribute("gobackURL", gobackURL);
			session.removeAttribute("gobackURL");
		}
		return "login/loginEnd.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/loginEnd.jsp 파일을 생성한다.
	}
	
	// ===== 로그아웃 완료 요청 ===== 
	@RequestMapping(value="/logout.action", method= {RequestMethod.GET})
	public String logout(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "login/logout.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/logout.jsp 파일을 생성한다.
	}
	
	@RequestMapping(value="/memberRegist.action", method= {RequestMethod.GET})
	public String memberRegist() {
		
		return "member/memberRegist.tiles";		
	}
	
	@RequestMapping(value="/idCheck.action", method= {RequestMethod.GET})
	public String idCheck(HttpServletRequest req) {
		
		String userid = req.getParameter("userid");
		
		int n = 0;
		
		if(userid == null) {
			n = -1;
		}
		else if(userid.trim().isEmpty()) {
			n = -1;
		}
		else {
			n = service.idCheck(userid);
		}
		
		req.setAttribute("n", n);
		
		return"idCheck.notiles";
	}
	
	@RequestMapping(value="/memberRegistEnd.action", method={RequestMethod.POST})
	public String memberRegistEnd(HttpServletRequest req) {
		
		String userid = req.getParameter("userid");
		String pwd = req.getParameter("password");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String gender = req.getParameter("gender");
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		String zipcode = req.getParameter("zipcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
				
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("pwd", pwd);
			
		int RegMember = service.memberRegist(map);
		int RegMember1 = 0;
		
		if(RegMember == 0) {
			String msg = "가입실패";
			String loc = "javascript:history.back()";
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return"msg.notiles";
		}
		else if(RegMember == 1) {

			map.put("name", name);
			map.put("birth", birth);
			map.put("email1", email1);
			map.put("email2", email2);
			map.put("gender", gender);
			map.put("hp1", hp1);
			map.put("hp2", hp2);
			map.put("hp3", hp3);
			map.put("zipcode", zipcode);
			map.put("addr1", addr1);
			map.put("addr2", addr2);
			
			RegMember1 = service.memberRegistDetail(map);
			
			if(RegMember1 == 1) {
				String msg = "가입성공";
				String loc = "login.action";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				return"msg.notiles";
			}
			else if(RegMember1 == 0){
				String msg = "가입실패";
				String loc = "javascript:history.back()";
				
				req.setAttribute("msg", msg);
				req.setAttribute("loc", loc);
				
				return"msg.notiles"; 
			}
		}
		
		req.setAttribute("RegMember1", RegMember1); 
		
		return "member/memberRegistEnd.tiles";
	}
	
	@RequestMapping(value="/ZipcodeSerch.action", method= {RequestMethod.POST})
	public String ZipcodeSerch() {
		
		return "ZipcodeSerch.notiles";
	}
	
	@RequestMapping(value="/ZipcodeSerchEdit.action", method= {RequestMethod.POST})
	public String ZipcodeSerchEdit() {
		
		return "ZipcodeSerchEdit.notiles";
	}
	
	@RequestMapping(value="/zipcodeEditInfo.action", method= {RequestMethod.GET})
	public String ZipcodeSerchEditInfo(HttpServletRequest req) {
		
		List<HashMap<String, String>> zipcodeList = null;
		
		zipcodeList = new ArrayList<HashMap<String, String>>();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("sido", req.getParameter("sido"));
		
		zipcodeList = service.serchZipcode(map);
		
		if(zipcodeList == null || zipcodeList.size() == 0) {
			req.setAttribute("result", "0");
			req.setAttribute("zipcodeNotExist", "해당 주소가 없습니다.");
		}
		else {
			req.setAttribute("result", "1");
			req.setAttribute("zipcodeList", zipcodeList);
			String zipcode = req.getParameter("zipcode");
			String addr1 = req.getParameter("addr1");
			
			req.setAttribute("zipcode", zipcode);
			req.setAttribute("addr1", addr1);
		}
		
		return "zipcodeEditInfo.notiles";
	}
	
	@RequestMapping(value="/zipcodeInfo.action", method= {RequestMethod.GET})
	public String zipcodeInfo(HttpServletRequest req) {
		
		List<HashMap<String, String>> zipcodeList = null;
		
		zipcodeList = new ArrayList<HashMap<String, String>>();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("sido", req.getParameter("sido"));
		
		zipcodeList = service.serchZipcode(map);
		
		
		
		if(zipcodeList == null || zipcodeList.size() == 0) {
			req.setAttribute("result", "0");
			req.setAttribute("zipcodeNotExist", "해당 주소가 없습니다.");
		}
		else {
			req.setAttribute("result", "1");
			req.setAttribute("zipcodeList", zipcodeList);
			String zipcode = req.getParameter("zipcode");
			String addr1 = req.getParameter("addr1");
			
			req.setAttribute("zipcode", zipcode);
			req.setAttribute("addr1", addr1);
		}
		
		return "zipcodeInfo.notiles";
	}
	
	@RequestMapping(value="/pwdFind.action", method= {RequestMethod.POST})
	public String pwdFind(HttpServletRequest req) {
		
		return "pwdFind.notiles";
	}
	
	@RequestMapping(value="/pwdFindEnd.action", method= {RequestMethod.POST})
	public String pwdFindEnd(HttpServletRequest req) {
		
		String method = req.getMethod();
		String userid = "", email = "";
		int n = 0;
		req.setAttribute("method", method);
		
		if("post".equalsIgnoreCase(method)) {
			// 비밀번호 찾기 모달창에서 찾기 버튼을 클릭했을 경우
			userid = req.getParameter("userid");
			email = req.getParameter("email");
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("userid", userid);
			map.put("email", email);
			 
			n = service.isUserExists(map); 
			
			if(n==1) {
				
				GoogleMail mail = new GoogleMail();
				
				Random rnd = new Random();
				
				String certificationCode = "";
				// certificationCode ==> "ewtyq0452029"
				
				char randchar = ' ';
				for(int i=0; i<5; i++) {
					// min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면
					// int rndnum = rnd.nextInt(max - min + 1) + min;  
					randchar = (char)(rnd.nextInt('z' - 'a' + 1) + 'a');
					certificationCode += randchar;
				}
				
				int randnum = 0;
				for(int i=0; i<7; i++) {
					randnum = (int)(rnd.nextInt(10-0+1)+0);
					certificationCode += randnum;
				}
				
				try {
					mail.sendmail(email, certificationCode);
					req.setAttribute("certificationCode", certificationCode);
					
				} catch(Exception e) {
					e.printStackTrace();
					
					req.setAttribute("sendFailmsg", "메일발송에 실패했습니다.");
					n = -1;
				}
			}
		}
		req.setAttribute("n", n);  
		// n이 0이면 존재하지 않은 userid 또는 email 인 경우
		// n이 1이면 userid 와 email 존재하면서 메일발송이 성공한 경우
		// n이 -1이면 userid 와 email 존재하는데 메일발송이 실패한 경우
		
		req.setAttribute("userid", userid);
		req.setAttribute("email", email);
		
		return "pwdFindEnd.notiles";
	}
	
	@RequestMapping(value="/pwdConfirm.action", method= {RequestMethod.GET})
	public String pwdConfirm(HttpServletRequest req) {
		
		String method = req.getMethod();
		req.setAttribute("method", method);
	
	    String userid =	req.getParameter("userid");
	    req.setAttribute("userid", userid);
	    
	    int n = 0;
	    
	    HashMap<String, String> map = new HashMap<String, String>();
	    
	    if("GET".equalsIgnoreCase(method)) {	    	
	    	String pwd = req.getParameter("pwd");
	    	req.setAttribute("pwd", pwd); 
	    	
	 	    map.put("pwd", pwd);
	 	    map.put("userid", userid);
	    	
	    	if(userid != null && pwd != null) {	
	    		n = service.updatePwdUser(map);
	    	}

	    	req.setAttribute("n", n);
	    }
		
		return "pwdConfirm.notiles";
	}
	
	@RequestMapping(value="/myPage.action", method= {RequestMethod.GET})
	public String myPage(HttpServletRequest req) {
		
		return "member/myPage.tiles";
	}
	
	@RequestMapping(value="/myInfoEdit.action", method= {RequestMethod.POST})
	public String myInfoEdit(HttpServletRequest req) {
		
		return "member/myInfoEdit.tiles";
	}
	
	@RequestMapping(value="/myInfoEditEnd.action", method= {RequestMethod.POST})
	public String myInfoEditEnd(HttpServletRequest req) {
		
		String userid = req.getParameter("userid");
		String name = req.getParameter("name");
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		String zipcode = req.getParameter("zipcode");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
				
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("name", name);
		map.put("email1", email1);
		map.put("email2", email2);
		map.put("hp1", hp1);
		map.put("hp2", hp2);
		map.put("hp3", hp3);
		map.put("zipcode", zipcode);
		map.put("addr1", addr1);
		map.put("addr2", addr2);
		
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		loginuser.setEmail(email1+"@"+email2);
		loginuser.setHp1(hp1);
		loginuser.setHp2(hp2);
		loginuser.setHp3(hp3);
		loginuser.setZipcode(zipcode);
		loginuser.setAddr1(addr1);
		loginuser.setAddr2(addr2);
		
		int RegMember = service.memberEdit(map);
		
		if(RegMember == 1) {
			
			req.setAttribute("loginuser", loginuser);
			req.setAttribute("RegMember", RegMember); 
			
		}
		
		return "myInfoEditEnd.notiles";
	}
	
	@RequestMapping(value="/myJoinList.action", method= {RequestMethod.GET})
	public String myJoinList(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		session.setAttribute("loginuser", loginuser);
		
		String usernum = loginuser.getUsernum();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("usernum", loginuser.getUsernum());
		map.put("coin", loginuser.getCoin());
		
		List<HashMap<String, String>> JoinList = new ArrayList<HashMap<String, String>>();
		
		JoinList = service.JoinList(map);
		
		req.setAttribute("JoinList", JoinList);
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo"); 
		
		int totalCount = 0;         // 총게시물건수
		int sizePerPage = 10;        // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총페이지수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;           // 시작행 번호
		int endRno = 0;             // 끝행 번호
		
		int blockSize = 5;         // "페이지바" 에 보여줄 페이지의 갯수 
		
		/*
		    ==== 총페이지수 구하기 ====    
		        검색조건이 없을 때의 총페이지 수와
		        검색조건이 있을 때의 총페이지 수를 구해야 한다.
		        
		        검색조건이 없을 때의 총페이지 수 ==> colname 과 search 값이 null 인 것이고,
		        검색조건이 있을 때의 총페이지 수 ==> colname 과 search 값이 null 이 아닌 것이다.        
		 */
		// 먼저 총게시물 건수를 구한다.
		
		totalCount = service.getTotalCount(Integer.parseInt(usernum)); // 검색어가 없는 총게시물 건수
		
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		
		
		if(str_currentShowPageNo == null) {
			// 게시판 초기화면에 보여지는 것은 
			// req.getParameter("currentShowPageNo"); 값이 없으므로
			// str_currentShowPageNo 는 null 이 된다.
			
			currentShowPageNo = 1; 
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
				/*if (currentShowPageNo > 1) {
					
				}*/
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		      currentShowPageNo    startRno    endRno
		      ---------------------------------------
		           1 page      ==>     1          5
		           2 page      ==>     6         10
		           3 page      ==>    11         15
		           4 page      ==>    16         20
		           5 page      ==>    21         25
		           6 page      ==>    26         30
		           7 page      ==>    31         35
		 */
		
		startRno = (currentShowPageNo - 1) * sizePerPage + 1;
		endRno = startRno + sizePerPage - 1;
		
		// ==== #111. 페이징 처리를 위해 startRno, endRno 를 map 에 추가하여 
		//            파라미터로 넘겨서 select 되도록 한다. 
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		/*String pagebar = "<li>";
		
		pagebar += MyUtil.getAuctionPageBar("buyList.action", currentShowPageNo, sizePerPage, totalPage, blockSize);     
		pagebar += "</li>";*/
		
		
		
		String pagebar = MyUtil.getAuctionPageBar("myJoinList.action", currentShowPageNo, sizePerPage, totalPage, blockSize);     
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("startRno", startRno);
		req.setAttribute("endRno", endRno);
		req.setAttribute("currentShowPageNo", currentShowPageNo);
		
		return "member/myJoinList.tiles";
	
	}
	
<<<<<<< HEAD
=======
	
	@RequestMapping(value="/auctionList.action", method= {RequestMethod.GET})
	public String auctionList(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		
		session.setAttribute("loginuser", loginuser);
		
		String usernum = loginuser.getUsernum();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("usernum", loginuser.getUsernum());
		
		List<HashMap<String, String>> AuctionList = new ArrayList<HashMap<String, String>>();
		
		AuctionList = service.AuctionList(map);
		
		req.setAttribute("AuctionList", AuctionList);
		
		String str_currentShowPageNo = req.getParameter("currentShowPageNo"); 
		
		int totalCount = 0;         // 총게시물건수
		int sizePerPage = 10;        // 한 페이지당 보여줄 게시물 건수 
		int currentShowPageNo = 0;  // 현재 보여주는 페이지 번호로서, 초기치로는 1페이지로 설정함.
		int totalPage = 0;          // 총페이지수 (웹브라우저상에 보여줄 총 페이지 갯수)
		
		int startRno = 0;           // 시작행 번호
		int endRno = 0;             // 끝행 번호
		
		int blockSize = 5;         // "페이지바" 에 보여줄 페이지의 갯수 
		
		/*
		    ==== 총페이지수 구하기 ====    
		        검색조건이 없을 때의 총페이지 수와
		        검색조건이 있을 때의 총페이지 수를 구해야 한다.
		        
		        검색조건이 없을 때의 총페이지 수 ==> colname 과 search 값이 null 인 것이고,
		        검색조건이 있을 때의 총페이지 수 ==> colname 과 search 값이 null 이 아닌 것이다.        
		 */
		// 먼저 총게시물 건수를 구한다.
		
		totalCount = service.getTotalCount(Integer.parseInt(usernum)); // 검색어가 없는 총게시물 건수
		
		
		totalPage = (int)Math.ceil((double)totalCount/sizePerPage);
		
		
		
		if(str_currentShowPageNo == null) {
			// 게시판 초기화면에 보여지는 것은 
			// req.getParameter("currentShowPageNo"); 값이 없으므로
			// str_currentShowPageNo 는 null 이 된다.
			
			currentShowPageNo = 1; 
		}
		else {
			try {
				currentShowPageNo = Integer.parseInt(str_currentShowPageNo);
				
				if(currentShowPageNo < 1 || currentShowPageNo > totalPage) {
					currentShowPageNo = 1;
				}
				
				/*if (currentShowPageNo > 1) {
					
				}*/
				
			} catch (NumberFormatException e) {
				currentShowPageNo = 1;
			}
		}
		
		// **** 가져올 게시글의 범위를 구한다.(공식임!!!) ****
		/*
		      currentShowPageNo    startRno    endRno
		      ---------------------------------------
		           1 page      ==>     1          5
		           2 page      ==>     6         10
		           3 page      ==>    11         15
		           4 page      ==>    16         20
		           5 page      ==>    21         25
		           6 page      ==>    26         30
		           7 page      ==>    31         35
		 */
		
		startRno = (currentShowPageNo - 1) * sizePerPage + 1;
		endRno = startRno + sizePerPage - 1;
		
		// ==== #111. 페이징 처리를 위해 startRno, endRno 를 map 에 추가하여 
		//            파라미터로 넘겨서 select 되도록 한다. 
		map.put("startRno", String.valueOf(startRno));
		map.put("endRno", String.valueOf(endRno));
		
		/*String pagebar = "<li>";
		
		pagebar += MyUtil.getAuctionPageBar("buyList.action", currentShowPageNo, sizePerPage, totalPage, blockSize);     
		pagebar += "</li>";*/
		
		
		
		String pagebar = MyUtil.getAuctionPageBar("myJoinList.action", currentShowPageNo, sizePerPage, totalPage, blockSize);     
		req.setAttribute("pagebar", pagebar);
		req.setAttribute("startRno", startRno);
		req.setAttribute("endRno", endRno);
		req.setAttribute("currentShowPageNo", currentShowPageNo);
		
		return "member/myauctionList.tiles";
	
	}

	
>>>>>>> branch 'master' of https://github.com/dkenlzkf2018/FinalAuction.git
	@RequestMapping(value="/plusCoin.action", method= {RequestMethod.POST})
	public String myCoinPlus(HttpServletRequest req) {
		
		return "member/plusCoin.tiles";
	}

}
