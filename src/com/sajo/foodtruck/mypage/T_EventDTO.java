package com.sajo.foodtruck.mypage;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class T_EventDTO {
	
	private String eno;
	private String s_no;
	private String title;
	private String content;
	private MultipartFile titlefile;
	private MultipartFile contentfile;
	private Date s_date;
	private Date e_date;
	private Date postdate;
	
	public String getEno() {
		return eno;
	}
	
	public void setEno(String eno) {
		this.eno = eno;
	}
	
	public String getS_no() {
		return s_no;
	}
	
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public MultipartFile getTitlefile() {
		return titlefile;
	}
	
	public void setTitlefile(MultipartFile titlefile) {
		this.titlefile = titlefile;
	}
	
	public MultipartFile getContentfile() {
		return contentfile;
	}
	
	public void setContentfile(MultipartFile contentfile) {
		this.contentfile = contentfile;
	}
	
	public Date getS_date() {
		return s_date;
	}
	
	public void setS_date(Date s_date) {
		this.s_date = s_date;
	}
	
	public Date getE_date() {
		return e_date;
	}
	
	public void setE_date(Date e_date) {
		this.e_date = e_date;
	}
	
	public Date getPostdate() {
		return postdate;
	}
	
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
}
