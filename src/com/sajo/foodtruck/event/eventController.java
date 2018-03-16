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
public class eventController {
	
	//목록용]
	@RequestMapping("/Homeevent.event")
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		eventDAO dao = new eventDAO(req.getServletContext());
		List list = dao.selectHList();
		model.addAttribute("event",list);
	return "/com.sajo.foodtruck/front-end/views/event/home_event/Home_event.jsp";
	}
	@RequestMapping("/Localevent.event")
	public String LocalList(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		eventDAO dao = new eventDAO(req.getServletContext());
		List list = dao.selectLList();
		model.addAttribute("event",list);
	return "/com.sajo.foodtruck/front-end/views/event/local_event/Local_event.jsp";
	}
	@RequestMapping("/Eventview.event")
	public String View(Model model,HttpServletRequest req,@RequestParam Map map) throws Exception{
		String key = req.getParameter("eno");
		eventDAO dao = new eventDAO(req.getServletContext());
		eventDTO dto = dao.selectOne(key);
		model.addAttribute("dto",dto);
		if(Integer.parseInt(dto.getBoardtype())==1) {
		return  "/com.sajo.foodtruck/front-end/views/event/home_event/Home_event_detail.jsp";
		}
		else
		return  "/com.sajo.foodtruck/front-end/views/event/local_event/Local_event_detail.jsp";
	}
	@RequestMapping("/Allevent.event")
	public String Allevent(Model model,HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		
		eventDAO dao = new eventDAO(req.getServletContext());
		List list = dao.selectAll();
		model.addAttribute("events",list);
		return "/com.sajo.foodtruck/front-end/views/main.jsp";
	}
}
	