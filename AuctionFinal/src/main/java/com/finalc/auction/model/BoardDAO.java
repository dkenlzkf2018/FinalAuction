package com.finalc.auction.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements InterBoardDAO {
	
	// 게시판 DAO
	
	@Autowired
	private SqlSessionTemplate sqlsession;

}
