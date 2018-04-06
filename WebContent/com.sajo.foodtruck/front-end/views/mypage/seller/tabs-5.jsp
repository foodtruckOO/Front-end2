<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 정보 수정 -->
<div style="font-size: 2em; color: gray">개인정보수정</div>
<hr>
<script language="javascript">
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrCoordUrl.do)를 호출하게 됩니다.
	var pop = window.open("<c:url value='/com.sajo.foodtruck/front-end/views/mypage/seller/jusoPopup.jsp'/>","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}
function jusoCallBack(roadAddrPart1,addrDetail){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		document.form.addr.value = roadAddrPart1;
		document.form.addr2.value = addrDetail;
		console.log(roadAddrPart1);
} 
</script>

<script>
	$(function(){
		$('#pwd').keyup(function(){
			if($.trim($('#pwd').val())==$('#pwd').val() && centerSpace($('#pwd').val())){
				$('#checkPwd').html('<span style="color:green">사용 가능한 비밀번호</span>');
			}
			else $('#checkPwd').html('<span style="color:red">비밀번호는 공백 사용 불가</span>');
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

<form method="post" name="form" id="form" action="<c:url value='/Info/Update.page'/>">
	<div style="width: 49.5%; float: left; padding: 5%; padding-top: 0%;">
		<div class="form-group">
			<label for="">아이디</label>
			<input class="form-control" name="id" value="<%=session.getAttribute("USER_ID")%>" readonly>
			
		</div>
		<div class="form-group">
			<label for="">비밀번호</label>&emsp; <span id="checkPwd"></span>
			<input type="password" class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력하세요">
		</div>
		<div class="form-group">
			<label for="">확인 비밀번호</label><span id="checkPwd2"></span>
			<input type="password" class="form-control" id="pwd2" name="pwd2" placeholder="비밀번호를  입력하세요">
		</div>
		<div class="form-group">
			<label for="">전화번호</label>
			<input class="form-control" name="tel" value="${seller.tel}">
		</div>
		
		<div class="form-group" style="width: 227%" >
			<label for="" style="position: relative;">주소</label>
			<div>
				<input class="form-control" id="addr" name="addr" value="${seller.addr }" style="width: 85%; margin-bottom:5px; float: left;"  readonly/>
				<input type="button" onClick="goPopup()" class="btn btn-default" value="주소찾기" style="float: right;"/>
				<input class="form-control" id="addr2" name="addr2" value="${seller.addr2 }" style="width: 60%"  readonly/>
            </div>
		</div>
	</div>

	<div style="width: 1%; float: left;">
		<hr style="width: 0.5px; height: 250px; border: 0.5px solid #BFBFBF;">
	</div>
	
	<div style="width: 49.5%; float: right; padding: 5%; padding-top: 0%;">
		<div class="form-group">
			<label for="">사업자이름</label>
			<input class="form-control" name="name" placeholder="사업자 이름" value="${seller.name }">
		</div>
		<div class="form-group">
			<label for="">사업자번호</label>
			<input class="form-control" name="corporate_no" placeholder="402-80-27740" value="${seller.corporate_no }">
		</div>
		<div class="form-group">
			<label for="">점포명</label>
			<input class="form-control" name="tname" placeholder="푸드트럭이름" value="${seller.tname }">
		</div>
	</div>
	<button type="submit" class="btn btn-default" style="margin-left: 90%">등록</button>
</form>