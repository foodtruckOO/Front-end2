<%@page import="model.CusDAO"%>
<%@page import="com.sun.java.swing.plaf.windows.resources.windows"%>
<%@page import="model.SellerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- LoginProcess.jsp -->
<%
	//사용자 입력값 받기]
	String user= request.getParameter("user");	
	String pass= request.getParameter("pass");	
	
	//아뒤가 KIM이고 비번이 1234면 회원이라고 가정]		
	//if("KIM".equals(user) && "1234".equals(pass)){//회원
	//실제 테이블과 연동]
	CusDAO dao = new CusDAO(application);
	SellerDAO dao2 = new SellerDAO(application);
	boolean flag=dao.isMember(user, pass);
	boolean flag2=dao2.isMember(user,pass);
	dao.close();
	dao2.close(); 
	if(flag){ 
		//1.로그인 처리]-세션영역에 속성(주로 식별자만) 저장
		session.setAttribute("USER_ID",user);
		session.setAttribute("USER_PWD",pass);
		//2.로그인 처리후 메인 페이지로 이동]
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("window.close();");
		out.println("alert('일반회원 로그인 성공!');");
		out.println("</script>");
		//request.getRequestDispatcher("../main.jsp").forward(request, response);
	}
	else if(flag2){
		//1.로그인 처리]-세션영역에 속성(주로 식별자만) 저장
		session.setAttribute("USER_ID",user);
		session.setAttribute("USER_PWD",pass);
		//2.로그인 처리후 메인 페이지로 이동]
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("window.close();");
		out.println("alert('판매자 로그인 성공!');");
		out.println("</script>");
		//request.getRequestDispatcher("../main.jsp").forward(request, response);
	}
	else{//비회원-다시 로그인 페이지로 포워드
		//out.println("<script>");
		//out.println("alert('회원정보가 틀려요');");
		//out.println("history.back();");
		//out.println("</script>");
		
		//리퀘스트 영역에 필요한 데이터 저장]
		request.setAttribute("ERROR","※아이디와 비밀번호가 틀렸습니다.");
		//로그인 페이지로 포워드]
		request.getRequestDispatcher("Login.jsp").forward(request, response);	
	}
%>
