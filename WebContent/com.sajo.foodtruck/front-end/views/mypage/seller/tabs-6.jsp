<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!-- 메뉴 등록 -->
<br/>
<div style="font-size: 2em; color: gray">메뉴 등록</div>
<hr>
<form>
	<div class="form-group">
		<label for="">제목</label>
		<input class="form-control" id="" placeholder="제목을 입력하세요">
	</div>
	<div class="form-group">
		<label>행사일자</label></br>
		<div style="display: inline-block; position: relative;"align="left">
			시작일자 : <input type="text" id="sdatepicker" name="startdate" size="15" value=''>
		</div>
		<div style="display: inline-block; position: relative;"align="left">
			종료일자 : <input type="text" id="edatepicker" name="enddate" size="15" value=''>
			<span id="span" style="color: red"></span>
		</div>
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

