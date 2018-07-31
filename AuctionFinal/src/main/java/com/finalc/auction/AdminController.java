package com.finalc.auction;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.model.BoardVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.service.InterAdminService;

@Controller
public class AdminController {
// 관리자 컨트롤러
	
	// ===== #. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterAdminService service;
	

	// 관리자 메인 Controller 단

		@RequestMapping(value="/adminMain.action", method={RequestMethod.GET})
		public String adminMain(HttpServletRequest req, HttpServletResponse res) {
			
			int memberCount = service.getMemberCount();
			int boardCount = service.getBoardCount();
			int hugiboardCount = service.getHugiBoardCount();
			int categoryDetailCount = service.getCategoryDetailCount();
			int deliverCount = service.getDeliverCount();
			
			req.setAttribute("memberCount", memberCount-1);
			req.setAttribute("boardCount", boardCount+hugiboardCount);
			req.setAttribute("categoryDetailCount", categoryDetailCount);
			req.setAttribute("deliverCount", deliverCount);
			
			return "adminMain.admin";
		}
		
	// 카테고리 관리 페이지 Controller 단
		@RequestMapping(value="/adminCategory.action", method={RequestMethod.GET})
		public String adminMain(HttpServletRequest req) {
			List<CategoryVO> categoryList = service.getAdminCategory();
			
			List<CategoryVO> categoryDetailList = service.getAdminCategoryDetail();
			
			req.setAttribute("categoryList", categoryList); /* req.setAttribute는 값은 해당 뷰단에서 c:forEach문에서 items에 들어가는 값과 동일하게 줘야함*/
			req.setAttribute("categoryDetailList", categoryDetailList);
			
			return "adminCategory.admin";
		}	
		
	// 일반 게시판 (공지사항, Q&A 등)
		@RequestMapping(value="/generBoard.action", method={RequestMethod.GET})
		public String generBoard(HttpServletRequest req) {
			List<BoardVO> generBoard = service.getGenerBoard();
			
			req.setAttribute("generBoard", generBoard);
			
			return "generBoard.admin";
		}
		
	// 카테고리 등록 Controller 단 -> 주석달아놓기
		@RequestMapping(value="/admin/addCategory.action", method={RequestMethod.GET})
		public String addCategory(HttpServletRequest req) {
			String cdname = req.getParameter("cdname");
			String cnum = req.getParameter("cnum");
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("cdname", cdname);
			map.put("cnum", cnum);
			
			int n = service.addCategory(map);
			
			String msg = "", loc = "";
			
			
			if(n == 1) {
				msg = "추가 완료";
				loc = "/auction/adminCategory.action";
			}
			else {
				msg = "추가 실패";
				loc = "/auction/adminCategory.action";
			}
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}
		
		// 카테고리 삭제 Controller 단
		@RequestMapping(value="/admin/delCategory.action", method={RequestMethod.GET})
		public String delCategory(HttpServletRequest req) {
			
			String cdname = req.getParameter("cdname");
			
			String cnum = req.getParameter("cnum");
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			map.put("cdname", cdname);
			map.put("cnum", cnum);
			
			int n = service.delCategory(map);
			
			String msg = "", loc = "";
			
			if(n == 1) {
				msg = "삭제 완료";
				loc = "/auction/adminCategory.action";
			}
			else {
				msg = "삭제 실패";
				loc = "/auction/adminCategory.action";
			}
			
			req.setAttribute("msg", msg);
			req.setAttribute("loc", loc);
			
			return "msg.notiles";
		}

}

