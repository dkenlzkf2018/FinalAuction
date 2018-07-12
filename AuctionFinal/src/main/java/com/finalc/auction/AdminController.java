package com.finalc.auction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		public String adminMain() {
			
			return "adminMain.admin";
		}
		
	// 카테고리 관리 페이지 Controller 단
		@RequestMapping(value="/adminCategory.action", method={RequestMethod.GET})
		public String adminMain(HttpServletRequest req) {
			List<CategoryVO> adminCategory = service.getAdminCategory();
			
			List<CategoryVO> adminCategoryDetail = service.getAdminCategoryDetail();
			
			req.setAttribute("adminCategory", adminCategory);
			req.setAttribute("adminCategoryDetail", adminCategoryDetail);
			
			return "adminCategory.admin";
		}	
		
	// 일반 게시판 (공지사항, Q&A 등)	
		@RequestMapping(value="/generBoard.action", method={RequestMethod.GET})
		public String generBoard(HttpServletRequest req) {
			List<BoardVO> generBoard = service.getGenerBoard();
			
			req.setAttribute("generBoard", generBoard);
			
			return "generBoard.admin";
		}
		
/*	// 카테고리 등록 Controller 단
		@RequestMapping(value="/addCategory.action", method={RequestMethod.GET})
		public String addCategory() {
			
			return "addCategory.admin";
		}
		
	// 카테고리 수정 Controller 단
		@RequestMapping(value="/modiCategory.action", method={RequestMethod.GET})
		public String modiCategory() {
			
			return "modiCategory.admin";
		}
		
	// 카테고리 삭제 Controller 단
		@RequestMapping(value="/delCategory.action", method={RequestMethod.GET})
		public String delCategory() {
			
			return "delCategory.admin";
		}*/
		
	// 
	
}
