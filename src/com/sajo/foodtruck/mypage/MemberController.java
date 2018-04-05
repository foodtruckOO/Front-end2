package com.sajo.foodtruck.mypage;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class MemberController {
	
	// Seller or Customer
	@RequestMapping("/Member.page")
	public String Member(Model model, HttpServletRequest req) throws Exception{
		//seller
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		return "tabs-1.tiles";
		
		//customer
	}	

	/**********Seller page**********/
	//회원정보 수정
	@RequestMapping("/Tabs1.page")
	public String Tabs1(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		return "tabs-1.tiles";
	}
	
	//회원정보 수정
	@RequestMapping("/Tabs1_OK.page")
	public String Tabs1_OK(SellerDTO dto, Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		String result = "<script>\r\n" + 
				"  $( function() {\r\n" + 
				"    $( \"#dialog\" ).dialog();\r\n" + 
				"  } );\r\n" + 
				"  </script>"+ 
				"<div id=\"dialog\" title=\"Basic dialog\">\r\n" + 
				"<img src=\"<c:url value='/com.sajo.foodtruck/front-end/images/checkmark.gif'/>\" alt=\"이미지 없다\" \r\n" + 
				"			style=\"width:50px; height: 50px; margin:1%;"+
				"  <p>"+dao.update(dto)+"</p>\r\n" + 
				"</div>";
		dao.close();
		model.addAttribute("result", result);
		return "tabs-1.tiles";
	}
	

	// tab-1
	@RequestMapping("/Tabs2.page")
	public String Tabs2(Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs2 접속");
		return "tabs-2.tiles";
	}

	@RequestMapping("/Tabs3.page")
	public String Tabs3(Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs3 접속");
		return "tabs-3.tiles";
	}
	
	@RequestMapping("/Tabs4.page")
	public String Tabs4(Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs4 접속");
		return "tabs-4.tiles";
	}
	
	//개인정보 수정
	@RequestMapping("/Tabs5.page")
	public String InfoUpdate(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println((String)req.getSession().getAttribute("USER_ID"));
		System.out.println("hanwook");
		return "tabs-5.tiles";
	}
	
	//메뉴 수정
	@RequestMapping("/Tabs6.page")
	public String MenuUpdate(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println((String)req.getSession().getAttribute("USER_ID"));
		System.out.println("hanwook");
		return "tabs-6.tiles";
	}
		
	//이벤트 수정
	@RequestMapping("/Tabs7.page")
	public String EventUpdate() throws Exception{
		
		return "tabs-7.tiles";
	}
	
	//이벤트 수정
	@RequestMapping("/Tabs8.page")
	public String SnsUpdate(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println((String)req.getSession().getAttribute("USER_ID"));
		return "tabs-8.tiles";
	}
	
	@RequestMapping(value="/Event/Upload.page", method=RequestMethod.POST)
	public String upload(T_EventDTO dto, Model model, HttpServletRequest req) throws Exception{
		
		String user = req.getSession().getAttribute("USER_ID").toString();
		/*-----------------------------이미지 폴더 저장-----------------------------*/
		MultipartFile titleFile		= dto.getTitlefile();
		MultipartFile contentFile	= dto.getContentfile();
		
		//1] 이미지 경로
		String titlePath=req.getSession().getServletContext().getRealPath(
									"/"+req.getSession().getAttribute("USER_TYPE").toString()+
									"/"+req.getSession().getAttribute("USER_ID").toString()+
									"/EVENT/TITLE");
		String contentPath=req.getSession().getServletContext().getRealPath(
									"/"+req.getSession().getAttribute("USER_TYPE").toString()+
									"/"+req.getSession().getAttribute("USER_ID").toString()+
									"/EVENT/CONTENT");
		
		//2]File객체 생성
		File title		= new File(titlePath);	
		File content	= new File(contentPath);		
		System.out.println(titlePath + titleFile.getOriginalFilename());
		
		//해당 디렉토리의 존재여부를 확인
		if(!title.exists()){
			//없다면 생성
			title.mkdirs(); 
		}else{
			//있다면 현재 디렉토리 파일을 삭제 
			System.out.println("폴더1 있어 기존거 삭제할게");
			File[] destroy = title.listFiles(); 
			for(File des : destroy) des.delete();
		}
		
		//해당 디렉토리의 존재여부를 확인
		if(!content.exists()){
			System.out.println("폴더2 없어 하나 만들게");
			//없다면 생성
			content.mkdirs(); 
			System.out.println("폴더2 만들었어!");
		}else{
			//있다면 현재 디렉토리 파일을 삭제 
			System.out.println("폴더2 있어 기존거 삭제할게");
			File[] destroy = content.listFiles(); 
			for(File des : destroy) des.delete();
		}

		//2]File객체 생성
		title	= new File(titlePath + File.separator + titleFile.getOriginalFilename());	
		content	= new File(contentPath + File.separator + contentFile.getOriginalFilename());	
		
		//3]업로드 처리
		titleFile.transferTo(title);
		contentFile.transferTo(content);
		

		/*-----------------------------이미지 DB등록-----------------------------*/		
		System.out.println(dto.getTitle());
		
		System.out.println(dto.getSdate());
		System.out.println(dto.getEdate());

		T_EventDAO dao = new T_EventDAO(req.getServletContext());
		dto.setS_no(dao.getSellerNo(user));
		dao.insertEvent(dto);
		return "forward:/Member.page";
	}
}