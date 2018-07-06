package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterBuyListDAO {

	// #Buy 5. 구매 리스트 Interface DAO 단
	List<HashMap<String, String>> getBuyList(HashMap<String, String> map);

	int getTotalCount();

	int getBindAuction(HashMap<String, String> map);

	AuctionVO viewAuction(String actdnum);

}
