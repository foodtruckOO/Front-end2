package com.sajo.foodtruck.board;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpMethodConstraint;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		
		String usertype = null;
		if(req.getSession().getAttribute("USER_TYPE")!=null) {
			usertype = req.getSession().getAttribute("USER_TYPE").toString();
		}
		if("seller".equals(usertype)) {
			return "/com.sajo.foodtruck/front-end/views/board/customer/IdCheck.jsp";
		}
		List list = dao.selectHList();
		dao.close();
		model.addAttribute("board",list);
		return "/com.sajo.foodtruck/front-end/views/board/customer/Cuscom.jsp";
	}

	// 셀러목록용]
	@RequestMapping("/Pizza.board")
	public String Pizza(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{

		SellerDAO dao = new SellerDAO(req.getServletContext());
		
		String usertype = null;
		if(req.getSession().getAttribute("USER_TYPE")!=null) {
			usertype = req.getSession().getAttribute("USER_TYPE").toString();
		}
		if("customer".equals(usertype)) {
			return "/com.sajo.foodtruck/front-end/views/board/seller/IdCheck.jsp";
		}
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

	//커스텀 삭제
	  @RequestMapping("/delete.board")
	  public String delete(Model model,HttpServletRequest req) throws Exception{
		  
		  ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
		  String cb_no= req.getParameter("cb_no");
		  System.out.println(cb_no);
		  dao.delete(cb_no);
		  dao.close();  
		  return "/Com.board";
	  }
	  
	//셀러 삭제
	  @RequestMapping("/delet.board")
	  public String delet(Model model,HttpServletRequest req) throws Exception{
		  
		  SellerDAO dao = new SellerDAO(req.getServletContext());
		  String sb_no= req.getParameter("sb_no");
		  System.out.println(sb_no);
		  dao.delete(sb_no);
		  dao.close();  
		  return "/Pizza.board";
	  }

	  //커스텀 파일 업로드
		protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			//파라미터 받기]
			String filename = req.getParameter("filename");
			System.out.println("filename="+filename);
			String key      = req.getParameter("key");
			//다운로드 관련 모델 호출]
			//1.파일 다운로드 로직 호출]
			FileUtils.download(req, resp, "/Upload", filename);
			//2.테이블의 다운로드수 컬럼 증가용 데이타베이스 관련 로직 호출]
			ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
			dao.updateDownCount(key);
			dao.close();
			
		}//////////////////////////
	
}///////////////////////
