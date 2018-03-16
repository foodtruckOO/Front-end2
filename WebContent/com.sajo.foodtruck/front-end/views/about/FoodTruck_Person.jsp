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

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>	
		$(function(){
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop(); 
				$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			});
			
		});
		
		$(document).ready(function() {
			$('.carousel').carousel({
				interval : 6000
			})
		});
		
		function person(){
			$("#pizza").modal();
		}
		
		
	</script>
<style>

.team {
	padding: 75px 0;
}

h6.description {
	font-weight: bold;
	letter-spacing: 2px;
	color: #999;
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
	padding-bottom: 5px;
}

.profile {
	margin-top: 25px;
}

.profile h1 {
	font-weight: normal;
	font-size: 20px;
	margin: 10px 0 0 0;
}

.profile h2 {
	font-size: 14px;
	font-weight: lighter;
	margin-top: 5px;
}

.profile .img-box {
	opacity: 1;
	display: block;
	position: relative;
}

.profile .img-box:after {
	content: "";
	opacity: 0;
	background-color: rgba(0, 0, 0, 0.75);
	position: absolute;
	right: 0;
	left: 0;
	top: 0;
	bottom: 0;
}

.img-box ul {
	position: absolute;
	z-index: 2;
	bottom: 50px;
	text-align: center;
	width: 100%;
	padding-left: 0px;
	height: 0px;
	margin: 0px;
	opacity: 0;
}

.profile .img-box:after, .img-box ul, .img-box ul li {
	-webkit-transition: all 0.5s ease-in-out 0s;
	-moz-transition: all 0.5s ease-in-out 0s;
	transition: all 0.5s ease-in-out 0s;
}

.img-box ul i {
	font-size: 20px;
	letter-spacing: 10px;
}

.img-box ul li {
	width: 30px;
	height: 30px;
	text-align: center;
	border: 1px solid #88C425;
	margin: 2px;
	padding: 5px;
	display: inline-block;
}

.img-box a {
	color: #fff;
}

.img-box:hover:after {
	opacity: 1;
}

.img-box:hover ul {
	opacity: 1;
}

.img-box ul a {
	-webkit-transition: all 0.3s ease-in-out 0s;
	-moz-transition: all 0.3s ease-in-out 0s;
	transition: all 0.3s ease-in-out 0s;
}

.img-box a:hover li {
	border-color: #fff;
	color: #88C425;
}

a {
	color: #88C425;
}

a:hover {
	text-decoration: none;
	color: #519548;
}

i.red {
	color: #BC0213;
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




	<!-- 내용 시작 -->

	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->


	<section class="team" style="width: 100%;height: 100%">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<div class="col-lg-12">
						<h6 class="description">FOODTRUCK TEAM</h6>
						<div class="row pt-md">
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 profile">
								<div class="img-box">
									<img src="<c:url value='/com.sajo.foodtruck/front-end/views/about/Image/하아4.png'/>"
										class="img-responsive">

								</div>
								<h1>Marrie Doi</h1>
								<h2>Co-founder/ Operations</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 profile">
								<div class="img-box">
									<img src="<c:url value='/com.sajo.foodtruck/front-end/views/about/Image/하아2.jpg'/>"
										class="img-responsive">

								</div>
								<h1>Christopher Di</h1>
								<h2>Co-founder/ Projects</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 profile">
								<div class="img-box">
									<img src="<c:url value='/com.sajo.foodtruck/front-end/views/about/Image/하아5.jpg'/>"
										class="img-responsive">

								</div>
								<h1>Heather H</h1>
								<h2>Co-founder/ Marketing</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
							
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 profile">
								<div class="img-box">
									<img src="<c:url value='/com.sajo.foodtruck/front-end/views/about/Image/하아3.jpg'/>"
										class="img-responsive">

								</div>
								<h1>Peter John</h1>
								<h2>Web Developer</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 profile">
								<div class="img-box">
									<img src="<c:url value='/com.sajo.foodtruck/front-end/views/about/Image/하아1.jpg'/>"
										class="img-responsive">

								</div>
								<h1>Cherry John</h1>
								<h2>Fullstack Developer</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 profile">
								<div class="img-box">
									<img src="http://nabeel.co.in/files/bootsnipp/team/7.jpg"
										class="img-responsive">

								</div>
								<h1>Frank Martin</h1>
								<h2>Co-founder/ Operations</h2>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</section>
	<!-- /.container -->
	<div id="pizza" class="modal fade" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4">.col-md-4</div>
							<div class="col-md-4 col-md-offset-4">.col-md-4
								.col-md-offset-4</div>
						</div>
						<div class="row">
							<div class="col-md-3 col-md-offset-3">.col-md-3
								.col-md-offset-3</div>
							<div class="col-md-2 col-md-offset-4">.col-md-2
								.col-md-offset-4</div>
						</div>
						<div class="row">
							<div class="col-md-6 col-md-offset-3">.col-md-6
								.col-md-offset-3</div>
						</div>
						<div class="row">
							<div class="col-sm-9">
								Level 1: .col-sm-9
								<div class="row">
									<div class="col-xs-8 col-sm-6">Level 2: .col-xs-8
										.col-sm-6</div>
									<div class="col-xs-4 col-sm-6">Level 2: .col-xs-4
										.col-sm-6</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>

				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->



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