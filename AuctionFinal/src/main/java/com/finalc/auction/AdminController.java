package com.finalc.auction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import com.finalc.auction.service.InterAdminService;



@Controller
@Component
public class AdminController {

	@Autowired
	private InterAdminService service;
	
}
