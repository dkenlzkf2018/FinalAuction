package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements InterBoardDAO {
	
	// 게시판 DAO
	
	@Autowired
	private SqlSessionTemplate sqlsession;

	// 총 게시물 건수 페이징처리 시작 (07.03)
	// 검색어 없는 총 게시물 건수
	@Override
	public int getTotalCount() {
		int count = sqlsession.selectOne("board.getTotalCount");
		
		return count;
	}

	// 검색어 있는 총 게시물 건수
	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		int count = sqlsession.selectOne("board.getTotalCount2", map);
		
		return count;
	}// 총 게시물 건수 페이징처리 끝 (07.03)

	// 게시글 목록 시작(07.03)
	// 검색어 없는 게시글목록 보여주기
	@Override
	public List<BoardVO> boardList(HashMap<String, String> map) {
		List<BoardVO> boardList = sqlsession.selectList("board.boardList", map);
		
		return boardList;
	}
	// 검색어 있는 게시글목록 보여주기
	@Override
	public List<BoardVO> boardList2(HashMap<String, String> map) {
		List<BoardVO> boardList = sqlsession.selectList("board.boardList2", map);
		
		return boardList;
	}// 게시글 목록 끝(07.03)
	
	

}
