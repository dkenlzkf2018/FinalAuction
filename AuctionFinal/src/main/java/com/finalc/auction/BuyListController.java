package com.finalc.auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.buyList.service.InterBuyListService;

@Controller
public class BuyListController {
	
	@Autowired
	private InterBuyListService service;
	
	@RequestMapping(value="/buyList.action", method={RequestMethod.GET})
	public String buyList() {
		
		return "buy/buyList.tiles";
	}
}
