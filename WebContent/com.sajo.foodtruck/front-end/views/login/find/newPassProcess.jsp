<%@page import="com.sajo.foodtruck.LoginJoin.*"%>
<%@page import="java.io.Console"%>
<%@page import="com.sajo.foodtruck.mypage.SellerDTO"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	//사용자 입력값 받기]
	String id = session.getAttribute("checkid").toString();
	String pwd = session.getAttribute("checkpwd").toString();
	String pass = session.getAttribute("pass").toString();
	//System.out.println(pass);
	pass = PBKDF2.createHash(pass);
	

	//실제 테이블과 연동]
	CusDAO dao = new CusDAO(application);
	dao.updatePass(pass, id, pwd);
	dao.close();
	
	if(id != null){
		out.println("<script>");	
		out.println("window.close()");
		out.println("alert('비밀번호 변경이 완료되었습니다.');");
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
