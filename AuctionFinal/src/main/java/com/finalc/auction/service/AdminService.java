package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.BoardVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.InterAdminDAO;
import com.finalc.auction.model.MemberVO;

@Service
public class AdminService implements InterAdminService{

	@Autowired
	private InterAdminDAO dao;

	// 카테고리 페이지
	@Override
	public List<CategoryVO> getAdminCategory() {
		List<CategoryVO> adminCategory = dao.getAdminCategory();
		return adminCategory;
	}
	
	@Override
	public List<CategoryVO> getAdminCategoryDetail() {
		List<CategoryVO> adminCategoryDetail = dao.getAdminCategoryDetail();
		return adminCategoryDetail;
	}

	// 게시판
	@Override
	public List<BoardVO> getGenerBoard() {
		// TODO Auto-generated method stub
		return null;
	}

	// 카테고리 추가
	@Override
	public int addCategory(HashMap<String, String> map) {
		int n = dao.addCategory(map);
		return n;
	}

	// 카테고리 삭제
	@Override
	public int delCategory(HashMap<String, String> map) {
		int n = dao.delCategory(map);
		return n;
	}

	@Override
	public int getMemberCount() {
		int memberCount = dao.getMemberCount();
		return memberCount;
	}

	@Override
	public int getBoardCount() {
		int boardCount = dao.getBoardCount();
		return boardCount;
	}

	@Override
	public int getHugiBoardCount() {
		int hugiboardCount = dao.getHugiBoardCount();
		return hugiboardCount;
	}

	@Override
	public int getCategoryDetailCount() {
		int categoryDetailCount = dao.getCategoryDetailCount();
		return categoryDetailCount;
	}

	@Override
	public int getDeliverCount() {
		int deliverCount = dao.getDeliverCount();
		return deliverCount;
	}
	
	
	

	
	
	
}