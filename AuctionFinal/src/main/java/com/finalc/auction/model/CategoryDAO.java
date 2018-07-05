package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CategoryDAO implements InterAdminDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	// #. 카테고리 관리 DAO 단
/*	@Override
	public List<HashMap<String, String>> getBuyList(String usernum) {
		System.out.println("Dao 단 usernum : " + usernum);
		List<HashMap<String, String>> buyMapList = sqlsession.selectList("buyList.getBuyList", usernum);
		System.out.println("3. DAO 단 buyMapList : " + buyMapList);
		return buyMapList;
	}*/
	
}
