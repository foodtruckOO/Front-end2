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
	<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
	<!-- Bootstrap theme -->
	<link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
	<!-- YangGeum template CSS -->
	<link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" />
	<link rel="stylesheet" href="<c:url value='/bootstrap/css/mypage.css'/>" />
	<!-- naver map -->
	<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=ygb_z5ZpazgrKimoE4A4&submodules=geocoder"></script>
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
		$(function() {
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop();
				$("#sidebox").stop().animate({
					"top" : position + currentPosition + "px"
				}, 1000);
			});
		});
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
	<!-- mypage start -->
	<div id=mypage>
		<!-- 배경화면/프로필 이미지 등록 -->
		<div id=mypage_top>
			<!-- 프로필 -->
			<img src="../../../images/user.png" alt="이미지를 찾을 수 없습니다..." class="img-circle" id="mypage_top_pro">
		</div>
		<div id=mypage_body>
			<table>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	<!-- mypage end -->
	</div>
	
	
	
	<!-- 내용 끝 -->
	<div id="FOOTER">
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