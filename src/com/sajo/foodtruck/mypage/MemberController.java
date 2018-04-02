package com.sajo.foodtruck.mypage;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String Tabs1_OK(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		return "tabs-1.tiles";
	}
	

	// tab-1
	@RequestMapping("/Tabs2.page")
	public String Tabs2(Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs2 접속");
		return "wordcloud.tiles";
	}
	@RequestMapping("/Tabs3.page")
	public String Tabs3(Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs3 접속");
		return null;
	}
	
	@RequestMapping("/Info.page")
	public String InfoEdit(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		System.out.println((String)req.getSession().getAttribute("USER_ID"));
		System.out.println("hanwook");
		return "tabs-5.tiles";
	}
	
	
	@RequestMapping("/Event/Upload.page")
	public String upload(T_EventDTO dto, Model model, HttpSession session) throws Exception{
		
		MultipartFile upload = dto.getTitlefile();
		MultipartFile upload2 = dto.getContentfile();
		
		//1]서버의 물리적 경로 얻기
		//2]File객체 생성
		String folderName = "회원아이디";	//폴더 생성할 이름
		String fileName = "가수이미지.jpg";	//파일 이름
		String path = "저장될 주소" +"/" + folderName;
		String filepath = path + "/" + fileName;
		
		File dir = new File(path);
		
		if(!dir.exists()) {	//폴더 없으면 폴더 생성
			dir.mkdirs();
		}
		
		//2-1] 파일 중복시 이름 변경
		//String newFileName=FileUpDownUtils.getNewFileName(phisicalPath, upload.getOriginalFilename());
		//File file = new File(phisicalPath+File.separator+newFileName);		
		//3]업로드 처리
		//upload.transferTo(file);
		//뷰정보 반환]
		return "/com.sajo.foodtruck/front-end/views/mypage/seller/mypage.jsp";
	}
	
}