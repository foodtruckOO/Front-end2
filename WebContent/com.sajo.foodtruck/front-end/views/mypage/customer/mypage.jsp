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

	
	<!-- YangGeum template JacaScript -->
	<script src="<c:url value='/bootstrap/js/template.js'/>"></script>
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
	<div id=mypage style="height: 1200px">
		<!-- Mypage Left -->
		<div style="float: left; background-color: green; width: 20%">
			<!-- 프로필 사진 -->
			<img src="<c:url value='/com.sajo.foodtruck/front-end/images/my_main.png'/>" alt="이미지를 찾을 수 없습니다.." 
										class="img-square"style="width: 100%; height: 100%; border: 2px solid #ffe9c1">
			<!-- ID -->
			<div>
				
			</div>
			<div>
				<div>정보수정</div>
				<div></div>
				<div>이벤트</div>
				<div>위치</div>
				<div>위치</div>
			</div>
		</div>
		<!-- Mypage Right -->
		<div style="float: right; background-color: red; width: 78%; height: 100%">
			<!-- background -->
			<div style="height: 300px; background-image: linear-gradient(to top, #a18cd1 0%, #fbc2eb 100%);">
				<img src="<c:url value='/com.sajo.foodtruck/front-end/images/my_back.png'/>" alt="이미지를 찾을 수 없습니다.."
				 			style="width: 100%; height: 100%; border: 2px solid #ffe9c1">				
			</div>
			<!-- button -->
			<div style="height: 3%; background-color: #ffe9c1">
				<button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 즐겨찾기 </button>
				<button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> 위치 </button>
				<button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span> 메뉴 </button>
				
			</div>
			 
		</div>

		<!-- 이하 부분 -->
	</div>
	<!-- mypage end -->


	<!-- 내용 끝 -->
	<div id="FOOTER">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>

</html>