package com.sajo.foodtruck.mypage;

import java.util.List;
import java.util.Map;

public class T_OderDTO {
	
	private String cname;				//손님번호
	private String tel;
	private String fname;			//음식이름
	private String price;			//음식가격
	private String num;				//음식갯수
	private String timeofreceipt;	//수령시간
	private String content;			//요청사항
	private String postdate;		//주문날짜
	private String confirm;			//확인여부
	private String total;			//총합
	private List<Map<String, String>> list;
	
	
	
	public List<Map<String, String>> getList() {
		return list;
	}
	public void setList(List<Map<String, String>> list) {
		this.list = list;
	}
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
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
}