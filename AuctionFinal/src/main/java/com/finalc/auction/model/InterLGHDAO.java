package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterLGHDAO {

	List<MemberVO> getMemberList();

	List<HashMap<String, String>> getAwardList();

	List<HugiBoardVO> getHugiList();

	int hugiDel(String ep_boardno);

	int hugiRecover(String ep_boardno);

	int deliverSet(HashMap<String, String> map);

}
