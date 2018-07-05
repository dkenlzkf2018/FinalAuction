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

	// 게시글 쓰기 완료 (07.03 시작)
	// 게시글 쓰기 (파일 첨부 있는거, 없는거 시작)
	@Override
	public int write_add(BoardVO boardvo) {
		int n = sqlsession.insert("board.write_add", boardvo);
		
		return n;
	}

	@Override
	public int getGroupMaxno() {
		int max = sqlsession.selectOne("board.getGroupMaxno");
		
		return max;
	}

	@Override
	public int write_withFile(BoardVO boardvo) {
		int n = sqlsession.insert("board.write_withFile", boardvo);
				
		return n;
	}// 게시글 쓰기 (파일 첨부 있는거, 없는거 끝)
	// 게시글 쓰기 완료 (07.03 끝)

	// 게시글 1개보기 (조회수 증가, 증가없이 07.05 시작)
	@Override
	public BoardVO getWriteView(String boardno) {
		BoardVO boardvo = sqlsession.selectOne("board.getWriteView", boardno);
		
		return boardvo;
	
	}// 게시글 1개보기 (조회수 증가, 증가없이 07.05 끝)
	
	// 게시글 1개 볼때마다 1증가(07.05 시작)
	@Override
	public void setAddViewCount(String boardno) {
		
		
	}// 게시글 1개 볼때마다 1증가(07.05 끝)

	// 댓글보기 (07.05 시작)
	@Override
	public List<CommentVO> commentList(String boardno) {
		
		return null;
	}// 댓글보기 (07.05 끝)
	
	

}
