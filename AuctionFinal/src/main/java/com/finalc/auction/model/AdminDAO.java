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
	
	// 관리자 메인 Controller 단
	@Override
	public List<HashMap<String, String>> getadMin(HashMap<String, String> map) {
		System.out.println("Dao 단 map : " + map);
		List<HashMap<String, String>> adMapList = sqlsession.selectList("adMin.getadMin", map);
		System.out.println("3. DAO 단 adMapList : " + adMapList);
		return adMapList;
	}

	@Override
	public List<CategoryVO> getAdminCategory() {
		List<CategoryVO> adminCategory = sqlsession.selectList("admin.getAdminCategory");
		return adminCategory;
	}
	
	// 카테고리 관리 페이지 Controller 단
	/*@Override
	public List<HashMap<String, String>> getadMin(HashMap<String, String> map) {
		System.out.println("Dao 단 map : " + map);
		List<HashMap<String, String>> adMapList = sqlsession.selectList("adMin.getadMin", map);
		System.out.println("3. DAO 단 adMapList : " + adMapList);
		return adMapList;
	}*/
	
	// 카테고리 등록 Controller 단
	
	// 카테고리 수정 Controller 단
	
	// 카테고리 삭제 Controller 단
	
	
}
