package com.finalc.auction.model;

public class HugiBoardVO {
	private String ep_boardno;
	private String fk_userid;
	private String fk_actdnum;
	private String ep_content;
	private String ep_writeday;
	private String ep_satisfaction;
	private String ep_boardstatus;
	
	public HugiBoardVO() {}
	
	public HugiBoardVO(String ep_boardno, String fk_userid, String fk_actdnum, String ep_content, String ep_writeday,
			String ep_satisfaction, String ep_boardstatus) {
		this.ep_boardno = ep_boardno;
		this.fk_userid = fk_userid;
		this.fk_actdnum = fk_actdnum;
		this.ep_content = ep_content;
		this.ep_writeday = ep_writeday;
		this.ep_satisfaction = ep_satisfaction;
		this.ep_boardstatus = ep_boardstatus;
	}
	
	public String getEp_boardno() {
		return ep_boardno;
	}
	public void setEp_boardno(String ep_boardno) {
		this.ep_boardno = ep_boardno;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getFk_actdnum() {
		return fk_actdnum;
	}
	public void setFk_actdnum(String fk_actdnum) {
		this.fk_actdnum = fk_actdnum;
	}
	public String getEp_content() {
		return ep_content;
	}
	public void setEp_content(String ep_content) {
		this.ep_content = ep_content;
	}
	public String getEp_writeday() {
		return ep_writeday;
	}
	public void setEp_writeday(String ep_writeday) {
		this.ep_writeday = ep_writeday;
	}
	public String getEp_satisfaction() {
		return ep_satisfaction;
	}
	public void setEp_satisfaction(String ep_satisfaction) {
		this.ep_satisfaction = ep_satisfaction;
	}
	public String getEp_boardstatus() {
		return ep_boardstatus;
	}
	public void setEp_boardstatus(String ep_boardstatus) {
		this.ep_boardstatus = ep_boardstatus;
	}
}
