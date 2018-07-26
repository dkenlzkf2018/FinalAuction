package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.JoinaclistVO;

public interface InterBuyListService {
	
	// #Buy 3. 구매 리스트 Interface Service 단
	List<HashMap<String, String>> getBuyList(HashMap<String, String> map);

	int getTotalCount();

	AuctionVO viewAuction(String actdnum);

	CategoryVO getCategoryName(String actnum);

	// #Buy 12. 경매 입찰(insert)하는 Interface Service 단
	int inputTender(HashMap<String, String> map);

	// #Buy 13. 경매 입찰했던 최고가격을 가져옴
	String getTender(String actnum);

	// #Buy 14. 경매 입찰 수를 가져옴
	int getTenderCount(String actnum);

	// #Buy 15. 입찰금액이 가장 큰 1행만 가져온다.
	JoinaclistVO searchTender(HashMap<String, String> map);

	

	/*// #Buy 18. #Buy 17. 의 경매 status 0으로(경매종료를 알리는 스테이터스) 변경되었으므로
	// 배송테이블에 기본값 주문완료를 입력시킨다.
	int inputDeliver(HashMap<String, String> map);*/

	// #Buy 16. 낙찰 테이블에 #Buy 15. 을 입력시킨다.
	/*int inputAward_transaction(HashMap<String, String> map);*/

	// 입찰 없이 경매가 종료 되었을 경우에도 경매status를 0으로 바꿔준다.
	/*int updateAuctionStatus(HashMap<String, String> map);*/

	JoinaclistVO getMemberDeposit(String actnum);

	int rollbackDeposit(HashMap<String, String> map);

	int awardCancel(HashMap<String, String> map);

	int quickTender(HashMap<String, String> map);
}
