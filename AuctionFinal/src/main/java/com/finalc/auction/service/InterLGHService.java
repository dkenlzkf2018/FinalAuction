package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.HugiBoardVO;
import com.finalc.auction.model.MemberVO;

public interface InterLGHService {

	List<MemberVO> getMemberList();

	List<HashMap<String, String>> getAwardList();

	List<HugiBoardVO> getHugiList();

	int hugiDel(String ep_boardno);

	int hugiRecover(String ep_boardno);

	int deliverSet(HashMap<String, String> map);

}
