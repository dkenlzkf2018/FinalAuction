package com.finalc.auction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.service.InterAdminService;

@Controller
public class AdminCategory {

	// ===== #. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterAdminService service;
	
	// 카테고리 관리 페이지 Controller 단
	@RequestMapping(value="/adminCategory.action", method={RequestMethod.GET})
	public String adminMain(HttpServletRequest req) {
		List<CategoryVO> adminCategory = service.getAdminCategory();
		
		req.setAttribute("adminCategory", adminCategory);
		
		return "adminCategory.admin";
	}	
	
}
