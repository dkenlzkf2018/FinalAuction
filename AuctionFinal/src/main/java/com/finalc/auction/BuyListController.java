package com.finalc.auction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
	
	// #Buy 2. 구매 리스트 controller 단
	@RequestMapping(value="/buyList.action", method={RequestMethod.GET})
	public String buyList(HttpServletRequest req) {
		HttpSession session = req.getSession();
		MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		System.out.println("0. loginuser : " + loginuser);
		session.setAttribute("loginuser", loginuser);
		System.out.println("1. loginuser.userid : " + loginuser.getUserid());
		
		List<HashMap<String, String>> buyMapList = new ArrayList<HashMap<String, String>>();
		buyMapList = service.getBuyList(loginuser.getUsernum());
		System.out.println("?. Controller 단 buyMapList : " + buyMapList);
		
		req.setAttribute("buyMapList", buyMapList);
		
		return "buy/buyList.tiles";
	}
}
