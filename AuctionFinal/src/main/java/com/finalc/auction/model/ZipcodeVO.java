package com.finalc.auction.model;

public class ZipcodeVO {

	private String zipnum;  /* 주소번호 */
	private String zipcode; /* 우편번호 */
	private String sido; /* 시도 */
	private String sigungu; /* 시군구 */
	private String eupmyun; /* 읍면 */
	private String doro; /* 도로 */
	private String building; /* 건물 */
	private String buildname; /* 건물이름 */
	private String dongname; /* 동이름 */
	private String riname; /* 리이름 */
	private String dong2name; /* 동이름2 */
	
	private String address;
	
	public ZipcodeVO(String zipcode, String address) {		
		this.zipcode = zipcode;
		this.setAddress(address);
	}
	
	public ZipcodeVO(String zipnum, String zipcode, String sido, String sigungu, String eupmyun, String doro,
			String building, String buildname, String dongname, String riname, String dong2name) {
		this.zipnum = zipnum;
		this.zipcode = zipcode;
		this.sido = sido;
		this.sigungu = sigungu;
		this.eupmyun = eupmyun;
		this.doro = doro;
		this.building = building;
		this.buildname = buildname;
		this.dongname = dongname;
		this.riname = riname;
		this.dong2name = dong2name;
	}
	
	public ZipcodeVO(String zipnum, String zipcode, String building, String buildname, String dongname, 
			String riname, String dong2name, String address) {
		this.zipnum = zipnum;
		this.zipcode = zipcode;
		this.building = building;
		this.buildname = buildname;
		this.dongname = dongname;
		this.riname = riname;
		this.dong2name = dong2name;
		this.setAddress(address);
	}

	public String getZipnum() {
		return zipnum;
	}

	public void setZipnum(String zipnum) {
		this.zipnum = zipnum;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getSigungu() {
		return sigungu;
	}

	public void setSigungu(String sigungu) {
		this.sigungu = sigungu;
	}

	public String getEupmyun() {
		return eupmyun;
	}

	public void setEupmyun(String eupmyun) {
		this.eupmyun = eupmyun;
	}

	public String getDoro() {
		return doro;
	}

	public void setDoro(String doro) {
		this.doro = doro;
	}

	public String getBuilding() {
		return building;
	}

	public void setBuilding(String building) {
		this.building = building;
	}

	public String getBuildname() {
		return buildname;
	}

	public void setBuildname(String buildname) {
		this.buildname = buildname;
	}

	public String getDongname() {
		return dongname;
	}

	public void setDongname(String dongname) {
		this.dongname = dongname;
	}

	public String getRiname() {
		return riname;
	}

	public void setRiname(String riname) {
		this.riname = riname;
	}

	public String getDong2name() {
		return dong2name;
	}

	public void setDong2name(String dong2name) {
		this.dong2name = dong2name;
	}
	
	public String getAddress() {
		String address = sido + sigungu + eupmyun + doro;
		return address;
	}

	public void setAddress(String address) {
		address = sido + sigungu + eupmyun + doro;
		this.address = address;
	}
	
}
