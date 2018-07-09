package com.finalc.auction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.model.MemberVO;
import com.finalc.auction.service.InterLGHService;

@Controller
public class LGHController {
	@Autowired
	private InterLGHService service;
	
	// 관리자 회원관리 Controller 단
	@RequestMapping(value="/admin/memberList.action", method={RequestMethod.GET})
	public String adminMain(HttpServletRequest req) {
		List<MemberVO> memberList = service.getMemberList();
		
		req.setAttribute("memberList", memberList);
		return "management/memberList.admin";
	}
}
