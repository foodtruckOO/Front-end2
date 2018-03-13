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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script>
	$(function() {
		var currentPosition = parseInt($("#sidebox").css("top"));
		$(window).scroll(function() {
			var position = $(window).scrollTop();
			$("#sidebox").stop().animate({
				"top" : position + currentPosition + "px"
			}, 1000);
		});

	    var action;
	    $(".number-spinner button").mousedown(function () {
	        btn = $(this);
	        input = btn.closest('.number-spinner').find('input');
	        btn.closest('.number-spinner').find('button').prop("disabled", false);

	    	if (btn.attr('data-dir') == 'up') {
	            action = setInterval(function(){
	                if ( input.attr('max') == undefined || parseInt(input.val()) < parseInt(input.attr('max')) ) {
	                    input.val(parseInt(input.val())+1);
	                }else{
	                    btn.prop("disabled", true);
	                    clearInterval(action);
	                }
	            }, 50);
	    	} else {
	            action = setInterval(function(){
	                if ( input.attr('min') == undefined || parseInt(input.val()) > parseInt(input.attr('min')) ) {
	                    input.val(parseInt(input.val())-1);
	                }else{
	                    btn.prop("disabled", true);
	                    clearInterval(action);
	                }
	            }, 50);
	    	}
	    }).mouseup(function(){
	        clearInterval(action);
	    });
	});
</script>
</head>
<style>
body {
	min-height: 2000px;
	padding-top: 70px;
}

#content {
	padding-bottom: 70px !important;
}
</style>
<style>
</style>
<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	<!-- 내용 시작 -->

	<div class="container-fluid" id="content">
		<div class="row">
			<div class="col-md-12">
				<div class="jumbotron" style="background-color: white !important;">
					<img class="img-fluid"
						src="<c:url value= '/com.sajo.foodtruck/front-end/images/logo.jpg'/>" />
					<h1 style="display: inline; line-height: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;상세
						메뉴</h1>
				</div>

				<div class="row">
					<div class="col-md-6">
						<img class="img-rounded img-responsive"
							src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>">
					</div>
					<div class="col-md-6">
						<h2 align="center">국산 소고기로 만든 안심 스테이크</h2>
						<h3 align="center" style="padding-bottom: 30px">L 8,000원 M
							6,000원</h3>

						<div class="row">
							<div class="col-md-6">
								<p style="font-size: 1.5em">
									사이즈&nbsp;&nbsp;&nbsp; <select style="align-content: center;"
										name="speed" id="speed">
										<option style="text-align: center">Medium</option>
										<option style="text-align: center">Large</option>
									</select>
								</p>
							</div>
							<div class="col-md-2 col-sm-6">
								<p style="font-size: 1.5em">수량</p>
							</div>
							<div class="col-md-4 col-sm-6">
								<div class="input-group number-spinner">
									<span class="input-group-btn data-dwn">
										<button class="btn btn-default btn-info" data-dir="dwn">
											<span class="glyphicon glyphicon-minus"></span>
										</button>
									</span> <input type="text" class="form-control text-center" value="1"
										min="-0" max="40" width="50% !important"> <span
										class="input-group-btn data-up">
										<button class="btn btn-default btn-info" data-dir="up">
											<span class="glyphicon glyphicon-plus"></span>
										</button>
									</span>
								</div>

							</div>
							<div class="col-md-12" style="padding-bottom: 20px">
								<h3 align="center" >총금액 : 30000원</h3>
							</div>
							<div class="col-md-offset-3 col-md-6">
							<button class="btn btn-danger btn-lg btn-block" type="button">
								장바구니 담기</button>
							</div>
						</div>
					</div>
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