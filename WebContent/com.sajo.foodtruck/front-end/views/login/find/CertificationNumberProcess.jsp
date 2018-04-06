<%@page import="java.util.UUID"%>
<%@page import="com.sajo.foodtruck.LoginJoin.*"%>
<%@page import="java.io.Console"%>
<%@page import="com.sajo.foodtruck.mypage.SellerDTO"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	//사용자 입력값 받기]
	String email = session.getAttribute("email").toString();
	String uuid=null;
    uuid = UUID.randomUUID().toString().replaceAll("-", ""); // -를 제거해 주었다. 
    uuid = uuid.substring(0, 7); //uuid를 앞에서부터 10자리 잘라줌. 
    System.out.println("uuid : "+uuid);
	String authNum = uuid;
	System.out.println("authNum : "+authNum);
	
	session.setAttribute("authNum", authNum);
	
	Email sendmail = new Email(email,authNum);
	if(email != null){
		out.println("<script>");	
		//out.println("window.close()");
		//out.println("alert('회원확인이 완료되었습니다.');");
		out.println("location.href = 'CertificationNumber.jsp';");
		out.println("</script>");
	}
%>

