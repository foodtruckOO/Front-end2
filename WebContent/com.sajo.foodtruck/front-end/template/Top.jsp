<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
@media screen and (max-width: 400px){
		#top_bar{width: 95% !important}
}

</style>
<script>
	if("${sessionScope.USER_TYPE}"=="seller"){
		timer = setInterval( function() {
			$.ajax({
				type:"POST",
				url:"<c:url value='/check.order'/>",
				dataType:'text',
				success:function(data){
					if(data=="Y"){
					alert("확인하지 않은 주문이 있습니다. 확인해주세요");
					location.href="<c:url value='/edit.order'/>"
					}					
				}
			});		
		

			
			
		}, 30000); // 30초에 한번씩 받아온다.
	}
</script>
<script>
if("${sessionScope.USER_TYPE}"=="seller"){
	timer = setInterval( function() {
		$.ajax({
			type:"POST",
			url:"<c:url value='/timecheck.order'/>",
			dataType:'text',
			success:function(data){
				if(data=="30"){
				alert("30분 남은 주문이 있습니다 확인해주세요");
				}
				else if(data=="10"){
				alert("10분 남은 주문이 있습니다 확인해주세요");
				}
			}
		});		
	

		
		
	}, 20000); // 20초에 한번씩 받아온다.
}

</script>

<!-- Fixed navbar -->
<header>
	<nav class="navbar navbar-default navbar-fixed-top" id="top_top"><!--  navbar-fixed-top -->
		<!-- logo -->
		<div class="container" id="top_bar" style="border-bottom: 2px orange solid; width: 70%;">
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
				       <li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/login/Login.jsp'/>">LOGIN</a></li>&emsp;
				        <li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/member/Join.jsp'/>">JOIN</a></li>
			        <%}else{ %>
				        <li><a id="top_my_small" href="javascript:cart()">CART</a></li>&emsp;
				        <li><a id="top_my_small" href="<c:url value='/Member.page'/>">MYPAGE</a></li>&emsp;
				        <li><a id="top_my_small" href="<c:url value='/com.sajo.foodtruck/front-end/views/login/Logout.jsp'/>">LOGOUT</a></li>&emsp;
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
							<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/foodtruck/all/Foodtruck_list.jsp'/>">지역별</a></li>
						</ul></li>

					<li><a href="<c:url value='/com.sajo.foodtruck/front-end/views/map/Findtruck.jsp'/>">FINDTRUCK</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">EVENT
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value='/Homeevent.event'/>">홈페이지 이벤트</a></li>
							<li><a href="<c:url value='/Localevent.event'/>">지역 이벤트</a></li>
							<li><a href="<c:url value='/SellerEvent.event'/>">푸드트럭별 이벤트</a></li>
						</ul></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">COMMUNITY
							<span class="caret"></span>
					</a>
						<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/Customlist.board'/>">손님용 게시판</a></li>
						<li><a href="<c:url value='/Sellerlist.board'/>">사장님용 게시판</a></li>
						</ul>
					</li>
				</ul>

			</div>
			<!--/.nav-collapse -->
		</div><!--<hr style="border: solid 1px #FE9A2E;"> -->
	</nav>
</header>

<script>
		var width = document.body.scrollWidth;
</script>