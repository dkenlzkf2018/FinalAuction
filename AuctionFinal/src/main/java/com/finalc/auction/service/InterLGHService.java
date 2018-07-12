package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.MemberVO;

public interface InterLGHService {

	List<MemberVO> getMemberList();

	List<HashMap<String, String>> getAwardList();

}
