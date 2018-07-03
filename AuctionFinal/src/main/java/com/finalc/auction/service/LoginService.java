package com.finalc.auction.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterLoginDAO;
import com.finalc.auction.model.MemberVO;


@Service
public class LoginService implements InterLoginService {

	@Autowired
	private InterLoginDAO dao;

	@Override
	public MemberVO getLoginMember(HashMap<String, String> map) {
		MemberVO loginuser = dao.getLoginMember(map);
		return loginuser;
	}
	
}
