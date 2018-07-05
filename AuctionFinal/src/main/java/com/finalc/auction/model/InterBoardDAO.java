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

	BoardVO getWriteView(String boardno);

	void setAddViewCount(String boardno);

	List<CommentVO> commentList(String boardno);

	
}
