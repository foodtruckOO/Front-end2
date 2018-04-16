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
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop();
				$("#sidebox").stop().animate({
					"top" : position + currentPosition + "px"
				}, 1000);
			});
			
			//$('.list-group a').click(function(){
			//	$('#my_tab li').attr('class','');
			//});
			
			//${error}
			$("#${tab}").addClass('active');
			
			$(window).resize(function(){
			     console.log($(window).width());
			     if($(window).width()<500){
			    	 $('#mypage_left').hide();
			    	 $('#mypage_R').css({"width":"100%"});
			    	 $('.dropdown').show();
			     }
			     else{
			    	 $('#mypage_left').show();
			    	 $('#mypage_R').css({"width":"78%"});
			    	 $('.dropdown').hide();
			     }
			}).resize();
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
		<!-- Mypage Left -->
		<div style="float: left; width: 20%" id="mypage_left">
			<c:if test="${empty requestScope.img.intro}" var="flag">
				<img src="<c:url value='com.sajo.foodtruck/front-end/images/image-not-found.jpg'/>" alt="이미지를 찾을 수 없습니다.." 
										class="img-square"style="width: 100%; height: 100%; border: 2px solid #ffe9c1">
			</c:if>
			<c:if test="${not flag}">
			<!-- 프로필 사진 -->
				<img id="mypageMainImg" src="http://${ip}:8080/Front-end_FoodTruckProj/seller/<%=request.getSession().getAttribute("USER_ID")%>/FOODTRUCKS/MAIN/${img.newMain}" alt="이미지를 찾을 수 없습니다.." 
										class="img-square"style="width: 100%; height: 100%; border: 2px solid #ffe9c1">
			
			</c:if>
			<!-- ID -->
			<div>
				<h4 style="font-weight: bold; text-align: center;">${seller.tname}</h4>
			</div>
			<!-- Left menu -->
		   	<div class="list-group" style="text-align: center;" >
	            <a href="<c:url value='/Tabs5.page'/>" class="list-group-item" id='tabs5'>개인정보수정</a>
	            <a href="<c:url value='/Tabs10.page'/>" class="list-group-item" id='tabs10'>트럭정보 등록</a>
	            <a href="<c:url value='/Tabs6.page'/>" class="list-group-item" id='tabs6'>메뉴 등록</a>
	            <a href="<c:url value='/Tabs7.page'/>" class="list-group-item" id='tabs7'>이벤트 등록</a>
	            <!-- <a href="<c:url value='/Tabs8.page'/>" class="list-group-item" id="a5">SNS 등록</a> -->
         	</div> 
			
			
			<!-- 워드클라우드 -->
			
				<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
				<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script> -->
				<script src="<c:url value='/bootstrap/js/tagcloud.jquery.js'/>"></script>
				
					<!-- Google Analytics -->
				    <script>
				            (function (i, s, o, g, r, a, m) {
				                i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
				                    (i[r].q = i[r].q || []).push(arguments)
				                }, i[r].l = 1 * new Date(); a = s.createElement(o),
				                m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
				            })(window, document, 'script', 'https://www.google-analytics.com/analytics.js', 'ga');
				            ga('create', 'UA-110902214-1', 'auto');
				            ga('send', 'pageview');
				    </script>
				    <!-- End Google Analytics -->
				
				<style>
				
					#tagcloud ul li a:hover{
						color: white !important;
						background-color: GREEN;
						font-size: 5em;
					}
					#tagcloud ul li a {
						/*resize: none;*/
						border: none;
						outline: none;
						text-decoration: none;
						padding: 0px;
						margin: 0px;
						list-style-type: none;
						color: #ffa500;
					}
				</style>
				
				<script type="text/javascript">
					var settings = {
						//height of sphere container
						height : 240,
						//width of sphere container
						width : 220,
						//radius of sphere
						radius : 75,
						//rotation speed
						speed : 3,
						//sphere rotations slower
						slower : 0.9,
						//delay between update position
						timer : 5,
						//dependence of a font size on axis Z
						fontMultiplier : 5,
						//tag css stylies on mouse over
						hoverStyle : {
							border : 'none',
							color : 'red'
						},
						//tag css stylies on mouse out
						mouseOutStyle : {
							border : '',
							color : ''
						}
					};
				
					$(document).ready(function() {
						$('#tagcloud').tagoSphere(settings);
					});
				</script>
				
				<div id="tagcloud">
					<ul>
						<li><a href="#">amianthoidal</a></li>
						<li><a href="#">piperide</a></li>
						<li><a href="#">cleavelandite</a></li>
						<li><a href="#">Otomian</a></li>
						<li><a href="#">censureship</a></li>
						<li><a href="#">nonapostatizing</a></li>
						<li><a href="#">nonflowing</a></li>
						<li><a href="#">songwright</a></li>
						<li><a href="#">andalusite</a></li>
						<li><a href="#">doorstop</a></li>
						<li><a href="#">subnatural</a></li>
						<li><a href="#">nicolayite</a></li>
						<li><a href="#">integrifolious</a></li>
						<li><a href="#">uncurricularized</a></li>
						<li><a href="#">ericeticolous</a></li>
						<li><a href="#">yellowwood</a></li>
						<li><a href="#">Sumdum</a></li>
						<li><a href="#">hysteroscope</a></li>
						<li><a href="#">simony</a></li>
						<li><a href="#">overrestore</a></li>
						<li><a href="#">firearmed</a></li>
						<li><a href="#">doctorfish</a></li>
						<li><a href="#">Costaea</a></li>
						<li><a href="#">consentingly</a></li>
						<li><a href="#">Angoumian</a></li>
						<li><a href="#">bumbleberry</a></li>
						<li><a href="#">tunnelmaking</a></li>
						<li><a href="#">overtenderly</a></li>
						<li><a href="#">expergefaction</a></li>
						<li><a href="#">intraventricular</a></li>
						<li><a href="#">unsignificancy</a></li>
						<li><a href="#">deflector</a></li>
						<li><a href="#">truism</a></li>
						<li><a href="#">otosalpinx</a></li>
						<li><a href="#">chamberletted</a></li>
						<li><a href="#">unbeauteous</a></li>
						<li><a href="#">Jugulares</a></li>
						<li><a href="#">pith</a></li>
						<li><a href="#">outhear</a></li>
						<li><a href="#">immaculateness</a></li>
						<li><a href="#">bonnibel</a></li>
						<li><a href="#">xerotherm</a></li>
						<li><a href="#">onrush</a></li>
						<li><a href="#">binocularly</a></li>
						<li><a href="#">insignia</a></li>
						<li><a href="#">Baloskionaceae</a></li>
						<li><a href="#">vapulatory</a></li>
						<li><a href="#">stoechas</a></li>
						<li><a href="#">spurtle</a></li>
						<li><a href="#">speedily</a></li>
						<li><a href="#">intermittedly</a></li>
						<li><a href="#">pie</a></li>
						<li><a href="#">urohematin</a></li>
						<li><a href="#">pervertedness</a></li>
						<li><a href="#">summability</a></li>
						<li><a href="#">unspinsterlike</a></li>
						<li><a href="#">guilty</a></li>
						<li><a href="#">equivalence</a></li>
						<li><a href="#">ovaloid</a></li>
						<li><a href="#">goodliness</a></li>
						<li><a href="#">dainteth</a></li>
						<li><a href="#">umiak</a></li>
						<li><a href="#">faunistically</a></li>
						<li><a href="#">spumose</a></li>
						<li><a href="#">supercrowned</a></li>
						<li><a href="#">preludial</a></li>
						<li><a href="#">unbusied</a></li>
						<li><a href="#">sleeting</a></li>
						<li><a href="#">traitor</a></li>
						<li><a href="#">professionalism</a></li>
						<li><a href="#">auntlike</a></li>
						<li><a href="#">shieldtail</a></li>
						<li><a href="#">cheapen</a></li>
						<li><a href="#">platycoria</a></li>
						<li><a href="#">mesorectal</a></li>
						<li><a href="#">polylithic</a></li>
						<li><a href="#">Parasuchia</a></li>
						<li><a href="#">bronchia</a></li>
						<li><a href="#">hypochnose</a></li>
						<li><a href="#">causticization</a></li>
						<li><a href="#">chroococcaceous</a></li>
						<li><a href="#">colonist</a></li>
						<li><a href="#">antilogous</a></li>
						<li><a href="#">Erpetoichthys</a></li>
						<li><a href="#">lactoproteid</a></li>
						<li><a href="#">appetite</a></li>
						<li><a href="#">delineate</a></li>
						<li><a href="#">polytomous</a></li>
						<li><a href="#">parheliacal</a></li>
						<li><a href="#">loweringness</a></li>
						<li><a href="#">dragontail</a></li>
						<li><a href="#">filching</a></li>
						<li><a href="#">unavoidably</a></li>
						<li><a href="#">szlachta</a></li>
						<li><a href="#">azotoluene</a></li>
						<li><a href="#">gadding</a></li>
					</ul>
				</div>
			<!-- 워드클라우드 -->
			
			<!-- 광고 -->			
			<div class="cycle-slideshow"  data-cycle-fx=scrollHorz  data-cycle-timeout=2000 style="margin-top: 20px;">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_1.jpg'/>" style="width: 100%; height: 100px">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_2.jpg'/>" style="width: 100%; height: 100px">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_3.jpg'/>" style="width: 100%; height: 100px">
			    <img src="<c:url value='/com.sajo.foodtruck/front-end/images/ad_4.jpg'/>" style="width: 100%; height: 100px">
			</div>
			<hr>
         	<!-- sns -->
			<div style="text-align: center; style="margin-top: 20px;">
				<img alt="facebook" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_f.png'/>" style="width: 50px; height: auto;">
				<img alt="instagram" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_i.png'/>" style="width: 50px; height: auto;">
				<img alt="twitter" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_t.png'/>" style="width: 50px; height: auto;">
			</div>
			
		</div>
		
		<!-- Mypage Right -->
		<div id="mypage_R" style="float: right;  width: 78%;" >
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
					<li role="presentation" class="dropdown">
					    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false">
					      Edit <span class="caret"></span>
					    </a>
					    <ul class="dropdown-menu" role="menu">
							<a href="<c:url value='/Tabs5.page'/>" class="list-group-item" id='tabs5'>개인정보수정</a>
				            <a href="<c:url value='/Tabs10.page'/>" class="list-group-item" id='tabs10'>트럭정보 등록</a>
				            <a href="<c:url value='/Tabs6.page'/>" class="list-group-item" id='tabs6'>메뉴 등록</a>
				            <a href="<c:url value='/Tabs7.page'/>" class="list-group-item" id='tabs7'>이벤트 등록</a>
				            <!-- <a href="<c:url value='/Tabs8.page'/>" class="list-group-item" id="a5">SNS 등록</a> -->
				            <!-- <a href="<c:url value='/Tabs9.page'/>" class="list-group-item" id='tabs9'>주문 현황</a> -->
					    </ul>
					</li>
					<!--  data-toggle="tab" -->
					<li role="presentation" id='tabs1'><a href="<c:url value='/Tabs1.page'/>"><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> HOME </a></li>
					<li role="presentation" id='tabs2'><a href="<c:url value='/Tabs2.page'/>"><span class="glyphicon glyphicon-cutlery" aria-hidden="true"></span> 메뉴</a></li>
					<li role="presentation" id='tabs3'><a href="<c:url value='/Tabs3.page'/>"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 리뷰 </a></li>
					<li role="presentation" id='tabs4'><a href="<c:url value='/Tabs4.page'/>"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 이벤트 </a></li>
					<li role="presentation" id='tabs4'><a href="<c:url value='/Tabs9.page'/>"><span class="glyphicon glyphicon-star" aria-hidden="true"></span> 주문현황 </a></li>
					<!-- <button type="button" class="btn btn-warning" style="float: right; width: 15%; height: 100; margin-right: 1%">
						<span class="glyphicon glyphicon-heart" aria-hidden="true"></span> 즐겨찾기 
					</button> -->
				</ul>
				<div  class="tab-content" style="padding: 1%; padding-top: 3%;">
					<tiles:insertAttribute name="body"/>
				</div>
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