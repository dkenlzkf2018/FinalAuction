package com.finalc.auction.model;

public class CategoryVO {
		private String cnum; // 주 카테고리 분류번호
		private String cname; // 주 카테고리 이름
		
		private String cdnum; // 부 카테고리 분류번호
		private String fk_cnum; // String cnum == 주 카테고리 분류번호
		private String cdname; // 부 카테고리 이름
		
		public String getCnum() {
			return cnum;
		}
		public void setCnum(String cnum) {
			this.cnum = cnum;
		}
		public String getCname() {
			return cname;
		}
		public void setCname(String cname) {
			this.cname = cname;
		}
		public String getCdnum() {
			return cdnum;
		}
		public void setCdnum(String cdnum) {
			this.cdnum = cdnum;
		}
		public String getFk_cnum() {
			return fk_cnum;
		}
		public void setFk_cnum(String fk_cnum) {
			this.fk_cnum = fk_cnum;
		}
		public String getCdname() {
			return cdname;
		}
		public void setCdname(String cdname) {
			this.cdname = cdname;
		}
		public CategoryVO() {}
		public CategoryVO(String cnum, String cname, String cdnum, String cdname) {
			super();
			this.cnum = cnum;
			this.cname = cname;
			this.cdnum = cdnum;
			this.fk_cnum = cnum;
			this.cdname = cdname;
		}
		public CategoryVO(String cnum, String cname, String cdnum, String fk_cnum, String cdname) {
			super();
			this.cnum = cnum;
			this.cname = cname;
			this.cdnum = cdnum;
			this.fk_cnum = fk_cnum;
			this.cdname = cdname;
		}
		
}
