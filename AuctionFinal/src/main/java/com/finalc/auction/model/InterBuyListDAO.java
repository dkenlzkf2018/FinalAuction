package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterBuyListDAO {

	// #Buy 5. 구매 리스트 Interface DAO 단
	List<HashMap<String, String>> getBuyList(HashMap<String, String> map);

	int getTotalCount();

	AuctionVO viewAuction(String actdnum);

	CategoryVO getCategoryName(String actnum);

	int inputTender(HashMap<String, String> map);

	String getTender(String actnum);

	int getTenderCount(String actnum);

	JoinaclistVO searchTender(HashMap<String, String> map);

	int inputAward(HashMap<String, String> map);

	int updateAD(HashMap<String, String> map);

	int updateDeposit(HashMap<String, String> map);

	int rollbackDeposit(HashMap<String, String> map);

	JoinaclistVO getMemberDeposit(String actnum);

	int awardCancel(HashMap<String, String> map);

	int updateAwardCancel(HashMap<String, String> map);

	int quickGumae(HashMap<String, String> map);

	int paymember(HashMap<String, String> map);

	int paystatus(HashMap<String, String> map);

	int inputDeliver(HashMap<String, String> map);

	HashMap<String, String> getDeliverData(HashMap<String, String> map);

}
