package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.MemberVO;
import com.finalc.auction.model.ZipcodeVO;

public interface InterLoginService {

	MemberVO getLoginMember(HashMap<String, String> map);

	int idCheck(String userid);

	int memberRegist(HashMap<String, String> map);

	int memberRegistDetail(HashMap<String, String> map);

	List<ZipcodeVO> serchZipcode(String sido);

	int updatePwdUser(HashMap<String, String> map);
	
	int isUserExists(HashMap<String, String> map);

}
