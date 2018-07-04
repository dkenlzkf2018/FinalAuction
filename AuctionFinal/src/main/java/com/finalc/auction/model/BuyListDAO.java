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
	public List<HashMap<String, String>> getBuyList(String usernum) {
		System.out.println("Dao 단 usernum : " + usernum);
		List<HashMap<String, String>> buyMapList = sqlsession.selectList("buyList.getBuyList", usernum);
		System.out.println("3. DAO 단 buyMapList : " + buyMapList);
		return buyMapList;
	}
	
}
