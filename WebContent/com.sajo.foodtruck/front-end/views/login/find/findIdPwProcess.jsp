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
		out.println("<script>");	
		//out.println("window.close()");
		out.println("alert('회원인증이 완료되었습니다. 당신의 아이디는 <"+id+">입니다.');");
		out.println("alert(' 비밀번호 변경페이지로 이동합니다.');");
		out.println("location.href = 'newPass.jsp';");
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
