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
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
			
	CartDAO dao = new CartDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
			
			String f_no = map.get("f_no").toString();
			String yn = dao.insert(f_no,user);
			dao.close();
			return yn;
	}
	
	@ResponseBody
	@RequestMapping(value="/detail.cart", produces="text/html; charset=UTF-8")
	public String DetailList(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		CartDAO dao = new CartDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
		String f_no = map.get("f_no").toString();
		String num =  map.get("num").toString();
		String yn = dao.detailinsert(f_no,user,num);
		dao.close();
		return yn;
	}
	@ResponseBody
	@RequestMapping(value="/delete.cart", produces="text/html; charset=UTF-8")
	public void Delete(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		CartDAO dao = new CartDAO(req.getServletContext());
		String f_no = map.get("f_no").toString();
		dao.delete(f_no);
		dao.close();
	}
	@ResponseBody
	@RequestMapping(value="/search.cart", produces="text/html; charset=UTF-8")
	public String Search(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		CartDAO dao = new CartDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
		String yn = dao.search(user);
		dao.close();
		return yn;
	}
	
	@RequestMapping("/order.cart")
	public String detailorder(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		CartDAO dao = new CartDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
		java.util.List list = dao.order(user);
		model.addAttribute("order",list);
		dao.close();
		return "/com.sajo.foodtruck/front-end/views/order/Paymentready.jsp";
	}
	@RequestMapping("/cart.cart")
	public String cart(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		CartDAO dao = new CartDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
		java.util.List<CartDTO> list = dao.order(user);
		model.addAttribute("order",list);
		dao.close();
		return "/com.sajo.foodtruck/front-end/views/order/Cart.jsp";
	}
	
	
	
}
