package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.SystemPropertyUtils;

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

   @Override
   public List<CategoryVO> getCategoryList() {
      List<CategoryVO> categoryList = sqlsession.selectList("auction.getCategoryList");
      return categoryList;
   }

   @Override
   public List<CategoryVO> getCategoryDetailList() {
      List<CategoryVO> categoryDetailList = sqlsession.selectList("auction.getCategoryDetailList");
      return categoryDetailList;
   }
   // 게시글 1개보기 (조회수 증가, 증가없이 07.05 시작)
   @Override
   public BoardVO getWriteView(String boardno) {
      BoardVO boardvo = sqlsession.selectOne("board.getWriteView", boardno);
      
      return boardvo;
   
   }// 게시글 1개보기 (조회수 증가, 증가없이 07.05 끝)
   
   // 게시글 1개 볼때마다 1증가(07.05 시작)
   @Override
   public void setAddViewCount(String boardno) {
      sqlsession.update("board.setAddViewCount", boardno);
      
   }// 게시글 1개 볼때마다 1증가(07.05 끝)

   // 댓글보기 (07.05 시작)
   @Override
   public List<CommentVO> commentList(String boardno) {
      List<CommentVO> list = sqlsession.selectList("board.commentList", boardno);
      
      return list;
   }// 댓글보기 (07.05 끝)

   @Override
   public List<HugiBoardVO> getReviewByActdnum(String actdnum) {
      List<HugiBoardVO> hugiBoardList = sqlsession.selectList("board.getReviewByActdnum", actdnum);
      return hugiBoardList;
   }

   @Override
   public int reviewRegist(HashMap<String, String> map) {
      int n = sqlsession.insert("board.reviewRegist",map);
      return n;
   }
   
   // 게시글 수정페이지 완료 (07.06 12:32 시작)
   @Override
   public int writeedit(BoardVO boardvo) {
      int n = sqlsession.update("board.writeedit", boardvo);
            
      return n;
   }// 게시글 수정페이지 완료 (07.06 12:32 끝)

   // 게시글에 댓글이 있는지 없는지 확인(07.06 17:30 시작)
   @Override
   public boolean isExistsComment(HashMap<String, String> map) {
      int count = sqlsession.selectOne("board.isExistsComment", map);
      
      if(count > 0)
 
         return true;
      else
         
         return false;

   }// 게시글에 댓글이 있는지 없는지 확인(07.06 17:30 끝)

   // 게시글 삭제하기(07.06 17:31 시작)
   @Override
   public int deleteContent(HashMap<String, String> map) {
      int n = sqlsession.update("board.deleteContent", map);
      
      return n;
   }// 게시글 삭제하기(07.06 17:31 끝)

   // 게시글에 댓글 삭제(07.06 17:31 시작)
   @Override
   public int deleteComment(HashMap<String, String> map) {
      int n = sqlsession.update("board.deleteComment", map);
      
      return n;
   }// 게시글에 댓글 삭제(07.06 17:31 끝)

   // 댓글 쓰기(07.07 11:57 시작)
   @Override
   public int writeComment(CommentVO commentvo) {
      int n = sqlsession.insert("board.writeComment", commentvo);
      
      return n;
   }// 댓글 쓰기(07.07 11:57 끝)

   // 댓글쓰기 후 댓글갯수 1증가(07.07 11:58 시작)
   @Override
   public int updateCommentCount(String fk_boardno) {
      int n = sqlsession.update("board.updateCommentCount", fk_boardno);
      
      return n;
   }// 댓글쓰기 후 댓글갯수 1증가(07.07 11:59 끝)

   // 신상경매 목록리스트
   @Override
   public List<AuctionVO> getNewAuctionList() {
		
	   List<AuctionVO> newAuctionList = sqlsession.selectList("board.newAuctionList");
		
	   return newAuctionList;
   }

	@Override
	public List<AuctionVO> getAuctionList() {
		
		List<AuctionVO> auctionList = sqlsession.selectList("board.auctionList");
		
		return auctionList;
	}

	@Override
	public List<AuctionVO> getBestAuctionList() {
		
		List<AuctionVO> bestAuctionList = sqlsession.selectList("board.bestAuctionList");
		
		return bestAuctionList;
	}

	@Override
	public List<AuctionVO> getWorstAuctionList() {
		
		List<AuctionVO> worstAuctionList = sqlsession.selectList("board.worstAuctionList");
		
		return worstAuctionList;
	}


}