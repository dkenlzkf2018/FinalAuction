package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterBuyListDAO;

@Service
public class BuyListService implements InterBuyListService {

	@Autowired
	private InterBuyListDAO dao;

	// #Buy 4. 구매 리스트 Service 단
	@Override
	public List<HashMap<String, String>> getBuyList(String usernum) {
		List<HashMap<String, String>> buyMapList = dao.getBuyList(usernum);
		System.out.println("2. Service 단 buyMapList : " + buyMapList);
		return buyMapList;
	}
}
