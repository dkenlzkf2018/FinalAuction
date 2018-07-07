package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.CategoryVO;

public interface InterBuyListService {

	// #Buy 3. 구매 리스트 Interface Service 단
	List<HashMap<String, String>> getBuyList(HashMap<String, String> map);

	int getTotalCount();

	AuctionVO viewAuction(String actdnum);

	CategoryVO getCategoryName(String actnum);

	// #Buy 12. 경매 입찰(insert)하는 Interface Service 단
	int inputTender(HashMap<String, String> map);

}
