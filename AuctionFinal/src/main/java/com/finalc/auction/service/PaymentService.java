package com.finalc.auction.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterPaymentDAO;

@Service
public class PaymentService implements InterPaymentService {

	@Autowired
	private InterPaymentDAO dao;
	
	@Override
	public int auctionPay(String usernum, String coinmoney) {
		
		int n = dao.auctionPay(usernum, coinmoney);
		
		return n;
	}

}
