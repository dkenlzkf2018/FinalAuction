package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.exceptions.TooManyResultsException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.interceptor.CacheOperationInvoker.ThrowableWrapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.InterBuyListDAO;
import com.finalc.auction.model.JoinaclistVO;

@Service
public class BuyListService implements InterBuyListService {

	@Autowired
	private InterBuyListDAO dao;

	// #Buy 4. 구매 리스트 Service 단
	@Override
	public List<HashMap<String, String>> getBuyList(HashMap<String, String> map) {
		List<HashMap<String, String>> buyMapList = dao.getBuyList(map);
		System.out.println("2. Service 단 buyMapList");
		return buyMapList;
	}

	
	public int getTotalCount() {
		int count = dao.getTotalCount();
		return count;
	}


	@Override
	public AuctionVO viewAuction(String actdnum) {
		AuctionVO acvo = dao.viewAuction(actdnum);
		return acvo;
	}


	@Override
	public CategoryVO getCategoryName(String actnum) {
		CategoryVO cvo = dao.getCategoryName(actnum);
		return cvo;
	}


	@Override
	public int inputTender(HashMap<String, String> map) {
		int result = dao.inputTender(map);
		return result;
	}


	@Override
	public String getTender(String actnum) {
		String price = dao.getTender(actnum);
		return price;
	}
	
	@Override
	public int getTenderCount(String actnum) {
		int count = dao.getTenderCount(actnum);
		return count;
	}


	@Override
	public JoinaclistVO searchTender(HashMap<String, String> map) {
		JoinaclistVO jvo = dao.searchTender(map);
		return jvo;
	}


	@Override
	public int inputDeliver(HashMap<String, String> map) {
		int deliver = dao.inputDeliver(map);
		return deliver;
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED, isolation=Isolation.READ_COMMITTED, rollbackFor={Throwable.class})
	public int inputAward_transaction(HashMap<String, String> map) 
		throws TooManyResultsException {
		int award1 = dao.inputAward(map);
		
		// #Buy 17. #Buy 16. 의 낙찰이 되어 경매가 종료되었으므로
		// 경매 status를 0으로 변경한다.
		int award2 = dao.updateAD(map);
		int deliver = 0;
		
		if (award1+award2 == 2) {			
			
			HashMap<String, String> deliverMap = dao.getDeliverData(map);
			map.put("AWARDNUM", deliverMap.get("awardnum"));
			map.put("ADDR", deliverMap.get("addr"));
			deliver = dao.inputDeliver(map);
			
			
		}
		return (award1+award2+deliver);
	}

}
