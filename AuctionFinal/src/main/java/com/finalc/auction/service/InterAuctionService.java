package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.AuctionVO;

// 옥션 서비스 인터페이스
public interface InterAuctionService {

	// 0704 옥션을 등록하는 서비스
	int AuctionUpload();
	
	// 0709 옥션등록 하는 서비스 (첨부 이미지 없음)
	int add_auction(AuctionVO auctionVO);
//	int add_auction(HashMap<String, String> map);
	// 0709 옥션등록 하는 서비스 (첨부 이미지 있음)
	int add_auctionWithFile(AuctionVO auctionVO);
//	int add_auctionWithFile(HashMap<String, String> map);
	
//	상품목록을 띄우는 메소드	
	int ShowAuction(HashMap<String, String> map);
//	해당 카테고리에 포함되는 상품을 가져오는 메소드	
	List<AuctionVO> getAuctionList(String fk_cdnum);

}