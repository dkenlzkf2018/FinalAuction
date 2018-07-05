package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

public interface InterAdminService {

	// #Admin main - 관리자페이지 인터페이스 DAO
	List<HashMap<String, String>> getAdMin(String userid);

}
