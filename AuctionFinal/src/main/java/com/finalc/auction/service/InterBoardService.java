package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.BoardVO;
//게시판 InterService
public interface InterBoardService {

	int getTotalCount();

	int getTotalCount2(HashMap<String, String> map);
	
	List<BoardVO> boardList(HashMap<String, String> map);

	List<BoardVO> boardList2(HashMap<String, String> map);

	

	
}
