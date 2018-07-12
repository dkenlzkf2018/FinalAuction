package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterLoginDAO {

	MemberVO getLoginMember(HashMap<String, String> map);

	int idCheck(String userid);

	int memberRegist(HashMap<String, String> map);

	int memberRegistDetail(HashMap<String, String> map);

	List<ZipcodeVO> serchZipcode(String sido);

	int updatePwdUser(String pwd);
	
	int isUserExists(HashMap<String, String> map);

	int updatePwdUser1(String userid);

}
