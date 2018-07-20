package com.finalc.auction.model;

import java.util.HashMap;
import java.util.List;

//게시판 InterDAO
public interface InterBoardDAO {

	int getTotalCount();

	int getTotalCount2(HashMap<String, String> map);

	List<BoardVO> boardList(HashMap<String, String> map);

	List<BoardVO> boardList2(HashMap<String, String> map);

	int write_add(BoardVO boardvo);

	int getGroupMaxno();

	int write_withFile(BoardVO boardvo);

	List<CategoryVO> getCategoryList();

	List<CategoryVO> getCategoryDetailList();
	
	BoardVO getWriteView(String boardno);

	void setAddViewCount(String boardno);

	List<CommentVO> commentList(String boardno);

	List<HugiBoardVO> getReviewByActdnum(String actdnum);

	int reviewRegist(HashMap<String, String> map);

	int writeedit(BoardVO boardvo);

	boolean isExistsComment(HashMap<String, String> map);

	int deleteContent(HashMap<String, String> map);

	int deleteComment(HashMap<String, String> map);

	int writeComment(CommentVO commentvo);

	int updateCommentCount(String fk_boardno);

	List<AuctionVO> getNewAuctionList();





	
}
