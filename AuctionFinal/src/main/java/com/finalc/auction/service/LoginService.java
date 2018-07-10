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
	public List<ZipcodeVO> serchZipcode(String sido) {
		List<ZipcodeVO> zipcodeList = dao.serchZipcode(sido);
		return zipcodeList;
	}
	
}
