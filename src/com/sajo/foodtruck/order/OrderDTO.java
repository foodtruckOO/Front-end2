package com.sajo.foodtruck.order;

public class OrderDTO {

	
	private String o_no;
	private String g_no;
	private String f_no;
	private String num;
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
	public OrderDTO(String o_no, String g_no, String f_no, String num) {
		super();
		this.o_no = o_no;
		this.g_no = g_no;
		this.f_no = f_no;
		this.num = num;
	}
	public OrderDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
