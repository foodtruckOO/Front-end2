<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="sidebox" align="right">
    	<div class="list-group" style="text-align: center;" >
            <a href="#" class="list-group-item" id="side"><span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span></a>
            
            <a href="<c:url value='/com.sajo.foodtruck/front-end/views/Main.jsp' />" class="list-group-item">MAIN</a>
            <%if(session.getAttribute("USER_ID") ==null){ %>
				<a href="<c:url value='/com.sajo.foodtruck/front-end/views/login/Login.jsp'/>" class="list-group-item">LOGIN</a>
		        <a href="<c:url value='/com.sajo.foodtruck/front-end/views/member/Join.jsp'/>" class="list-group-item">JOIN</a>
	        <%}else{ %>
					<%if(session.getAttribute("USER_TYPE")=="seller".toString()){ %>
	        		<a href="<c:url value='/Member.page'/>" class="list-group-item">MYPAGE</a>
			        <%}else{ %>
	       			<a href="<c:url value='/Customer.page'/>" class="list-group-item">MYPAGE</a>
			        <% } %>
		        <a href="<c:url value='/com.sajo.foodtruck/front-end/views/login/Logout.jsp'/>" class="list-group-item">LOGOUT</a>
	        <% } %>
            
            <a href="#" class="list-group-item" id="side"><span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span></a>
          </div>
</div>
    