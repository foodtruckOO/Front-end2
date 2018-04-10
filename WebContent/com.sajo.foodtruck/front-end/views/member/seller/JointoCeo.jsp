<%@page import="com.sajo.foodtruck.map.mapDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.sajo.foodtruck.map.mapDAO"%>
<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- <%@ include file="/com.sajo.foodtruck/front-end/Common/IsMember.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko">
<!-- JQuery CDN 호출 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 소재지 js 호출 -->
<script src="<c:url value='/com.sajo.foodtruck/front-end/views/map/sojaeji.js'/>"></script>
<script src='https://www.google.com/recaptcha/api.js'></script>
  <head> 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Foodtruck:: ver1.0</title>

	<style type="text/css">
body, html {
    height: 100%;
    background-repeat: no-repeat;
}

.card-container.card {
    max-width: 530px;
    padding: 40px 40px;
}
  
.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
	padding: 20px 25px 30px;
    margin: auto 25px;
    margin-top: 20px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #inputid,
.form-signin #inputname,
.form-signin #inputpass,
.form-signin #inputpass2,
.form-signin #phonenumber{
    direction: ltr;
    height: 44px;
    font-size: 16px;
}

.form-signin input[type=text],
.form-signin input[type=password],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}

.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}
</style>

    <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
     <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
    <!-- Custom styles for this template -->    
	 
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
function pwdCheck(){
	var pwd = document.getElementById("inputpass").value;
	var pwdcheck = document.getElementById("inputpass2").value;
	if(pwd == pwdcheck){
		document.getElementById("same").innerHTML="비밀번호가 일치 합니다"
		document.getElementById("same").style.color="green"
	}
	else{
		document.getElementById("same").innerHTML="비밀번호가 일치하지 않습니다."
		document.getElementById("same").style.color="red"
	}
}

</script>
<script language="javascript">
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
	var pop = window.open("jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2){//,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo,entX,entY){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.roadAddrPart1.value = roadAddrPart1;
		document.form.roadAddrPart2.value = roadAddrPart2;
		document.form.addrDetail.value = addrDetail;		
} 
</script>
<script>
$(function(){
	$('#inputid').keyup(function(){
		if($.trim($('#inputid').val())!="" && $.trim($('#inputid').val())==$('#inputid').val() && centerSpace($('#inputid').val())){
			$.ajax({
				type:"POST",
				url:"../idcheck.jsp",
				data:{"id":$('#inputid').val()},
				success:function(data){
					if($.trim(data)=="NO"){
					//alert('사용불가');
					$('#checkok').html('<p style="font-size:14px; color:red">사용중인 아이디 입니다</p>');
					}
					else{
					//alert('사용가능');
					$('#checkok').html('<p style="font-size:14px; color:green">사용가능한 아이디 입니다</p>');
					}	
				}
			});
		}
		else $('#checkok').html('<p style="font-size:15px; color:red">아이디에 공백 사용 불가</p>');
	});
});
function centerSpace(string){
	for(var i=0;i<string.length;i++){
		if(string.charAt(i)==' '){
			return false;//
		}
	}
	return true;
}
</script> 
  </head>
<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
    </div>
    <div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp"/>
    </div>
	<section style="margin-top:60px; margin-bottom:80px;">
	<div class="container">
        <div class="card card-container">
        <h3>사업자 회원가입</h3><hr style="border: solid 1px #FE9A2E;">
            <p id="profile-name" class="profile-name-card"></p>
            <form class="form-signin" method="post" name="form" id="form" action="../SellerJoinProcess.jsp">
                <span id="reauth-email" class="reauth-email"></span>
                <label>아이디</label>
                <input type="text" id="inputid" class="form-control" placeholder="아이디를 입력해주세요" name="id" strequired autofocus>
				<span id="checkok"></span><br>
                <label>비밀번호</label>
                <input type="password" id="inputpass" class="form-control" placeholder="비밀번호를 입력해주세요" name="pwd" onchange="pwdCheck()" required>
                <label>비밀번호 확인</label>
                <input type="password" id="inputpass2" class="form-control" placeholder="비밀번호를 입력해주세요" name="pwdcheck" onchange="pwdCheck()" required><span id="same"></span><br><br>
                <label>사업자번호</label>
                <input type="text" id="inputsaupno" class="form-control" placeholder="ex)123-45-67890" name="fno" required>
                <label>대표명</label>
                <input type="text" id="ownername" class="form-control" placeholder="이름(대표자 성함)을 입력해주세요" name="name" required>
                <label>점포명</label>
                <input type="text" id="inputtruckname" class="form-control" placeholder="점포명을 입력해주세요" name="tname" required>
                <label>연락처</label>
                <input type="text" id="phonenumber" class="form-control" placeholder="연락처를입력해주세요" name="phone" required>
                <label>주소</label>
               	<input type="button" onClick="goPopup();" class="form-control" value="주소찾기"/>
				<input type="hidden" class="form-control" id="roadFullAddr" name="roadFullAddr" /><br>
				도로명주소 <input type="text" class="form-control" id="roadAddrPart1" name="roadAddrPart1" readonly/><br>
				고객입력 상세주소<input type="text" class="form-control" id="addrDetail" name="addrDetail" readonly/><br>
				<input type="hidden" class="form-control" id="roadAddrPart2" name="roadAddrPart2" /><br>
				
                
                <label>업종선택</label>
                <p style="font-size: 0.8em; color: red;">*다중선택 가능</p>
                <div class="checkbox" style="text-align: center">
                	<label>
				    <input type="checkbox" value="">한식
				    </label>&emsp;
				    <label>
				    <input type="checkbox" value="">일식
				    </label>&emsp;
				    <label>
				    <input type="checkbox" value="">중식
				    </label>&emsp;<br><br>
				    <label>
				    <input type="checkbox" value="">양식
				    </label>&emsp;
				    <label>
				    <input type="checkbox" value="">퓨전
				    </label>&emsp;
				    <label>
				    <input type="checkbox" value="">기타
				    </label>&emsp;
				</div><br>
                <button class="btn btn-lg btn-primary btn-block btn-signin" type="submit">완료</button>
            </form><!-- /form -->     
        </div><!-- /card-container -->
    </div><!-- /container -->
    </section>
    <!-- footer -->
    <section>
		<article>
			<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
	 	</article>
    </section>
	<!-- 내용 끝 -->
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>