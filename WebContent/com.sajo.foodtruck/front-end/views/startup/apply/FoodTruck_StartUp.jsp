<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Foodtruck:: ver1.0</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
	rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>"
	rel="stylesheet">
<!-- YangGeum template CSS -->
<link rel="stylesheet"
	href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
<!-- Custom styles for this template -->

<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
.bbsList01 {
	border-top: 1px solid #000;
}

div {
	display: block;
}

body {
	color: #707070;
	font-weight: normal;
	font-family: NanumGothic, sans-serif;
	letter-spacing: -0.02pt;
}

.bbsList01 table {
	width: 100%;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	border-left: 1px solid #000000
}

colgroup {
	display: table-column-group;
}

col {
	display: table-column;
}

thead {
	display: table-header-group;
	vertical-align: middle;
}

tr {
	display: table-row;
	vertical-align: inherit;
	border-color: inherit;
}

tbody {
	display: table-row-group;
	vertical-align: middle;
}

p {
	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 0px;
	-webkit-margin-end: 0px;
}

ol, ul, li {
	list-style: none;
}

th, td {
	border: 1px solid silver;
	border-left: 1px solid #000000
}

.wpb_single_image .vc_single_image-wrapper {
	line-height: 0;
}

.wpb_single_image .vc_single_image-wrapper {
	display: inline-block;
	vertical-align: top;
	max-width: 100%;
}

*, legend {
	padding: 0;
}

*, figure, form {
	margin: 0;
}

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

user agent stylesheet
div {
	display: block;
}

.wpb_single_image.vc_align_center {
	text-align: center;
}

.vc_tta.vc_general {
	font-size: 1em;
}

.custom-btn-color>*, .stripe .custom-btn-color>* {
	color: inherit !important;
}

html, body, body.page, .wf-container>* {
	font: normal 14px/26px "Open Sans", Helvetica, Arial, Verdana,
		sans-serif;
	word-spacing: normal;
	color: #72777d;
}

html, body, body.page, .wf-container>* {
	font: normal 14px/26px "Open Sans", Helvetica, Arial, Verdana,
		sans-serif;
	word-spacing: normal;
	color: #72777d;
}

html {
	font-size: 100%;
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
}

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.wpb_single_image .vc_figure {
	max-width: 100%;
}

.wpb_single_image .vc_figure {
	display: inline-block;
	vertical-align: top;
	margin: 0;
	max-width: 100%;
}

article, aside, details, figcaption, figure, footer, header, hgroup, nav,
	section, summary {
	display: block;
}

*, figure, form {
	margin: 0;
}

*, legend {
	padding: 0;
}

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

user agent stylesheet
figure {
	display: block;
	-webkit-margin-before: 1em;
	-webkit-margin-after: 1em;
	-webkit-margin-start: 40px;
	-webkit-margin-end: 40px;
}

.wpb_single_image.vc_align_center {
	text-align: center;
}

.vc_tta.vc_general {
	font-size: 1em;
}

.custom-btn-color>*, .stripe .custom-btn-color>* {
	color: inherit !important;
}

html, body, body.page, .wf-container>* {
	font: normal 14px/26px "Open Sans", Helvetica, Arial, Verdana,
		sans-serif;
	word-spacing: normal;
	color: #72777d;
}

html, body, body.page, .wf-container>* {
	font: normal 14px/26px "Open Sans", Helvetica, Arial, Verdana,
		sans-serif;
	word-spacing: normal;
	color: #72777d;
}

html {
	font-size: 100%;
	-webkit-text-size-adjust: 100%;
	-ms-text-size-adjust: 100%;
}

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

*, *:before, *:after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}
</style>
</head>

<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
	</div>
	<div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
	</div>
	<!-- 내용 시작 -->

	<img 
		src="https://jjudal.com/wp-content/uploads/2017/02/행복창업절차.png"
		class="vc_single_image-img attachment-full" alt=""
		srcset="https://jjudal.com/wp-content/uploads/2017/02/행복창업절차.png 1280w, https://jjudal.com/wp-content/uploads/2017/02/행복창업절차-300x169.png 300w, https://jjudal.com/wp-content/uploads/2017/02/행복창업절차-768x432.png 768w, https://jjudal.com/wp-content/uploads/2017/02/행복창업절차-1024x576.png 1024w, https://jjudal.com/wp-content/uploads/2017/02/행복창업절차-1000x563.png 1000w"
		sizes="(max-width: 1280px) 100vw, 1280px" style="width: 100%;height: 100%">

	<div class="bbsList01" style="padding-bottom: 30px">
		<table border=1
			style='border-left: 0; border-right: 0; border-bottom: 0; border-top: 0;'>
			<colgroup>
				<col width="29.64%">
				<col width="*">
			</colgroup>
			<thead style="color: black; background-color: silver;">
				<tr>
					<th scope="col">구분</th>
					<th scope="col">내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">
						<p style="color: black;">가맹 문의 및 상담</p>
					</th>
					<td>
						<ul>
							<li>홈페이지 또는 전화(02-3412-0781)를 통한 문의 및 지역 담당자 상담</li>

						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row" style="color: black;"><p>상권 분석 및 계약</p></th>
					<td>
						<ul>
							<li><strong>점포개발 및 입지 상권 분석 실시</strong>
								<p>의사 결정, 1차 시장조사&#47;입지지역 상권 분석 및 사업 타당성 분석</p></li>
							<li><strong>최종 협의 및 계약</strong>
								<p>가맹 개설 승인&#47;임대차 계약&#47;가맹계약서, 각종 계약금 지불</p></li>
						</ul>
					</td>
				</tr>
				<tr>
					<th scope="row" style="color: black;"><p>점포 운영 기획, 인테리어 공사</p></th>
					<td>
						<ul>
							<li><strong>점포 실측&#47;설계, 점포 내, 외부 디자인 방향 결정</strong>
								<p>점포 실측 및 설계, 투자비 산출 (시설, 기자재, 초도물품비품)</p></li>
							<li><strong>인테리어 공사</strong>
								<p>인테리어 공사 실시 (공사의 진행 상황에 따라 공사 일정이 변경될 수 있음)</p></li>
							<li><strong>직원 채용&#47;교육 실시</strong>
								<p>본사와 점주님이 함께 협의하여 직원 수급/점주님께서 직접 면접을 진행해 채용/본사 교육 실시</p></li>
							<li><strong>각종 증서 발급</strong>
								<p>소방완비필증&#47;영업신고증(관할 구청 위생과)&#47;사업자 등록증&#47;카드
									승인&#47;위생교육증, 보건증</p></li>
							<li><strong>기자재 및 물품 입고</strong>
								<p>기자재 입고&#47;물품·비품 입고&#47;가오픈 (리허설)</p></li>
						</ul>
					</td>
				</tr>
				<tr class="open">
					<th scope="row" style="color: black;"><p>그랜드 오픈!</p></th>
					<td>
						<ul>
							<li><strong>가맹점 개점</strong>
								<p style="color: black;">그랜드 오픈 및 영업 개시</p></li>
						</ul>
					</td>
				</tr>

			</tbody>
		</table>
	</div>










	<!-- 내용 끝 -->
	<div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
	</div>

	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>