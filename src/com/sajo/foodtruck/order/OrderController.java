package com.sajo.foodtruck.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sajo.foodtruck.cart.CartDAO;


@Controller
public class OrderController {

	
	@RequestMapping("/order.order")
	public String order(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
	
		
		String user = (String)req.getSession().getAttribute("USER_ID");
		String time = map.get("time").toString();
		String ordertype = map.get("slt_payMethod").toString();
		String text = null ;
		
		text = map.get("input_order_memo").toString();
		
		
		//System.out.println("user:"+user+"time:"+time+"text:"+text+"ordertype:"+ordertype);
		
		OrderDAO dao = new OrderDAO(req.getServletContext());
		
		List list = dao.order(user,time,ordertype,text);
		model.addAttribute("order",list);
		dao.close();
		
		return "com.sajo.foodtruck/front-end/views/order/paymentComplete.jsp";
	}
	@ResponseBody
	@RequestMapping("/check.order")
	public String OrderCheck(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		OrderDAO dao = new OrderDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
		String yn = dao.check(user);
		dao.close();
			
		return yn;
	}
	@RequestMapping("/edit.order")
	public String Edit(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		OrderDAO dao = new OrderDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
		
		dao.edit(user);
		
		dao.close();
		return "com.sajo.foodtruck/front-end/views/index.jsp";
	}
	
	@ResponseBody
	@RequestMapping("/timecheck.order")
	public String TimeCheck(Model model, HttpServletRequest req,@RequestParam Map map)throws Exception{
		OrderDAO dao = new OrderDAO(req.getServletContext());
		String user = req.getSession().getAttribute("USER_ID").toString();
		String yn = dao.timecheck(user);
		dao.close();
		
		
	return yn;
	}
}
