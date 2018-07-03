package com.finalc.auction.model;

public class MemberVO {

	private String userid;
	private String passwd;
	private String user_status;
	private String usernum;
	private String username;
	private String birth;
	private String gender;
	private String email;
	private String zipcode;
	private String addr1;
	private String addr2;
	private String grade;
	private String hp1;
	private String hp2;
	private String hp3;
	
	public MemberVO() {}
	
	public MemberVO(String userid, String passwd, String user_status, String usernum, String username, String birth,
			String gender, String email, String zipcode, String addr1, String addr2, String grade, String hp1,
			String hp2, String hp3) {
		this.userid = userid;
		this.passwd = passwd;
		this.user_status = user_status;
		this.usernum = usernum;
		this.username = username;
		this.birth = birth;
		this.gender = gender;
		this.email = email;
		this.zipcode = zipcode;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.grade = grade;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public String getUsernum() {
		return usernum;
	}

	public void setUsernum(String usernum) {
		this.usernum = usernum;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	
	
	
}
