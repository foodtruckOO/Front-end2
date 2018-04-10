package com.sajo.foodtruck.foodtruck;

import java.util.HashMap;
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
public class FoodtruckController {
	
	//목록용]
	@RequestMapping("/list.foodtruck")
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		FoodtruckDAO dao = new FoodtruckDAO(req.getServletContext());
		List list = dao.selectList();
		model.addAttribute("foodtruck",list);
	return "/com.sajo.foodtruck/front-end/views/foodtruck/all/Foodtruck.jsp";
	
	}
	
	@RequestMapping("/detail1.foodtruck")
	public String detailOne(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		FoodtruckDAO dao = new FoodtruckDAO(req.getServletContext());
		ReviewDAO dao2  = new ReviewDAO(req.getServletContext());
		List<FoodtruckDTO> list = dao.selectImg(req.getParameter("s_no"));
		
		Map map2 = dao2.count(req.getParameter("s_no"));
		String count = map2.get("count").toString();
		String starsum = map2.get("starsum").toString();
		
		int totalRecordCount = dao2.getTotalRecordCount(req.getParameter("s_no"));
		int pageSize = 5;
		int blockPage = 3 ;
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1)*pageSize + 1;
		int end = nowPage*pageSize;
		List<ReviewDTO> list2 = dao2.selectList(req.getParameter("s_no"),start,end);
		
		
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/detail1.foodtruck?",req.getParameter("s_no"));
		
		dao.close();
		dao2.close();
		
		
		model.addAttribute("pagingString",pagingString);
		model.addAttribute("totalRecordCount",totalRecordCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("nowPage",nowPage);
		
		model.addAttribute("count",count);
		model.addAttribute("starsum",starsum);
		model.addAttribute("s_no",req.getParameter("s_no"));
		model.addAttribute("addr",list.get(0).getAddr());
		model.addAttribute("tname", list.get(0).getTname());
		model.addAttribute("intro", list.get(0).getIntro());
		model.addAttribute("id",list.get(0).getId());
		
		model.addAttribute("foodtruck",list);
		model.addAttribute("review",list2);
		
		return "/com.sajo.foodtruck/front-end/views/foodtruck/all/Foodtruck_detail1.jsp";	
		
	}
	
	@RequestMapping("/area.foodtruck")
	public String areaList(Model model, HttpServletRequest req,@RequestParam Map map, HttpServletResponse resp) throws Exception{
		
		FoodtruckDAO dao = new FoodtruckDAO(req.getServletContext());
		
		String area = req.getParameter("area");
		String sort = req.getParameter("sort");
		List list = dao.selectArea(area,sort);
		
		dao.close();
		model.addAttribute("area",area);
		model.addAttribute("sort",sort);
		model.addAttribute("foodtruck",list);
		return "/com.sajo.foodtruck/front-end/views/foodtruck/all/Foodtruck.jsp";	
	}
		
	@RequestMapping("/write.foodtruck")
	public String write(Model model, HttpServletRequest req,@RequestParam Map map, HttpServletResponse resp) throws Exception{
	
		req.setCharacterEncoding("UTF-8");
		
		FoodtruckDAO dao = new FoodtruckDAO(req.getServletContext());
		ReviewDAO dao2  = new ReviewDAO(req.getServletContext());
		
		
		String user = (String)req.getSession().getAttribute("USER_ID");
		String commen = req.getParameter("commen");
		String star = req.getParameter("star");
		String s_no = req.getParameter("s_no");
		dao2.write(s_no,star,commen,user);
		
		Map map2 = dao2.count(req.getParameter("s_no"));
		String count = map2.get("count").toString();
		String starsum = map2.get("starsum").toString();
		model.addAttribute("count",count);
		model.addAttribute("starsum",starsum);
		
		List<FoodtruckDTO> list = dao.selectImg(req.getParameter("s_no"));
		
		int totalRecordCount = dao2.getTotalRecordCount(req.getParameter("s_no"));
		int pageSize = 5;
		int blockPage = 3 ;
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		
		int start = (nowPage-1)*pageSize + 1;
		int end = nowPage*pageSize;
		List<ReviewDTO> list2 = dao2.selectList(req.getParameter("s_no"),start,end);
		
		String pagingString = PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage, req.getContextPath()+"/write.foodtruck?",req.getParameter("s_no"));
		
		dao.close();
		dao2.close();
		
		
		model.addAttribute("pagingString",pagingString);
		model.addAttribute("totalRecordCount",totalRecordCount);
		model.addAttribute("pageSize",pageSize);
		model.addAttribute("nowPage",nowPage);
		
		model.addAttribute("s_no",req.getParameter("s_no"));
		model.addAttribute("addr",list.get(0).getAddr());
		model.addAttribute("tname", list.get(0).getTname());
		model.addAttribute("intro", list.get(0).getIntro());
		model.addAttribute("id",list.get(0).getId());
		
		model.addAttribute("foodtruck",list);
		model.addAttribute("review",list2);
		
		return "com.sajo.foodtruck/front-end/views/foodtruck/all/Foodtruck_detail1.jsp";
	}
	
	@RequestMapping("/rank.foodtruck")
	public String rank(Model model, HttpServletRequest req,@RequestParam Map map, HttpServletResponse resp) throws Exception{
		
		FoodtruckDAO dao = new FoodtruckDAO(req.getServletContext());
		String area = req.getParameter("area");
		List list = dao.selectRank(area);
		
		dao.close();
		model.addAttribute("sort","rank");
		model.addAttribute("area",area);
		model.addAttribute("foodtruck",list);
		
		return "/com.sajo.foodtruck/front-end/views/foodtruck/all/Foodtruck.jsp";
	}
		
	
}
	