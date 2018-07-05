package com.finalc.auction;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalc.auction.model.CategoryDAO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.service.InterAdminService;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;


@Controller
@Component
public class AdminController {
// 관리자 컨트롤러
	
	// ===== #. 의존객체 주입하기(DI : Dependency Injection) =====
	@Autowired
	private InterAdminService service;
	
	// ===== #. 관리자메인페이지 요청 ===== 
/*	@RequestMapping(value="/admain.action", method= {RequestMethod.GET})
	public String login(HttpServletRequest req) {
		
		HttpSession session = req.getSession();
		List<CategoryVO> categoryList = service.getCategoryList();
		
		List<CategoryVO> categoryDetailList = service.getCategoryDetailList();
		
		session.setAttribute("categoryList", categoryList);
		session.setAttribute("categoryDetailList", categoryDetailList);		
		
		return "admin/admain.notiles";
		// /AuctionFinal/src/main/webapp/WEB-INF/views/admin/admain.jsp 파일을 생성한다.
	}*/
	
	// ===== #. 카테고리 등록 페이지  ===== 
	@ResponseBody
	@RequestMapping(value="/adReg.action", method= {RequestMethod.POST})
	public String adctr_reg(HttpServletRequest req) {
		
        CategoryDAO category = new CategoryDAO();
        category.setName(categoryName);
        category.setRegDate(new Date());		
		
		return "admin/adReg.notiles";
		// /AuctionFinal/src/main/webapp/WEB-INF/views/admin/adReg.jsp 파일을 생성한다.
	}
	
	// ===== #. 카테고리 등록 완료  ===== 
	@RequestMapping(value="/adEnd.action", method= {RequestMethod.GET})
	public String adctr_fin(CategoryVO categoryvo, HttpServletRequest req, HttpSession session) {
		
		String content = categoryvo.getContent().replaceAll("\r\n", "<br/>");
		categoryvo.setContent(content);

		int n = 0;
		if(categoryvo.getAttach().isEmpty()) {
			// 파일 첨부가 없다면
			n = service.write_add(boardvo);
		}
		if(!boardvo.getAttach().isEmpty()) {
			// 파일 첨부가 있다면
			n = service.write_withFile(boardvo);
		}

		req.setAttribute("n", n);
		
		return "admin/adEnd.notiles";
		// /AuctionFinal/src/main/webapp/WEB-INF/views/admin/adEnd.jsp 파일을 생성한다.
	}	
}
