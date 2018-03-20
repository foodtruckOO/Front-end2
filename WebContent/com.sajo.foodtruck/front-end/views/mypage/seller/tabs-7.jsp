<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!-- 마이페이지 이벤트 등록 -->
<form>
	<div class="form-group">
		<label for="">제목</label>
		<input class="form-control" id="" placeholder="제목을 입력하세요">
	</div>
	<div class="form-group">
		<label for="">내용</label>
		<textarea class="form-control" rows="5"></textarea>
	</div>
	<div class="form-group">
		<label for="exampleInputFile">타이틀 이미지</label>
		<input type="file" id="exampleInputFile">
	</div>
	<div class="form-group">
		<label for="exampleInputFile">첨부 이미지</label>
		<input type="file" id="exampleInputFile" >
	</div>
	<button type="submit" class="btn btn-default">등록</button>
</form>