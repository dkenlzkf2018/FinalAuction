package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterAdminDAO {

	// 관리자 페이지 메인 단
	List<HashMap<String, String>> getAdMin();

	// 카테고리 페이지 단
	List<CategoryVO> getAdminCategory();

	List<CategoryVO> getAdminCategoryDetail();
	
	// 게시판 관리 단
	

	

	

	
}