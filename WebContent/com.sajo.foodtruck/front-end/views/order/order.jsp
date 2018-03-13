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
	<style>
		body {
		   	min-height: 2000px;
  			padding-top: 70px;
		}
		table,table th{
			text-align:center;
		}
		
	</style>
	
  </head>

<body>
	<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
	
	<!-- 내용 시작 -->
	<div class="container-fluid">
	<div class="row">
		<div class="jumbotron" >
            <h1>주문하기</h1>
         </div>
         <h2></h2>
         <div class= "col-lg-2">
         <img alt="주문한 그림" src='<c:url value = "/com.sajo.foodtruck/front-end/images/menu_list1.jpg"/>'/>
         <h2></h2>
         </div>
		 <div class = "col-lg-offset-2 col-lg-6">
		 <h3><span style="font-style: italic;">주문 내역</span></h3>
		 <h4>스테이크 3개 <span>9000원</span></h4>
		<h4>감자튀김 2개 <span>10000원</span></h4>
		<h4>콜라 1개 <span>2000원</span></h4>
		 </div>         
		 <div class = "col-lg-offset-11 col-lg-1">
		 <a href="<c:url value='/com.sajo.foodtruck/front-end/views/order/order2.jsp'/>"><button class = "btn btn-default">주문하기</button></a>
		 <h2></h2>
		 </div>
	</div>
	</div>
	
	<!-- 내용 끝 -->
   
	<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
 

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>