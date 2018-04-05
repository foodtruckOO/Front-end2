package com.sajo.foodtruck.mypage;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class T_EventDTO {
	
	private String s_no;
	private String title;
	private String content;
	private MultipartFile titlefile;
	private MultipartFile contentfile;
	private String sdate;
	private String edate;
	/*
	private Date sdate;
	private Date edate;
	*/

	public String getS_no() {
		return s_no;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
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
	/*
	public Date getSdate() {
		return sdate;
	}
	
	public void setSdate(Date sdate) {
		this.sdate = sdate;
	}
	
	public Date getEdate() {
		return edate;
	}
	
	public void setEdate(Date edate) {
		this.edate = edate;
	}
	*/
}
