package com.finalc.auction.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaymentDAO implements InterPaymentDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public int auctionPay(String usernum, String coinmoney) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("usernum", usernum);
		map.put("coinmoney", coinmoney);
		System.out.println(">> 확인용 DAO 1-1");
		int n = sqlsession.update("auction.auctionPay", map);
		System.out.println(">> 확인용 DAO 1-2");
		return n;
	}

}
