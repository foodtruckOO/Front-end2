package com.sajo.foodtruck.mypage;

import java.io.File;
import java.io.IOException;
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
	//회원정보 수정-----------------------------------------------------------------
	@RequestMapping("/Tabs1.page")
	public String Tabs1(Model model, HttpServletRequest req) throws Exception{
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		model.addAttribute("seller", dto);
		return "tabs-1.tiles";
	}
	
	@RequestMapping("/Info/Update.page")
	public String Info(SellerDTO dto, Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs5 접속");
		System.out.println(dto.getId());
		SellerDAO dao = new SellerDAO(req.getServletContext());
		dao.update(dto);
		dao.close();
		model.addAttribute("seller", dto);
		return "tabs-5.tiles";
	}
	
	//메뉴 보기화면------------------------------------------------------------------------*
	@RequestMapping("/Tabs2.page")
	public String selectMenu(Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs2 접속");
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		List<T_Menu_FoodDTO> list = dao.selectMenu(dao.getSellerNo(req.getSession().getAttribute("USER_ID").toString()));
		dao.close();
		for(T_Menu_FoodDTO dto : list) dto.setContent(dto.getContent().replaceAll("\r\n", "</br>"));
		model.addAttribute("list",list);
		return "tabs-2.tiles";
	}
	//메뉴삭제
	@RequestMapping("/deleteMenu.page")
	public String deleteMenu(T_Menu_FoodDTO dto,Model model, HttpServletRequest req) throws Exception{
		System.out.println("deleteMenu 접속");
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		dao.deleteMenu(dto.getFno());
		dao.close();
		return "forward:/Tabs2.page";
	}
	
	//메뉴 수정폼으로 이동
	@RequestMapping("/editMenu.page")
	public String editMenu(T_Menu_FoodDTO dto, Model model, HttpServletRequest req) throws Exception{
		System.out.println("editMenu 접속");
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		List<T_Menu_TypeDTO> list = dao.foodtype();
		List<T_Menu_FoodDTO> dtos = dao.selectMenu(dao.getSellerNo(req.getSession().getAttribute("USER_ID").toString()));
		for(T_Menu_FoodDTO d: dtos) {
			if(dto.getFno().equals(d.getFno())){
					dto=d;
					break;
			}
		}
		dao.close();
		model.addAttribute("list",list);
		model.addAttribute("food", dto);
		return "tabs-6_1.tiles";
	}
	
	//메뉴 수정
	@RequestMapping("/updateMenu.page")
	public String updateMenu(T_Menu_FoodDTO dto,Model model, HttpServletRequest req) throws Exception{
		System.out.println("updateMenu 접속");
		String user = req.getSession().getAttribute("USER_ID").toString();
		/*-----이미지 경로에 등록-----*/
		if(!(dto.getNewPicture().equals(dto.getPicture().getOriginalFilename()))) {
			FileDelete("/MENU", dto.getNewPicture(), req);
			dto.setNewPicture(FileUpload(dto.getPicture(), "/MENU", req,false));
		}
		/*-----이미지 DB등록-----*/		
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		dao.updateMenu(dto);
		dao.close();
		return "forward:/Tabs2.page";
	}
	
	//메뉴 등록화면-----------------------------------------------------------------
	@RequestMapping("/Tabs6.page")
	public String MenuUpdate(Model model, HttpServletRequest req) throws Exception{
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		List<T_Menu_TypeDTO> list = dao.foodtype();
		dao.close();
		model.addAttribute("list",list);
		return "tabs-6.tiles";
	}
	
	//메뉴 등록
	@RequestMapping("/Menu/Upload.page")
	public String MenuUpload(T_Menu_FoodDTO dto, HttpServletRequest req) throws Exception{
		System.out.println("MenuUpload");
		String user = req.getSession().getAttribute("USER_ID").toString();
		/*-----이미지 경로에 등록-----*/
		dto.setNewPicture(FileUpload(dto.getPicture(), "/MENU", req,false));
		
		/*-----이미지 DB등록-----*/		
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		dto.setSno(dao.getSellerNo(user));
		dao.insertMenu(dto);	//변경되면 1 아니면 0
		dao.close();
		return "forward:/Member.page";
	}
		
		
	//
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
		return "tabs-5.tiles";
	}
	


	

	//이벤트 수정------------------------------------------------------------------------
	@RequestMapping("/Tabs7.page")
	public String EventUpdate() throws Exception{
		
		return "tabs-7.tiles";
	}
	
	@RequestMapping(value="/Event/Upload.page", method=RequestMethod.POST)
	public String EventUpload(T_EventDTO dto, Model model, HttpServletRequest req) throws IllegalStateException, IOException {
		
		String user = req.getSession().getAttribute("USER_ID").toString();
		
		/*-----이미지 경로에 등록-----*/
		FileUpload(dto.getTitlefile(), "/EVENT/TITLE", req,true);
		FileUpload(dto.getContentfile(), "/EVENT/CONTENT", req,true);		

		/*-----이미지 DB등록-----*/		
		T_EventDAO dao = new T_EventDAO(req.getServletContext());
		dto.setS_no(dao.getSellerNo(user));
		dao.insertEvent(dto);// 변경되면 1 아니면 0
		return "forward:/Member.page";
	}
	
	//SNS 등록------------------------------------------------------------------------
	@RequestMapping("/Tabs8.page")
	public String SnsInsert() throws Exception{
		
		return "tabs-8.tiles";
	}	
	
	//주문 현황------------------------------------------------------------------------
	@RequestMapping("/Tabs9.page")
	public String OrderList() throws Exception{
		
		return "tabs-9.tiles";
	}	
	//사진 등록------------------------------------------------------------------------
	@RequestMapping("/Tabs10.page")
	public String TruckImg() throws Exception{
		return "tabs-10.tiles";
	}
	
	@RequestMapping("/ImgUpload.page")
	public String ImgUpload(T_ImgDTO dto,HttpServletRequest req,Model model) throws Exception{
		System.out.println("ImgUpload");
		String user = req.getSession().getAttribute("USER_ID").toString();
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		dto.setSno(dao.getSellerNo(user));
		System.out.println("여기"); 
		dto.setNewImg(FileUpload(dto.getImg(), "/FOODTRUCKS", req, false));
		System.out.println("끝");
		dao.insertFoodtruck(dto);
		System.out.println("whdfy");  
		dao.close();
		return "forward:/Member.page";
	}
	

	//이미지 파일 업로드 메소드------------------------------------------------------------------------*
	public String FileUpload(MultipartFile mf, String folder, HttpServletRequest req, Boolean flag) throws IllegalStateException, IOException {
		
		MultipartFile file = mf;
		//1] 이미지 경로
		String path=req.getSession().getServletContext().getRealPath(
									"/"+req.getSession().getAttribute("USER_TYPE").toString()+
									"/"+req.getSession().getAttribute("USER_ID").toString()+folder);

		String newFileName=FileUpDownUtils.getNewFileName(path, file.getOriginalFilename());
		//2]File객체 생성
		File f = new File(path);	
		//해당 디렉토리의 존재여부를 확인
		if(!f.exists()){
			//없다면 생성
			f.mkdirs(); 
		}else{
			//있다면 현재 디렉토리 파일을 삭제 
			if(flag) {
				System.out.println("폴더1 있어 기존거 삭제할게");
				File[] destroy = f.listFiles(); 
				for(File des : destroy) des.delete();
			}
		}
		//3]File객체 생성
		f	= new File(path + File.separator + newFileName);	
		//4]업로드 처리
		file.transferTo(f);
		//5]변경된 이름 return
		return newFileName;
	}
	

	//이미지 파일 삭제 메소드------------------------------------------------------------------------*
	public void FileDelete(String folder, String filename, HttpServletRequest req) throws IllegalStateException, IOException {
		String path=req.getSession().getServletContext().getRealPath(
						"/"+req.getSession().getAttribute("USER_TYPE").toString()+
						"/"+req.getSession().getAttribute("USER_ID").toString()+folder+filename);
		File file = new File(path);
		if( file.exists() ){
			if(file.delete())
				System.out.println(filename+" 삭제 성공");
			else
		    System.out.println(filename + "삭제 실패");
		}else
		    System.out.println(filename + " 파일이 존재하지 않습니다.");
	}
}