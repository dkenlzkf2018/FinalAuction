package com.finalc.auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.service.InterAdminService;

@Controller
public class MemberController {
	@Autowired
	private InterAdminService service;
	

	// 관리자 메인 Controller 단
		@RequestMapping(value="/admin/memberList.action", method={RequestMethod.GET})
		public String adminMain() {
			
			return "management/memberList.admin";
		}
}
