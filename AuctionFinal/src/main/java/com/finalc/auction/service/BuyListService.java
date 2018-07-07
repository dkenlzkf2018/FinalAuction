package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.InterBuyListDAO;

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

	// #Buy 13. 경매 입찰(insert)하는 Service 단
	@Override
	public int getBindAuction(HashMap<String, String> map) {
		int bind = dao.getBindAuction(map);
		return bind;
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
}
