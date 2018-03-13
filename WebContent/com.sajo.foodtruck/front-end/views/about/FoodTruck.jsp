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
		$(document).ready(function(){
		    var my_posts = $("[rel=tooltip]");
		    for(i=0;i<my_posts.length;i++){
		        the_post = $(my_posts[i]);
		        if(the_post.hasClass('invert')){
		            the_post.tooltip({ placement: 'left'});
		            the_post.css("cursor","pointer");
		        }else{
		            the_post.tooltip({ placement: 'rigt'});
		            the_post.css("cursor","pointer");
		        }
		    }
		});
	</script>
<style>
.timeline {
	list-style: none;
	padding: 20px 0 20px;
	position: relative;
}

.timeline:before {
	top: 0;
	bottom: 0;
	position: absolute;
	content: " ";
	width: 3px;
	background-color: #eeeeee;
	left: 50%;
	margin-left: -1.5px;
}

.timeline>li {
	margin-bottom: 20px;
	position: relative;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li:before, .timeline>li:after {
	content: " ";
	display: table;
}

.timeline>li:after {
	clear: both;
}

.timeline>li>.timeline-panel {
	width: 46%;
	float: left;
	border: 1px solid #d4d4d4;
	/*border-radius: 2px;*/
	/*padding: 20px;*/
	position: relative;
	-webkit-box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
	box-shadow: 0 1px 6px rgba(0, 0, 0, 0.175);
}

.timeline>li>.timeline-panel:before {
	position: absolute;
	top: 26px;
	right: -15px;
	display: inline-block;
	border-top: 15px solid transparent;
	border-left: 15px solid #ccc;
	border-right: 0 solid #ccc;
	border-bottom: 15px solid transparent;
	content: " ";
}

.timeline>li>.timeline-panel:after {
	position: absolute;
	top: 27px;
	right: -14px;
	display: inline-block;
	border-top: 14px solid transparent;
	border-left: 14px solid #fff;
	border-right: 0 solid #fff;
	border-bottom: 14px solid transparent;
	content: " ";
}

.timeline>li>.timeline-badge {
	color: #fff;
	width: 24px;
	height: 24px;
	line-height: 50px;
	font-size: 1.4em;
	text-align: center;
	position: absolute;
	top: 16px;
	left: 50%;
	margin-left: -12px;
	/*background-color: #999999;*/
	z-index: 100;
	/*
  border-top-right-radius: 50%;
  border-top-left-radius: 50%;
  border-bottom-right-radius: 50%;
  border-bottom-left-radius: 50%;
  */
}

.timeline>li.timeline-inverted>.timeline-panel {
	float: right;
}

.timeline>li.timeline-inverted>.timeline-panel:before {
	border-left-width: 0;
	border-right-width: 15px;
	left: -15px;
	right: auto;
}

.timeline>li.timeline-inverted>.timeline-panel:after {
	border-left-width: 0;
	border-right-width: 14px;
	left: -14px;
	right: auto;
}

.timeline-badge>a {
	color: #C5C7C5 !important;
}

.timeline-badge a:hover {
	color: #FF531F !important;
}

.timeline-title {
	margin-top: 0;
	color: inherit;
}

.timeline-body>p, .timeline-body>ul {
	padding: 20px;
	margin-bottom: 0;
}

.timeline-body>p+p {
	margin-top: 5px;
}

.timeline-footer {
	padding: 20px;
	background-color: #f4f4f4;
}

.timeline-footer>a {
	cursor: pointer;
	text-decoration: none;
}

.tooltip {
	position: absolute;
	z-index: 1020;
	display: block;
	visibility: visible;
	padding: 5px;
	font-size: 11px;
	opacity: 0;
	filter: alpha(opacity = 0);
}

.tooltip.in {
	/*opacity:0;
    filter:alpha(opacity=80);*/
	
}

.tooltip.top {
	margin-top: -2px;
}

.tooltip.right {
	margin-left: 2px;
}

.tooltip.bottom {
	margin-top: 2px;
}

.tooltip.left {
	margin-left: -2px;
}

.tooltip.top .tooltip-arrow {
	bottom: 0;
	left: 0;
	margin-left: 0;
	border-left: 0 solid transparent;
	border-right: 5px solid transparent;
	border-top: 0 solid #000;
}

.tooltip.left .tooltip-arrow {
	bottom: 0;
	left: 0;
	margin-left: 0;
	border-left: 0 solid transparent;
	border-right: 5px solid transparent;
	border-top: 0 solid #000;
}

.tooltip.bottom .tooltip-arrow {
	bottom: 0;
	left: 0;
	margin-left: 0;
	border-left: 0 solid transparent;
	border-right: 5px solid transparent;
	border-top: 0 solid #000;
}

.tooltip.right .tooltip-arrow {
	bottom: 0;
	left: 0;
	margin-left: 0;
	border-left: 0 solid transparent;
	border-right: 5px solid transparent;
	border-top: 0 solid #000;
}

.tooltip-inner {
	width: 200px;
	padding: 3px 8px;
	color: #fff;
	text-align: center;
	text-decoration: none;
	background-color: #FF531F;
	-webkit-border-radius: 0px;
	-moz-border-radius: 0px;
	border-radius: 0px;
}

.tooltip-arrow {
	
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
	<script
		src="//netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

	<div class="container" style="padding-right: 70px">
		<div class="page-header text-center">
			<h1 id="timeline" style="color: orange;">FoodTruck</h1>
		</div>
		<ul class="timeline">
			<li>
				<div class="timeline-badge primary">
					<a><i class="glyphicon glyphicon-record" rel="tooltip" id=""></i></a>
				</div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<img class="img-responsive"
							src=http://www.bamdokkaebi.org/storage/app/public/thumbnails/cf/26/spill_800x800_31b24c6496550bef96083863996423ad4b227d32.JPG />

					</div>
					<div class="timeline-body">
						<p>푸드트럭은 ‘음식’이라는 뜻의 영어 'food'와 트럭(차량)의 합성어로 식품을 조리할 수 있는 시설이
							완비된 차량을 말한다. 푸드트럭은 건물 공간에 창업하는 것 보다 훨씬 비용이 저렴할 뿐만 아니라 자유롭게 판매 지역을
							옮겨 다닐 수 있기 때문에 전 세계적으로 큰 인기를 얻고 있다. 우리나라 정부는 지난 2014년 9월, 푸드트럭을
							합법화 하였으며 그 숫자가 꾸준히 증가하고 있다. 많은 청년들이 푸드트럭 창업을 시도하고 있으며, 상품도 더욱 다양화
							되고 있다. 하지만 아무 곳에서나 푸드트럭의 영업이 가능한 것은 아니다. 우리나라의 경우 각 지방자치단체가 정한
							곳에서만 영업할 수 있는데, 지정된 곳이 많지 않을 뿐만 아니라, 그 마저도 사람이 많이 지나다니지 않는 곳이 있어
							정부 정책의 개선이 요구되고 있다.</p>

					</div>

				</div>
			</li>

			<li class="timeline-inverted">
				<div class="timeline-badge primary">
					<a><i class="glyphicon glyphicon-record invert" rel="tooltip"
						id=""></i></a>
				</div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<img class="img-responsive"
							src=http://www.bamdokkaebi.org/storage/app/public/thumbnails/2b/98/spill_800x800_820c01c4613f19a3d1fe0a8624a989608a35ea51.JPG />

					</div>
					<div class="timeline-body">
						<p>Mussum ipsum cacilds, vidis litro abertis. Consetis
							adipiscings elitis. Pra lá , depois divoltis porris, paradis.
							Paisis, filhis, espiritis santis. Mé faiz elementum girarzis,
							nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
							Manduma pindureta quium dia nois paga. Sapien in monti palavris
							qui num significa nadis i pareci latim. Interessantiss quisso
							pudia ce receita de bolis, mais bolis eu num gostis.</p>

					</div>


				</div>
			</li>
			<li>
				<div class="timeline-badge primary">
					<a><i class="glyphicon glyphicon-record" rel="tooltip" id=""></i></a>
				</div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<img class="img-responsive"
							src="http://www.bamdokkaebi.org/storage/app/public/thumbnails/ac/0b/spill_800x800_d7ebdd0bcb656ece4e5c705012f3c942b9b1525e.jpg"/>

					</div>
					<div class="timeline-body">
						<p>Mussum ipsum cacilds, vidis litro abertis. Consetis
							adipiscings elitis. Pra lá , depois divoltis porris, paradis.
							Paisis, filhis, espiritis santis. Mé faiz elementum girarzis,
							nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
							Manduma pindureta quium dia nois paga. Sapien in monti palavris
							qui num significa nadis i pareci latim. Interessantiss quisso
							pudia ce receita de bolis, mais bolis eu num gostis.</p>

					</div>


				</div>
			</li>

			<li class="timeline-inverted">
				<div class="timeline-badge primary">
					<a><i class="glyphicon glyphicon-record invert" rel="tooltip"
						id=""></i></a>
				</div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<img class="img-responsive"
							src=http://www.bamdokkaebi.org/storage/app/public/thumbnails/d6/87/spill_800x800_a60bb237050650c8de7093b3ae720274479326a3.jpg />

					</div>
					<div class="timeline-body">
						<p>Mussum ipsum cacilds, vidis litro abertis. Consetis
							adipiscings elitis. Pra lá , depois divoltis porris, paradis.
							Paisis, filhis, espiritis santis. Mé faiz elementum girarzis,
							nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
							Manduma pindureta quium dia nois paga. Sapien in monti palavris
							qui num significa nadis i pareci latim. Interessantiss quisso
							pudia ce receita de bolis, mais bolis eu num gostis.</p>

					</div>


				</div>
			</li>
			<li>
				<div class="timeline-badge primary">
					<a><i class="glyphicon glyphicon-record" rel="tooltip" id=""></i></a>
				</div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<img class="img-responsive"
							src="http://www.bamdokkaebi.org/storage/app/public/thumbnails/7a/61/spill_800x800_246242eb5e47eaf2904f9fa57c8b612796b8fc9f.jpg" />

					</div>
					<div class="timeline-body">
						<p>Mussum ipsum cacilds, vidis litro abertis. Consetis
							adipiscings elitis. Pra lá , depois divoltis porris, paradis.
							Paisis, filhis, espiritis santis. Mé faiz elementum girarzis,
							nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
							Manduma pindureta quium dia nois paga. Sapien in monti palavris
							qui num significa nadis i pareci latim. Interessantiss quisso
							pudia ce receita de bolis, mais bolis eu num gostis.</p>

					</div>


				</div>
			</li>

			<li class="timeline-inverted">
				<div class="timeline-badge primary">
					<a><i class="glyphicon glyphicon-record invert" rel="tooltip"
						id=""></i></a>
				</div>
				<div class="timeline-panel">
					<div class="timeline-heading">
						<img class="img-responsive"
							src="http://www.bamdokkaebi.org/storage/app/public/thumbnails/51/38/spill_800x800_20fe180cfb461e2e5faef1b3b5e7b00a3ea7d5ee.JPG" />

					</div>
					<div class="timeline-body">
						<p>Mussum ipsum cacilds, vidis litro abertis. Consetis
							adipiscings elitis. Pra lá , depois divoltis porris, paradis.
							Paisis, filhis, espiritis santis. Mé faiz elementum girarzis,
							nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.
							Manduma pindureta quium dia nois paga. Sapien in monti palavris
							qui num significa nadis i pareci latim. Interessantiss quisso
							pudia ce receita de bolis, mais bolis eu num gostis.</p>

					</div>


				</div>
			</li>



		</ul>
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