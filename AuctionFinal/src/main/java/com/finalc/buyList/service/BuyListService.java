package com.finalc.buyList.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.buyList.model.InterBuyListDAO;

@Service
public class BuyListService implements InterBuyListService {

	@Autowired
	private InterBuyListDAO dao;
}
