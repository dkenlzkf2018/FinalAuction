package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.BoardVO;
import com.finalc.auction.model.CategoryVO;

public interface InterAdminService {

	// 카테고리 페이지
	List<CategoryVO> getAdminCategory();

	List<CategoryVO> getAdminCategoryDetail();

	// 카테고리 추가
	int addCategory(HashMap<String, String> map);
	
	// 카테고리 삭제
	int delCategory(HashMap<String, String> map);
	
	// 게시판 페이지
	List<BoardVO> getGenerBoard();

	

	

	



	
	

	
	
}