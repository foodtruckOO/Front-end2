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
		<style>


.box {
  background:#fff;
  transition:all 0.2s ease;
  border:2px dashed #dadada;
  margin-top: 10px;
  box-sizing: border-box;
  border-radius: 5px;
  background-clip: padding-box;
  padding:0 20px 20px 20px;
  min-height:340px;
}

.box:hover {
  border:2px solid #525C7A;
}

.box span.box-title {
    color: #fff;
    font-size: 24px;
    font-weight: 300;
    text-transform: uppercase;
}

.box .box-content {
  padding: 16px;
  border-radius: 0 0 2px 2px;
  background-clip: padding-box;
  box-sizing: border-box;
}
.box .box-content p {
  color:#515c66;
  text-transform:none;
}
</style>
  </head>

<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
    </div>
    <div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp"/>
    </div>
	<!-- 내용 시작 -->

<div class="container"style="padding-right: 100px">
	<div class="row">
		<h2 class="text-center">푸드트럭을 소개합니다~!!!</h2>
            <div class="row">
                <div class="col-md-4 text-center">
                    <div class="box">
                        <div class="box-content">
                            <h1 class="tag-title"> 밤도깨비 야시장</h1>
                            <hr />
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pharetra quam sollicitudin nibh aliquam finibus. Etiam efficitur felis vel imperdiet varius. Maecenas bibendum elementum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus finibus semper. Fusce molestie tincidunt leo vel varius. Nam scelerisque nulla feugiat leo consequat, id dignissim sem tincidunt. Proin elit mauris, hendrerit in varius sed, facilisis sit amet neque.</p>
                            <br />
                            <a href="http://www.bamdokkaebi.org/" class="btn btn-block btn-primary">더보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="box">
                        <div class="box-content">
                            <h1 class="tag-title">Heading</h1>
                            <hr />
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pharetra quam sollicitudin nibh aliquam finibus. Etiam efficitur felis vel imperdiet varius. Maecenas bibendum elementum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus finibus semper. Fusce molestie tincidunt leo vel varius. Nam scelerisque nulla feugiat leo consequat, id dignissim sem tincidunt. Proin elit mauris, hendrerit in varius sed, facilisis sit amet neque.</p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">더보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="box">
                        <div class="box-content">
                            <h1 class="tag-title">Heading</h1>
                            <hr />
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pharetra quam sollicitudin nibh aliquam finibus. Etiam efficitur felis vel imperdiet varius. Maecenas bibendum elementum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus finibus semper. Fusce molestie tincidunt leo vel varius. Nam scelerisque nulla feugiat leo consequat, id dignissim sem tincidunt. Proin elit mauris, hendrerit in varius sed, facilisis sit amet neque.</p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">더보기</a>
                        </div>
                    </div>
                </div>
            </div>           
        </div>
	</div>

	<div class="container"style="padding-right: 100px; padding-bottom: 50px">
	<div class="row">
		<h2 class="text-center">푸드트럭을 소개합니다~!!!</h2>
            <div class="row">
                <div class="col-md-4 text-center">
                    <div class="box">
                        <div class="box-content">
                            <h1 class="tag-title">Heading</h1>
                            <hr />
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pharetra quam sollicitudin nibh aliquam finibus. Etiam efficitur felis vel imperdiet varius. Maecenas bibendum elementum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus finibus semper. Fusce molestie tincidunt leo vel varius. Nam scelerisque nulla feugiat leo consequat, id dignissim sem tincidunt. Proin elit mauris, hendrerit in varius sed, facilisis sit amet neque.</p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">더보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="box">
                        <div class="box-content">
                            <h1 class="tag-title">Heading</h1>
                            <hr />
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pharetra quam sollicitudin nibh aliquam finibus. Etiam efficitur felis vel imperdiet varius. Maecenas bibendum elementum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus finibus semper. Fusce molestie tincidunt leo vel varius. Nam scelerisque nulla feugiat leo consequat, id dignissim sem tincidunt. Proin elit mauris, hendrerit in varius sed, facilisis sit amet neque.</p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">더보기</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 text-center">
                    <div class="box">
                        <div class="box-content">
                            <h1 class="tag-title">Heading</h1>
                            <hr />
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi pharetra quam sollicitudin nibh aliquam finibus. Etiam efficitur felis vel imperdiet varius. Maecenas bibendum elementum molestie. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris cursus finibus semper. Fusce molestie tincidunt leo vel varius. Nam scelerisque nulla feugiat leo consequat, id dignissim sem tincidunt. Proin elit mauris, hendrerit in varius sed, facilisis sit amet neque.</p>
                            <br />
                            <a href="ppc.html" class="btn btn-block btn-primary">더보기</a>
                        </div>
                    </div>
                </div>
            </div>           
        </div>
	</div>
	
	
	
	
	
	
	
	<!-- 내용 끝 -->
    <div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
 	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>