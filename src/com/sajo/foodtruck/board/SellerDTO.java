package com.sajo.foodtruck.board;
 
import java.sql.Date;
/* 
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */
public class SellerDTO {
	
	public SellerDTO() {
	}
	//속성 혹은 멤버변수]
	private String sb_no;
	private String s_no;
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
	
	public SellerDTO(String sb_no, String s_no, String title, String content, String attachedfile,Date postdate) {
		super();
		this.sb_no = sb_no;
		this.s_no = s_no;
		this.title = title;
		this.content = content;
		this.attachedfile = attachedfile;
		this.postdate = postdate;
		
	
	
	


}
	public String getSb_no() {
		return sb_no;
	}
	public void setSb_no(String sb_no) {
		this.sb_no = sb_no;
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
	