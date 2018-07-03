package com.finalc.auction;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.service.InterBoardService;
import com.finalc.auction.common.FileManager;

@Controller
@Component
public class BoardController {
// 게시판 컨트롤러
	@Autowired
	private InterBoardService service;
	
	@Autowired 
	private FileManager fileManager;
	
	// 메인 페이지
	@RequestMapping(value="/index.action", method={RequestMethod.GET})  
	public String index(HttpServletRequest req) {
		
		
		
		return "main/index.tiles";
	}
	

}
