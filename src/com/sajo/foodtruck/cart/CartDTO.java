package com.sajo.foodtruck.cart;

public class CartDTO {

	
	private String s_no;
	private String f_no;
	private String num;
	private String tname;
	private String id;
	private String tel;
	private String fname;
	private String price;
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getF_no() {
		return f_no;
	}
	public void setF_no(String f_no) {
		this.f_no = f_no;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public CartDTO(String s_no, String f_no, String num, String tname, String id, String tel, String fname,
			String price) {
		super();
		this.s_no = s_no;
		this.f_no = f_no;
		this.num = num;
		this.tname = tname;
		this.id = id;
		this.tel = tel;
		this.fname = fname;
		this.price = price;
	}
	public CartDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
