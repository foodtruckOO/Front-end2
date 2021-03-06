package com.sajo.foodtruck.event;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.annotation.HttpMethodConstraint;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


//세션처리용]

@Controller
public class EventController {
	
	//목록용]
	@RequestMapping("/Homeevent.event")
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		EventDAO dao = new EventDAO(req.getServletContext());
		List list = dao.selectHList();
		dao.close();
		model.addAttribute("event",list);
	return "/com.sajo.foodtruck/front-end/views/event/home_event/Home_event.jsp";
	}
	@RequestMapping("/Localevent.event")
	public String LocalList(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		EventDAO dao = new EventDAO(req.getServletContext());
		List list = dao.selectLList();
		dao.close();
		model.addAttribute("event",list);
	return "/com.sajo.foodtruck/front-end/views/event/local_event/Local_event.jsp";
	}
	@RequestMapping("/Eventview.event")
	public String View(Model model,HttpServletRequest req,@RequestParam Map map) throws Exception{
		String key = req.getParameter("eno");
		EventDAO dao = new EventDAO(req.getServletContext());
		EventDTO dto = dao.selectOne(key);
		dao.close();
		model.addAttribute("dto",dto);
		if(Integer.parseInt(dto.getBoardtype())==1) {
		return  "/com.sajo.foodtruck/front-end/views/event/home_event/Home_event_detail.jsp";
		}
		else
		return  "/com.sajo.foodtruck/front-end/views/event/local_event/Local_event_detail.jsp";
	}
	@RequestMapping("/Allevent.event")
	public String Allevent(Model model,HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		
		EventDAO dao = new EventDAO(req.getServletContext());
		List list = dao.selectAll();
		dao.close();
		model.addAttribute("events",list);
		return "/com.sajo.foodtruck/front-end/views/Main.jsp";
	}
	@RequestMapping("/SellerEvent.event")
	public String SellerList(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		EventDAO dao = new EventDAO(req.getServletContext());
		List list = dao.selectSList();
		dao.close();
		model.addAttribute("event",list);
		
		return "/com.sajo.foodtruck/front-end/views/event/seller_event/Seller_event.jsp";
	}
	
	@RequestMapping("/SellerEventview.event")
	public String SellerView(Model model,HttpServletRequest req,@RequestParam Map map) throws Exception{
		String s_no = req.getParameter("s_no");
		EventDAO dao = new EventDAO(req.getServletContext());
		EventDTO dto = dao.selectSOne(s_no);
		dao.close();
		model.addAttribute("dto",dto);
		return  "/com.sajo.foodtruck/front-end/views/event/seller_event/Seller_event_detail.jsp";
	}
	
	
}
	