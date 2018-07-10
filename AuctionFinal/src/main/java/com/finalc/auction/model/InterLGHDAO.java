package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterLGHDAO {

	List<MemberVO> getMemberList();

	List<HashMap<String, String>> getAwardList();

}
