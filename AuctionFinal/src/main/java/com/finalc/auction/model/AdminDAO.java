package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAO implements InterAdminDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// 관리자 페이지 요청 단
	@Override
	public List<HashMap<String, String>> getBuyList(HashMap<String, String> map) {
		System.out.println("Dao 단 map : " + map);
		List<HashMap<String, String>> buyMapList = sqlsession.selectList("buyList.getBuyList", map);
		System.out.println("3. DAO 단 buyMapList : " + buyMapList);
		return buyMapList;
	}
	
}
