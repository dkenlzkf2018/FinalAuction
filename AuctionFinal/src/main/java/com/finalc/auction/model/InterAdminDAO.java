package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterAdminDAO {

	// 관리자 페이지 메인 단
	List<HashMap<String, String>> getAdMin();

	// 카테고리 페이지 단
	List<CategoryVO> getAdminCategory();

	List<CategoryVO> getAdminCategoryDetail();

	// 카테고리 추가 단
	int addCategory(HashMap<String, String> map);
	
	// 카테고리 삭제 단
	int delCategory(HashMap<String, String> map);
	
	// 게시판 관리 단
	

	

	

	
}