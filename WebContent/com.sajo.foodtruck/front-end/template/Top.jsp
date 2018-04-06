<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	function popupOpen(){
	var windowW=400;
	var windowH=580;
	var left=Math.ceil((window.screen.width-windowW)/2);
	var top=Math.ceil((window.screen.height-windowH)/2);
	var popUrl = "<c:url value='/com.sajo.foodtruck/front-end/views/login/Login.jsp'/>";	//팝업창에 출력될 페이지 URL
	var popOption = "width="+windowW+", height="+windowH+", resizable=no, scrollbars=no, status=no, left="+left+", top="+top+", location=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
<script type="text/javascript">
	function popupOpen2(){
	var windowW=650;
	var windowH=500;
	var left=Math.ceil((window.screen.width-windowW)/2);
	var top=Math.ceil((window.screen.height-windowH)/2);
	var popUrl = "<c:url value='/com.sajo.foodtruck/front-end/views/member/Join.jsp'/>";	//팝업창에 출력될 페이지 URL
	var popOption = "width="+windowW+", height="+windowH+", resizable=no, scrollbars=no, status=no, left="+left+", top="+top+", location=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
	}
</script>
<script>
	function cart(){
	var user = "${sessionScope.USER_ID}";
	if(user==""){
		alert("로그인 후 이용해주세요.");
	}	
	else if("${sessionScope.USER_TYPE}"=="seller"){
		alert("사업자는 이용할 수 없습니다.");
	}
	else
		var order = confirm("장바구니로 이동하시겠습니까?");
		if(order)
		location.href="<c:url value='/cart.cart'/>";
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
				<a class="navbar-brand" href="<c:url value='/Allevent.event'/>">FOODTRUCK</a>
			</div>
			
			<div id="navbar" class="navbar-collapse collapse">
				<!-- mypage login join -->
				<ul id="top_login" style="margin-bottom: 5px">
					<%if(session.getAttribute("USER_ID") ==null){ %>
				       <li><a href="javascript:popupOpen();">LOGIN</a></li>&emsp;
				        <li><a href="javascript:popupOpen2();">JOIN</a></li>
			        <%}else{ %>
				        <li><a href="javascript:cart()">CART</a></li>&emsp;
				        <li><a href="<c:url value='/Member.page'/>">MYPAGE</a></li>&emsp;
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
							<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/about/FoodTruck.jsp'/>">푸드트럭이란</a></li>
							<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/about/FoodTruck_Introduce.jsp'/>">사이트 소개</a></li>
							<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/about/FoodTruck_Person.jsp'/>">운영진</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">FOODTRUCK
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value='/list.foodtruck?area=all'/>">전체</a></li>
							<!-- <li><a href="#">종류별</a></li> -->
							<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck_list.jsp'/>">지역별</a></li>
						</ul></li>

					<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/map/Findtruck.jsp'/>">FINDTRUCK</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">EVENT
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value='/Homeevent.event'/>">홈페이지 이벤트</a></li>
							<li><a href="<c:url value='/Localevent.event'/>">지역 이벤트</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">COMMUNITY
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/Com.board'/>">손님용 게시판</a></li>
						<li><a href="<c:url value='/Pizza.board'/>">사장님용 게시판</a></li>
						</ul>
					</li>
				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
</header>

<script>
		var width = document.body.scrollWidth;
</script>