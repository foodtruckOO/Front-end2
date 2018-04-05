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
	<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
	<link href="<c:url value='/com.sajo.foodtruck/front-end/views/order/css/mdtimepicker.css'/>" rel="stylesheet" type="text/css">
	 <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
	<!-- //style -->

	<!-- javascript -->
	<!-- <script src="/resources/js/common/jquery-1.12.4.min.js"></script>
	<script src="/resources/js/common/jquery-migrate-1.3.0.min.js"></script>
	<script src="/resources/js/common/jquery-ui.min.js"></script>
	
	<script src="/resources/js/plugins.js"></script>
	<script src="/resources/js/ui_script.js?version=20170720"></script>
	<script src="/resources/js/ui.js?version=20170720"></script> -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
	<script src="<c:url value='/com.sajo.foodtruck/front-end/views/order/mdtimepicker.js'/>"></script>
	
	
	<script>
	var $j = jQuery.noConflict();
		$j(function(){
			var currentPosition = parseInt($j("#sidebox").css("top"));
			$j(window).scroll(function() {
				var position = $j(window).scrollTop(); 
				$j("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			});
			
		});
	</script>
	<script>
	$j(document).ready(function(){
	    $j('#timepicker').mdtimepicker(); //Initializes the time picker
	  });
	</script>
	
	

<style>
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

<body class="KOR font ">
	
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	
	<!-- wrap -->
	<div id="wrap">
		<div id="container">
			<section id="contents">
				<div class="page_top">
						<h2 class="tit">결제하기</h2>
				</div>
				<div class="cont_inner">
					<div class="payment_wrap order_view">
						<div class="left">
							<h3 class="tit">주문정보 입력</h3>
							<table class="table">
								<tbody>
									<tr class="order_store">
											<th scope="row">주문시간</th>
											<td>
												<div class="inp_wid wid2" style="width: 200px">
														<input type="text" id="timepicker"/>
												</div>
											</td>
									</tr>
									
									<tr>
										
											<th scope="row">주문매장</th>
										
										
										<td>
										<c:forEach begin="0" end="0" var="dto" items="${order}">
											<span>${dto.tname}</span>
										
										</td>
										
									</tr>
									
									<tr>
										<th scope="row">주소</th>
										<td>
											
												
													<span class="txt">${dto.addr}  </span>
												
										</td>
									</tr>
									
									<tr>
										<th scope="row">주문 고객</th>
										<td>
											
												
													${dto.name}
												
										</td>
									</tr>
										

											<tr class="Phone_input">
											<th scope="row">주문고객<br>연락처</th>
											<td class="inp_phone">
												${dto.tel}
											</td>
											</tr>
									</c:forEach>	
									<tr>
									
										<th scope="row">요청사항</th>
										<td>
											<textarea name="input_order_memo" id="input_order_memo" class="oidirection" maxlength="100" title="요청사항 입력"></textarea>
										</td>
									</tr>
								
								</tbody>
							</table>
							
							
						</div>
						<div class="right">
							<h3 class="tit">결제내역</h3>
							<ul class="od_menu_list">
											<c:forEach begin="1" var="dto2" items="${order}" varStatus="loop">
												<c:if test="${!loop.last}">
												<li idx="62055280">
													<p class="menuinfo">
														<strong>${dto2.fname}</strong>
													</p>
													<div class="menu_opt">
														<strong class="num">수량 : ${dto2.num}</strong>
																<strong class="price"><fmt:formatNumber value="${(dto2.price-0)*dto2.num}" pattern="#,###"/>원</strong>
													</div>
												</li>
												</c:if>
											</c:forEach>
									
									
								
							</ul>
							<ul class="od_pay_price">
								<c:forEach begin="1" var="dto3" items="${order}" varStatus="loop">
									<c:if test="${loop.last}">
									<li id="ordPriceDisplay">
										<span>총 주문금액</span>
										<strong id="ordStrong"><fmt:formatNumber value="${dto3.priceall}" pattern="#,###"/>원</strong>
									</li>								
									 
									<li class="last">
										<span>결제 예정 금액</span>
										<strong id="lastStrong"><fmt:formatNumber value="${dto3.priceall}" pattern="#,###"/>원</strong>
									</li>
									</c:if>
								</c:forEach>
							</ul>
									
							<div class="od_pay_sel">
								
								<label class="radio">
									<input type="radio" name="slt_payMethod" value="mobile" />
									<span class="lbl">휴대폰 소액결제</span>
								</label>
								
								<label class="radio">
									<input type="radio" name="slt_payMethod" value="card" />
									
										
											<span class="lbl">신용카드(온라인결제)</span>
										
								</label>
 								
									
										<label class="radio">
											<input type="radio" name="slt_payMethod" value="cardDirect" />
											<span class="lbl">신용카드(현장결제)</span>
										</label>
									
									<label class="radio">
										<input type="radio" name="slt_payMethod" value="cash" />
										<span class="lbl">현금결제(현장결제)</span>
									</label>
 								
							</div>
							
						
							
							
								<div class="only_app_btn btn_wrap">
									<a href="javascript:void(0)" class="button h50 btn_red" id="btn_finishOrder2">결제하기</a>
								</div>
								<div class="m_fixed_btn button_wrap">
									<a href="javascript:void(0)" class="button h50 w200 btn_red" id="btn_finishOrder">결제하기</a>
								</div>
							
							</div>
						</div>
					</div>
				</section>
			</div>
			
			<!-- //contents -->
		</div>
		<!-- //container -->
		
	<div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
	</div>
	
		
		
</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</html>
    