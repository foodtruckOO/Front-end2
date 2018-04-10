<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 
<!-- Begin page content -->
<footer id="footer_footer">
	<div class="container col-xs-6 col-md-4" style="background-color: orange; width: 100%">
		<div style="float: right; padding-top: 10px">푸드트럭소식을 만날 수 있는 공식 SNS 채널
				<img id="im" alt="facebook" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_f.png'/>" style="width: 30px; height: 30px;">
				<img id="im" alt="instagram" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_i.png'/>" style="width: 30px; height: 30px;">
				<img id="im" alt="twitter" src="<c:url value='/com.sajo.foodtruck/front-end/images/sns_t.png'/>" style="width: 30px; height: 30px;">
		</div>
		<div id="footNotice" class="col-xs-6" style="background-color: #ffc253; float: left; width: 65%; height: 30px; margin-top: 1%; padding: 0.4%;">
			<span style="border: 1px solid orange; font-weight: bold; margin-top: 30%">공지사항</span>&emsp;
			<span style="font-weight: bold; margin-top: 30%">03/15(목) 도서문화상품권 결제 일시중단 안내</span>
		</div>
		<div class="page-header col-xs-12" style="margin: -5px;">
			<h5 style="text-align: center;">
				<br/><a href="#"> 인재채용</a><a href="#"> 협력업체등록</a><a href="#"> 공지사항</a> 
				<a href="#"> 고객의 소리</a><a href="#"> 개인정보취급방침</a><a href="#"> 이용약관</a>
			</h5>
		</div>
		<ul class="footer_line col-xs-12" >
			<li>㈜푸드트럭코리아 대표이사 한소인</li>
			<li>경기도 성남시 분당구 판교로 111번길 1</li>
			<li>전화 : 1588-7777</li>
			<li>팩스 : 0123-456-8888</li>
			<br/>
			<li>E-mail : foodtruck@sajo.co.kr</li>
			<li>사업자등록번호 : 220-00-33333호</li>
			<li>통신판매업 신고번호 : 제2018-경기성남-1111호 사업자정보확인</li>
		</ul>
		<p class="col-xs-12">&emsp;&emsp;&emsp;© 2018 FOODTRUCK Korea Corporation AllRights Reserved.</p>
		<img src="<c:url value='/com.sajo.foodtruck/front-end/images/hidden.png'/>" onclick="javascript:location.href='http://localhost:8080/Back-end/backend/pages/Login.jsp';"></img>
	</div>
</footer>