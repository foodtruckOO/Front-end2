<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/com.sajo.foodtruck/front-end/Common/IsMember.jsp" %>
<!DOCTYPE html>
<html lang="ko">
  <head> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Foodtruck:: ver1.0</title>

    <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
    <!-- Custom styles for this template -->    
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>	
		$(function(){
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop(); 
				$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			});
			
		});
	</script>
  </head>

<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
    </div>
    <div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp"/>
    </div>
	<!-- 내용 시작 -->
	
	<!-- 내용 시작 -->
    <section style="padding-top: 80px; margin-right: 80px; margin-left: 80px">
  	<article>
  	<h2>사장게시판</h2><hr align="left" style="border: solid 1px #FE9A2E; width: 20%">
	</article>
	
	<article style="float: right; margin-right: 30px">		
	<a href="<c:url value='#'/>"><button type="button" class="btn btn-success">글등록</button></a>
	</article><br><br>
	
	<article style="margin-right:30px; margin-left: 30px">
	<table class="table table-bordered table-hover">
		<tr style="text-align: center">
			<th style="width:10%;">번호</th>
			<th style="width:35%">제목</th>
			<th style="width:10%">작성자</th>
			<th style="width:15%">등록일</th>
			<th style="width:20%">첨부파일</th>
		</tr>
		<c:if test="${empty requestScope.list }" var="flag">
			<tr>
				<td colspan="6">등록된 자료가 없습니다</td>
			</tr>
		</c:if>
		<c:if test="${not flag }">
			<c:forEach var="item" items="${list}" varStatus="loop">
				<tr>
					<td>${totalRecordCount - (((nowPage - 1) * pageSize) + loop.index)}</td>
					<td><a href="<c:url value='/DATAROOM/View.do?key=${item.no}'/>">${item.title}</a></td>
					<td>${item.name}</td>
					<td>${item.postdate}</td>
					<td><span id="download${loop.count}">${item.downcount}</span></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	</article>
	
	
	<!-- footer -->
    <article>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
 	</article>
  	</section>
  	
	<!-- 내용 끝 -->
	
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>