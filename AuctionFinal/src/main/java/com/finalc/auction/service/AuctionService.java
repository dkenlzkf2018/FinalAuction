package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.InterAuctionDAO;

@Service
public class AuctionService implements InterAuctionService {

	@Autowired
	private InterAuctionDAO dao;
	
	// 0704 옥선을 등록하는 서비스
	@Override
	public int AuctionUpload() {
		
		return 0;
	}

	// 0709 옥션등록 하는 서비스 (첨부 이미지 없음)
	@Override
	public int add_auction(HashMap<String, String> map) {
		int n = dao.add_auction(map);
		System.out.println(">> 확인용 service-1 n : " + n);
		return n;
	}
	// 0709 옥션등록 하는 서비스 (첨부 이미지 있음)
	@Override
	public int add_auctionWithFile(HashMap<String, String> map) {
		int n = dao.add_auctionWithFile(map);
		System.out.println(">> 확인용 service-2 n : " + n);
		return n;
	}

	@Override
	public int ShowAuction(HashMap<String, String> map) {
		int n = dao.ShowAuction(map);
		
		return n;
	}

	@Override
	public List<AuctionVO> getAuctionList(String fk_cdnum) {
		List<AuctionVO> auctionList = dao.getAuctionList(fk_cdnum);
		
		return auctionList;
	}

}
