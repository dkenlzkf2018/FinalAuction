package com.finalc.auction.model;

import java.util.HashMap;

public interface InterLoginDAO {

	MemberVO getLoginMember(HashMap<String, String> map);

	int idCheck(String userid);

	int memberRegist(HashMap<String, String> map);

}
