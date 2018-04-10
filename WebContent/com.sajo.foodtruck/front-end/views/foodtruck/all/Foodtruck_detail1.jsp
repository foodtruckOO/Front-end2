<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Foodtruck:: ver1.0</title>

    <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
    <!-- Custom styles for this template -->    
	 <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet">
	<link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
	<link rel="icon" href="<c:url value='/com.sajo.foodtruck/front-end/images/Webpage-Icon.png'/>" type="image/gif" >
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7dbbcf6a7522d6da2a900b6547dee963&libraries=services"></script>
	
	<!-- jQuery -->
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

	
	
	<script>	
		$(function(){
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop(); 
				$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			});
			
		});
	</script>

	<script>
	
	function click(){
		
		
		if(!"${sessionScope.USER_ID}".length){
			alert("로그인을 해주세요");
			
		}
		else if("${sessionScope.USER_TYPE}"=="seller"){ 
			alert("푸드트럭 사업주는 리뷰를 달수 없어요 ㅜㅜ");
		}
		else{
		var star = $(":radio:checked").val();
		var commen = $('#review').val();
		var s_no = "${s_no}";
		alert("등록이 성공했어요");
		location.href="<c:url value='/write.foodtruck'/>?star="+star+"&s_no="+s_no+"&commen="+commen; 
		}
	}
	</script>

	<style>
	
	

img {
  max-width: 100%; }

.preview {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }
  @media screen and (max-width: 996px) {
    .preview {
      margin-bottom: 20px; } }

