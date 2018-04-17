package com.sajo.foodtruck.mypage;

public class T_OderformDTO {

	private String tname;			//트럭이름
	private String tel;				//트럭전화
	private String fname;			//음식이름
	private String price;			//음식가격
	private String num;				//음식갯수
	private String timeofreceipt;	//수령시간
	private String content;			//요청사항
	private String postdate;		//주문날짜
	private String confirm;			//확인여부
	private String total;			//총합


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
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTimeofreceipt() {
		return timeofreceipt;
	}
	public void setTimeofreceipt(String timeofreceipt) {
		this.timeofreceipt = timeofreceipt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	public String getConfirm() {
		return confirm;
	}
	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
}