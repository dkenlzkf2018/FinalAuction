package com.finalc.auction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.model.MemberVO;
import com.finalc.auction.service.InterBuyListService;



@Controller
public class BuyListController {
	
	@Autowired
	private InterBuyListService service;
	
	@RequestMapping(value="/buyList.action", method={RequestMethod.GET})
	public String buyList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		session.setAttribute("loginuser", loginuser);
		
		
		
		return "buy/buyList.tiles";
	}
}
