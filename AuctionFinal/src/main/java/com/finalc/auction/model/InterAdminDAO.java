package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterAdminDAO {

	// 관리자 페이지 메인 단
	List<HashMap<String, String>> getadMin(HashMap<String, String> map);

	
}