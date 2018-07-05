package com.finalc.auction.service;

import java.util.HashMap;

import com.finalc.auction.model.MemberVO;

public interface InterLoginService {

	MemberVO getLoginMember(HashMap<String, String> map);

	int idCheck(String userid);

	int memberRegist(HashMap<String, String> map);

	int memberRegistDetail(HashMap<String, String> map);

}
