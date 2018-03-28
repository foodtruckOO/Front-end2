package com.sajo.foodtruck.mypage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MemberController {

	// Seller or Customer
	@RequestMapping("/Member.page")
	public String InfoEdit(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println((String)req.getSession().getAttribute("USER_ID"));
		return "/com.sajo.foodtruck/front-end/views/mypage/seller/mypage.jsp";
	}
	
	@RequestMapping("/Event.page")
	public String Event(Model model, HttpServletRequest req) throws Exception{
		T_EventDAO dao = new T_EventDAO(req.getServletContext());
		//T_EventDTO dto = dao.insert();
		dao.close();
		//model.addAttribute("seller", dto);
		System.out.println((String)req.getSession().getAttribute("USER_ID"));
		return "/com.sajo.foodtruck/front-end/views/mypage/seller/mypage.jsp";
	}
	
}