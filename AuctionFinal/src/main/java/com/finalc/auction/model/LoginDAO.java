package com.finalc.auction.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
		return n;
	}

	@Override
	public int memberRegist(HashMap<String, String> map) {
		int RegMember = sqlsession.insert("login.memberRegist", map);
		return RegMember;
	}

	@Override
	public int memberRegistDetail(HashMap<String, String> map) {
		int RegMember = sqlsession.insert("login.memberRegistDetail", map);
		return RegMember;
	}

	@Override
	public List<ZipcodeVO> serchZipcode(String sido) {
		List<ZipcodeVO> zipcodeList  = sqlsession.selectList("login.serchZipcode", sido);
		return zipcodeList;
	}

	@Override
	public int updatePwdUser(HashMap<String, String> map) {
		int n = sqlsession.update("login.updatePwdUser", map);
		return n;
		
	}

	@Override
	public int isUserExists(HashMap<String, String> map) {
		int n = sqlsession.selectOne("login.isUserExists", map);
		return n;
	}

	
}
