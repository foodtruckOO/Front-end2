package com.sajo.foodtruck.map;
  
/* 
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */

public class mapDTO {
	
	//속성 혹은 멤버변수]
	private String addr;
	private String tname;
	private String tel;
	
	public mapDTO() {}

	public mapDTO(String addr, String tname, String tel) {
		super();
		this.addr = addr;
		this.tname = tname;
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	
	
}
