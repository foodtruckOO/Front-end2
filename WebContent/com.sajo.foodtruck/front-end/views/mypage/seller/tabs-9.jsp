<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 주문 현황 -->
<div style="font-size: 2em; color: gray">주문 현황</div>
<hr>

<c:if test="${empty requestScope.list}" var="flag">
	<h2>주문이 없습니다.</h2>
</c:if>

<c:if test="${not flag}">
	<c:forEach var="list" items="${list}" varStatus="loop">
	<div class="col-sm-4 col-xs-12">
		<div class="panel panel-default text-center">
			<div class="panel-heading">
				<h1>${list.cname}</h1>
	        </div>
			<div class="panel-body">
				<table style="width: 100%">
					<tr>
						<td><strong>${list.fname }</strong></td>
						<td>${list.num }</td>
						<td>${list.price }</td>
					</tr>
					<tr>
						<td><strong>치킨</strong></td>
						<td>2000원</td>
						<td>3개</td>
					</tr>
					<tr>
						<td><strong>고기</strong></td>
						<td>2000원</td>
						<td>2개</td>
					</tr>
				</table>
				<hr/>
				<table style="width: 100%">
					<tr>
						<td><strong>구매자</strong></td>
						<td>콩순이</td>
					</tr>
					<tr>
						<td><strong>전화</strong></td>
						<td>${list.tel}</td>
					</tr>
					<tr>
						<td><strong>요청사항</strong></td>
						<td colspan="2">${list.content }</td>
					</tr>
				</table>
			</div>
			<div class="panel-footer">
				<h3 style="font-weight: bold; font-size: 2em"><img src="<c:url value='/com.sajo.foodtruck/front-end/images/won.png'/>" alt="￦">${list.total }</h3>
				<button class="btn btn-lg">Sign Up</button>
			</div>
		</div>      
	</div>
	</c:forEach>
</c:if>