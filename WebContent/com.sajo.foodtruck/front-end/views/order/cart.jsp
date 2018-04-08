<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>

<html lang="ko">
<head>
	
    
	<meta charset="utf-8">	
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>�ֹ��ϱ�</title>
	
	<link rel="stylesheet" href="<c:url value='/com.sajo.foodtruck/front-end/views/order/css/common.css'/>" media="all" />
	<link rel="stylesheet" href="<c:url value='/com.sajo.foodtruck/front-end/views/order/css/contents.css'/>" media="all" />	
	
	<!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
	
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
	<script>
	function del(index){
		//alert(index);
		var del = confirm("�ش� ��ǰ�� �����Ͻðڽ��ϱ�?");
		if(del){
			$.ajax({
				type:"POST",
				url:"<c:url value='/delete.cart'/>",
				data: {f_no : index},
				success:function(data){
					var priceall = $("#priceall").text().replace(",","");
					var price = $("#price-"+index).text().replace(",","");
					price = priceall-0-price;
					price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					$("#priceall").text(price);
					$("button[name="+index+"]").closest("tr").remove();
					alert("�ش� ��ǰ�� �����Ǿ����ϴ�.");							
					
				}
			});		
			
	/* 	var priceall = $("#priceall").text().replace(",","");
		var price = $("#price-"+index).text().replace(",","");
		price = priceall-0-price;
		price = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		$("#priceall").text(price);
		$("button[name="+index+"]").closest("tr").remove();
		alert("�ش� ��ǰ�� �����Ǿ����ϴ�."); */
		
		
		/* alert($("#priceall").text());
		alert($("#price-"+index).text()); */
		
		
		//alert($('#price-'+index).text()); 
		
		}
	}
	function back(){
		history.back();
	}
	
	function order(){
		
		$.ajax({
			type:"POST",
			url:"<c:url value='/search.cart'/>",
			dataType: 'text', 
			success:function(data){
				if(data =="N"){
					alert("��� ��ǰ�� �����ϴ�.");
				}			
				else{
					var order = confirm("��ǰ�� �ֹ��Ͻðڽ��ϱ�?");
					if(order)
					location.href="<c:url value='/order.cart'/>";
				}
			}
		});		
		
		
		
	}
	
	</script>
	<style>
	body{
	margin: 0 auto;}
	</style>
</head>

<body class=" font">
	
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	<!-- wrap -->
	<div id="wrap">
		<!-- header -->
		

<!-- �α��� ������ ���� (user / nonMember) -->


<!-- ����ڰ� �������� �ߴ� ��ǰ������ �����ϸ� ���� -->


<header id="header">
	
</header>
		<!-- //header -->

		<!-- container -->
		<div id="container">
			<!-- contents -->
			<section id="contents">
				<div class="page_top">
				
					
						
							<h2 class="tit">��ٱ���</h2>
					 
				</div>
				
				<div class="cont_inner">
					<div class="table_wrap order_view tr_click">
						<table class="table">
							<caption>�ֹ����� ��</caption>
							<colgroup>
								<col class="menu">
								<col>
								<col class="num">
								<col class="price">
								<col class="btn_td">
							</colgroup>
							<thead>
								<tr>								
									<th scope="col" colspan="2">�ֹ�����</th>
									<th scope="col">����</th>
									<th scope="col">�ݾ�</th>
									<th scope="col"><span class="blind">��ư</span></th>
								</tr>
							</thead>
							<tbody>
									<c:forEach begin="1" var="dto" items="${order}" varStatus="loop">
										<c:if test="${!loop.last}">
											<tr class="menuinfo nooption" idx="62173555" id ="tr-${dto.f_no}">
												
										 	
											<td class="menu">
														<!-- <a href="/menu/homeservice/detail/LB0082" class="thumb "></a> -->
													<a href="/menu/homeservice/detail/LB0082" class="thumb ">
														<span class=""></span><!-- ŵ���������޴� ǥ�þ����� -->
														<img src="<c:url value='/com.sajo.foodtruck/front-end/images/Kim/food/food_list1.jpg'/>" alt="����ũ��" />
													</a>
														
														
											</td>
											<td class="menu_info menuinfo">
														<strong class="t_blk">${dto.fname}</strong>
											</td>
											<td class="num">${dto.num}</td>
											<td class="price">
													<span class="t_price"><strong id ="price-${dto.f_no}"><fmt:formatNumber value='${(dto.price-0)*dto.num}' pattern="#,###"/></strong>��</span>
											</td>
											<td class="btn_td">
											<button onclick="javascript:del(${dto.f_no})" name="${dto.f_no}" class="btn_delete"><span class="blind">���� ��ư</span></button></td>
											</tr>
										</c:if>
									</c:forEach>
						
							</tbody>
							<tfoot>
								<c:forEach begin="1" var="dto2" items="${order}" varStatus="loop">
									<c:if test="${loop.last}">
										<tr>
											<td colspan="3"><p class="total_txt">���� �����ݾ�</p></td>
											<td colspan="2" class="t_right"><span class="t_price cart_tot_price"><strong id="priceall"><fmt:formatNumber value="${dto2.priceall}" pattern="#,###"/></strong>��</span></td>
										</tr>
									</c:if>
								</c:forEach>
							</tfoot>
						</table>						
					</div>
					<br/>
					<div class="btn_txt_wrap">
						<span class="left">
							<a href="javascript:back()" class="btn_txt">����<span>����</span></a>
						</span>
						<span class="right">
							<a href="javascript:order()" id="btn_startOrder" class="btn_txt h60 btn_red" >�ֹ�<span>�ϱ�</span></a>
						</span>		
					</div>
					
				
					
				</div>
			</section>
			
		</div>
		<div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
		</div>
		<!-- footer -->
		





	












		

   


</body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</html>
    