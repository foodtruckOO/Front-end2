package com.sajo.foodtruck.foodtruck;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.annotation.HttpMethodConstraint;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.sajo.foodtruck.review.ReviewDAO;
import com.sajo.foodtruck.review.ReviewDTO;


//세션처리용]

@Controller
public class foodtruckController {
	
	//목록용]
	@RequestMapping("/list.foodtruck")
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		foodtruckDAO dao = new foodtruckDAO(req.getServletContext());
		List list = dao.selectList();
		model.addAttribute("foodtruck",list);
	return "/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck.jsp";
	
	}
	
	@RequestMapping("/detail1.foodtruck")
	public String detailOne(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		foodtruckDAO dao = new foodtruckDAO(req.getServletContext());
		ReviewDAO dao2  = new ReviewDAO(req.getServletContext());
		List<foodtruckDTO> list = dao.selectImg(req.getParameter("s_no"));
		List<ReviewDTO> list2 = dao2.selectList(req.getParameter("s_no"));
		model.addAttribute("s_no",req.getParameter("s_no"));
		model.addAttribute("addr",list.get(0).getAddr());
		model.addAttribute("tname", list.get(0).getTname());
		model.addAttribute("intro", list.get(0).getIntro());
		model.addAttribute("id",list.get(0).getId());
		
		model.addAttribute("foodtruck",list);
		model.addAttribute("review",list2);
		
		return "/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck_detail1.jsp";	
		
	}
	
	@RequestMapping("/area.foodtruck")
	public String areaList(Model model, HttpServletRequest req,@RequestParam Map map, HttpServletResponse resp) throws Exception{
		
		foodtruckDAO dao = new foodtruckDAO(req.getServletContext());
		
		String area = req.getParameter("area");
		List list = dao.selectArea(area);
		model.addAttribute("area",area);
		
		model.addAttribute("foodtruck",list);
		return "/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck.jsp";	
	}
		
	@RequestMapping("/write.foodtruck")
	public String write(Model model, HttpServletRequest req,@RequestParam Map map, HttpServletResponse resp) throws Exception{
	
		req.setCharacterEncoding("UTF-8");
		
		foodtruckDAO dao = new foodtruckDAO(req.getServletContext());
		ReviewDAO dao2  = new ReviewDAO(req.getServletContext());
		
		String user = (String)req.getSession().getAttribute("USER_ID");
		String commen = req.getParameter("commen");
		String star = req.getParameter("star");
		String s_no = req.getParameter("s_no");
		dao2.write(s_no,star,commen,user);
		
		List<foodtruckDTO> list = dao.selectImg(req.getParameter("s_no"));
		List<ReviewDTO> list2 = dao2.selectList(req.getParameter("s_no"));
		
		
		
		model.addAttribute("s_no",req.getParameter("s_no"));
		model.addAttribute("addr",list.get(0).getAddr());
		model.addAttribute("tname", list.get(0).getTname());
		model.addAttribute("intro", list.get(0).getIntro());
		model.addAttribute("id",list.get(0).getId());
		
		model.addAttribute("foodtruck",list);
		model.addAttribute("review",list2);
		
		return "com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck_detail1.jsp";
	}
}
	