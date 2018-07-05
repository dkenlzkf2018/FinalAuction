package com.finalc.auction.model;

public class CommentVO {
	
  private String commentno; 	   /* 댓글번호 */
  private String fk_boardno; 	   /* 게시판 번호 */
  private String fk_userid; 	   /* 아이디 */
  private String cm_content;       /* 내용 */
  private String cm_writeday;	   /* 작성일 */
  private String cm_deptthno; 	   /* 댓글깊이 */
  private String fk_commentno;	   /* 원본댓글번호 */
  private String cm_public_status; /* 공개여부 */
  private String cm_status; 	   /* 댓글상태 */

  public CommentVO() {}
  public CommentVO(String commentno, String fk_boardno, String fk_userid, String cm_content, String cm_writeday,
		String cm_deptthno, String fk_commentno, String cm_public_status, String cm_status) {

	this.commentno = commentno;
	this.fk_boardno = fk_boardno;
	this.fk_userid = fk_userid;
	this.cm_content = cm_content;
	this.cm_writeday = cm_writeday;
	this.cm_deptthno = cm_deptthno;
	this.fk_commentno = fk_commentno;
	this.cm_public_status = cm_public_status;
	this.cm_status = cm_status;
}
  
public String getCommentno() {
	return commentno;
}
public void setCommentno(String commentno) {
	this.commentno = commentno;
}
public String getFk_boardno() {
	return fk_boardno;
}
public void setFk_boardno(String fk_boardno) {
	this.fk_boardno = fk_boardno;
}
public String getFk_userid() {
	return fk_userid;
}
public void setFk_userid(String fk_userid) {
	this.fk_userid = fk_userid;
}
public String getCm_content() {
	return cm_content;
}
public void setCm_content(String cm_content) {
	this.cm_content = cm_content;
}
public String getCm_writeday() {
	return cm_writeday;
}
public void setCm_writeday(String cm_writeday) {
	this.cm_writeday = cm_writeday;
}
public String getCm_deptthno() {
	return cm_deptthno;
}
public void setCm_deptthno(String cm_deptthno) {
	this.cm_deptthno = cm_deptthno;
}
public String getFk_commentno() {
	return fk_commentno;
}
public void setFk_commentno(String fk_commentno) {
	this.fk_commentno = fk_commentno;
}
public String getCm_public_status() {
	return cm_public_status;
}
public void setCm_public_status(String cm_public_status) {
	this.cm_public_status = cm_public_status;
}
public String getCm_status() {
	return cm_status;
}
public void setCm_status(String cm_status) {
	this.cm_status = cm_status;
}

  
}
