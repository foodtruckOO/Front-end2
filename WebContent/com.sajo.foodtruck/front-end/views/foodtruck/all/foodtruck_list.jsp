<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
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
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css"
	href="<c:url value ='/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck.css'/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value='/com.sajo.foodtruck/front-end/views/foodtruck/all/restaurant.css'/>" />
</head>
<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>

	<div id="wrap" style="position: relative;">
		<div id="content" class="container-fluid clearfix"
			style="background: #fff; max-width: 100%">
				<div class="jumbotron" style="background-color: white !important;">
					<img class="img-fluid"
						src="<c:url value= '/com.sajo.foodtruck/front-end/images/logo.jpg'/>" />
					<h1 style="display: inline; line-height: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;메뉴 보기</h1>
				</div>
			
			
			<div class="res_content">
				<!--**레스토랑 지역별-->
				<div class="dq_title home">
					<h4>지역별 푸드트럭</h4>
				</div>
				<div class="list_wrap row" id="area_list">
					<div class="reg_img_box col-sm-3 col-xs-6">
						<div class="reg_img_box_thumbnail">
							<a href="restaurant/area/1.html" class="reg_img_card areas">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>서울</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>
					<div class="reg_img_box col-sm-3 col-xs-6">
						<div class="reg_img_box_thumbnail">
							<a href="restaurant/area/2.html" class="reg_img_card areas">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>인천</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>
					<div class="reg_img_box col-sm-3 col-xs-6">
						<div class="reg_img_box_thumbnail">
							<a href="restaurant/area/3.html" class="reg_img_card areas">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>경기</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>
					<div class="reg_img_box col-sm-3 col-xs-6">
						<div class="reg_img_box_thumbnail">
							<a href="restaurant/area/4.html" class="reg_img_card areas">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>대전</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>
					<div class="reg_img_box col-sm-3 col-xs-6">
						<div class="reg_img_box_thumbnail">
							<a href="restaurant/area/5.html" class="reg_img_card areas">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>대구</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>
					<div class="reg_img_box col-sm-3 col-xs-6">
						<div class="reg_img_box_thumbnail">
							<a href="restaurant/area/6.html" class="reg_img_card areas">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>부산</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>
					<div class="reg_img_box col-sm-3 col-xs-6">
						<div class="reg_img_box_thumbnail">
							<a href="restaurant/area/7.html" class="reg_img_card areas">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>기타지역</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>

					<div class="reg_img_box more col-sm-3 col-xs-6"
						onclick="return moreArea(this);">
						<div class="reg_img_box_thumbnail">
							<a href="#" class="reg_img_card more">
								<div class="reg_img_c02"></div>
								<div class="reg_img_t02">
									<h3>
										+<br>전체보기
									</h3>
								</div>
								<div class="res_deco2"></div>
							</a>
						</div>
					</div>
				</div>
				<div class="dq_title home">
					<h4>잘나가는 푸드트럭</h4>
				</div>
				<div class="list_wrap row">
					<div class="tv_img_box col-sm-6 col-xs-12">
						<div class="tv_img_box_thumbnail">
							<a href="restaurant/theme/suyo.html" class="tv_img_card">
								<div class="tv_img_t01">
									<h3>
										<b>이달의</b><br>랭킹
									</h3>
								</div>
							</a>
						</div>
					</div>
					<div class="tv_img_box col-sm-6 col-xs-12">
						<div class="tv_img_box_thumbnail">
							<a href="restaurant/theme/back.html" class="tv_img_card">
								<div class="tv_img_t01">
									<h3>
										<b>신규창업</b><br>푸드트럭
									</h3>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	
	<div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
 	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>
