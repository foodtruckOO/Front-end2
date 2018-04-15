package com.sajo.foodtruck.mypage;

public class T_OrderListDTO {

	private String cname;				//손님번호
	private String tel;
	private String timeofreceipt;	//수령시간
	private String content;			//요청사항
	private String postdate;		//주문날짜
	private String confirm;			//확인여부
	private String total;			//총합
	
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
