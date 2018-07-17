package com.finalc.auction.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository
public class AuctionDAO implements InterAuctionDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	@Override
	public int add_auction(AuctionVO auctionVO) {
		int result = 0;
		int m = sqlsession.insert("auction.add_auction", auctionVO);
		System.out.println(">> 확인용 dao-1.1 ");
		int n = sqlsession.insert("auction.add_detail", auctionVO);
		
		if (m + n >= 2) {
			result = 1;
		}
		System.out.println(">> 확인용 dao-1 : " + result);
		return result;
	}

	@Override
	public int add_auctionWithFile(AuctionVO auctionVO) {
		int result = 0;
	//	System.out.println(">> 확인용 dao-2 map.get : " + map.get("cdnum"));
		int m = sqlsession.insert("auction.add_auctionWithFile", auctionVO);
		System.out.println(">> 확인용 dao-2.1 ");
		int n = sqlsession.insert("auction.add_detail", auctionVO);
		
		if (m + n >= 2) {
			result = 1;
		}
		System.out.println(">> 확인용 dao-2 : " + result);
		return result;
	}

	@Override
	public int ShowAuction(HashMap<String, String> map) {
		int n = sqlsession.selectOne("auction.ShowAuction", map);
		
		return n;
	}

	@Override
	public List<AuctionVO> getAuctionList(String fk_cdnum) {
		System.out.println(">> 확인용 fk_cdnum : " + fk_cdnum);
		List<AuctionVO> auctionList = sqlsession.selectList("auction.getAuctionList", fk_cdnum);
		
		for (AuctionVO avo:auctionList) {
			System.out.println(">> 확인용 AuctionVO name : " + avo.getActname());
		}
		System.out.println(">> 확인용 auctionList의 Size : "+auctionList.size());
		return auctionList;
	}

}
