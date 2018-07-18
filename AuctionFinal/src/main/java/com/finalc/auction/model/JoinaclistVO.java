package com.finalc.auction.model;

public class JoinaclistVO {
	private String joinactnum;
	private String fk_actnum;
	private String fk_usernum;
	private String tenderday;
	private String tenderprice;
	public JoinaclistVO() {
		// TODO Auto-generated constructor stub
	}
	public JoinaclistVO(String joinactnum, String fk_actnum, String fk_usernum, String tenderday, String tenderprice) {
		this.joinactnum = joinactnum;
		this.fk_actnum = fk_actnum;
		this.fk_usernum = fk_usernum;
		this.tenderday = tenderday;
		this.tenderprice = tenderprice;
	}
	public String getJoinactnum() {
		return joinactnum;
	}
	public void setJoinactnum(String joinactnum) {
		this.joinactnum = joinactnum;
	}
	public String getFk_actnum() {
		return fk_actnum;
	}
	public void setFk_actnum(String fk_actnum) {
		this.fk_actnum = fk_actnum;
	}
	public String getFk_usernum() {
		return fk_usernum;
	}
	public void setFk_usernum(String fk_usernum) {
		this.fk_usernum = fk_usernum;
	}
	public String getTenderday() {
		return tenderday;
	}
	public void setTenderday(String tenderday) {
		this.tenderday = tenderday;
	}
	public String getTenderprice() {
		return tenderprice;
	}
	public void setTenderprice(String tenderprice) {
		this.tenderprice = tenderprice;
	}
	
	
}
