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
	
	// 게시판 글쓰기 폼 시작 스마트에디터 사용전(07.03)
	@RequestMapping(value="/write.action", method={RequestMethod.GET})  
	public String write(HttpServletRequest req) {
		
		String boardno = req.getParameter("boardno");
		
		req.setAttribute("boardno", boardno);
		
		
		
		return "board/write.tiles2";
	} // 게시판 글쓰기 폼 스마트에디터 사용전 끝(07.03)
	

}
