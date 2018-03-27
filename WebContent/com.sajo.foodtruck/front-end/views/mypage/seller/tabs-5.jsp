<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!-- 정보 수정 -->
<br/>
<div style="font-size: 2em; color: gray">개인정보수정</div>
<hr>
<form>
	<div style="width: 49.5%; float: left; padding: 5%; padding-top: 0%;">
		<div class="form-group">
			<label for="">아이디</label>
			<input class="form-control" id="" placeholder="<%=session.getAttribute("USER_ID")%>"  disabled>
		</div>
		<div class="form-group">
			<label for="">비밀번호</label>
			<input class="form-control" id="" placeholder="비밀번호를 입력하세요">
		</div>
		<div class="form-group">
			<label for="">확인 비밀번호</label>
			<input class="form-control" id="" placeholder="비밀번호를  입력하세요">
		</div>
		<div class="form-group">
			<label for="">전화번호</label>
			<input class="form-control" id="" placeholder="010-0123-4567" value="${seller.tel }">
		</div>
		<div class="form-group" >
			<label for="">주소</label>
			<input class="form-control" id="" placeholder="주소를 입력하세요" style="position: relative; width: 200%" value="${seller.addr }">
			<button type="submit" class="btn btn-default" style="margin-left: 203%;">주소</button>
			<br/>
			<input class="form-control" id="" placeholder="주소를 입력하세요">
		</div>
	</div>

	<div style="width: 1%; float: left;">
		<hr style="width: 0.5px; height: 250px; border: 0.5px solid #BFBFBF;">
	</div>
	
	<div style="width: 49.5%; float: right; padding: 5%; padding-top: 0%;">
		<div class="form-group">
			<label for="">사업자이름</label>
			<input class="form-control" id="" placeholder="사업자 이름" value="${seller.name }">
		</div>
		<div class="form-group">
			<label for="">사업자번호</label>
			<input class="form-control" id="" placeholder="402-80-27740" value="${seller.corporate_no }">
		</div>
		<div class="form-group">
			<label for="">점포명</label>
			<input class="form-control" id="" placeholder="ex)SHEEPGOLD TRUCK" value=${seller.tname }>
		</div>
	</div>
	<button type="submit" class="btn btn-default" style="margin-left: 85%;">등록</button>
</form>

