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
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck.css'/>" />
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	function myFunction() {
	document.getElementById("myDropdown").classList.toggle("show");
	document.getElementById("myDropdown-i").classList.toggle("show")
	}
	function viewFilter() {
		$area1 = encodeURIComponent($('[name=_area1]').val());
		location.href = '/taste?area1=' + $area1;
	}

</script>
<style>
body {
	min-height: 2000px;
	padding-top: 100px !important;
}
</style>
</head>

<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	<!-- 내용 시작 -->
	<div id="content" class="container-fluid">
		<div class="jumbotron" style="background-color: white !important;">
			<img class="img-fluid"
				src="<c:url value= '/com.sajo.foodtruck/front-end/images/logo.jpg'/>" />
			<h1 style="display: inline; line-height: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상품
				메뉴</h1>
		</div>



		<div class="row">

			<div class="taste_card col-sm-3 col-xs-6 ">
				<div class="card_img_wrap" style="position: relative;">
					<div class="card_img_wrap_thumbnail a">
						<a
							href="<c:url value='/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck_detail_1_1_1.jsp'/>"><img
							src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>"
							width="100%" /> </a>
					</div>
				</div>
				<div class="card_content">
					<div class="title_main title clearfix">스테이크</div>
				</div>
			</div>
			<div class="taste_card col-sm-3 col-xs-6 ">
				<div class="card_img_wrap" style="position: relative;">
					<div class="card_img_wrap_thumbnail a">
						<a href="taste/10498.html"><img
							src="https://ssproxy.ucloudbiz.olleh.com/v1/AUTH_e59809eb-bdc9-44d7-9d8f-2e7f0e47ba91/post_card/34201_thumb_1516860532.jpg"
							width="100%" /> </a>
					</div>
				</div>
				<div class="card_content">
					<div class="title_main title clearfix">햄버거</div>
				</div>
			</div>
			<div class="taste_card col-sm-3 col-xs-6 ">
				<div class="card_img_wrap" style="position: relative;">
					<div class="card_img_wrap_thumbnail a">
						<a href="taste/10507.html"><img
							src="https://ssproxy.ucloudbiz.olleh.com/v1/AUTH_e59809eb-bdc9-44d7-9d8f-2e7f0e47ba91/post_card/33686_thumb_1514438582.jpg"
							width="100%" /> </a>
					</div>
				</div>
				<div class="card_content">
					<div class="title_main title clearfix">피자</div>
					
				</div>
			</div>
			<div class="taste_card col-sm-3 col-xs-6 ">
				<div class="card_img_wrap" style="position: relative;">
					<div class="card_img_wrap_thumbnail a">
						<a href="taste/10507.html"><img
							src="https://ssproxy.ucloudbiz.olleh.com/v1/AUTH_e59809eb-bdc9-44d7-9d8f-2e7f0e47ba91/post_card/33686_thumb_1514438582.jpg"
							width="100%" /> </a>
					</div>
				</div>
				<div class="card_content">
					<div class="title_main title clearfix">콜라</div>
					
				</div>
			</div>

		</div>
	</div>







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