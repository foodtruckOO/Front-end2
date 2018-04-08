package com.sajo.foodtruck.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


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
	
	
}
