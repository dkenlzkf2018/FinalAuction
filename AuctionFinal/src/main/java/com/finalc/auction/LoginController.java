package com.finalc.auction;

import java.util.HashMap;

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

import com.finalc.auction.service.InterLoginService;
import com.finalc.auction.model.MemberVO;

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
		
		int n = service.idCheck(userid);
		
		req.setAttribute("userid", userid);
		req.setAttribute("n", n);
		
		return"idCheck.notiles";
	}
	
	@RequestMapping(value="/memberRegistEnd.action", method={RequestMethod.GET})
	public String memberRegistEnd() {
		
		return "member/memberRegistEnd.notiles";
	}
	
}
