package com.finalc.auction.service;

import java.util.List;

import com.finalc.auction.model.BoardVO;
import com.finalc.auction.model.CategoryVO;

public interface InterAdminService {

	// 안녕 카테고리 시발아
	List<CategoryVO> getAdminCategory();

	// 안녕 게시판 페이지 시발아
	List<BoardVO> getGenerBoard();

	
	

	
	
}