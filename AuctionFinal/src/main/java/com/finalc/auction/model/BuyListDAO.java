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
	
	// 낙찰목록을 조회하기위해 join을 사용하여 List<HashMap>으로 전부 가져온다.
	@Override
	public List<HashMap<String, String>> getBuyList(HashMap<String, String> map) {
		List<HashMap<String, String>> buyMapList = sqlsession.selectList("buyList.getBuyList", map);
		System.out.println("2. DAO 단 buyMapList");
		return buyMapList;
	}

	// 낙찰된 수
	@Override
	public int getTotalCount(HashMap<String, String> map) {
		int count = sqlsession.selectOne("buyList.getTotalCount", map);
		return count;
	}

	// 상품 세부조회에 필요한 것을 가져온다.
	@Override
	public AuctionVO viewAuction(String actdnum) {
		AuctionVO acvo = sqlsession.selectOne("buyList.viewAuction", actdnum);
		return acvo;
	}

	// 카테고리 컬럼을 가져온다.
	@Override
	public CategoryVO getCategoryName(String actnum) {
		CategoryVO cvo = sqlsession.selectOne("buyList.getCategoryName", actnum);
		return cvo;
	}

	// 입찰하기
	@Override
	public int inputTender(HashMap<String, String> map) {
		int result = sqlsession.insert("buyList.inputTender",map);
		return result;
	}

	// 해당 상품의 입찰내역 중 가장 높은 입찰가를 가져온다.
	@Override
	public String getTender(String actnum) {
		String price = sqlsession.selectOne("buyList.getTenderPrice", actnum);
		return price;
	}

	// 입찰 수를 가져온다.
	@Override
	public int getTenderCount(String actnum) {
		int count = sqlsession.selectOne("buyList.getTenderCount", actnum);
		return count;
	}

	// 입찰내역을 가져온다.
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

	@Override
	public int updateDeposit(HashMap<String, String> map) {
		int result2 = sqlsession.update("buyList.updateDeposit", map);
		return result2;
	}

	@Override
	public int rollbackDeposit(HashMap<String, String> map) {
		int result0 = sqlsession.update("buyList.rollbackDeposit", map);
		return result0;
	}

	// 해당 상품의 보증금을 계산하기 위해 최고 입찰가와 회원번호를 가져온다.
	@Override
	public JoinaclistVO getMemberDeposit(String actnum) {
		JoinaclistVO jvo = sqlsession.selectOne("buyList.getMemberDeposit", actnum);
		return jvo;
	}
	
	// 낙찰을 취소할 시 보증금을 판매자에게 보낸다.
	@Override
	public int updateAwardCancel(HashMap<String, String> map) {
		int cancel0 = sqlsession.update("buyList.awardCancel", map);
		return cancel0;
	}

	// 낙찰 취소
	@Override
	public int awardCancel(HashMap<String, String> map) {
		int cancel = sqlsession.update("buyList.memberCancel", map);
		return cancel;
	}

	@Override
	public int quickGumae(HashMap<String, String> map) {
		int quickgumae = sqlsession.update("buyList.quickGumae", map);
		return quickgumae;
	}

	@Override
	public int paymember(HashMap<String, String> map) {
		int pay = sqlsession.update("buyList.paymember", map);
		return pay;
	}

	@Override
	public int paystatus(HashMap<String, String> map) {
		int pay_status = sqlsession.update("buyList.paystatus", map);
		return pay_status;
	}

	

	@Override
	public int inputDeliver(HashMap<String, String> map) {
		int deliver = sqlsession.insert("buyList.inputDeliver", map);
		return deliver;
	}

	@Override
	public HashMap<String, String> getDeliverData(HashMap<String, String> map) {
		HashMap<String, String> deliverMap = sqlsession.selectOne("buyList.getDeliverData", map);
		return deliverMap;
	}

	
}
