package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

public interface InterAdminDAO {

	// #Admin main 관리자메인페이지
	List<HashMap<String, String>> getAdMin(String n);
	
}
