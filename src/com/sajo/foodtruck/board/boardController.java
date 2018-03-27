package com.sajo.foodtruck.board;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
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

import com.oreilly.servlet.MultipartRequest;

import model.PBKDF2;



//세션처리용]

@Controller
public class boardController {
	
	//커스텀목록용]
	@RequestMapping("/Com.board")
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
		List list = dao.selectHList();
		dao.close();
		model.addAttribute("board",list);
	return "/com.sajo.foodtruck/front-end/views/board/customer/Cuscom.jsp";
	}
	
	// 셀러목록용]
		@RequestMapping("/Pizza.board")
		public String Pizza(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
			
			SellerDAO dao = new SellerDAO(req.getServletContext());
			List list = dao.selectHList();
			dao.close();
			model.addAttribute("board",list);
		return "/com.sajo.foodtruck/front-end/views/board/seller/Ceocom.jsp";
		}
   //커스텀 작성하기
	@RequestMapping("/ktx.board")
	public String Write(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
		req.setCharacterEncoding("UTF-8");
		
		String title= req.getParameter("title");
		System.out.println(title);
		String content= req.getParameter("content");
		String file= req.getParameter("file");
		String user = (String)req.getSession().getAttribute("USER_ID");
		dao.write(title, content, file, user);
		dao.close();
	return "/Com.board";
	}
	//셀러 작성하기
	@RequestMapping("/lte.board")
	public String Swrite(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		req.setCharacterEncoding("UTF-8");
		
		String title= req.getParameter("title");
		System.out.println(title);
		String content= req.getParameter("content");
		String file= req.getParameter("file");
		String user = (String)req.getSession().getAttribute("USER_ID");
		dao.swrite(title, content, file, user);
		dao.close();
	return "/Pizza.board";
	}
	//커스텀 상세보기용
	@RequestMapping("/rice.board")
	public String View(Model model,HttpServletRequest req) throws Exception{
		ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
		req.setCharacterEncoding("UTF-8");
		
		String cb_no= req.getParameter("cb_no");
		System.out.println(cb_no);
		ComstomerDTO dto = dao.selectOne(cb_no);
		model.addAttribute("rice", dto);
		dao.close();
		
		return "/com.sajo.foodtruck/front-end/views/board/customer/View.jsp";
	}
	//셀러 상세보기용
		@RequestMapping("/nice.board")
		public String Viw(Model model,HttpServletRequest req) throws Exception{
			SellerDAO dao = new SellerDAO(req.getServletContext());
			req.setCharacterEncoding("UTF-8");
			
			String sb_no= req.getParameter("sb_no");
			System.out.println(sb_no);
			SellerDTO dto = dao.selectOne(sb_no);
			model.addAttribute("nice", dto);
			dao.close();
			
			return "/com.sajo.foodtruck/front-end/views/board/seller/View.jsp";
		}/////
		
		      //커스텀 수정
				@RequestMapping("/sujung.board")
				public String update(Model model,HttpServletRequest req) throws Exception{
					ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
					req.setCharacterEncoding("UTF-8");
					
					String cb_no= req.getParameter("cb_no");
					System.out.println(cb_no);
					ComstomerDTO dto = dao.selectOne(cb_no);
					model.addAttribute("nike", dto);
					dao.close();
					
					return "/com.sajo.foodtruck/front-end/views/board/customer/Edit.jsp";
				}/////
				//커스텀 수정
				@RequestMapping("/sujin.board")
				public String date(Model model,HttpServletRequest req) throws Exception{
					ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
					req.setCharacterEncoding("UTF-8");
					
					String cb_no= req.getParameter("cb_no");
					String title= req.getParameter("title");
					System.out.println(title);
					String content= req.getParameter("content");
					String file= req.getParameter("file");
					String user = (String)req.getSession().getAttribute("USER_ID");
					dao.update(cb_no,title, content, file, user);
					dao.close();
					
					return "/rice.board?cb_no="+cb_no;
				}/////
		
				 //셀러 수정
				@RequestMapping("/seller.board")
				public String up(Model model,HttpServletRequest req) throws Exception{
					SellerDAO dao = new SellerDAO(req.getServletContext());
					req.setCharacterEncoding("UTF-8");
					
					String sb_no= req.getParameter("sb_no");
					System.out.println(sb_no);
					SellerDTO dto = dao.selectOne(sb_no);
					model.addAttribute("adidas", dto);
					dao.close();
					
					return "/com.sajo.foodtruck/front-end/views/board/seller/Edit.jsp";
				}/////
				//셀러 수정
				@RequestMapping("/sale.board")
				public String down(Model model,HttpServletRequest req) throws Exception{
					SellerDAO dao = new SellerDAO(req.getServletContext());
					req.setCharacterEncoding("UTF-8");
					
					String sb_no= req.getParameter("sb_no");
					String title= req.getParameter("title");
					System.out.println(title);
					String content= req.getParameter("content");
					String file= req.getParameter("file");
					String user = (String)req.getSession().getAttribute("USER_ID");
					dao.update(sb_no,title, content, file, user);
					dao.close();
					
					return "/nice.board?sb_no="+sb_no;
				}/////
		
	/*
	@RequestMapping("/Eventview.event")
	public String View(Model model,HttpServletRequest req,@RequestParam Map map) throws Exception{
		String key = req.getParameter("eno");
		boardDAO dao = new boardDAO(req.getServletContext());
		boardDTO dto = dao.selectOne(key);
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
		
		
		boardDAO dao = new boardDAO(req.getServletContext());
		List list = dao.selectAll();
		dao.close();
		model.addAttribute("events",list);
		return "/com.sajo.foodtruck/front-end/views/main.jsp";
	}
	*/
}
	