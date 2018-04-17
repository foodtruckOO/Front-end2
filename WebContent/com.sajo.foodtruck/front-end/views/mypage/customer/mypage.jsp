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
	<link rel="icon" href="<c:url value='/com.sajo.foodtruck/front-end/images/Webpage-Icon.png'/>" type="image/gif" >
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
	
	<script>
		$(function() {
			$("#cust3").addClass('active');
			$('#cus1').hide();
			$('#cus2').hide();
			$('#cus3').show();
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop();
				$("#sidebox").stop().animate({
					"top" : position + currentPosition + "px"
				}, 1000);
			});
			
			$('#cust1').on('click', function() {
				$("#cust1").attr('class','active');
				$("#cust2").attr('class','');
				$("#cust3").attr('class','');
				$('#cus1').show();
				$('#cus2').hide();
				$('#cus3').hide();
			});

			$('#cust2').on('click', function() {
				$("#cust1").attr('class','');
				$("#cust2").attr('class','active');
				$("#cust3").attr('class','');
				$('#cus1').hide();
				$('#cus2').show();
				$('#cus3').hide();
			});

			$('#cust3').on('click', function() {
				$("#cust1").attr('class','');
				$("#cust2").attr('class','');
				$("#cust3").attr('class','active');
				$('#cus1').hide();
				$('#cus2').hide();
				$('#cus3').show();
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
		<!-- Mypage Right -->
		<div id="mypage_R" style="float: right;  width: 100%;" >
			<!-- background
			<div style="height: 300px; ">
				<img src="<c:url value='/com.sajo.foodtruck/front-end/membership/api/back/my_back.png'/>" alt="이미지를 찾을 수 없습니다.."
				 			style="width: 100%; height: 100%; border: 2px solid #ffe9c1">				
			</div> -->
			<!-- tap -->
			<!-- 여기요 -->
			<div id="tabs" style="width: 100%; height: 100%; ">
				<!-- include -->
				<ul class="nav nav-tabs" style="background-color: #ffe9c1;">
					<!--  data-toggle="tab" -->
					<li role="presentation" id='cust1'><a ><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> HOME </a></li>
					<li role="presentation" id='cust2'><a ><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span> 개인정보수정</a></li>
					<li role="presentation" id='cust3'><a ><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 주문현황 </a></li>
					<!-- <button type="button" class="btn btn-warning" style="float: right; width: 15%; height: 100; margin-right: 1%">
						<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 즐겨찾기 
					</button> -->
				</ul>
				<!-- HOME -->
				<div id = "cus1" style="width: 100%; height: 100%;">
					
				</div>
				<!-- 개인정보수정 -->
				<div id = "cus2" style="width: 100%; height: 100%;">
					
				</div>
				<!-- 주문현황 -->
				<div id = "cus3" style="width: 100%; height: 100%;">
					<br/>
					<c:if test="${empty requestScope.list}" var="flag">
						<h2>주문이 없습니다.</h2>
					</c:if>
					
					<c:if test="${not flag}">
						<c:forEach var="list" items="${list}" varStatus="loop">
						<div class="col-sm-4 col-xs-12">
							<div class="panel panel-default text-center">
								<div class="panel-heading">
									<h1>${list.tname}</h1>
									<h3>${list.tel}</h3>
						        </div>
								<div class="panel-body">
									<table style="width: 100%">
									<c:forEach var="food" items="${list.foods}">
										<tr>
											<td><strong>${food.fname }</strong></td>
											<td>${food.num }</td>
											<td>${food.price }</td>
										</tr>
									</c:forEach>
									</table>
									<hr/>
									<table style="width: 100%">
										<tr>
											<td><strong>판매트럭</strong></td>
											<td>${list.tname}</td>
										</tr>
										<tr>
											<td><strong>요청시간</strong></td>
											<td>${list.postdate}${list.timeofreceipt}</td>
										</tr>
										<tr>
											<td><strong>요청사항</strong></td>
											<td colspan="2">${list.content }</td>
										</tr>
									</table>
								</div>
								<div class="panel-footer">
									<h3 style="font-weight: bold; font-size: 2em"><img src="<c:url value='/com.sajo.foodtruck/front-end/images/won.png'/>" alt="￦">${list.sum}</h3>
									<button class="btn btn-lg">Sign Up</button>
								</div>
							</div>      
						</div>
						</c:forEach>
					</c:if>
				</div>
				<!-- div끝 -->
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