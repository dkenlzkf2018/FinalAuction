package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterAuctionDAO {

	// 0709 옥션등록 하는 서비스 (첨부 이미지 없음)
//	int add_auction(HashMap<String, String> map);
	int add_auction(AuctionVO auctionVO);
	// 0709 옥션등록 하는 서비스 (첨부 이미지 있음)
//	int add_auctionWithFile(HashMap<String, String> map);
	int add_auctionWithFile(AuctionVO auctionVO);
	
//	카테고리 리스트 페이지 띄우는 dao	
	int ShowAuction(HashMap<String, String> map);
	List<AuctionVO> getAuctionList(String fk_cdnum);
//  =======================================================
	
	
}
