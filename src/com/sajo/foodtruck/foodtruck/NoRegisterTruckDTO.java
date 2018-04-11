package com.sajo.foodtruck.foodtruck;

public class NoRegisterTruckDTO {

	
	private String f_no;
	private String tname;
	private String addr;
	private String tel;
	private String attachedfile;
	private String ip;
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getF_no() {
		return f_no;
	}
	public void setF_no(String f_no) {
		this.f_no = f_no;
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
	public String getAttachedfile() {
		return attachedfile;
	}
	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
	}
	public NoRegisterTruckDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoRegisterTruckDTO(String f_no, String tname, String addr, String tel, String attachedfile,String ip) {
		super();
		this.f_no = f_no;
		this.tname = tname;
		this.addr = addr;
		this.tel = tel;
		this.attachedfile = attachedfile;
		this.ip = ip;
	}
	
	
}
