package com.finalc.auction;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.common.FileManager;
import com.finalc.auction.model.HugiBoardVO;
import com.finalc.auction.service.InterBoardService;

@Controller
@Component
public class AuctionController {

	// 경매 컨트롤러
	@Autowired
	private InterBoardService service;
	
	@Autowired 
	private FileManager fileManager;
	
/*	// 메인 페이지
	@RequestMapping(value="/index.action", method={RequestMethod.GET})  
	public String index(HttpServletRequest req) {

		return "main/index.tiles";
	}*/
	
	// 옥션 상품 게시 기능 (0704)
	@RequestMapping(value="/AuctionUpload.action", method={RequestMethod.GET})  
	public String auctionLogin_AuctionUpload(HttpServletRequest req, HttpServletResponse res) {
		
		return "auction/AddAuction.tiles";
	} // 옥션 상품 게시 기능
	
	@RequestMapping(value="/auctionDetail.action", method={RequestMethod.GET})  
	public String review(HttpServletRequest req) {
		String actdnum = req.getParameter("actdnum");
		
		List<HugiBoardVO> hugiBoardList = service.getReviewByActdnum(actdnum);
		
		req.setAttribute("hugiBoardList", hugiBoardList);
		req.setAttribute("actdnum", actdnum);
		
		return "auction/auctionDetail.tiles";
	}
	
	@RequestMapping(value="/reviewRegist.action", method={RequestMethod.POST})  
	public String reviewRegist(HttpServletRequest req) {
		String actdnum = req.getParameter("actdnum");
		String fk_userid = req.getParameter("fk_userid");
		String ep_content = req.getParameter("ep_content");
		String ep_satisfaction = req.getParameter("ep_satisfaction");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("actdnum", actdnum);
		map.put("fk_userid", fk_userid);
		map.put("ep_content", ep_content);
		map.put("ep_satisfaction", ep_satisfaction);
		
		int n = service.reviewRegist(map);
		
		List<HugiBoardVO> hugiBoardList = service.getReviewByActdnum(actdnum);
		
		req.setAttribute("hugiBoardList", hugiBoardList);
		req.setAttribute("actdnum", actdnum);
		
		return "auction/auctionDetail.tiles";
	}
}
