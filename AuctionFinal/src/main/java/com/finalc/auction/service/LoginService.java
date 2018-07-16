package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterLoginDAO;
import com.finalc.auction.model.MemberVO;
import com.finalc.auction.model.ZipcodeVO;


@Service
public class LoginService implements InterLoginService {

	@Autowired
	private InterLoginDAO dao;

	@Override
	public MemberVO getLoginMember(HashMap<String, String> map) {
		MemberVO loginuser = dao.getLoginMember(map);
		return loginuser;
	}

	@Override
	public int idCheck(String userid) {
		int n = dao.idCheck(userid);
		return n;
	}

	@Override
	public int memberRegist(HashMap<String, String> map) {
		int RegMember = dao.memberRegist(map);
		return RegMember;
	}

	@Override
	public int memberRegistDetail(HashMap<String, String> map) {
		int RegMember = dao.memberRegistDetail(map);
		return RegMember;
	}

	@Override
	public List<HashMap<String, String>> serchZipcode(HashMap<String, String> map) {
		List<HashMap<String, String>> zipcodeList = dao.serchZipcode(map);
		return zipcodeList;
	}

	@Override
	public int updatePwdUser(HashMap<String, String> map) {
		int n = dao.updatePwdUser(map);
		return n;
	}
	
	@Override
	public int isUserExists(HashMap<String, String> map) {
		int n = dao.isUserExists(map);
		return n;
	}

	@Override
	public int memberEdit(HashMap<String, String> map) {
		int n = dao.memberEdit(map);
		return n;
	}


	
	
}
