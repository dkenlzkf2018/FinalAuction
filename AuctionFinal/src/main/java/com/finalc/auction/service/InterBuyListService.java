package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

public interface InterBuyListService {

	// #Buy 3. 구매 리스트 Interface Service 단
	List<HashMap<String, String>> getBuyList(String usernum);

}
