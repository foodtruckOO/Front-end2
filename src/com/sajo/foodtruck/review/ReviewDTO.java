package com.sajo.foodtruck.review;

import java.sql.Date;

public class ReviewDTO {

	private String r_no;
	private String s_no;
	private String g_no;
	private String star;
	private String commen;
	private String c_name;
	private Date cpostdate;
	public ReviewDTO(String r_no, String s_no, String g_no, String star, String commen, String c_name,Date cpostdate) {
		super();
		this.r_no = r_no;
		this.s_no = s_no;
		this.g_no = g_no;
		this.star = star;
		this.commen = commen;
		this.c_name = c_name;
		this.cpostdate = cpostdate;
	}
	public ReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getR_no() {
		return r_no;
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public void setR_no(String r_no) {
		this.r_no = r_no;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getG_no() {
		return g_no;
	}
	public void setG_no(String g_no) {
		this.g_no = g_no;
	}
	public String getStar() {
		return star;
	}
	public void setStar(String star) {
		this.star = star;
	}
	public String getCommen() {
		return commen;
	}
	public void setCommen(String commen) {
		this.commen = commen;
	}
	public Date getCpostdate() {
		return cpostdate;
	}
	public void setCpostdate(Date cpostdate) {
		this.cpostdate = cpostdate;
	}
	
	
	
}
