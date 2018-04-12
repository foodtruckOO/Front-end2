<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!-- 메뉴 등록 -->
<div style="font-size: 2em; color: gray">메뉴 등록</div>
<hr>
<form action="<c:url value='/updateMenu.page'/>" method="post" enctype="multipart/form-data">
	<div class="form-group">
		<label for="">메뉴명</label>
		<input type="text"  class="form-control" placeholder="제목을 입력하세요" name="fname" value="${food.fname }"/>
	</div>
	<div class="form-group">
		<label for="">음식타입</label>
		<select class="form-control" name="tno" id="selectBox" >
			<c:if test="${empty requestScope.list}" var="flag">
				<option>Error</option>
			</c:if>
			<c:if test="${not flag}">
				<c:forEach var="list" items="${list}" varStatus="loop">
					<option value="${list.tno}">${list.type}</option>
				</c:forEach>
			</c:if>
		</select>
    </div>
    <div class="form-group">
		<label for="">가격</label>
		<input type="text"  class="form-control" placeholder="숫자만 입력됩니다" name="price"
				onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)' style='ime-mode:disabled;'
				value="${food.price }"
		/>
	</div>
	<div class="form-group">
		<label for="">설명</label>
		<textarea class="form-control" rows="5" name="content" style="resize: none;">${food.content }</textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputFile">첨부 이미지</label>
		<input type="file" name="picture" /><p>현재 첨부파일 : ${food.newPicture}</p>
	</div>
	<input type="hidden" value="${food.fno}" name="fno"/>
	<input type="hidden" value="${food.newPicture}" name="newPicture"/>
	<button type="submit" class="btn btn-default" >등록</button>
</form>


<script>
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105) || keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 || keyID == 37 || keyID == 39 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}
</script>