package com.sajo.foodtruck.LoginJoin;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {

	
	
	@ResponseBody
	@RequestMapping(value="/Login.login",produces="text/html; charset=UTF-8")	
	public String Login(@RequestParam Map map, HttpServletRequest req) 
			throws Exception{
		
		CusDAO cusdao = new CusDAO(req.getServletContext());
		SellerDAO sellerdao = new SellerDAO(req.getServletContext());
		String id = map.get("id").toString();
		String pwd = map.get("pwd").toString();
		boolean flagOne = cusdao.isMember(id, pwd);
		boolean flagTwo = sellerdao.isMember(id, pwd);
		String usertype; 
		if(flagOne) {
			usertype = "customer";
		}
		else if(flagTwo) {
			usertype = "seller";
		}
		else usertype = "no";
		JSONObject json = new JSONObject();
		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		//JSON객체의 put("키값","값")메소드로 저장하면
		//{"키값":"값"} JSON형태의 데이타로 저장됨.
		json.put("isMember",usertype);
		
		return json.toJSONString();
	}
}
