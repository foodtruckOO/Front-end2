package com.sajo.foodtruck.mypage;

import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class MemberController {
	
	// Customer
	@RequestMapping("/Customer.page")
	public String Customer(Model model, HttpServletRequest req) throws Exception{
		CusDAO dao = new CusDAO(req.getServletContext());
		CusDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		
		List<Map> list = orderCusMigrator(dao.order(dto.getCno()));
		model.addAttribute("list", list);
		model.addAttribute("dto", dto);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		return "mypage";
	}	
	
	// Seller or Customer
	@RequestMapping("/Member.page")
	public String Member(Model model, HttpServletRequest req) throws Exception{
		//seller
		String user = (String)req.getSession().getAttribute("USER_ID");
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne(user);
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		dao.close();
		daoImg.close();
		model.addAttribute("seller", dto);
		model.addAttribute("img", result);
		model.addAttribute("tab", "tabs1");
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		return "tabs-1.tiles";
	}	

	/**********Seller page**********/
	//회원정보 수정-----------------------------------------------------------------
	@RequestMapping("/Tabs1.page")
	public String Tabs1(Model model, HttpServletRequest req) throws Exception{
		//seller
		String user = (String)req.getSession().getAttribute("USER_ID");
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne(user);
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		dao.close();
		daoImg.close();
		model.addAttribute("seller", dto);
		model.addAttribute("img", result);
		model.addAttribute("tab", "tabs1");
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		return "tabs-1.tiles";
	}
	
	
	@RequestMapping("/Info/Update.page")
	public String Info(SellerDTO dto, Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs5 접속");
		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		System.out.println(dto.getId());
		SellerDAO dao = new SellerDAO(req.getServletContext());
		dao.update(dto);
		dao.close();
		daoImg.close();
		model.addAttribute("tab", "tabs5");
		model.addAttribute("seller", dto);
		return "tabs-5.tiles";
	}
	
	//개인정보 수정
	@RequestMapping("/Tabs5.page")
	public String InfoUpdate(Model model, HttpServletRequest req) throws Exception{
		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		SellerDAO dao = new SellerDAO(req.getServletContext());
		SellerDTO dto = dao.selectOne((String)req.getSession().getAttribute("USER_ID"));
		dao.close();
		daoImg.close();
		model.addAttribute("tab", "tabs5");
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
		

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		daoImg.close();
		model.addAttribute("tab", "tabs2");
		return "tabs-2.tiles";
	}
	
	//메뉴삭제
	@RequestMapping("/deleteMenu.page")
	public String deleteMenu(T_Menu_FoodDTO dto,Model model, HttpServletRequest req) throws Exception{
		System.out.println("deleteMenu 접속");
		FileDelete("/MENU", dto.getNewPicture(), req);
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

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("list",list);
		model.addAttribute("food", dto);
		daoImg.close();
		model.addAttribute("tab", "tabs6");
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

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs6");
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

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs3");
		return "tabs-3.tiles";
	}

	//이벤트 보기화면-----------------------------------------------------------------
	@RequestMapping("/Tabs4.page")
	public String Tabs4(Model model, HttpServletRequest req) throws Exception{
		System.out.println("tabs4 접속");
		T_EventDAO dao = new T_EventDAO(req.getServletContext());
		List<T_EventDTO> list = dao.selectEvent(dao.getSellerNo(req.getSession().getAttribute("USER_ID").toString()));
		dao.close();
		for(T_EventDTO dto : list) dto.setContent(dto.getContent().replaceAll("\r\n", "</br>"));
		model.addAttribute("list",list);

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs4");
		return "tabs-4.tiles";
	}
	
	//이벤트 삭제
	@RequestMapping("/deleteEvent.page")
	public String deleteEvent(T_EventDTO dto,Model model, HttpServletRequest req) throws Exception{
		System.out.println("deleteEvent 접속");
		FileDelete("/EVENT/TITLE", dto.getNewTitlefile(), req);
		FileDelete("/EVENT/CONTENT", dto.getNewContentfile(), req);
		T_EventDAO dao = new T_EventDAO(req.getServletContext());
		dao.deleteEvent(dto.getEno());
		dao.close();
		return "forward:/Tabs4.page";
	}
	
	//이벤트 등롬폼으로 이동------------------------------------------------------------------------
	@RequestMapping("/Tabs7.page")
	public String EventUpdate(HttpServletRequest req, Model model) throws Exception{

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs7");
		return "tabs-7.tiles";
	}
	
	//이벤트 등록
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
	
	//이벤트 수정폼으로 이동
	@RequestMapping("/editEvent.page")
	public String editEvent(T_EventDTO dto, Model model, HttpServletRequest req) throws Exception{
		System.out.println("editEvent 접속");
		T_EventDAO dao = new T_EventDAO(req.getServletContext());
		List<T_EventDTO> dtos = dao.selectEvent(dao.getSellerNo(req.getSession().getAttribute("USER_ID").toString()));
		for(T_EventDTO d: dtos) {
			if(dto.getEno().equals(d.getEno())){
					dto=d;
					dto.setSdate(dto.getSdate().replaceAll("-", "/"));
					dto.setEdate(dto.getEdate().replaceAll("-", "/"));
					break;
			}
		}
		dao.close();
		model.addAttribute("event", dto);

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs7");
		return "tabs-7_1.tiles";
	}
	
	//이벤트 수정
	@RequestMapping("/updateEvent.page")
	public String updateEvent(T_EventDTO dto,Model model, HttpServletRequest req) throws Exception{
		System.out.println("updateEvent 접속");
		String user = req.getSession().getAttribute("USER_ID").toString();
		/*-----이미지 경로에 등록-----*/
		if(!(dto.getNewTitlefile().equals(dto.getTitlefile().getOriginalFilename()))) {
			FileDelete("/EVENT/TITLE", dto.getNewTitlefile(), req);
			dto.setNewTitlefile(FileUpload(dto.getTitlefile(), "/EVENT/TITLE", req,false));
		}
		if(!(dto.getNewContentfile().equals(dto.getContentfile().getOriginalFilename()))) {
			FileDelete("/EVENT/CONTENT", dto.getNewContentfile(), req);
			dto.setNewContentfile(FileUpload(dto.getContentfile(), "/EVENT/CONTENT", req,false));
		}
		/*-----이미지 DB등록-----*/		
		T_EventDAO dao = new T_EventDAO(req.getServletContext());
		dao.updateEvent(dto);
		dao.close();
		
		return "forward:/Tabs4.page";
	}
	
	
	//SNS 등록------------------------------------------------------------------------
	@RequestMapping("/Tabs8.page")
	public String SnsInsert(HttpServletRequest req, Model model) throws Exception{

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs8");
		return "tabs-8.tiles";
	}	
	
	//주문 현황------------------------------------------------------------------------
	@RequestMapping("/Tabs9.page")
	public String OrderList(HttpServletRequest req,Model model) throws Exception{
		T_OrderDAO dao = new T_OrderDAO(req.getServletContext());
		T_OderDTO dto =  new T_OderDTO();
		List<T_OderDTO> list = new Vector<T_OderDTO>();
		String user = (String)req.getSession().getAttribute("USER_ID");
		list = dao.orderList(user);

		List<Map> newList = orderMigrator(list);
		System.out.println(JSONArray.toJSONString(newList));
		/********************List<Map<String, String>>*/
		/****************************************************************************************/
		model.addAttribute("list", newList);
		System.out.println(list);
		
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO dd = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", dd);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs9");
		return "tabs-9.tiles";
	}
	
	//푸드트럭사진 등록------------------------------------------------------------------------
	@RequestMapping("/Tabs10.page")
	public String TruckImg(HttpServletRequest req,Model model) throws Exception{
		System.out.println("Tabs10 접속"); 
		/*
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		List<T_ImgDTO> list = dao.selectSubImage(dao.getSellerNo(req.getSession().getAttribute("USER_ID").toString()));
		dao.close();
		model.addAttribute("list",list);*/
		

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO result = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		daoImg.close();
		model.addAttribute("img", result);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		model.addAttribute("tab", "tabs10");
		return "tabs-10.tiles";
	}

	@ResponseBody
	@RequestMapping("/selectSubImg.page")
	public String selectSubImg(HttpServletRequest req,Model model) throws Exception{
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		List<T_ImgDTO> list = dao.selectSubImage(dao.getSellerNo(req.getSession().getAttribute("USER_ID").toString()));
		List<String> result = new Vector<String>();
		for(T_ImgDTO li : list) {
			result.add(li.getNewImg());
		}
		
		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		JSONObject json = new JSONObject();
		json.put("list", result);
		System.out.println(list);
		

		String user = (String)req.getSession().getAttribute("USER_ID");
		T_MenuDAO daoImg = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO dd = daoImg.selectMainImg(daoImg.getSellerNo(user).toString());
		model.addAttribute("img", dd);
		model.addAttribute("ip", InetAddress.getLocalHost().getHostAddress());
		return json.toJSONString();
	}
	
	//SUB[JSON으로 응답할때]
	@ResponseBody
	@RequestMapping(value="/Img/Upload.page", method = RequestMethod.POST)
	public String Img(MultipartHttpServletRequest mf,HttpServletRequest req) throws Exception{
		System.out.println("ImgUpload");
		String user = req.getSession().getAttribute("USER_ID").toString();
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		T_ImgDTO dto = new T_ImgDTO();
		dto.setSno(dao.getSellerNo(user));

		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		JSONObject json = new JSONObject();

		Iterator<String> itr = mf.getFileNames();
		 if(itr.hasNext()) {
			 MultipartFile mpf = mf.getFile(itr.next());
			 System.out.println(mpf.getOriginalFilename() +" uploaded!"); 
			 try { 
				 	json.put("length", (int)mpf.getBytes().length/1028);
				 	dto.setKilobyte(String.valueOf(mpf.getBytes().length/1028));
				 	dto.setNewImg(FileUpload(mpf, "/FOODTRUCKS", req, false));
				 	json.put("name", dto.getNewImg());
					dao.insertSubFoodtruck(dto);
					dao.close();
			 } 
			 catch (IOException e) { 
				 System.out.println("catch 에러남 왜남"); 
				 e.printStackTrace(); 
			 } 
			System.out.println(json.toJSONString());
			return json.toJSONString();
		} 
		 else { 
			 System.out.println("else 에러남 끝에서남"); 
			 return "x"; 
		 }
	}
	//SUB[JSON으로 응답할때]
		@ResponseBody
		@RequestMapping(value="/Img/dragNdrop.page", method = RequestMethod.POST)
		public String dragNdrop(MultipartHttpServletRequest mf,HttpServletRequest req) throws Exception{
			System.out.println("ImgUpload");
			String user = req.getSession().getAttribute("USER_ID").toString();
			T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
			T_ImgDTO dto = new T_ImgDTO();
			dto.setSno(dao.getSellerNo(user));

			//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
			JSONObject json = new JSONObject();

			Iterator<String> itr = mf.getFileNames();
			int  num = 1;
			
			 while(itr.hasNext()) {
				 System.out.println(num++);
				 MultipartFile mpf = mf.getFile(itr.next());
				 System.out.println(mpf.getOriginalFilename() +" uploaded!"); 
				 try { 
					 	json.put("length", (int)mpf.getBytes().length/1028);
					 	dto.setKilobyte(String.valueOf(mpf.getBytes().length/1028));
					 	dto.setNewImg(FileUpload(mpf, "/FOODTRUCKS", req, false));
					 	json.put("name", dto.getNewImg());
						dao.insertSubFoodtruck(dto);
						dao.close();
				 } 
				 catch (IOException e) { 
					 System.out.println("catch 에러남 왜남"); 
					 e.printStackTrace(); 
				 } 
				System.out.println(json.toJSONString());
			}
			return json.toJSONString();
		}
	//
	@ResponseBody
	@RequestMapping("/Img/Delete.page")
	public String TruckImgDelete(@RequestParam Map map, HttpServletRequest req,Model model) throws Exception{
		System.out.println(map.get("id"));
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		dao.deleteSubFoodtruck(map.get("id").toString());
		FileDelete("/FOODTRUCKS", map.get("id").toString(), req);
		return "true";
	}
	
	//[JSON으로 응답할때]
		@ResponseBody
		@RequestMapping(value="/Img/dragNdropMain.page", method = RequestMethod.POST)
		public String dragNdropMain(MultipartHttpServletRequest mf,HttpServletRequest req) throws Exception{
			System.out.println("Main drag ImgUpload");
			String user = req.getSession().getAttribute("USER_ID").toString();
			T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
			T_ImgTruckpageDTO dto = new T_ImgTruckpageDTO();
			dto.setSno(dao.getSellerNo(user));

			//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
			JSONObject json = new JSONObject();

			Iterator<String> itr = mf.getFileNames();
			 if(itr.hasNext()) {
				 MultipartFile mpf = mf.getFile(itr.next());
				 System.out.println(mpf.getOriginalFilename() +" Main uploaded!"); 
				 try { 
					 	json.put("length", (int)mpf.getBytes().length/1028);
					 	dto.setNewMain(FileUpload(mpf, "/FOODTRUCKS/MAIN", req, true));
					 	json.put("name", dto.getNewMain());
					 	dto.setIntro(mf.getParameter("intro").replaceAll("\r\n", "<br/>")+" ");			 	
					 	if(dao.isSnoMain(dto.getSno())) dao.updateMain(dto);
					 	else dao.insertMainFoodtruck(dto);
						dao.close();
				 } 
				 catch (IOException e) { 
					 System.out.println("catch 에러남 왜남"); 
					 e.printStackTrace(); 
				 } 
				System.out.println(json.toJSONString());
				return json.toJSONString();
			} 
			 else { 
				 System.out.println("else 에러남 끝에서남"); 
				 return "x"; 
			 }
		}
		
		
	//[JSON으로 응답할때]
	@ResponseBody
	@RequestMapping(value="/Img/Main/Upload.page", method = RequestMethod.POST)
	public String ImgMain(MultipartHttpServletRequest mf,HttpServletRequest req) throws Exception{
		System.out.println("Main ImgUpload");
		String user = req.getSession().getAttribute("USER_ID").toString();
		T_MenuDAO dao = new T_MenuDAO(req.getServletContext());
		T_ImgTruckpageDTO dto = new T_ImgTruckpageDTO();
		dto.setSno(dao.getSellerNo(user));

		//JSON데이타 타입으로 반환하기위해 JSONObject객체 생성
		JSONObject json = new JSONObject();

		Iterator<String> itr = mf.getFileNames();
		 if(itr.hasNext()) {
			 MultipartFile mpf = mf.getFile(itr.next());
			 System.out.println(mpf.getOriginalFilename() +" Main uploaded!"); 
			 try { 
				 	json.put("length", (int)mpf.getBytes().length/1028);
				 	dto.setNewMain(FileUpload(mpf, "/FOODTRUCKS/MAIN", req, true));
				 	json.put("name", dto.getNewMain());
				 	json.put("intro", mf.getParameter("intro").replaceAll("\r\n", "<br/>"));
				 	dto.setIntro(mf.getParameter("intro")+" ");
				 	if(dao.isSnoMain(dto.getSno())) dao.updateMain(dto);
				 	else dao.insertMainFoodtruck(dto);
					dao.close();
			 } 
			 catch (IOException e) { 
				 System.out.println("catch 에러남 왜남"); 
				 e.printStackTrace(); 
			 } 
			System.out.println(json.toJSONString());
			return json.toJSONString();
		} 
		 else { 
			 System.out.println("else 에러남 끝에서남"); 
			 return "x"; 
		 }
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
						"/"+req.getSession().getAttribute("USER_ID").toString()+folder+File.separator+filename);
		File file = new File(path);
		if( file.exists() ){
			if(file.delete())
				System.out.println(filename+" 삭제 성공");
			else
		    System.out.println(filename + "삭제 실패");
		}else
		    System.out.println(filename + " 파일이 존재하지 않습니다.");
	}
	
	public List<Map> orderMigrator(List<T_OderDTO> list){
		List<Map> newList = new Vector();//전체 담는 거
		Map map = null;//전체에 담기는 각각의 주문덩어리
		List<T_OderDTO> foods = null;//map에 넣을 음식리스트
		T_OderDTO innerDto = null;//각각의 음식데이터 담은녀석들
		int currentNo=0;
		int sum=0;
		for(T_OderDTO dto : list) {
			if(Integer.parseInt(dto.getO_no())!=currentNo) {//다음 주문으로 넘어감
				currentNo = Integer.parseInt(dto.getO_no());
				if(map!=null) {
					map.put("foods", foods);
					map.put("sum", sum);
					sum=0;
					newList.add(map);
				}
				map = new HashMap();
				foods = new Vector();
				map.put("orderNo", dto.getO_no());
				map.put("cname", dto.getCname());
				map.put("tel", dto.getTel());
				map.put("content", dto.getContent());
			}
			innerDto = new T_OderDTO();
			innerDto.setFname(dto.getFname());
			System.out.println(dto.getFname());
			innerDto.setNum(dto.getNum());
			int price = Integer.parseInt(dto.getPrice())*Integer.parseInt(dto.getNum());
			sum+=price;
			innerDto.setPrice(Integer.toString(price));
			foods.add(innerDto);
		}
		map.put("foods", foods);
		map.put("sum", sum);
		newList.add(map);
		return newList;
	}
	

	public List<Map> orderCusMigrator(List<T_OderformDTO> list){
		List<Map> newList = new Vector();//전체 담는 거
		Map map = null;//전체에 담기는 각각의 주문덩어리
		List<T_OderformDTO> foods = null;//map에 넣을 음식리스트
		T_OderformDTO innerDto = null;//각각의 음식데이터 담은녀석들
		int currentNo=0;
		int sum=0;
		for(T_OderformDTO dto : list) {
			if(Integer.parseInt(dto.getOno())!=currentNo) {//다음 주문으로 넘어감
				currentNo = Integer.parseInt(dto.getOno());
				if(map!=null) {
					map.put("foods", foods);
					map.put("sum", sum);
					sum=0;
					newList.add(map);
				}
				map = new HashMap();
				foods = new Vector();
				map.put("ono", dto.getOno());
				map.put("tname", dto.getTname());
				map.put("tel", dto.getTel());
				map.put("content", dto.getContent());
				map.put("postdate", dto.getPostdate().split(" ")[0]);
				map.put("timeofreceipt", dto.getTimeofreceipt());
			}
			innerDto = new T_OderformDTO();
			innerDto.setFname(dto.getFname());
			innerDto.setNum(dto.getNum());
			int price = Integer.parseInt(dto.getPrice())*Integer.parseInt(dto.getNum());
			sum+=price;
			innerDto.setPrice(Integer.toString(price));
			foods.add(innerDto);
		}
		map.put("foods", foods);
		map.put("sum", sum);
		newList.add(map);
		return newList;
	}
}