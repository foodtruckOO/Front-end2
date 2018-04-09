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
<title>Home_event</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>"
	rel="stylesheet">
<!-- YangGeum template CSS -->
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />

<link rel="stylesheet" type="text/css"
	href="<c:url value ='/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck.css'/>" />

<!-- Custom styles for this template -->

<style>
body {
	min-height: 2000px;
	padding-top: 70px;
}

table, table th {
	text-align: center;
}

.pagination>li>a, .pagination>li>span {
	border-radius: 50% !important;
	margin: 0 5px;
}

.thumbnail { position: relative; 
			padding-top: 100%; /* 1:1 ratio */ 
			overflow: hidden; }
.thumbnail .centered { position: absolute;
 	top: 0; left: 0; right: 0; bottom: 0; -webkit-transform: translate(50%,50%); 
 	-ms-transform: translate(50%,50%); transform: translate(50%,50%); 
 } 
 .thumbnail .centered img { position: absolute; top: 0; left: 0; max-width: 100%; height: auto;
  -webkit-transform: translate(-50%,-50%); -ms-transform: translate(-50%,-50%); transform: translate(-50%,-50%); 
 }


</style>

</head>

<body>
	<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />

	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>

	<!-- 내용 시작 -->
	<div class="container-fluid">

		<div class="row">

			<div class="col-xs-12 col-sm-12">
				<div class="jumbotron" style="background-color: white !important;">
					<img class="img-fluid"
						src="<c:url value= '/com.sajo.foodtruck/front-end/images/logo.jpg'/>" />
					<h1 style="display: inline; line-height: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;홈페이지 이벤트</h1>
				</div>
			</div>
		</div>
	<%-- 	<div class="row">
				<c:forEach items="${event}" var ="dto">
			<div class="col-xs-6 col-lg-4 thumbnail-wrapper" style="border: none" >
				<div class="thumbnail">
					<a href="<c:url value='/com.sajo.foodtruck.event/event/view.event?eno=${dto.eno}'/>"> 
					<div class="centered">	
						<img class="img-responsive img-rounded"
						src="<c:url value ='/com.sajo.foodtruck/front-end/images/${dto.attachedfile}'/>">
					</div>
						<h3 style="text-indent: 45px">${dto.title}</h3>
						<p style="text-indent: 45px">기간 : ${dto.s_date} ~ ${dto.e_date}</p>
					</a>
				</div>
			</div>
				</c:forEach>
		</div> --%>
		<div class="row">
			<c:forEach items="${event}" var ="dto">
			<div class="taste_card col-sm-4 col-xs-6 ">
						<div class="card_img_wrap" style="position: relative;">
							<div class="card_img_wrap_thumbnail a">
								<a href="<c:url value='/Eventview.event?eno=${dto.eno}'/>"><img
									src="http://localhost:8080/Back-end/backend/img/admin/${dto.titlefile}"
									width="100%" /> </a>
							</div>
						</div>
						<div class="card_content" align="center">
							<h3 style="text-indent: 45px">${dto.title}</h3>
							<p style="text-indent: 45px">기간 : ${dto.s_date} ~ ${dto.e_date}</p>
							
						</div>
			</div>
			</c:forEach>
		</div>
		<!--/row-->
<!-- 
		<div align="center">
			<ul class="pagination">
				<li class="disabled"><a href="#">«</a></li>
				<li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#">»</a></li>
			</ul>
		</div> -->



	</div>
	<!--/.container-->
	<!-- 내용 끝 -->
	<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>