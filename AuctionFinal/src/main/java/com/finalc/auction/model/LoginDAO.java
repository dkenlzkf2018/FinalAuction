package com.finalc.auction.model;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LoginDAO implements InterLoginDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public MemberVO getLoginMember(HashMap<String, String> map) {
		MemberVO loginuser = sqlsession.selectOne("login.getLoginMember", map);
		return loginuser;
	}

	@Override
	public int idCheck(String userid) {
		int n = sqlsession.selectOne("login.idCheck", userid);
		
		System.out.println("확인용 3 : " + n);
		
		return n;
	}
	
}
