<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">

<!-- Added by HTTrack --><meta http-equiv="content-type" content="text/html;charset=UTF-8" /><!-- /Added by HTTrack -->
<head>
	
	<meta charset="utf-8">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>�ֹ��ϱ�</title>
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
	
	<!--[if lt IE 9]>
		<script src="/resources/js/common/html5Shiv.js"></script>
	<![endif]-->
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<!-- //javascript -->
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
	body{
	margin: 0 auto;}
	</style>
	</head>

<!-- <body class="ENG font" oncontextmenu="return false" onselectstart="return false" ondragstart="return false"> -->
	<body class="ENG font">
	
		<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	


	<div id="wrap">

		

<!-- ���� URL -->
<input type="hidden" value="" id="prevURL" />
<!-- ���� URL -->
<input type="hidden" value="" id="currentURL" />

<!-- �α��� ������ ���� (user / nonMember) -->


<!-- ����ڰ� �������� �ߴ� ��ǰ������ �����ϸ� ���� -->


	
		<!-- container -->
		<div id="container">
			<!-- contents -->
			<section id="contents">
				<div class="page_top">
					
					
						<h3 class="tit">${food.fName}</h3>
					
				</div>
				
				
				<div class="cont_inner">
						
					<div class="menu_view">
						<div class="img"><img src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>" alt="" /></div>
												
						<div class="info menuinfo" idx="0">
							<div>
									<h3 class="tit">${food.fName}</h3>
									<div class="txt">${food.content}<br><br>
									</div>
								<div class="price_wrap amount">
											<span class="inp_spinner">
												<a style="cursor: hand" class="btn minus sp"><span class="blind">����</span></a>
												<input type="text" class="detailpdcnt prod_qty" value="1" maxlength="2" readonly="readonly">
												<a style="cursor: hand" class="btn plus sp"><span class="blind">���ϱ�</span></a>
											</span>					
																											
																	
								
									
									<span class="price"><strong><fmt:formatNumber value="${food.price}" pattern="#,###"/></strong>��</span>
									
								<input type="hidden" class="prod_unit_price"    	value="${food.price}" />
						
								</div>
								<div class="only_app_btn btn_wrap btn2">
									<a href="javascript:void(0)" class="button h50 btn_gray add_cart"><span>Add to Cart<!-- ��ǰ��� --></span>	</a>
									<a href="javascript:void(0)" class="button h50 btn_red btn_Order">Direct order<!-- �ٷ��ֹ� --></a>
								</div>
								<div class="m_fixed_btn btn_wrap btn2">
									<a href="javascript:void(0)" class="button h50 btn_gray add_cart"><span>Add to Cart<!-- ��ǰ��� --></span>	</a>
									<a href="javascript:void(0)" class="button h50 btn_red btn_Order">Direct order<!-- �ٷ��ֹ� --></a>
								</div>
							</div>
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
	


	
		<!-- footer -->
		

	</div>
	<!-- //wrap -->
    
</body>
</html>

