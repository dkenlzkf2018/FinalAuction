package com.finalc.auction;

import java.util.HashMap;
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
	

	@RequestMapping(value="/admin/memberList.action", method={RequestMethod.GET})
	public String memberList(HttpServletRequest req) {
		List<MemberVO> memberList = service.getMemberList();
		
		List<HashMap<String, String>> awardList = service.getAwardList();
		
		req.setAttribute("awardList", awardList);
		
		req.setAttribute("memberList", memberList);
		return "management/memberList.admin";
	}
	
	@RequestMapping(value="/admin/awardList.action", method={RequestMethod.GET})
	public String adminMain(HttpServletRequest req) {
		List<HashMap<String, String>> awardList = service.getAwardList();
		
		req.setAttribute("awardList", awardList);
		
		return "management/awardList.admin";
	}
}
