<%@page import="com.sajo.foodtruck.board.ComstomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Foodtruck:: ver1.0</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>"
	rel="stylesheet">
<!-- YangGeum template CSS -->
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
<!-- Custom styles for this template -->

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>	
		$(function(){
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop(); 
				$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			});
			
		});
		
		
		function isDelete(){
		    var con= confirm("삭제하시겠습니까??");	
		    if(con==true)
		       location.href= "<c:url value='SellerDelete.board?sb_no=${nice.sb_no }'/>";
		       
		}
	</script>
</head>

<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	<!-- 내용 시작 -->
	<div class="container" style="width: 100%">

		<div class="page-header">
			<h2 style="color: orange;">상세보기</h2>
		</div>
		<div class="row">

			<div>
				<table class="table table-bordered table-striped">
					<tr>
						<td style="width: 25%">작성자</td>
						<td>${nice.name }</td>
					</tr>
					<tr>
						<td>작성일</td>
						<td>${nice.postdate }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td>${nice.title }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td>${nice.content }</td>
					</tr>
					<tr>
						<td>첨부파일</td>
						<td>${nice.attachedfile }</td>
					</tr>

					<tr>
						<td colspan="2" style="padding-left: 240px">
							<ul style="width: 35%;" class="nav nav-pills center-block"
								role="tablist">
								<li role="presentation"><a
									href="<c:url value='/SellerEdit.board?sb_no=${nice.sb_no }'/>">수정</a></li>
								<li role="presentation"><a href="#" onclick="isDelete()">삭제</a></li>
								<li role="presentation"><a
									href="<c:url value='/SellerWrite.board'/>">목록</a></li>
							</ul>

						</td>
					</tr>
				</table>

			</div>

		</div>

	</div>

	<!--Left메뉴 및 실제 내용 감싸는 div끝-->
	<!--footer를 감싸는 div 시작-->

	<!--footer를 감싸는 div 끝-->










	<!-- 내용 끝 -->
	<div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>