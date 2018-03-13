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
		
		$(document).ready(function() {
			$('.carousel').carousel({
				interval : 6000
			})
		});
		
		function person(){
			$("#pizza").modal();
		}
		
		
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
	
	
	
	
	<!-- 내용 시작 -->
	<div class="container" style="padding-bottom: 50px;padding-right: 50px">
		<div class="col-xs-12"align="center">

			<div class="page-header">
				<h3>운영진 소개</h3>
				<p>Responsive Moving Box Carousel Demo</p>
			</div>

			<div class="carousel slide" id="myCarousel"align="center">
				<div class="carousel-inner"align="center">
					<div class="item active">
						<ul class="thumbnails" >
							<li class="col-sm-4">
								<div class="fff">
									<div class="thumbnail">
										<a href="javascript:person()"><img src="<c:url value='/com.sajo.foodtruck/front-end/views/about/Imag/하아4.png'/>" alt=""></a>
									</div>
									<div class="caption">
										<h4>나의 한마디</h4>
										<p>창조적인 사람이 되겠습니다</p>
										<a class="btn btn-mini" href="javascript:person()">» 운영진 소개 더보기</a>
									</div>
								</div>
							</li>
							<li class="col-sm-4">
								<div class="fff">
									<div class="thumbnail">
										<a href="javascript:person()"><img src="<c:url value='/com.sajo.foodtruck/front-end/views/about/Imag/하아2.jpg'/>" alt=""></a>
									</div>
									<div class="caption">
										<h4>나의 한마디</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="javascript:person()">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-4">
								<div class="fff">
									<div class="thumbnail">
										<a href="javascript:person()"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>나의 한마디</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="javascript:person()">» Read More</a>
									</div>
								</div>
							</li>

						</ul>
					</div>
					<!-- /Slide1 -->
					<div class="item">
						<ul class="thumbnails">
							<li class="col-sm-4">
								<div class="fff">
									<div class="thumbnail">
										<a href="javascript:person()"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>나의 한마디</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="javascript:person()">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-4">
								<div class="fff">
									<div class="thumbnail">
										<a href="javascript:person()"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>나의 한마디</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="javascript:person()">» Read More</a>
									</div>
								</div>
							</li>
							<li class="col-sm-4">
								<div class="fff">
									<div class="thumbnail">
										<a href="javascript:person()"><img src="http://placehold.it/360x240" alt=""></a>
									</div>
									<div class="caption">
										<h4>나의 한마디</h4>
										<p>Nullam Condimentum Nibh Etiam Sem</p>
										<a class="btn btn-mini" href="javascript:person()">» Read More</a>
									</div>
								</div>
							</li>

						</ul>
					</div>
				</div>


				<nav>
					<ul class="control-box pager" style="padding-left: 45px">
						<li><a data-slide="prev" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-left"></i></a></li>
						<li><a data-slide="next" href="#myCarousel" class=""><i
								class="glyphicon glyphicon-chevron-right"></i></a></li>
					</ul>
				</nav>
				<!-- /.control-box -->

			</div>
			<!-- /#myCarousel -->

		</div>
		<!-- /.col-xs-12 -->

	</div>
	<!-- /.container -->
<div id="pizza" class="modal fade" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel">Modal title</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <div class="col-md-4">.col-md-4</div>
              <div class="col-md-4 col-md-offset-4">.col-md-4 .col-md-offset-4</div>
            </div>
            <div class="row">
              <div class="col-md-3 col-md-offset-3">.col-md-3 .col-md-offset-3</div>
              <div class="col-md-2 col-md-offset-4">.col-md-2 .col-md-offset-4</div>
            </div>
            <div class="row">
              <div class="col-md-6 col-md-offset-3">.col-md-6 .col-md-offset-3</div>
            </div>
            <div class="row">
              <div class="col-sm-9">
                Level 1: .col-sm-9
                <div class="row">
                  <div class="col-xs-8 col-sm-6">
                    Level 2: .col-xs-8 .col-sm-6
                  </div>
                  <div class="col-xs-4 col-sm-6">
                    Level 2: .col-xs-4 .col-sm-6
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
    
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
  
    
	
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