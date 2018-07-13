package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LGHDAO implements InterLGHDAO {
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = sqlsession.selectList("leegh.getMemberList");
		return memberList;
	}

	@Override
	public List<HashMap<String, String>> getAwardList() {
		List<HashMap<String, String>>awardList = sqlsession.selectList("leegh.getAwardList");
		return awardList;
	}

	@Override
	public List<HugiBoardVO> getHugiList() {
		List<HugiBoardVO> hugiLsit = sqlsession.selectList("leegh.getHugiList");
		return hugiLsit;
	}

	@Override
	public int hugiDel(String ep_boardno) {
		int n = sqlsession.update("leegh.hugiDel", ep_boardno);
		return n;
	}

	@Override
	public int hugiRecover(String ep_boardno) {
		int n = sqlsession.update("leegh.hugiRecover", ep_boardno);
		return n;
	}

	@Override
	public int deliverSet(HashMap<String, String> map) {
		int n = 0;
		HashMap<String, String> map1 = new HashMap<String, String>();
		for(int i=1; i<map.size()-1; i++) {
			map1.put("deliverstatus", map.get("deliverstatus"+i));
			map1.put("awardnum", map.get("awardnum"+i));
			n = sqlsession.update("leegh.deliverSet", map1);
			if(n == 0) {
				return 0;
			}
		}
		return n;
	}
}
