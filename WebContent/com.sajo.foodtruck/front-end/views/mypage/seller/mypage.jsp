<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

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
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script> -->
	<script src="http://malsup.github.com/jquery.cycle2.js"></script>
	<script src="<c:url value='/bootstrap/js/template.js'/>"></script>
	
	<!-- star -->
	<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	
	
	<script>
		$(function() {
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop();
				$("#sidebox").stop().animate({
					"top" : position + currentPosition + "px"
				}, 1000);
			});
			
			
			$('.list-group a').click(function(){
				$('#my_tab li').attr('class','');
			});
			
			
		});
				
		
		
	</script>
	<!-- Google Analytics -->
    <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date(); a = s.createElement(o),
                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-110902214-1', 'auto');
            ga('send', 'pageview');
    </script>
    <!-- End Google Analytics -->
    <!-- Google fonts -->
    <link href="//fonts.googleapis.com/css?family=Roboto:300,400,700" rel="stylesheet">
    <!-- CSS Files -->
    <link href="/Content/plug/bootstrap.min.css" rel="stylesheet" />
    <link href="/Content/plug/font-awesome.min.css" rel="stylesheet" />
    <link href="/Content/plug/material-kit.css" rel="stylesheet" />
    <link href="/Content/plug/owl.carousel.css" rel="stylesheet" />
    <link href="/Content/plug/landing-style.css" rel="stylesheet" />
    <!-- favicon -->
    <link rel="icon" href="/favicon.ico">
  
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
		<div style="float: left; width: 20%">
			<!-- 프로필 사진 -->
			<img src="<c:url value='/com.sajo.foodtruck/front-end/images/my_main.png'/>" alt="이미지를 찾을 수 없습니다.." 
										class="img-square"style="width: 100%; height: 100%; border: 2px solid #ffe9c1">
			<!-- ID -->
			<div>
				<h4 style="font-weight: bold; text-align: center;">API MARKET</h4>
			</div>
			<!-- Left menu -->
		   	<div class="list-group" style="text-align: center;" >
	            <a href="<c:url value='/Info.page'/>" class="list-group-item" id="a1">개인정보수정</a>
	            <a href="#tabs-6" class="list-group-item" id="a2">메뉴 등록</a>
	            <a href="#tabs-7" class="list-group-item" id="a3">이벤트 등록</a>
	            <a href="#tabs-7" class="list-group-item" id="a3">SNS 등록</a>
         	</div>
         	
			<!-- sns -->
			<div style="text-align: center;">
				<img alt="facebook" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_f.png'/>" style="width: 50px; height: auto;">
				<img alt="instagram" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_i.png'/>" style="width: 50px; height: auto;">
				<img alt="twitter" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_t.png'/>" style="width: 50px; height: auto;">
			</div>
			
			<!-- 광고 -->			
			<div class="cycle-slideshow"  data-cycle-fx=scrollHorz  data-cycle-timeout=2000 style="margin-top: 20%;">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_1.jpg'/>" style="width: 100%; height: 100px">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_2.jpg'/>" style="width: 100%; height: 100px">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_3.jpg'/>" style="width: 100%; height: 100px">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_4.jpg'/>" style="width: 100%; height: 100px">
			</div>
			
			<hr>
			
		</div>
		
		<!-- Mypage Right -->
		<div style="float: right;  width: 78%;">
			<!-- background -->
			<div style="height: 300px; ">
				<img src="<c:url value='/com.sajo.foodtruck/front-end/images/my_back.png'/>" alt="이미지를 찾을 수 없습니다.."
				 			style="width: 100%; height: 100%; border: 2px solid #ffe9c1">				
			</div>
			
			<!-- tap -->
			<!-- 여기요 -->
			<div style="width: 100%; height: 100%; ">
				<!-- include -->
				<ul class="nav nav-tabs" id="my_tab"style="background-color: #ffe9c1;">
					<!--  data-toggle="tab" -->
					<li class="active" id="acti"><a href="<c:url value='/Tabs1.page'/>"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> HOME </a></li>
					<li><a href="<c:url value='/Tabs2.page'/>"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span> 메뉴</a></li>
					<li><a href="<c:url value='/Tabs3.page'/>"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 리뷰 </a></li>
					<li><a href="#tabs-4"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 주문현황 </a></li>
					<button type="button" class="btn btn-warning" style="float: right; width: 15%; height: 100; margin-right: 1%">
						<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 즐겨찾기 
					</button>
				</ul>

				<div  class="tab-content" style="padding: 1%;">
					<tiles:insertAttribute name="body"/>
				</div>
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
	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>

</html>