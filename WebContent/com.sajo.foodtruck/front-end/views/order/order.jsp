<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Foodtruck:: ver1.0</title>
	<!-- style -->
	<link rel="stylesheet" href="<c:url value='/com.sajo.foodtruck/front-end/views/order/css/common.css'/>" media="all" />
	<link rel="stylesheet" href="<c:url value='/com.sajo.foodtruck/front-end/views/order/css/contents.css'/>" media="all" />
	
	 <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
	

	<!-- javascript -->
	<!-- <script src="../resources/js/common/jquery-1.12.4.min.js"></script>
	<script src="../resources/js/common/jquery-migrate-1.3.0.min.js"></script>
	<script src="../resources/js/common/jquery-ui.min.js"></script>
 -->

	<!-- <script src="../resources/js/plugins.js"></script>
	<script src="../resources/js/ui_script19fa.js"></script>
	<script src="../resources/js/ui19fa.js"></script> -->
	
	<!-- //javascript -->
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

<style>

#test {
    float: right;
    position: relative;
    left: -50%;
}
#test li {
    float: left;
    position: relative;
    left: 50%;
}

@media screen and (min-width: 1501px) {
	body  {
		margin-right:15%;
	}
}

@media screen and (min-width: 1221px) and (max-width: 1500px){
	body  {
		margin-right:10%;
	}
}
@media screen and (min-width: 770px) and (max-width: 1220px){
	body  {
		padding-top:100px;
		margin-right:10%;
		width: 80%;
	}
}

@media screen and (min-width: 400px) and (max-width: 769px){
	body  {
		padding-top:80px;
		margin-right:5%;
	}
}
@media screen and (max-width: 400px) {
	body  {
		margin-right:3%;
	}
}


</style>

</head>
<header id = "header">
	
</header>
<body class="ENG font ">

	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	
	
	<!-- wrap -->
	<div id="wrap">
		<div id="container" class="container">
			<!-- contents -->
			<section id="contents">
				<div class="page_top">
					<input id="menuType" type="hidden" value="homeservice">
							<h3 id="page_tit" class="tit">주문하기</h3>
				</div>
					<div id="recommend" class="menu_sec">
						<h4 class="line_tit"><span>주메뉴</span></h4>
						<div class="menu_wrap">
							<div class="swiper-container">
								<ul class="menu_list swiper-wrapper" id="test">
											
											<c:forEach items="${food}" var="dto">
											<c:if test="${dto.t_no !=7}">
											<li class="menuinfo swiper-slide">
											
											<div>
												<a href="<c:url value='/detail.food?f_no=${dto.f_no}'/>" class="img"> 
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/${dto.id}/food/${dto.picture}'/>" data-animation="zoomIn" width="" height=""/>
												</a> 
													<p class="menu_name" title="${dto.fName}">${dto.fName}</p>
												<p class="menu_price"><strong><fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</strong></p>
												
										<div class="opt">
													 
											<div class="sel_list">
														<a href="javascript:void(0)">
															<span>가격</span>
															<strong><fmt:formatNumber value="${dto.price}" pattern="#,###"/>원</strong>
														</a>
											</div>													
													<p class="btn_area">
														<a href="javascript:void(0)" class="btn btn_cart add_cart">
															<span>상품 담기</span>
															<!-- <span>상품담기</span> -->
														</a>
														<a href="javascript:void(0)" class="btn btn_buy btn_Order">
															<span>바로 주문</span>
															<!-- <span>바로주문</span> -->
														</a>
													</p>
												</div>
											</div>
										</li>
									</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				
					<div id="beverage" class="menu_sec">
						<h4 class="line_tit"><span>사이드 메뉴</span></h4>
						<div class="menu_wrap">
							<div class="swiper-container">
								<ul class="menu_list swiper-wrapper" id="test">
									
									<!-- <script type="text/javascript">alert(0.0000);</script>  -->
										
								<c:forEach items="${food}" var="dto2">
									<c:if test="${dto2.t_no eq 7}">
										<li class="menuinfo swiper-slide">
											
											<div>
												<a href="<c:url value='/detail.food?f_no=${dto2.f_no}'/>" class="img"> 
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/${dto2.id}/food/${dto2.picture}'/>" data-animation="zoomIn" width="" height=""/>
												</a> 
													<p class="menu_name" title="${dto2.fName}">${dto2.fName}</p>
												<p class="menu_price"><strong><fmt:formatNumber value="${dto2.price}" pattern="#,###"/>원</strong></p>
												
										<div class="opt">
													 
											<div class="sel_list">
														<a href="javascript:void(0)">
															<span>가격</span>
															<strong><fmt:formatNumber value="${dto2.price}" pattern="#,###"/>원</strong>
														</a>
											</div>													
													<p class="btn_area">
														<a href="javascript:void(0)" class="btn btn_cart add_cart">
															<span>상품 담기</span>
															<!-- <span>상품담기</span> -->
														</a>
														<a href="javascript:void(0)" class="btn btn_buy btn_Order">
															<span>바로 주문</span>
															<!-- <span>바로주문</span> -->
														</a>
													</p>
												</div>
											</div>
										</li>
										</c:if>
										</c:forEach>
								</ul>
							</div>
						</div>
					</div>
			</section>
			<!-- //contents -->

		</div>
		<!-- //container -->

	<div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
	</div>
	





	



	</div>
	

	
</body>
 	
 	
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<!-- Mirrored from mobilehome.lotteria.com/menu/homeservice by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 27 Mar 2018 04:22:58 GMT -->
</html>
    