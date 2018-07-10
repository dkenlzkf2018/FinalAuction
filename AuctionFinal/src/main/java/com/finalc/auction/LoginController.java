package com.finalc.auction;

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

import com.finalc.auction.service.InterLoginService;
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
	
	@RequestMapping(value="/zipcodeInfo.action", method= {RequestMethod.GET})
	public String zipcodeInfo(HttpServletRequest req) {
		
		String sido = req.getParameter("sido");
				
		List<ZipcodeVO> zipcodeList = null;
		
		zipcodeList = service.serchZipcode(sido);
		
		int cnt = 0;
		while(zipcodeList.toString().length() == zipcodeList.size()) {
			cnt++;
			if(cnt==1)
				zipcodeList = new ArrayList<ZipcodeVO>(); 
			
			String zipcode = req.getParameter("zipcode");
			String address = req.getParameter("address");
			
			ZipcodeVO zvo = new ZipcodeVO(zipcode, address);
			
			zipcodeList.add(zvo);
		}
		
		System.out.println("확인용 zipcodeList : "+ zipcodeList);
		
		if(zipcodeList == null || zipcodeList.size() == 0) {
			req.setAttribute("result", "0");
			req.setAttribute("zipcodeNotExist", "해당 주소가 없습니다.");
		}
		else {
			req.setAttribute("result", "1");
			req.setAttribute("zipcodeList", zipcodeList);
		}
		
		return "zipcodeInfo.notiles";
	}
	
	@RequestMapping(value="/pwdFind.action", method= {RequestMethod.GET})
	public String pwdFind() {
		
		return "pwdFind.notiles";
		
	}
	
}
