<%@page import="com.sajo.foodtruck.LoginJoin.*"%>
<%@page import="java.io.Console"%>
<%@page import="com.sajo.foodtruck.mypage.SellerDTO"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	session.setAttribute("pass", request.getParameter("pass"));
	if(request.getParameter("pass").equals(request.getParameter("pass2"))){
		out.println("<script>");
		out.println("location.href = 'newPassProcess.jsp';");
		out.println("</script>");
		
	}
	else{
		out.println("<script>");
		out.println("alert('비밀번호가 일치하지않습니다.');");
		out.println("history.back();");
		out.println("</script>");
	}
	
%>
