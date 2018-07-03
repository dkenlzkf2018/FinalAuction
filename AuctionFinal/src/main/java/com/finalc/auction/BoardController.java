package com.finalc.auction;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
// 게시판 컨트롤러
	
	@RequestMapping(value="/home.action", method={RequestMethod.GET}) 
	public String home() {
		
		return "index.tiles";
	}
}
