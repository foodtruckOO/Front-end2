<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css"
	href="<c:url value ='/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck.css'/>" />
	<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>
	$(function(){
		if("${area}".length)
			if("${area}" == 'seoul')
					$('option:eq(1)').attr("selected","selected");
			else if("${area}" == 'incheon')
					$('option:eq(2)').attr("selected","selected");
			else if("${area}" == 'gyeonggi')
					$('option:eq(3)').attr("selected","selected");
			else if("${area}" == 'daejeon')
					$('option:eq(4)').attr("selected","selected");
			else if("${area}" == 'daegu')
					$('option:eq(5)').attr("selected","selected");
			else if("${area}" == 'busan')
					$('option:eq(6)').attr("selected","selected");
			else if("${area}" == 'gita')
				$('option:eq(7)').attr("selected","selected");
		
				
	});
	
	
	
	function myFunction() {
	document.getElementById("myDropdown").classList.toggle("show");
	document.getElementById("myDropdown-i").classList.toggle("show")
	}
	function viewFilter() {
		var area1 =$("#area").val();
		location.href ="<c:url value='/area.foodtruck?area="+area1+"'/>";
			
	}

</script>
		<style>
			body {
			min-height: 2000px;
			padding-top: 100px;
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
		<div id="content" class="container-fluid">
				<div class="jumbotron" style="background-color: white !important;">
					<img class="img-fluid"
						src="<c:url value= '/com.sajo.foodtruck/front-end/images/logo.jpg'/>" />
					<h1 style="display: inline; line-height: 150%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;전체 메뉴</h1>
				</div>
			
			
				<div class="row taste_dropdown_wrap">
					<div class="taste_dropdown">
						<button class="more_btn_span taste_dropbtn col-xs-12"
							onclick="myFunction()">
							<span class="more_btn_span">지역전체보기</span> <i
								class="fa fa-angle-down" aria-hidden="true"></i>
						</button>
						<div id="myDropdown" class="taste_dropdown-content">
							<i id="myDropdown-i" class="fa fa-angle-up dropdown-i visible-xs"
								onclick="myFunction()" aria-hidden="true"
								style="text-align: right"></i>
							<div>
								<span>전국</span>
								<ul>
									<li><a href="#">전체</a></li>
								</ul>
							</div>
							<div>
								<span>서울</span>
								<ul>
									<li><a href="#">전체</a></li>
									<li><a href="#">강동/천호</a></li>
									<li><a href="#">홍대/마포</a></li>
									<li><a href="#">종로/대학로</a></li>
									<li><a href="#">여의도/영등포</a></li>
									<li><a href="#">압구정/신사</a></li>
									<li><a href="#">신촌/이대</a></li>
									<li><a href="#">수유/동대문</a></li>
									<li><a href="#">송파/잠실</a></li>
									<li><a href="#">명동/이태원</a></li>
									<li><a href="#">노원/강북</a></li>
									<li><a href="#">교대/사당</a></li>
									<li><a href="#">관악/신림</a></li>
									<li><a href="#">건대/왕십리</a></li>
									<li><a href="#">강서/목동</a></li>
									<li><a href="#">강남/논현</a></li>
									<li><a href="#">삼성/선릉</a></li>
									<li><a href="#">기타</a></li>
								</ul>
							</div>
							<div>
								<span>인천</span>
								<ul>
									<li><a href="#">전체</a></li>
								</ul>
							</div>
							<div>
								<span>경기</span>
								<ul>
									<li><a href="#">전체</a></li>
									<li><a href="#">용인/분당/수원</a></li>
									<li><a href="#">안양/안산/광명</a></li>
									<li><a href="#">남양주/구리/하남</a></li>
									<li><a href="#">인천/부천</a></li>
									<li><a href="#">일산/파주</a></li>
									<li><a href="#">기타</a></li>
								</ul>
							</div>
							<div>
								<span>대전</span>
								<ul>
									<li><a href="#">전체</a></li>
								</ul>
							</div>
							<div>
								<span>대구</span>
								<ul>
									<li><a href="#">전체</a></li>
								</ul>
							</div>
							<div>
								<span>부산</span>
								<ul>
									<li><a href="#">전체</a></li>
								</ul>
							</div>
							<div>
								<span>기타지역</span>
								<ul>
									<li><a href="#">전체</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="dq_select_box">
						<select class="dq_select form-control solo" name="_area1" id = "area"
							onchange="viewFilter()">
							<option class="dq_select_op" value="all">전국</option>
							<option class="dq_select_op" value="seoul">서울</option>
							<option class="dq_select_op" value="incheon">인천</option>
							<option class="dq_select_op" value="gyeonggi">경기</option>
							<option class="dq_select_op" value="daejeon">대전</option>
							<option class="dq_select_op" value="daegu">대구</option>
							<option class="dq_select_op" value="busan">부산</option>
							<option class="dq_select_op" value="gita">기타지역</option>
						</select>
					</div>
					<div class="dq_select_box"></div>
					<div class="taste_sort_wrap">
						<button class="sort_btn active" data-order=""
							onclick="viewOrdered(this)">
							<span style="background-color: #ff4081"></span><span
								style="color: #ff4081">신규등록순</span>
						</button>
						<button class="sort_btn active" data-order="hot"
							onclick="viewOrdered(this)">
							<span style=""></span><span style="color:#ff4081">인기순</span>
						</button>
					</div>
				</div>
				<div class="row">
					<c:forEach items="${foodtruck}" var ="dto">
						<div class="taste_card col-sm-3 col-xs-6 ">
							<div class="card_img_wrap" style="position: relative;">
								<div class="card_img_wrap_thumbnail a">
									<a href="<c:url value='/detail1.foodtruck?s_no=${dto.s_no}'/>">
									<img src="<c:url value='/com.sajo.foodtruck/front-end/images/${dto.id}/${dto.img}'/>"width="100%" /> </a>
								</div>
							</div>
							<div class="card_content">
								<div class="title_main title clearfix">${dto.tname}</div>
								<div class="date">
									<span class="pin a"><i class="fa fa-map-marker"
										aria-hidden="true"></i>&nbsp;
											<c:set var ="addrs" value='${fn:split(dto.addr," ")}'/>
												<c:forEach var = "addr" items="${addrs}" end="1">
													${addr}&nbsp;
												</c:forEach>
									</span>
								</div>
							</div>
						</div>
					</c:forEach>
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