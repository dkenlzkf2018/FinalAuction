package com.finalc.auction;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.common.FileManager;
import com.finalc.auction.service.InterBoardService;

@Controller
@Component
public class AuctionController {

	// 경매 컨트롤러
	@Autowired
	private InterBoardService service;
	
	@Autowired 
	private FileManager fileManager;
	
	// 메인 페이지
	@RequestMapping(value="/index.action", method={RequestMethod.GET})  
	public String index(HttpServletRequest req) {

		return "main/index.tiles";
	}
	
	// 옥션 상품 게시 기능 (0704)
	@RequestMapping(value="/AuctionUpload.action", method={RequestMethod.GET})  
	public String before_AuctionUpload(HttpServletRequest req) {
		
		
		
	return "auction/AddAuction.tiles";
	} // 옥션 상품 게시 기능
	
}
