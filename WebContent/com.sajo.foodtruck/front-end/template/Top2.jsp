<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Fixed navbar -->
<header>
    <nav class="navbar navbar-default navbar-static-top" id="top_top">
	<div class="container" id="top_bar">
		<div class="navbar-header" style="margin-left: -10%">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
			<a class="navbar-brand" href="#">FOODTRUCK</a>
		</div>
		<div id="navbar" class="navbar-collapse collapse" style="text-align: center; margin-right: -10%">

			<ul id="top_login">
				<li><a href="#">MYPAGE</a></li>&emsp;
				<li><a href="#">LOGIN</a></li>&emsp;
				<li><a href="#">JOIN</a></li>
			</ul>

			<ul class="nav navbar-nav navbar-right" id="top_menu">
			
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">ABOUT
						<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">푸드트럭이란</a></li>
						<li><a href="#">사이트 소개</a></li>
						<li><a href="#">운영진</a></li>
					</ul>
				</li>
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">FOODTRUCK
						<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">전체</a></li>
						<li><a href="#">종류별</a></li>
						<li><a href="#">지역별</a></li>
					</ul>
				</li>
				
				<li><a href="#">FINDTRUCK</a></li>
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">EVENT
						<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">공용 이벤트</a></li>
						<li><a href="#">푸드트럭별 이벤트</a></li>
					</ul>
				</li>
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">COMMUNITY
						<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">손님용 게시판</a></li>
						<li><a href="#">사장님용 게시판</a></li>
					</ul>
				</li>
				
				
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">STARTUP
						<span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">창업 개설절차</a></li>
						<li><a href="#">창업 문의 게시판</a></li>
						<li><a href="#">창업 설명회 신청</a></li>
					</ul>
				</li>
			</ul>

		</div>
		<!--/.nav-collapse -->
	</div>
</nav>
</header>