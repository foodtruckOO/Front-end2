package com.sajo.foodtruck.event;
 
import java.sql.Date;
/* 
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */
public class EventDTO {
	
	public EventDTO() {
	}
	//속성 혹은 멤버변수]
	private String eno;
	private String title;
	private String content;
	private String titlefile;
	private String contentfile;
	private Date s_date;
	private Date e_date;
	private String ip;
	public EventDTO(String eno, String title, String content, String titlefile, String contentfile, Date s_date,
			Date e_date, Date postdate, String boardtype, String ip) {
		super();
		this.eno = eno;
		this.title = title;
		this.content = content;
		this.titlefile = titlefile;
		this.contentfile = contentfile;
		this.s_date = s_date;
		this.e_date = e_date;
		this.postdate = postdate;
		this.boardtype = boardtype;
		this.ip = ip;
	}
	
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	private Date postdate;
	private String boardtype;
	public String getEno() {
		return eno;
	}
	
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
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
	public String getTitlefile() {
		return titlefile;
	}
	public void setTitlefile(String titlefile) {
		this.titlefile = titlefile;
	}
	public String getContentfile() {
		return contentfile;
	}
	public void setContentfile(String contentfile) {
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
	//프로그램의 효율성을 위한 속성 추가]
	