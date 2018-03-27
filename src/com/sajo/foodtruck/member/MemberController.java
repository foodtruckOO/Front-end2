package com.sajo.foodtruck.member;

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

	// Seller
	@RequestMapping("/Sellerpage.member")
	public String Sellerpage(Model model, HttpServletRequest req, HttpSession ss) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)ss.getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println((String)ss.getAttribute("USER_ID"));
		return "/com.sajo.foodtruck/front-end/views/mypage/seller/mypage.jsp";
	}
	
}