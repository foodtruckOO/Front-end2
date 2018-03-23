package com.sajo.foodtruck.member;

import java.sql.Date;

public class SellerDTO {

	private String s_no;//사업자 회원 번호
	private String id;	//id
	private String pwd; //pwd
	private String name;//사업자 회원 이름
	private String tname;//간판(푸드트럭 이름)
	private String addr;//주소
	private String tel;	//전화번호
	private String corporate_no;//사업자번호
	private Date regidate;//등록일
	
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getCorporate_no() {
		return corporate_no;
	}
	public void setCorporate_no(String corporate_no) {
		this.corporate_no = corporate_no;
	}
	public Date getRegidate() {
		return regidate;
	}
	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}	
}
