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
	
	
}
