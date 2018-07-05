package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalc.auction.model.BoardVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.CommentVO;
import com.finalc.auction.model.InterBoardDAO;



@Service
public class BoardServive implements InterBoardService {
	
	// 게시판 Service
	
	@Autowired
	private InterBoardDAO dao;
	
	// 총 게시물 건수 페이징처리 시작 (07.03)
	// 검색어 없는 총 게시물 건수
	@Override
	public int getTotalCount() {
		
		int count = dao.getTotalCount();
		
		return count;
	}

	// 검색어 있는 총 게시물 건수
	@Override
	public int getTotalCount2(HashMap<String, String> map) {
		
		int count = dao.getTotalCount2(map);
		
		return count;
	}// 총 게시물 건수 페이징처리 끝 (07.03)

	// 게시글 목록 시작(07.03)
	// 검색어 없는 게시글목록 보여주기
	@Override
	public List<BoardVO> boardList(HashMap<String, String> map) {
		
		List<BoardVO> boardList = dao.boardList(map);
		
		return boardList;
	}
	// 검색어 있는 게시글목록 보여주기
	@Override
	public List<BoardVO> boardList2(HashMap<String, String> map) {
		
		List<BoardVO> boardList = dao.boardList2(map);
		
		return boardList;
	}// 게시글 목록 끝(07.03)

	// 게시글 쓰기 완료 (07.03 시작)
	// 게시글 쓰기 (파일 첨부 없는거 시작)
	@Override
	public int write_add(BoardVO boardvo) {
		
		if(boardvo.getFk_boardno() == null || boardvo.getFk_boardno().trim().isEmpty()) {
			
			int groupno = dao.getGroupMaxno()+1;
			boardvo.setGroupno(String.valueOf(groupno));
			
		}
		
		int n = dao.write_add(boardvo);
		
		
		return n;
	}// 게시글 쓰기 (파일 첨부 없는거 끝)
	

	// 게시글 쓰기 (파일 첨부 있는거 시작)
	@Override
	public int write_withFile(BoardVO boardvo) {
		
		if(boardvo.getFk_boardno() == null || boardvo.getFk_boardno().trim().isEmpty()) {
			
			int groupno = dao.getGroupMaxno()+1;
			boardvo.setGroupno(String.valueOf(groupno));
		}
		
		int n = dao. write_withFile(boardvo);
	
		return n;
	 // 게시글 쓰기 (파일 첨부 있는거 끝)
	}// 게시글 쓰기 완료 (07.03 끝)

	@Override
	public List<CategoryVO> getCategoryList() {
		List<CategoryVO> categoryList = dao.getCategoryList();
		return categoryList;
	}

	@Override
	public List<CategoryVO> getCategoryDetailList() {
		List<CategoryVO> categoryDetailList = dao.getCategoryDetailList();
		return categoryDetailList;
	}
	// 게시글 1개보기 (조회수 증가 07.05 시작)
	@Override
	public BoardVO getWriteView(String boardno, String userid) {
		BoardVO boardvo = dao.getWriteView(boardno);
		
		if(userid != null && !boardvo.getFk_userid().equals(userid)) {
			dao.setAddViewCount(boardno);
			boardvo = dao.getWriteView(boardno);
			
		}
		
		return boardvo;
	}// 게시글 1개보기 (조회수 증가 07.05 끝)

	// 게시글 1개보기 (조회수 증가없이 07.05 시작)
	@Override
	public BoardVO getNoviewCountWriteView(String boardno) {
		BoardVO boardvo = dao.getWriteView(boardno);
		
		return boardvo;
	}// 게시글 1개보기 (조회수 증가없이 07.05 끝)

	// 댓글 보기 (07.05 시작)
	@Override
	public List<CommentVO> commentList(String boardno) {
		List<CommentVO> comment = dao.commentList(boardno);
		
		return comment;
	}// 댓글 보기 (07.05 끝)
	
	

}
