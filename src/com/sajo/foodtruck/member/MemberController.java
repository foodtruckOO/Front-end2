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
	@RequestMapping("/Mypage.member")
	public String Sellerpage(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println((String)req.getSession().getAttribute("USER_ID"));
		return "/com.sajo.foodtruck/front-end/views/mypage/seller/mypage.jsp";
	}
	
}