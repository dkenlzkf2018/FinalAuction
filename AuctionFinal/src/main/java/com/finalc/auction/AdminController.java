package com.finalc.auction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.service.InterAdminService;

@Controller
public class AdminController {
// 관리자 컨트롤러
	
	// ===== #. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterAdminService service;
	
	// 관리자 메인 Controller 단
		@RequestMapping(value="/adMain.action", method={RequestMethod.GET})
		public String adMain(HttpServletRequest req) {
			HttpSession session = req.getSession();
			
			
			
			return "admin/admain.admin";
			
			
		}
}
