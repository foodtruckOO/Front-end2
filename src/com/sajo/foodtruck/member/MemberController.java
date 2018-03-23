package com.sajo.foodtruck.member;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class MemberController {

	// Seller
	@RequestMapping("/Sellerpage.member")
	public String Sellerpage(Model model, HttpServletRequest req, @RequestParam Map map) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)map.get("id"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println(dto.getId());
		return "/com.sajo.foodtruck/front-end/views/mypage/seller/mypage.jsp";
	}
	
}