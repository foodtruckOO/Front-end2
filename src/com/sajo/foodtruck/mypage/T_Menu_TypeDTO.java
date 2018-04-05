package com.sajo.foodtruck.mypage;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class T_Menu_TypeDTO {
	
	private String tno;
	private String type;

	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
}
