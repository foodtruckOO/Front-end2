package com.sajo.foodtruck.cart;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class CartController {

	@ResponseBody
	@RequestMapping(value="/food.cart", produces="text/html; charset=UTF-8")
	public void List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
			
	CartDAO dao = new CartDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
			
			String f_no = map.get("f_no").toString();
			
			dao.insert(f_no,user);
		dao.close();
	}
}
