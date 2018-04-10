package com.sajo.foodtruck.LoginJoin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sajo.foodtruck.event.EventDAO;

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
		cusdao.close();
		sellerdao.close();
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
	@RequestMapping("/complete.login")
	public String Complete(@RequestParam Map map, HttpServletRequest req, HttpSession session,Model model) 
	throws Exception{
		CusDAO cusdao = new CusDAO(req.getServletContext());
		SellerDAO sellerdao = new SellerDAO(req.getServletContext());
		
		
		
		String id = map.get("id").toString();
		String pwd = map.get("pwd").toString();
		boolean flagOne = cusdao.isMember(id, pwd);
		boolean flagTwo = sellerdao.isMember(id, pwd);
		
		EventDAO dao = new EventDAO(req.getServletContext());
		List list = dao.selectAll();
		model.addAttribute("events",list);
		
		dao.close();
		cusdao.close();
		sellerdao.close();
		
		
		
		if(flagOne) {
		session.setAttribute("USER_ID",id);
		session.setAttribute("USER_PWD",pwd);
		session.setAttribute("USER_TYPE","customer");
		return "/com.sajo.foodtruck/front-end/views/main.jsp";	
		}
		else {
		session.setAttribute("USER_ID",id);
		session.setAttribute("USER_PWD",pwd);
		session.setAttribute("USER_TYPE","seller");
		return "/com.sajo.foodtruck/front-end/views/main.jsp";	
		}
		
		
	}
}
