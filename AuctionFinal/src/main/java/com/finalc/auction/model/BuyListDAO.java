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
		List<HashMap<String, String>> buyMapList = sqlsession.selectList("buyList.getBuyList", map);
		System.out.println("2. DAO 단 buyMapList");
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

	@Override
	public String getTender(String actnum) {
		String price = sqlsession.selectOne("buyList.getTenderPrice", actnum);
		return price;
	}

	@Override
	public int getTenderCount(String actnum) {
		int count = sqlsession.selectOne("buyList.getTenderCount", actnum);
		return count;
	}

	@Override
	public JoinaclistVO searchTender(HashMap<String, String> map) {
		JoinaclistVO jvo = sqlsession.selectOne("buyList.searchTender", map);
		return jvo;
	}

	@Override
	public int inputAward(HashMap<String, String> map) {
		int award1 = sqlsession.insert("buyList.inputAward", map);
		return award1;
	}

	@Override
	public int updateAD(HashMap<String, String> map) {
		int award2 = sqlsession.update("buyList.updateAward", map);
		return award2;
	}

	/*@Override
	public int inputDeliver(HashMap<String, String> map) {
		int deliver = sqlsession.insert("buyList.inputDeliver", map);
		return deliver;
	}*/

	/*@Override
	public HashMap<String, String> getDeliverData(HashMap<String, String> map) {
		HashMap<String, String> deliverMap = sqlsession.selectOne("buyList.getDeliverData", map);
		return deliverMap;
	}*/
	
}
