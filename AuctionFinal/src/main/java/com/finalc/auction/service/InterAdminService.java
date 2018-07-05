package com.finalc.auction.service;

import java.util.List;

import com.finalc.auction.model.CategoryVO;

public interface InterAdminService {

	// #Admin main - 관리자페이지 인터페이스 DAO
//	List<HashMap<String, String>> getAdMin(String userid);

	// 카테고리 등록 대분류
	List<CategoryVO> getCategoryList();

	// 카테고리 등록 소분류
	List<CategoryVO> getCategoryDetailList();

}
