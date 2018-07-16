package com.finalc.auction.model;

import org.springframework.web.multipart.MultipartFile;

public class AuctionVO {
	private String actnum; // 경매번호
	private String actname; // 경매 이름
	private String actimage; // 경매 이미지
	
	private String filename; // WAS(톰캣)에 저장될 파일명(20161121324325454354353333432.png)
	private String orgFilename; // 진짜 파일명(강아지.png)   // 사용자가 파일을 업로드 하거나 파일을 다운로드 할때 사용되어지는 파일명
	private String fileSize;    // 파일크기
	
	private MultipartFile attach; // 진짜 파일 => 톰캣 디스크에 저장됨.
								  // MultipartFile attach는 오라클 tblBoard 테이블의 컬럼이 아니다.
	
	private CategoryVO categoryVO; // 카테고리 VO
	
	private String actdnum; // 경매 상세정보 일련번호
	private String fk_auctionnum; // actnum -> 경매번호
	private String fk_usernum; // 사용자 일련번호
	private String actd_price; // 즉시구매 가격
	private String actd_qty; // 수량
	private String actd_status; // 경매상태 // 0 : 경매중 | 1 : 낙찰
	private String actd_content; // 제품소개
	private String startprice; // 경매 시작가격
	private String actd_lowertenderprice; // 최저입찰가격
	private String actd_startday; // 경매시작일 default = sysdate
	private String actd_endday; // 경매종료일 >= 경매시작일 + 1
	
	public String getActnum() {
		return actnum;
	}
	public void setActnum(String actnum) {
		this.actnum = actnum;
	}
	public String getActname() {
		return actname;
	}
	public void setActname(String actname) {
		this.actname = actname;
	}
	public String getActimage() {
		return actimage;
	}
	public void setActimage(String actimage) {
		this.actimage = actimage;
	}
	public MultipartFile getAttach() {
		return attach;
	}
	public void setAttach(MultipartFile attach) {
		this.attach = attach;
	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getOrgFilename() {
		return orgFilename;
	}
	public void setOrgFilename(String orgFilename) {
		this.orgFilename = orgFilename;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	
	// ====================== 카테고리 =========================
	public CategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	public String getFk_cnum() {
		return categoryVO.getFk_cnum();
	}
	public void setFk_cnum(String fk_cnum) {
		categoryVO.setCnum(fk_cnum);
	}
	public String getFk_cdnum() {
		return categoryVO.getCdnum();
	}
	public void setFk_cdnum(String fk_cdnum) {
		categoryVO.setCdnum(fk_cdnum);
	}
	// ====================== 카테고리 =========================
	
	public String getActdnum() {
		return actdnum;
	}
	public void setActdnum(String actdnum) {
		this.actdnum = actdnum;
	}
	public String getFk_auctionnum() {
		return fk_auctionnum;
	}
	public void setFk_auctionnum(String fk_auctionnum) {
		this.fk_auctionnum = fk_auctionnum;
	}
	public String getFk_usernum() {
		return fk_usernum;
	}
	public void setFk_usernum(String fk_usernum) {
		this.fk_usernum = fk_usernum;
	}
	public String getActd_price() {
		return actd_price;
	}
	public void setActd_price(String actd_price) {
		this.actd_price = actd_price;
	}
	public String getActd_qty() {
		return actd_qty;
	}
	public void setActd_qty(String actd_qty) {
		this.actd_qty = actd_qty;
	}
	public String getActd_status() {
		return actd_status;
	}
	public void setActd_status(String actd_status) {
		this.actd_status = actd_status;
	}
	public String getActd_content() {
		return actd_content;
	}
	public void setActd_content(String actd_content) {
		this.actd_content = actd_content;
	}
	public String getStartprice() {
		return startprice;
	}
	public void setStartprice(String startprice) {
		this.startprice = startprice;
	}
	public String getActd_lowertenderprice() {
		return actd_lowertenderprice;
	}
	public void setActd_lowertenderprice(String actd_lowertenderprice) {
		this.actd_lowertenderprice = actd_lowertenderprice;
	}
	public String getActd_startday() {
		return actd_startday;
	}
	public void setActd_startday(String actd_startday) {
		this.actd_startday = actd_startday;
	}
	public String getActd_endday() {
		return actd_endday;
	}
	public void setActd_endday(String actd_endday) {
		this.actd_endday = actd_endday;
	}
	
	public AuctionVO() {}
	public AuctionVO(String actnum, String actname, String actimage, String orgFilename, String fileSize,
			CategoryVO categoryVO, String actdnum, String fk_auctionnum, String fk_usernum, String actd_price,
			String actd_qty, String actd_status, String actd_content, String startprice, String actd_lowertenderprice,
			String actd_startday, String actd_endday) {
		super();
		this.actnum = actnum;
		this.actname = actname;
		this.actimage = actimage;
		this.orgFilename = orgFilename;
		this.fileSize = fileSize;
		this.categoryVO = categoryVO;
		this.actdnum = actdnum;
		this.fk_auctionnum = fk_auctionnum;
		this.fk_usernum = fk_usernum;
		this.actd_price = actd_price;
		this.actd_qty = actd_qty;
		this.actd_status = actd_status;
		this.actd_content = actd_content;
		this.startprice = startprice;
		this.actd_lowertenderprice = actd_lowertenderprice;
		this.actd_startday = actd_startday;
		this.actd_endday = actd_endday;
	}
	
}
