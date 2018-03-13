<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function popupOpen(){
	var popUrl = "<c:url value='/com.sajo.foodtruck/front-end/views/login/Login.jsp'/>";	//팝업창에 출력될 페이지 URL
	var popOption = "width=380, height=580, resizable=no, scrollbars=no, status=no, left=800, top=200, location=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	} 
</script>
<script type="text/javascript">
	function popupOpen2(){
	var popUrl = "<c:url value='/com.sajo.foodtruck/front-end/views/member/Join.jsp'/>";	//팝업창에 출력될 페이지 URL
	var popOption = "width=650, height=500, resizable=no, scrollbars=no, status=no, left=600, top=200, location=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
<!-- Fixed navbar -->
<header>
	<nav class="navbar navbar-default navbar-fixed-top" id="top_top"><!--  navbar-fixed-top -->
		<!-- logo -->
		<div class="container" id="top_bar">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value='/com.sajo.foodtruck/front-end/views/main.jsp' />">FOODTRUCK</a>
			</div>
			
			<div id="navbar" class="navbar-collapse collapse">
				<!-- mypage login join -->
				<ul id="top_login" style="margin-bottom: 5px">
					<%if(session.getAttribute("USER_ID") ==null){ %>
				       <li><a href="javascript:popupOpen();">LOGIN</a></li>&emsp;
				        <li><a href="javascript:popupOpen2();">JOIN</a></li>
			        <%}else{ %>
				        <li><a href="#">MYPAGE</a></li>&emsp;
				        <li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/login/Logout.jsp'/>">LOGOUT</a></li>&emsp;
			        <% } %>
				</ul>
				<!-- bar menu -->
				<ul class="nav navbar-nav navbar-right" id="top_menu">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">ABOUT
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">푸드트럭이란</a></li>
							<li><a href="#">사이트 소개</a></li>
							<li><a href="#">운영진</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">FOODTRUCK
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">전체</a></li>
							<li><a href="#">종류별</a></li>
							<li><a href="#">지역별</a></li>
						</ul></li>

					<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/map/Findtruck.jsp'/>">FINDTRUCK</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">EVENT
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value='/com.sajo.foodtruck.event/event.event'/>">공용 이벤트</a></li>
							<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/event/seller_event/Seller_event.jsp'/>">푸드트럭별 이벤트</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">COMMUNITY
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/board/customer/Cuscom.jsp'/>">손님용 게시판</a></li>
						<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/board/seller/Ceocom.jsp'/>">사장님용 게시판</a></li>
						</ul>
					</li>


					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">STARTUP
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">창업 개설절차</a></li>
							<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/startup/board/startupboard.jsp'/>">창업 문의 게시판</a></li>
							<li><a href="#">창업 설명회 신청</a></li>
						</ul></li>
				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
</header>

<script>
		var width = document.body.scrollWidth;
</script>