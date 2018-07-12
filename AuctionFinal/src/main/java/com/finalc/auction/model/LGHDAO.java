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
}
