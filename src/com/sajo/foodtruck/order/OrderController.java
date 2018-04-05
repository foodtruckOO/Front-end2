package com.sajo.foodtruck.order;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sajo.foodtruck.foodtruck.FoodtruckDAO;

@Controller
public class OrderController {

	
	
	@RequestMapping("/datail.order")
	public String detailorder(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
	
		
		return "";
		
	}
	
	
}
