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
	public List<HashMap<String, String>> getAdMin() {
		List<HashMap<String, String>> adMapList = sqlsession.selectList("adMin.getadMin");
		return adMapList;
	}

	// 카테고리 페이지 단
	@Override
	public List<CategoryVO> getAdminCategory() {
		List<CategoryVO> categoryList = sqlsession.selectList("admin.getAdminCategory");
		return categoryList;
	}

	@Override
	public List<CategoryVO> getAdminCategoryDetail() {
		List<CategoryVO> categoryListDetail = sqlsession.selectList("admin.getAdminCategoryDetail");
		return categoryListDetail;
	}

	// 카테고리 등록 단
	@Override
	public int addCategory(HashMap<String, String> map) {
		int n = sqlsession.insert("admin.addCategory", map);
		return n;
	}

	// 카테고리 삭제 단
	@Override
	public int delCategory(HashMap<String, String> map) {
		int n = sqlsession.update("admin.delCategory", map);
		return n;
	}
	
}
