package com.finalc.auction;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.service.InterLoginService;
import com.finalc.auction.model.MemberVO;

// 로그인 관련 컨트롤러

@Controller
public class LoginController {

	@Autowired
	private InterLoginService service;
	
	// ===== #44. 로그인페이지 요청 ===== 
	@RequestMapping(value="/login.action", method= {RequestMethod.GET})
	public String login(HttpServletRequest req) {
		
		return "login/loginform.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/loginform.jsp 파일을 생성한다.
	}
	
	// ===== #45. 로그인 여부 요청 ===== 
	@RequestMapping(value="/loginEnd.action", method= {RequestMethod.POST})
	public String loginEnd(HttpServletRequest req) {
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
	
	// ===== #50. 로그아웃 완료 요청 ===== 
	@RequestMapping(value="/logout.action", method= {RequestMethod.GET})
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		return "login/logout.tiles";
		// /Board/src/main/webapp/WEB-INF/views/login/logout.jsp 파일을 생성한다.
	}
	
}