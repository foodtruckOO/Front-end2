<%@page import="com.sajo.foodtruck.map.mapDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.sajo.foodtruck.map.mapDAO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ include file="/com.sajo.foodtruck/front-end/Common/IsMember.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko">
<!-- JQuery CDN 호출 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 소재지 js 호출 --> 
<script src="<c:url value='/com.sajo.foodtruck/front-end/views/map/sojaeji.js'/>"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Foodtruck:: ver1.0</title>

	<style type="text/css">
body, html {
	max-width : 400%;
    height: 100%;
    background-repeat: no-repeat;
}

.card-container.card {
	text-align: center;
    max-width: 650px;
    max-height: 450px;
    padding: 40px 40px;
}
.btn-danger .btn{
	border-bottom-color:green;
	max-width: 100%;
    width : auto; 
    height: auto;
}

/*
 * Card component
 */
.card {
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 20px;
}
</style>

    <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
     <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
    <!-- Custom styles for this template -->    
	 
	<script>
		$(function(){
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop(); 
				$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			}); 
			
		});
	</script>
  </head>
<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
    </div>
    <div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp"/>
    </div>
	<section style="margin-top:60px; margin-bottom:80px;">
	<div class="container">
        <div class="card card-container">
        <h2>가입 유형을 선택해주세요.</h2><hr style="border: solid 1px #FE9A2E; width: 70%">
           <!-- 일반고객버튼 -->
           <div>
           <a href="<c:url value='/com.sajo.foodtruck/front-end/views/member/customer/JointoCus.jsp'/>">
           <input class="btn btn-success" type="button" value="Customer" style="position: relative; width: 80%; height: 100%; font-size: 25px;"></a>
           </div>
           <p>  </p>
           <!-- 사업자버튼 -->
           <div>
           <a href="<c:url value='/com.sajo.foodtruck/front-end/views/member/seller/JointoCeo.jsp'/>">
           <input class="btn btn-danger" type="button" value="Seller" style="position: relative; width: 80%; height: 100%; font-size: 25px;"></a>
           </div>
        </div><!-- /card-container -->
    </div><!-- /container -->
    </section>
    <!-- footer -->
    <section>
		<article>
			<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
	 	</article>
    </section>
	<!-- 내용 끝 -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>