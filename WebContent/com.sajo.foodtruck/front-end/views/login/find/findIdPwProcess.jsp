<%@page import="com.sajo.foodtruck.LoginJoin.*"%>
<%@page import="java.io.Console"%>
<%@page import="com.sajo.foodtruck.mypage.SellerDTO"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	//사용자 입력값 받기]
	String name= request.getParameter("name");	
	String phone= request.getParameter("phone");
	String email= request.getParameter("email");
	

	//실제 테이블과 연동]
	CusDAO dao = new CusDAO(application);
	CusDTO dto = dao.findIdPwone(name, phone);
	String id = dto.getId();
	String pwd = dto.getPwd();
	//System.out.println(id+pwd);
	dao.close();
	
	if(id != null){
		session.setAttribute("checkid",id);
		session.setAttribute("checkpwd", pwd);
		session.setAttribute("email", email);
		out.println("<script>");	
		//out.println("window.close()");
		//out.println("alert('회원확인이 완료되었습니다.');");
		out.println("alert('<"+email+">로 본인확인 인증번호가 전송되었습니다.');");
		out.println("location.href = 'CertificationNumberProcess.jsp';");
		out.println("</script>");
	}
	else{
		//비회원-다시 로그인 페이지로 포워드
		out.println("<script>");
		out.println("alert('존재하지 않는 회원입니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
%>
