package com.finalc.auction;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
		public String adMain(HttpServletRequest req, HttpServletResponse res, HttpSession session) {
			
			String cnum = req.getParameter("cnum");
			String cname = req.getParameter("cname");
			String cdnum = req.getParameter("cdnum");
			String fk_cnum = req.getParameter("fk_cnum");
			String cdname = req.getParameter("cdname");
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("cnum", cnum);
			map.put("cname", cname);
			map.put("cdnum", cdnum);
			map.put("fk_cnum", fk_cnum);
			map.put("cdname", cdname);
			
			return "admin/admain.admin";
		}
		
		
	
}
