package com.sajo.foodtruck.mypage;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class T_Menu_FoodDTO {
	
	private String fno;				//음식번호
	private String sno;				//사업자회원번호
	private String tno;				//음식타입번호
	private String fname;			//음식이름
	private MultipartFile picture;	//음식사진
	private String content;			//음식설명
	private String price;			//음식가격
	private String newPicture;		//사진이름 저장
	
	public String getFno() {
		return fno;
	}
	public void setFno(String fno) {
		this.fno = fno;
	}
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNewPicture() {
		return newPicture;
	}
	public void setNewPicture(String newPicture) {
		this.newPicture = newPicture;
	}
}
