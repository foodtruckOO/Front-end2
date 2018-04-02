<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   


<!DOCTYPE HTML>
<html lang="ko">
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Foodtruck:: ver1.0</title>
	<!-- style -->
	<link rel="stylesheet" href="<c:url value='/com.sajo.foodtruck/front-end/views/order/css/common.css'/>" media="all" />
	<link rel="stylesheet" href="<c:url value='/com.sajo.foodtruck/front-end/views/order/css/contents.css'/>" media="all" />
	
	 <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
	

	<!-- javascript -->
	<!-- <script src="../resources/js/common/jquery-1.12.4.min.js"></script>
	<script src="../resources/js/common/jquery-migrate-1.3.0.min.js"></script>
	<script src="../resources/js/common/jquery-ui.min.js"></script>
 -->

	<!-- <script src="../resources/js/plugins.js"></script>
	<script src="../resources/js/ui_script19fa.js"></script>
	<script src="../resources/js/ui19fa.js"></script> -->
	
	<!-- //javascript -->
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

#test {
    float: right;
    position: relative;
    left: -50%;
}
#test li {
    float: left;
    position: relative;
    left: 50%;
}
</style>

</head>
<header id = "header">
	
</header>
<body class="ENG font ">

	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	
	
	<!-- wrap -->
	<div id="wrap">
		<div id="container" class="container">
			<!-- contents -->
			<section id="contents">
				<div class="page_top">
					<input id="menuType" type="hidden" value="homeservice">
							<h3 id="page_tit" class="tit">�ֹ��ϱ�</h3>
				</div>
					<div id="recommend" class="menu_sec">
						<h4 class="line_tit"><span>�ָ޴�</span></h4>
						<div class="menu_wrap">
							<div class="swiper-container">
								<ul class="menu_list swiper-wrapper" id="test">
									
									<!-- <script type="text/javascript">alert(3400.0000);</script>  -->
											<li class="menuinfo swiper-slide">
										
											<div>
												<a href="<c:url value='/com.sajo.foodtruck/front-end/views/order/detail1.jsp'/>" class="img"> 
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>" alt="BIG CHICKEN BUR" data-animation="zoomIn" width="" height=""/>
												</a> 
												
												<!-- ��� �����ϸ� .btn_plus�� onŬ���� �ο�, ��� ���ڴ� strong�±׾����� -->
												<!-- <p class="btn_plus on"><a href="#"><strong>1</strong><span class="blind">���</span></a></p> -->
												<!-- <p class="btn_plus"><a href="#"><strong></strong><span class="blind">���</span></a></p> -->
												
													<p class="menu_name" title="BIG CHICKEN BUR">BIG CHICKEN BUR</p>
														<!-- <script type="text/javascript">alert(0.0000);</script> -->
												<p class="menu_price"><strong>3,700��</strong></p>
												
										<div class="opt">
													 
											<div class="sel_list">
														<a href="javascript:void(0)">
															<strong>3,700��</strong>
														</a>
											</div>													
													<p class="btn_area">
														<a href="javascript:void(0)" class="btn btn_cart add_cart">
															<span>��ǰ ���</span>
															<!-- <span>��ǰ���</span> -->
														</a>
														<a href="javascript:void(0)" class="btn btn_buy btn_Order">
															<span>�ٷ� �ֹ�</span>
															<!-- <span>�ٷ��ֹ�</span> -->
														</a>
													</p>
												</div>
											</div>
										</li>
										
										<li class="menuinfo swiper-slide">
										
											<div>
												<a href="homeservice/detail/detail1.html" class="img"> 
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>" alt="BIG CHICKEN BUR" data-animation="zoomIn" />
												</a> 
												
												
												
													<p class="menu_name" title="BIG CHICKEN BUR">BIG CHICKEN BUR</p>
														<!-- <script type="text/javascript">alert(0.0000);</script> -->
												<p class="menu_price"><strong>3,700��</strong></p>
												
										<div class="opt">
													 
											<div class="sel_list">
														<ul data-value='composition_'>
													<!-- Ÿ�Ӽ��� ���� ó�� �߰� 20171025 ������ -->
																<li class="on">
															
																	<a href="javascript:void(0)">
																		<span>Single</span>
																		<strong>3,700��</strong>
																	</a>
																
																</li>
																<li>
																	<a href="javascript:void(0)">
																		<span>Set</span>
																		<strong>6,000��</strong>
																	</a>
																</li>
														</ul>
														<a href="javascript:void(0)">
															<span>Single</span>
															<strong>3,700��</strong>
														</a>
											</div>													
													<p class="btn_area">
														<a href="javascript:void(0)" class="btn btn_cart add_cart">
															<span>Add to Cart</span>
															<!-- <span>��ǰ���</span> -->
														</a>
														<a href="javascript:void(0)" class="btn btn_buy btn_Order">
															<span>Direct order</span>
															<!-- <span>�ٷ��ֹ�</span> -->
														</a>
													</p>
												</div>
											</div>
										</li>
										
										<li class="menuinfo swiper-slide">
										
											<div>
												<a href="homeservice/detail/detail1.html" class="img"> 
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>" alt="BIG CHICKEN BUR" data-animation="zoomIn" />
												</a> 
												
												<!-- ��� �����ϸ� .btn_plus�� onŬ���� �ο�, ��� ���ڴ� strong�±׾����� -->
												<!-- <p class="btn_plus on"><a href="#"><strong>1</strong><span class="blind">���</span></a></p> -->
												<!-- <p class="btn_plus"><a href="#"><strong></strong><span class="blind">���</span></a></p> -->
												
													<p class="menu_name" title="BIG CHICKEN BUR">BIG CHICKEN BUR</p>
														<!-- <script type="text/javascript">alert(0.0000);</script> -->
												<p class="menu_price"><strong>3,700��</strong></p>
												
										<div class="opt">
													 
											<div class="sel_list">
														<ul data-value='composition_'>
													<!-- Ÿ�Ӽ��� ���� ó�� �߰� 20171025 ������ -->
																<li class="on">
															
																	<a href="javascript:void(0)">
																		<span>Single</span>
																		<strong>3,700��</strong>
																	</a>
																
																</li>
																<li>
																	<a href="javascript:void(0)">
																		<span>Set</span>
																		<strong>6,000��</strong>
																	</a>
																</li>
														</ul>
														<a href="javascript:void(0)">
															<span>Single</span>
															<strong>3,700��</strong>
														</a>
											</div>													
													<p class="btn_area">
														<a href="javascript:void(0)" class="btn btn_cart add_cart">
															<span>��ǰ ���</span>
															<!-- <span>��ǰ���</span> -->
														</a>
														<a href="javascript:void(0)" class="btn btn_buy btn_Order">
															<span>Direct order</span>
															<!-- <span>�ٷ��ֹ�</span> -->
														</a>
													</p>
												</div>
											</div>
										</li>
										<li class="menuinfo swiper-slide">
										
											<div>
												<a href="homeservice/detail/detail1.html" class="img"> 
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>" alt="BIG CHICKEN BUR" data-animation="zoomIn" />
												</a> 
												
												<!-- ��� �����ϸ� .btn_plus�� onŬ���� �ο�, ��� ���ڴ� strong�±׾����� -->
												<!-- <p class="btn_plus on"><a href="#"><strong>1</strong><span class="blind">���</span></a></p> -->
												<!-- <p class="btn_plus"><a href="#"><strong></strong><span class="blind">���</span></a></p> -->
												
													<p class="menu_name" title="BIG CHICKEN BUR">BIG CHICKEN BUR</p>
														<!-- <script type="text/javascript">alert(0.0000);</script> -->
												<p class="menu_price"><strong>3,700��</strong></p>
												
										<div class="opt">
													 
											<div class="sel_list">
														<ul data-value='composition_'>
													<!-- Ÿ�Ӽ��� ���� ó�� �߰� 20171025 ������ -->
																<li class="on">
															
																	<a href="javascript:void(0)">
																		<span>Single</span>
																		<strong>3,700��</strong>
																	</a>
																
																</li>
																<li>
																	<a href="javascript:void(0)">
																		<span>Set</span>
																		<strong>6,000��</strong>
																	</a>
																</li>
														</ul>
														<a href="javascript:void(0)">
															<span>Single</span>
															<strong>3,700��</strong>
														</a>
											</div>													
													<p class="btn_area">
														<a href="javascript:void(0)" class="btn btn_cart add_cart">
															<span>Add to Cart</span>
															<!-- <span>��ǰ���</span> -->
														</a>
														<a href="javascript:void(0)" class="btn btn_buy btn_Order">
															<span>Direct order</span>
															<!-- <span>�ٷ��ֹ�</span> -->
														</a>
													</p>
												</div>
											</div>
										</li>
								</ul>
							</div>
						</div>
					</div>
				
					<div id="beverage" class="menu_sec">
						<h4 class="line_tit"><span>���̵� �޴�</span></h4>
						<div class="menu_wrap">
							<div class="swiper-container">
								<ul class="menu_list swiper-wrapper" id="test">
									
									<!-- <script type="text/javascript">alert(0.0000);</script>  -->
										<li class="menuinfo swiper-slide">
										
											<div>
												<a href="homeservice/detail/242902.html" class="img"> 
													
													
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/menu_list1.jpg'/>" alt="ORANGE-H/S" data-animation="zoomIn" />
													
													
												</a> 
												
												<!-- ��� �����ϸ� .btn_plus�� onŬ���� �ο�, ��� ���ڴ� strong�±׾����� -->
												<!-- <p class="btn_plus on"><a href="#"><strong>1</strong><span class="blind">���</span></a></p> -->
												<!-- <p class="btn_plus"><a href="#"><strong></strong><span class="blind">���</span></a></p> -->
												
												
												
													<p class="menu_name" title="ORANGE-H/S">ORANGE-H/S</p>
												

												
													
														
														
														
														<!-- <script type="text/javascript">alert(0.0000);</script> -->
												<!-- Ÿ�Ӽ��� ���� ó�� �߰� 20171025 ������ -->
												<p class="menu_price"><strong>2,500��</strong></p>
										<div class="opt">
											<div class="sel_list">
														<ul data-value='composition_'>
													<!-- Ÿ�Ӽ��� ���� ó�� �߰� 20171025 ������ -->
																<li class="on">
															
																	<a href="javascript:void(0)">
																		<span>Single</span>
																		<strong>2,500��</strong>
																	</a>
																
																</li>
														</ul>
													<!-- Ÿ�Ӽ��� ���� ó�� �߰� 20171025 ������ -->	
														<a href="javascript:void(0)">
															<span>Single</span>
															<strong>2,500��</strong>
														</a>
											</div>													
													<p class="btn_area">
														<a href="javascript:void(0)" class="btn btn_cart add_cart">
															<span>Add to Cart</span>
															<!-- <span>��ǰ���</span> -->
														</a>
														<a href="javascript:void(0)" class="btn btn_buy btn_Order">
															<span>Direct order</span>
															<!-- <span>�ٷ��ֹ�</span> -->
														</a>
													</p>
												</div>
											</div>
										</li>
								</ul>
							</div>
						</div>
					</div>
			</section>
			<!-- //contents -->

		</div>
		<!-- //container -->

	<div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
	</div>
	





	



	</div>
	

	
</body>
 	
 	
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
<!-- Mirrored from mobilehome.lotteria.com/menu/homeservice by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 27 Mar 2018 04:22:58 GMT -->
</html>
    