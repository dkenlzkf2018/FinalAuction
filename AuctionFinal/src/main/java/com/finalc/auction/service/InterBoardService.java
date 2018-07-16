package com.finalc.auction.service;

import java.util.HashMap;
import java.util.List;

import com.finalc.auction.model.AuctionVO;
import com.finalc.auction.model.BoardVO;
import com.finalc.auction.model.CategoryVO;
import com.finalc.auction.model.CommentVO;
import com.finalc.auction.model.HugiBoardVO;
//게시판 InterService
public interface InterBoardService {

   int getTotalCount();

   int getTotalCount2(HashMap<String, String> map);
   
   List<BoardVO> boardList(HashMap<String, String> map);

   List<BoardVO> boardList2(HashMap<String, String> map);

   int write_add(BoardVO boardvo);

   int write_withFile(BoardVO boardvo);

   BoardVO getWriteView(String boardno, String userid);

   BoardVO getNoviewCountWriteView(String boardno);

   List<CommentVO> commentList(String boardno);

	List<CategoryVO> getCategoryList();
	
	List<CategoryVO> getCategoryDetailList();

	List<HugiBoardVO> getReviewByActdnum(String actdnum);

	int reviewRegist(HashMap<String, String> map);

	int writeedit(BoardVO boardvo);

	int writedel(HashMap<String, String> map)throws Throwable;

	int writeComment(CommentVO commentvo) throws Throwable;

	



}