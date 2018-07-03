package com.finalc.auction;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
<<<<<<< HEAD
=======

import com.finalc.auction.service.InterBoardService;
import com.finalc.auction.common.FileManager;
>>>>>>> branch 'master' of https://github.com/dkenlzkf2018/FinalAuction.git

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
	
	@RequestMapping(value="/home.action", method={RequestMethod.GET}) 
	public String home() {
		
		return "index.tiles";
	}
}
