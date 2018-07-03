package com.finalc.auction.model;

public class BoardVO {
	
	// 게시판 VO
	

	  private String boardno;        /* 게시판 번호 */
	  private String fk_userid;      /* 아이디 */
	  private String subject;        /* 제목 */
	  private String content;        /* 내용 */
	  private String commentcount;   /* 댓글갯수 */
	  private String viewcount;      /* 조회수 */
	  private String writeday;       /* 작성일 */
	  private String finaleditday;   /* 최종수정일 */
	  private String groupno;	     /* 답변그룹 */
	  private String fk_boardno;     /* 원본글번호 */
	  private String deptthno;       /* 답변글깊이 */
	  private String  public_status; /* 공개여부 */
	  private String boardstatus;    /* 게시글상태 */

	  public BoardVO(){}
	  public BoardVO(String boardno, String fk_userid, String subject, String content, String commentcount,
			String viewcount, String writeday, String finaleditday, String groupno, String fk_boardno, String deptthno,
			String public_status, String boardstatus) {
		
		this.boardno = boardno;
		this.fk_userid = fk_userid;
		this.subject = subject;
		this.content = content;
		this.commentcount = commentcount;
		this.viewcount = viewcount;
		this.writeday = writeday;
		this.finaleditday = finaleditday;
		this.groupno = groupno;
		this.fk_boardno = fk_boardno;
		this.deptthno = deptthno;
		this.public_status = public_status;
		this.boardstatus = boardstatus;
	}
	  
	public String getBoardno() {
		return boardno;
	}
	public void setBoardno(String boardno) {
		this.boardno = boardno;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(String commentcount) {
		this.commentcount = commentcount;
	}
	public String getViewcount() {
		return viewcount;
	}
	public void setViewcount(String viewcount) {
		this.viewcount = viewcount;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	public String getFinaleditday() {
		return finaleditday;
	}
	public void setFinaleditday(String finaleditday) {
		this.finaleditday = finaleditday;
	}
	public String getGroupno() {
		return groupno;
	}
	public void setGroupno(String groupno) {
		this.groupno = groupno;
	}
	public String getFk_boardno() {
		return fk_boardno;
	}
	public void setFk_boardno(String fk_boardno) {
		this.fk_boardno = fk_boardno;
	}
	public String getDeptthno() {
		return deptthno;
	}
	public void setDeptthno(String deptthno) {
		this.deptthno = deptthno;
	}
	public String getPublic_status() {
		return public_status;
	}
	public void setPublic_status(String public_status) {
		this.public_status = public_status;
	}
	public String getBoardstatus() {
		return boardstatus;
	}
	public void setBoardstatus(String boardstatus) {
		this.boardstatus = boardstatus;
	}
	  
	  
	}



