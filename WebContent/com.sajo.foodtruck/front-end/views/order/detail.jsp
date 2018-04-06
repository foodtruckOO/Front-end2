<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html lang="ko">

<head>
	
	<meta charset="utf-8">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>주문하기</title>
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
		
		function plusminus(plusminus){
			if(plusminus=="plus"){
				//alert("플러스군요");
				var num = $("#number").val();
				num = num-0+1;
				price = ("${food.price}"-0)*num;
				price =  price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#price").text(price);
				$("#number").val(num);
				
			}
			else{
				var num = $("#number").val();
				if(num!=1){
					num = num-0-1;
					price = ("${food.price}"-0)*num;
					price =  price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#price").text(price);
					$("#number").val(num);
				}
			}
		}
		function cart(){
			var user = "${sessionScope.USER_ID}";
			if(user==""){
				alert("로그인 후 이용해주세요.");
			}	
			else if("${sessionScope.USER_TYPE}"=="seller"){
				alert("사업자는 이용할 수 없습니다.");
			}
			else{
				var num = $("#number").val();
				var f_no = "${food.f_no}";
				var fname = "${food.fName}";
				var take = confirm(fname+"을(를) 장바구니에 담으시겠습니까?");
					if(take){			
						$.ajax({
							type:"POST",
							url:"<c:url value='/detail.cart'/>",
							dataType:'text',
							data: {f_no : f_no, num : num},
							success:function(data){
								if(data=="Y"){
								alert(fname+"이(가) 장바구니에 담겼습니다.");		
								}
								else{
									alert("다른 푸드트럭의 상품을 동시에 담을 수 없습니다.");
								}
							}
						});
					}	
			}
		}
		
		function order(){
			var user = "${sessionScope.USER_ID}";
			if(user==""){
				alert("로그인 후 이용해주세요.");
			}	
			else if("${sessionScope.USER_TYPE}"=="seller"){
				alert("사업자는 이용할 수 없습니다.");
			}
			else{
				var num = $("#number").val();
				var f_no = "${food.f_no}";
				var fname = "${food.fName}";
				var take = confirm(fname+"을(를) 주문하시겠습니까?");
					if(take){			
						$.ajax({
							type:"POST",
							url:"<c:url value='/detail.cart'/>",
							data: {f_no : f_no, num : num},
							dataType:'text',
							success:function(data){
								if(data=="Y"){
								location.href="<c:url value='/order.cart'/>";		
								}
								else{
								alert("다른 푸드트럭의 상품을 동시에 주문 할 수 없습니다.");									
								}
							}
						});
					}	
			}
			
			
		}
	</script>
	
	
	<style>
	body{
	margin: 0 auto;}
	</style>
	</head>

	<body class="ENG font">
	
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	


	<div id="wrap">

		






	
		<!-- container -->
		<div id="container">
			<!-- contents -->
			<section id="contents">
				<div class="page_top">
					
					
						<h3 class="tit">${food.fName}</h3>
					
				</div>
				
				
				<div class="cont_inner">
						
					<div class="menu_view">
						<div class="img"><img src="<c:url value='/com.sajo.foodtruck/front-end/images/${food.id}/food/${food.picture}'/>" alt="" /></div>
												
						<div class="info menuinfo" idx="0">
							<div>
									<h3 class="tit">${food.fName}</h3>
									<div class="txt">${food.content}<br><br>
									</div>
								<div class="price_wrap amount">
											<span class="inp_spinner">
												<a href="javascript:plusminus('minus')" style="cursor: hand" class="btn minus sp"><span class="blind">빼기</span></a>
												<input id="number" type="text" class="detailpdcnt prod_qty" value="1" maxlength="2" readonly="readonly">
												<a href="javascript:plusminus('plus')" style="cursor: hand" class="btn plus sp"><span class="blind">더하기</span></a>
											</span>					
																											
																	
								
									
									<span class="price"><strong id="price"><fmt:formatNumber value="${food.price}" pattern="#,###"/></strong>원</span>
									
								<input type="hidden" class="prod_unit_price"    	value="${food.price}" />
						
								</div>
								<div class="m_fixed_btn btn_wrap btn2">
									<a href="javascript:cart()" class="button h50 btn_gray add_cart"><span>상품 담기<!-- 상품담기 --></span>	</a>
									<a href="javascript:order()" class="button h50 btn_red btn_Order">바로주문<!-- 바로주문 --></a>
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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</html>

