package com.finalc.auction;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.service.InterAdminService;

@Controller
public class AdminController {
// 어드민 컨트롤러
	
	// ===== #. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterAdminService service;
	
	// ===== #. 관리자메인페이지 요청 ===== 
	@RequestMapping(value="/admain.action", method= {RequestMethod.GET})
	public String login(HttpServletRequest req) {
		
		return "admin/admain.notiles";
		// /AuctionFinal/src/main/webapp/WEB-INF/views/admin/admain.jsp 파일을 생성한다.
	}	
	
	
	
}
