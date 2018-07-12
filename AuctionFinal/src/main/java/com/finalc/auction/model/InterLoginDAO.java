package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterLoginDAO {

	MemberVO getLoginMember(HashMap<String, String> map);

	int idCheck(String userid);

	int memberRegist(HashMap<String, String> map);

	int memberRegistDetail(HashMap<String, String> map);

	int updatePwdUser(HashMap<String, String> map);
	
	int isUserExists(HashMap<String, String> map);

	List<ZipcodeVO> serchZipcode(String sido);


}
