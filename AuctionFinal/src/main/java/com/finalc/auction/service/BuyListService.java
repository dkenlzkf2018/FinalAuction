package com.finalc.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterBuyListDAO;

@Service
public class BuyListService implements InterBuyListService {

	@Autowired
	private InterBuyListDAO dao;
}
