package com.sajo.foodtruck.event;
 
import java.sql.Date;
/* 
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */
public class eventDTO {
	
	public eventDTO() {
	}
	//속성 혹은 멤버변수]
	private String eno;
	private String title;
	private String content;
	private String attachedfile;
	private Date s_date;
	private Date e_date;
	private Date postdate;
	
	
	public eventDTO(String eno, String title, String content, String attachedfile, Date s_date, Date e_date,
			Date postdate) {
		this.eno = eno;
		this.title = title;
		this.content = content;
		this.attachedfile = attachedfile;
		this.s_date = s_date;
		this.e_date = e_date;
		this.postdate = postdate;
	}
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
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
	public String getAttachedfile() {
		return attachedfile;
	}
	public void setAttachedfile(String attachedfile) {
		this.attachedfile = attachedfile;
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
	//프로그램의 효율성을 위한 속성 추가]
	