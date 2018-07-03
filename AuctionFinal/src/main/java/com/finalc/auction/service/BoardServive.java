package com.finalc.auction.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterBoardDAO;



@Service
public class BoardServive implements InterBoardService {
	
	// 게시판 Service
	
	@Autowired
	private InterBoardDAO dao;

}
