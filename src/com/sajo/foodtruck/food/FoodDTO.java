package com.sajo.foodtruck.food;

public class FoodDTO {

	
	private String f_no;
	private String s_no;
	private String t_no;
	private String fName;
	private String picture;
	private String price;
	private String id;
	private String content;
	private String ip;
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public FoodDTO(String f_no, String s_no, String t_no, String fName, String picture, String price, String id, String content) {
		super();
		this.f_no = f_no;
		this.s_no = s_no;
		this.t_no = t_no;
		this.fName = fName;
		this.picture = picture;
		this.price = price;
		this.id = id;
		this.content = content;
		this.ip = ip;
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getF_no() {
		return f_no;
	}
	public void setF_no(String f_no) {
		this.f_no = f_no;
	}
	public FoodDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
}
