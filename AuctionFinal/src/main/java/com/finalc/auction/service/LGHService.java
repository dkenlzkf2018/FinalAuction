package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.InterLGHDAO;
import com.finalc.auction.model.MemberVO;

@Service
public class LGHService implements InterLGHService {
	@Autowired
	private InterLGHDAO dao;

	@Override
	public List<MemberVO> getMemberList() {
		List<MemberVO> memberList = dao.getMemberList();
		return memberList;
	}

	@Override
	public List<HashMap<String, String>> getAwardList() {
		List<HashMap<String, String>> awardList = dao.getAwardList();
		return awardList;
	}
}
