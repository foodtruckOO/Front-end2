package com.sajo.foodtruck.mypage;

import org.springframework.web.multipart.MultipartFile;

public class T_ImgDTO {
	
	private String sno;
	private MultipartFile img;
	private String newImg;
	private String kilobyte;
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public MultipartFile getImg() {
		return img;
	}
	public void setImg(MultipartFile img) {
		this.img = img;
	}
	public String getNewImg() {
		return newImg;
	}
	public void setNewImg(String newImg) {
		this.newImg = newImg;
	}
	public String getKilobyte() {
		return kilobyte;
	}
	public void setKilobyte(String kilobyte) {
		this.kilobyte = kilobyte;
	}
}
