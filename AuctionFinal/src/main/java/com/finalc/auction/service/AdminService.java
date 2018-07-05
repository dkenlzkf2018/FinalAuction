package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.InterAdminDAO;

@Service
public class AdminService implements InterAdminService{

	@Autowired
	private InterAdminDAO dao;

	// 메인페이지
/*	@Override
	public List<HashMap<String, String>> getAdMin(String userid) {
		List<HashMap<String, String>> adMain = dao.getAdMin(userid);
		System.out.println(" 메인페이지 요청 : " + adMain);
		return adMain;
	}*/	

	// 카테고리 등록하기
	@Override
	public List<CategoryVO> getCategoryList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	// 카테고리 등록완료	
	@Override
	public List<CategoryVO> getCategoryDetailList() {
		// TODO Auto-generated method stub
		return null;
	}
	
}