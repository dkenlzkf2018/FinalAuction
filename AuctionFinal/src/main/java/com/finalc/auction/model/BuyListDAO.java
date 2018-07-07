package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BuyListDAO implements InterBuyListDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// #Buy 6. 구매 리스트 DAO 단
	@Override
	public List<HashMap<String, String>> getBuyList(HashMap<String, String> map) {
		System.out.println("Dao 단 map : " + map);
		List<HashMap<String, String>> buyMapList = sqlsession.selectList("buyList.getBuyList", map);
		System.out.println("3. DAO 단 buyMapList : " + buyMapList);
		return buyMapList;
	}

	@Override
	public int getTotalCount() {
		int count = sqlsession.selectOne("buyList.getTotalCount");
		return count;
	}

	@Override
	public AuctionVO viewAuction(String actdnum) {
		AuctionVO acvo = sqlsession.selectOne("buyList.viewAuction", actdnum);
		return acvo;
	}

	@Override
	public CategoryVO getCategoryName(String actnum) {
		CategoryVO cvo = sqlsession.selectOne("buyList.getCategoryName", actnum);
		return cvo;
	}

	@Override
	public int inputTender(HashMap<String, String> map) {
		int result = sqlsession.insert("buyList.inputTender",map);
		return result;
	}
	
}
