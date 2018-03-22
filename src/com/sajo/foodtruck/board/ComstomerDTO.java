package com.sajo.foodtruck.board;
 
import java.sql.Date;
/* 
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */
public class ComstomerDTO {
	
	public ComstomerDTO() {
	}
	//속성 혹은 멤버변수]
	private String cb_no;
	private String g_no;
	private String title;
	private String content;
	private String attachedfile;
	private Date postdate;
	
	//프로그램의 효율성을 위한 속성 추가]
		private String name;	
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
	
	public ComstomerDTO(String cb_no, String g_no, String title, String content, String attachedfile,Date postdate) {
		super();
		this.cb_no = cb_no;
		this.g_no = g_no;
		this.title = title;
		this.content = content;
		this.attachedfile = attachedfile;
		this.postdate = postdate;
		
	}
	public String getCb_no() {
		return cb_no;
	}
	public void setCb_no(String cb_no) {
		this.cb_no = cb_no;
	}
	public String getG_no() {
		return g_no;
	}
	public void setG_no(String g_no) {
		this.g_no = g_no;
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
	public Date getPostdate() {
		return postdate;
	}
	public void setPostdate(Date postdate) {
		this.postdate = postdate;
	}
	
	


}
	
	