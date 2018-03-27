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
	
	body {
  font-family: 'open sans';
  overflow-x: hidden;
  
   }

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
      display: block; }
    .preview-thumbnail.nav-tabs li a {
      padding: 0;
      margin: 0; }
    .preview-thumbnail.nav-tabs li:last-of-type {
      margin-right: 0; }

.tab-content {
  overflow: hidden; }
  .tab-content img {
    width: 100%;
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

  float: center; 

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
								<div class="tab-pane active" id="pic-1"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list1.jpg'/>"></div>
								<div class="tab-pane" id="pic-2"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list2.jpg'/>"></div>
								<div class="tab-pane" id="pic-3"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list3.jpg'/>"></div>
								<div class="tab-pane" id="pic-4"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list4.jpg'/>"></div>
								<div class="tab-pane" id="pic-5"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list5.jpg'/>"></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
									<li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list1.jpg'/>"></a></li>
									<li><a data-target="#pic-2" data-toggle="tab"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list2.jpg'/>"/></a></li>
									<li><a data-target="#pic-3" data-toggle="tab"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list3.jpg'/>"/></a></li>
									<li><a data-target="#pic-4" data-toggle="tab"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list4.jpg'/>"/></a></li>
									<li><a data-target="#pic-5" data-toggle="tab"><img src="<c:url value ='/com.sajo.foodtruck/front-end/images/Kim/menu_list5.jpg'/>"/></a></li>
						</ul>
					</div>
				
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
    
    	
	
	
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>