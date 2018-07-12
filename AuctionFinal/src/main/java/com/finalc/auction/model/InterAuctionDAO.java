package com.finalc.auction.model;

import java.util.HashMap;

public interface InterAuctionDAO {

	// 0709 옥션등록 하는 서비스 (첨부 이미지 없음)
	int add_auction(HashMap<String, String> map);
//	int add_auction(AuctionVO auctionVO);
	// 0709 옥션등록 하는 서비스 (첨부 이미지 있음)
	int add_auctionWithFile(HashMap<String, String> map);
//	int add_auctionWithFile(AuctionVO auctionVO);

}
