package com.finalc.auction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
<<<<<<< HEAD
	// 관리자 메인 Controller 단
		@RequestMapping(value="/adMain.action", method={RequestMethod.GET})
		public String adMain(HttpServletRequest req) {
			HttpSession session = req.getSession();
			
			
			
			return "admin/admain.admin";
			
			
		}
=======
	@RequestMapping(value="/adMain.action", method={RequestMethod.GET})  
	public String auctionLogin_AuctionUpload(HttpServletRequest req, HttpServletResponse res) {
		
		return "admain.admin";
	} // 옥션 상품 게시 기능
	
>>>>>>> branch 'master' of https://github.com/dkenlzkf2018/FinalAuction.git
}