.preview-pic {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.preview-thumbnail.nav-tabs {
  border: none;
  margin-top: 15px; }
  .preview-thumbnail.nav-tabs li {
    width: 18%;
    margin-right: 2.0%;
    margin-bottom: 1.0% }
    .preview-thumbnail.nav-tabs li img {
      max-width: 100%;
      width:92px;
      height:70px;
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 600px;
    height: 400px;
    -webkit-animation-name: opacity;
            animation-name: opacity;
    -webkit-animation-duration: .3s;
            animation-duration: .3s; }
            


.card {
  margin-top: 50px;
  background: #eee;
  background-color: white;
  padding: 3em;
  line-height: 1.5em; }

@media screen and (min-width: 997px) {
  .wrapper {
    display: -webkit-box;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex; } }

.details {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: vertical;
  -webkit-box-direction: normal;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.colors {
  -webkit-box-flex: 1;
  -webkit-flex-grow: 1;
      -ms-flex-positive: 1;
          flex-grow: 1; }

.product-title, .price, .sizes, .colors {
  text-transform: UPPERCASE;
  font-weight: bold; }

.checked, .price span {
  color: #ff9f1a; }

.product-title, .rating, .product-description, .price, .vote, .sizes {
  margin-bottom: 15px; }

.product-title {
  margin-top: 0; }

.size {
  margin-right: 10px; }
  .size:first-of-type {
    margin-left: 40px; }

.color {
  display: inline-block;
  vertical-align: middle;
  margin-right: 10px;
  height: 2em;
  width: 2em;
  border-radius: 2px; }
  .color:first-of-type {
    margin-left: 20px; }

.add-to-cart, .like {
  background: #ff9f1a;
  padding: 1.2em 1.5em;
  border: none;
  text-transform: UPPERCASE;
  font-weight: bold;
  color: #fff;
  -webkit-transition: background .3s ease;
          transition: background .3s ease; }
  .add-to-cart:hover, .like:hover {
    background: #b36800;
    color: #fff; }

.not-available {
  text-align: center;
  line-height: 2em; }
  .not-available:before {
    font-family: fontawesome;
    content: "\f00d";
    color: #fff; }

.orange {
  background: #ff9f1a; }

.green {
  background: #85ad00; }

.blue {
  background: #0076ad; }

.tooltip-inner {
  padding: 1.3em; }

@-webkit-keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }

@keyframes opacity {
  0% {
    opacity: 0;
    -webkit-transform: scale(3);
            transform: scale(3); }
  100% {
    opacity: 1;
    -webkit-transform: scale(1);
            transform: scale(1); } }
	
	
	
div.stars1 { 
  display: inline-block; 

} 

input.star { display: none; } 

label.star { 

  float: right; 

  padding: 3px; 

  font-size: 18px; 

  color: #444; 

  transition: all .2s; 

} 

input.star:checked ~ label.star:before { 

  content: '\f005'; 

  color: #FD4; 

  transition: all .25s; 
} 

input.star-5:checked ~ label.star:before {  
  color: #FE7; 

  text-shadow: 0 0 10px #952; 

} 

input.star-1:checked ~ label.star:before { color: #F62; } 

label.star:hover { transform: rotate(-15deg) scale(1.3); } 
 
label.star:before { 
 
  content: '\f006'; 
 
  font-family: FontAwesome; 

} 
	
	
	
	</style>
<script>
/* $(function(){
	var avg = ${starsum}/${count}*1.0;
	switch(avg){
	case 5 : break;
	case 4.5 : break;
	
	
	}
	
	$(".stars").html()
	
}); */
/* 	$(function(){
	console.log(${starsum});
	console.log(${count});
	alert("${starsum}");
	}); */
</script>	

	
  </head>

<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
    </div>
    <div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp"/>
    </div>
	<!-- 내용 시작 -->
	
	
		<div class="container-fliud">
		<div class="card">
			
				<div class="wrapper row">
					<div class="preview col-md-6">
						
						<div class="preview-pic tab-content">
							<c:forEach items="${foodtruck}" var ="dto" varStatus="loop">
								<c:choose>
									<c:when test="${loop.first}">
									<div class="tab-pane active" id="pic-${loop.count}"><img src="<c:url value ='/seller/${dto.id}/FOODTRUCKS/${dto.img}'/>"></div>
									</c:when>
									<c:otherwise>
									<div class="tab-pane" id="pic-${loop.count}"><img src="<c:url value ='/seller/${dto.id}/FOODTRUCKS/${dto.img}'/>"></div>
									</c:otherwise>
								</c:choose>
						  </c:forEach>
						</div>
						
						<ul class="preview-thumbnail nav nav-tabs">
							<c:forEach items="${foodtruck}" var ="dto2" varStatus="loop2">
								<c:choose>
									<c:when test="${loop2.first}">
									<li class="active"><a data-target="#pic-${loop2.count}" data-toggle="tab"><img src="<c:url value ='/seller/${dto2.id}/FOODTRUCKS/${dto2.img}'/>"></a></li>
									</c:when>
									<c:otherwise>
									<li><a data-target="#pic-${loop2.count}" data-toggle="tab"><img src="<c:url value ='/seller/${dto2.id}/FOODTRUCKS/${dto2.img}'/>"/></a></li>
									</c:otherwise>
								</c:choose>
						  </c:forEach>
						</ul>
					</div>
					<div class="details col-md-6">
						<div id="map" style="width:100%;height:400px;"></div>
					
						<h3 class="product-title" style="padding-top: 15px">${tname}</h3>
						<div class="rating">
							<div class="stars">
							<c:choose>
							<c:when test="${starsum eq 0}" >
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<0.5}">
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<1}">
							<span class="fa fa-star-half checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<1.5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<2.0}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star-half checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<2.5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<3.0}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star-half checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<3.5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<4.0}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star-half checked"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<4.5}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/count/2<5.0}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star-half checked"></span>
							</c:when>
							<c:when test="${(starsum+0.0)/5>=5.0}">
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							<span class="fa fa-star checked"></span>
							</c:when>
							</c:choose>
								<!-- <span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star "></span> -->
								<!--  star-half -->
							</div>
							<span class="review-no"> ${count}명 평가</span>
						</div>
						<p class="product-description">${intro}</p>
						<div class="action">
							<a href ="<c:url value='/menu.food?s_no=${s_no}'/>"><button class="add-to-cart btn btn-default" type="button">메뉴보기</button></a>
							
						</div>
					</div>
				</div>
			</div>
		
			<div class = "row">
				<div class="col-md-offset-1 col-md-2">
					
					<div class="stars1"> 
					 
					  <form action=""> 					 
					    
					    <input class="star star-5" id="star-5" type="radio" name="star" value="10"/> 

					    <label class="star star-5" for="star-5"></label> 
					 
					    <input class="star star-4" id="star-4" type="radio" name="star" value="8"/> 
					
					    <label class="star star-4" for="star-4"></label> 
					 
					    <input class="star star-3" id="star-3" type="radio" name="star" value="6"/> 
					 
					    <label class="star star-3" for="star-3"></label> 
					 
					    <input class="star star-2" id="star-2" type="radio" name="star" value="4"/> 
					 
					    <label class="star star-2" for="star-2"></label> 
					 
					    <input class="star star-1" id="star-1" type="radio" name="star" checked="checked" value="2"/> 
					
					    <label class="star star-1" for="star-1"></label> 
					 
					  </form> 
					 
					</div>
				</div>
				<div class="col-md-6">	 
					<input id="review" class="form-control" type="text"  style="float:left; margin-right: 10px"/>
				</div>
				<div class="col-md-2">	
					<a href="javascript:click()"><button class="btn btn-primary">등록</button></a>
				</div>
				
			</div>

		<div class="row" style="padding-top: 10px">
			<div class="col-md-offset-1 col-md-9">
				<table class="table table-bordered table-hover">
					<tr>
						<th style="width: 15%;">평점</th>
						<th>리뷰</th>
						<th style="width: 18%">작성자</th>
						<th style="width: 18%">등록일</th>


					</tr>
					<c:if test="${empty review}" var="flag">
						<tr>
							<td colspan="4">등록된 리뷰가 없습니다</td>
						</tr>
					</c:if>
					<c:if test="${not flag }">
						<c:forEach var="reviews" items="${review}" varStatus="loop">
							<tr>
								<td align="left">
								<c:choose>
										<c:when test="${reviews.star eq '2'}">
										<div class="stars">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										</div>
										</c:when>
										<c:when test="${reviews.star eq '4'}">
										<div class="stars">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										</div>
										</c:when>
										<c:when test="${reviews.star eq '6'}">
										<div class="stars">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										<span class="fa fa-star"></span>
										</div>
										</c:when>
										<c:when test="${reviews.star eq '8'}">
										<div class="stars">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star"></span>
										</div>
										</c:when>
										<c:when test="${reviews.star eq '10'}">
										<div class="stars">
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										<span class="fa fa-star checked"></span>
										</div>
										</c:when>
										
									</c:choose>
									
									</td>
								<td>${reviews.commen }</td> 
								<td>${reviews.c_name}</td>
								<td>${reviews.cpostdate}</td>
							</tr>
						</c:forEach>
					</c:if>
				</table>
			</div>
		</div>

	</div>
	
	
	
	
	
	
	
	<!-- 내용 끝 -->
    <div style="padding-top: 30px">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
 	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    
    	
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    	mapOption = {
        	center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
       	 level: 3 // 지도의 확대 레벨
    	};  

		
		var map = new daum.maps.Map(mapContainer, mapOption); 
		
		var geocoder = new daum.maps.services.Geocoder();
		
		geocoder.addressSearch("${addr}", function(result, status) {

		    // 정상적으로 검색이 완료됐으면 
		    if (status === daum.maps.services.Status.OK) {

		        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new daum.maps.Marker({
		            map: map,
		            position: coords
		        });
		        
		        var infowindow = new daum.maps.InfoWindow({
		            content: '<div style="width:200px;text-align:center;padding:6px;">${tname}<br/>${addr}</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		     }

		});

	</script>
	
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>