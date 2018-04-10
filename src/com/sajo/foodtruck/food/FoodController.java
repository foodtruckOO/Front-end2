package com.sajo.foodtruck.food;

import java.util.Map;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FoodController {

	
	@RequestMapping("/menu.food")
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
	String s_no = req.getParameter("s_no");
	FoodDAO dao = new FoodDAO(req.getServletContext());
	List list = dao.selectList(s_no);
	dao.close();
	model.addAttribute("food",list);
	return "/com.sajo.foodtruck/front-end/views/order/Order.jsp";
	}
	
	@RequestMapping("/detail.food")
	public String Detail(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
	String f_no = req.getParameter("f_no");
	FoodDAO dao = new FoodDAO(req.getServletContext());
	FoodDTO dto = dao.selectOne(f_no);
	dao.close();
	model.addAttribute("food",dto);
	return "/com.sajo.foodtruck/front-end/views/order/Detail.jsp";
	}
	
}
