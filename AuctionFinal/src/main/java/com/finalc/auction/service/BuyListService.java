package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		System.out.println("2. Service 단 buyMapList : " + buyMapList);
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
	public int inputAward(HashMap<String, String> map) {
		int award1 = dao.inputAward(map);
		return award1;
	}


	@Override
	public int updateAD(HashMap<String, String> map) {
		int award2 = dao.updateAD(map);
		return award2;
	}

}
