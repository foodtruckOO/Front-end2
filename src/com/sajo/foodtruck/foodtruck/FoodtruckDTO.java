package com.sajo.foodtruck.foodtruck;
 
import java.sql.Date;
/* 
 * DTO(Data Tranfer Object):데이타를 전송하는 객체로
 *                          테이블의 레코드 하나를 저장할 수 
 *                          있는 자료구조
 * 
 * 
 */
public class FoodtruckDTO {
	
	private String s_no;
	private String id;
	private String pwd;
	private String name;
	private String tname;
	private String addr;
	private String tel;
	private String coprorate_no;
	private String img;
	private Date regidate;
	private String intro;
	private String ip;
	public String getIp() {
		return ip;
	}


	public void setIp(String ip) {
		this.ip = ip;
	}


	public FoodtruckDTO() {}
	
	
	public FoodtruckDTO(String s_no, String id, String pwd, String name, String tname, String addr, String tel,
			String coprorate_no, String img, String intro, Date regidate,String ip) {
		this.s_no = s_no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tname = tname;
		this.addr = addr;
		this.tel = tel;
		this.coprorate_no = coprorate_no;
		this.img = img;
		this.intro = intro;
		this.regidate = regidate;
		this.ip = ip;
		
	}


	public String getIntro() {
		return intro;
	}


	public void setIntro(String intro) {
		this.intro = intro;
	}


	public String getS_no() {
		return s_no;
	}

	public void setS_no(String s_no) {
		this.s_no = s_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCoprorate_no() {
		return coprorate_no;
	}

	public void setCoprorate_no(String coprorate_no) {
		this.coprorate_no = coprorate_no;
	}

	public Date getRegidate() {
		return regidate;
	}

	public void setRegidate(Date regidate) {
		this.regidate = regidate;
	}


	public String getImg() {
		return img;
	}


	public void setImg(String img) {
		this.img = img;
	}

	
	
	
	//속성 혹은 멤버변수]
}