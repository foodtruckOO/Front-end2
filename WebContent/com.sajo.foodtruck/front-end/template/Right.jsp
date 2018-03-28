<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="sidebox" align="right">
    	<div class="list-group" style="text-align: center;" >
            <a href="#" class="list-group-item" id="side"><span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span></a>
            
            <a href="<c:url value='/com.sajo.foodtruck/front-end/views/main.jsp' />" class="list-group-item">MAIN</a>
            <%if(session.getAttribute("USER_ID") ==null){ %>
				<a href="javascript:popupOpen();" class="list-group-item">LOGIN</a>
		        <a href="javascript:popupOpen2();" class="list-group-item">JOIN</a>
	        <%}else{ %>
		        <a href="<c:url value='/Mypage.member'/>" class="list-group-item">MYPAGE</a>
		        <a href="<c:url value='/com.sajo.foodtruck/front-end/views/login/Logout.jsp'/>" class="list-group-item">LOGOUT</a>
	        <% } %>
            
            <a href="#" class="list-group-item" id="side"><span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a>
          </div>
</div>
    