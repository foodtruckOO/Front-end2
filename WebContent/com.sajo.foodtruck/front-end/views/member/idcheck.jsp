<%@page import="model.PBKDF2"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="model.CusDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//한글처리
	//id passwd name 가져오기
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	CusDAO dao = new CusDAO(application);
	boolean flag=dao.confirmId(id);
	dao.close();
	if(flag){
		out.print("NO");
	}
	else{
		out.print("YES");
	}
%>