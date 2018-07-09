package com.finalc.auction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.InterAdminDAO;
import com.finalc.auction.model.MemberVO;

@Service
public class AdminService implements InterAdminService{

	@Autowired
	private InterAdminDAO dao;

	@Override
	public List<CategoryVO> getAdminCategory() {
		List<CategoryVO> adminCategory = dao.getAdminCategory();
		return adminCategory;
	}

	
	
	
}