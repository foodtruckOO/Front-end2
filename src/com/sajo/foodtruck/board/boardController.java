package com.sajo.foodtruck.board;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.HttpMethodConstraint;
import javax.servlet.http.HttpServlet;
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
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;

import com.sajo.foodtruck.LoginJoin.PBKDF2;
import com.sajo.foodtruck.mypage.FileUpDownUtils;

@Controller
public class boardController  extends HttpServlet{


	//커스텀목록용]
	@RequestMapping("/Customlist.board")
	public String List(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		
		String usertype = null;
		if(req.getSession().getAttribute("USER_TYPE")!=null) {
			usertype = req.getSession().getAttribute("USER_TYPE").toString();
		}
		if("seller".equals(usertype)) {
			return "/com.sajo.foodtruck/front-end/views/board/customer/IdCheck.jsp";
		}
		ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
		//페이징을 위한 로직 시작]		
		//전체 레코드 수
		int totalRecordCount = dao.getTotalRecordCount();
		//페이지 사이즈
		int pageSize=5;
		//블락페이지
		int blockPage=3;
		//전체 페이지수] 
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
		//현재 페이지를 파라미터로 받기]
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;		
		//페이징을 위한 로직 끝]	
		List<ComstomerDTO> list=dao.selectList(start,end);
		dao.close();
		//라]결과값이 있으면 리퀘스트 영역에 저장
		//페이지용 문자열 생성]
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+"/Customlist.board?");

		req.setAttribute("board", list);//글목록들
		req.setAttribute("active","Cuscom");//메뉴 활성화용
		req.setAttribute("pagingString", pagingString);//페이징 문자열
		//아래는 글번호 순서용
		req.setAttribute("totalRecordCount", totalRecordCount);
		req.setAttribute("nowPage", nowPage);
		req.setAttribute("pageSize", pageSize);
		
		
		return "/com.sajo.foodtruck/front-end/views/board/customer/Cuscom.jsp";
		//마]결과값을 뿌려주거나 이동할 뷰(JSP페이지) 선택후 포워딩
		//뷰선택]
		//포워딩]
		
			/*
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
		*/
	}

	// 셀러목록용]
	@RequestMapping("/Sellerlist.board")
	public String Pizza(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{

		SellerDAO dao = new SellerDAO(req.getServletContext());

		String usertype = null;
		if(req.getSession().getAttribute("USER_TYPE")!=null) {
			usertype = req.getSession().getAttribute("USER_TYPE").toString();
		}
		if("customer".equals(usertype)) {
			return "/com.sajo.foodtruck/front-end/views/board/seller/IdCheck.jsp";
		}
		
		int totalRecordCount = dao.getTotalRecordCount();
		//페이지 사이즈
		int pageSize=5;
		//블락페이지
		int blockPage=3;
		//전체 페이지수] 
		int totalPage =(int)Math.ceil((double)totalRecordCount/pageSize);
		//현재 페이지를 파라미터로 받기]
		int nowPage = req.getParameter("nowPage")==null ? 1 : Integer.parseInt(req.getParameter("nowPage"));
		//시작 및 끝 ROWNUM구하기]
		int start= (nowPage-1)*pageSize +1;
		int end  = nowPage*pageSize;		
				//페이징을 위한 로직 끝]	
		
		
		List list = dao.selectHList(start,end);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, pageSize, blockPage, nowPage,req.getContextPath()+"/Sellerlist.board?");
		
		dao.close();
		model.addAttribute("active","Ceocom");
		model.addAttribute("pagingString", pagingString);//페이징 문자열
		//아래는 글번호 순서용
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("board",list);
		return "/com.sajo.foodtruck/front-end/views/board/seller/Ceocom.jsp";
	}
	//커스텀 작성하기
	@RequestMapping("/CustomWrite.board")
	public String Write(Model model, HttpServletRequest req,@RequestParam Map map) throws Exception{
		ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
		req.setCharacterEncoding("UTF-8");

		String title= req.getParameter("title");
		System.out.println(title);
		String content= req.getParameter("content");
		String file= req.getParameter("file");
		String user = (String)req.getSession().getAttribute("USER_ID");
		//System.out.println(content);
		//System.out.println(file);
		dao.write(title, content, file, user);
		dao.close();
		return "/Customlist.board";
	}
	//셀러 작성하기
	@RequestMapping("/SellerWrite.board")
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
		return "/Sellerlist.board";
	}
	//커스텀 상세보기용
	@RequestMapping("/CustomView.board")
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
	@RequestMapping("/SellerView.board")
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
	@RequestMapping("CustomEdit.board")
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
	@RequestMapping("/CustomEditCheck.board")
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

		return "/CustomView.board?cb_no="+cb_no;
	}/////

	//셀러 수정
	@RequestMapping("/SellerEdit.board")
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
	@RequestMapping("/SellerEditCheck.board")
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

		return "/SellerView.board?sb_no="+sb_no;
	}/////

	//커스텀 삭제
	@RequestMapping("/CustomDelete.board")
	public String delete(Model model,HttpServletRequest req) throws Exception{

		ComstomerDAO dao = new ComstomerDAO(req.getServletContext());
		String cb_no= req.getParameter("cb_no");
		System.out.println(cb_no);
		dao.delete(cb_no);
		dao.close();  
		return "/Customlist.board";
	}

	//셀러 삭제
	@RequestMapping("/SellerDelete.board")
	public String delet(Model model,HttpServletRequest req) throws Exception{

		SellerDAO dao = new SellerDAO(req.getServletContext());
		String sb_no= req.getParameter("sb_no");
		System.out.println(sb_no);
		dao.delete(sb_no);
		dao.close();  
		return "/Sellerlist.board";
	}///////////////////////////////  

	//커스텀 파일 업로드!!
	@RequestMapping("/summerNote.board")
	public String summerNote(HttpServletResponse resp, HttpServletRequest req) throws Exception{
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

		return "/CustomWrite.board";
	} /////////////////////////////////// 

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

	/*모든 이미지 파일 경로에 등록*/
	public String uploadFile(MultipartFile mf, String folder, HttpServletRequest req, Boolean flag) throws IllegalStateException, IOException {

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


}///////////////////////
