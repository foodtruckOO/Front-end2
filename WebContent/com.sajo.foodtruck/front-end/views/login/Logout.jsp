<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!-- Logout.jsp --> 
<% 
	//로그아웃 처리-]-세션영역에 저장된 속성 삭제
	//방법1]
	//session.removeAttribute("USER_ID");
	//session.removeAttribute("USER_PWD");
	//방법2]
	session.invalidate();
	//로그아웃 처리후 메인 페이지로 이동]
	//response.sendRedirect("../main.jsp");
	out.println("<script>");
	out.println("location.replace('"+request.getContextPath()+"/com.sajo.foodtruck/front-end/views/main.jsp');");
	out.println("alert('로그아웃 성공!');");
	out.println("</script>");
%>   