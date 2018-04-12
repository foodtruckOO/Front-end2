package com.sajo.foodtruck.mypage;

import org.springframework.web.multipart.MultipartFile;

public class T_ImgTruckpageDTO {
	private String sno;
	private String intro;
	private MultipartFile main;
	private String newMain;
	
	public String getSno() {
		return sno;
	}
	public void setSno(String sno) {
		this.sno = sno;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public MultipartFile getMain() {
		return main;
	}
	public void setMain(MultipartFile main) {
		this.main = main;
	}
	public String getNewMain() {
		return newMain;
	}
	public void setNewMain(String newMain) {
		this.newMain = newMain;
	}
}
