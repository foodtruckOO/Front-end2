package com.sajo.foodtruck.order;

public class OrderDTO {

	
	private String o_no;
	private String g_no;
	private String f_no;
	private String num;
	private String time;
	private String tname;
	private String addr;
	private String id;
	private String tel;
	private String contents;
	private String fname;
	private String price;
	private String priceall;
	private String ordertype;
	private String ip;
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getO_no() {
		return o_no;
	}
	public void setO_no(String o_no) {
		this.o_no = o_no;
	}
	public String getG_no() {
		return g_no;
	}
	public void setG_no(String g_no) {
		this.g_no = g_no;
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

	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
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
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
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
	public String getPriceall() {
		return priceall;
	}
	public void setPriceall(String priceall) {
		this.priceall = priceall;
	}
	public String getOrdertype() {
		return ordertype;
	}
	public void setOrdertype(String ordertype) {
		this.ordertype = ordertype;
	}
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDTO(String o_no, String g_no, String f_no, String num, String time, String tname, String addr,
			String id, String tel, String contents, String fname, String price, String priceall, String ordertype, String ip) {
		super();
		this.o_no = o_no;
		this.g_no = g_no;
		this.f_no = f_no;
		this.num = num;
		this.time = time;
		this.tname = tname;
		this.addr = addr;
		this.id = id;
		this.tel = tel;
		this.contents = contents;
		this.fname = fname;
		this.price = price;
		this.priceall = priceall;
		this.ordertype = ordertype;
		this.ip= ip;
	}
	
	
}
