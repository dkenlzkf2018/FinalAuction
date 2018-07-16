package com.finalc.auction;

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
	@RequestMapping(value="/adminMain.action", method={RequestMethod.GET})
	public String adminMain() {
		return "adminMain.admin";
	}
		
}
