<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!-- 마이페이지 이벤트 등록 -->

<!-- datepicker용 -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
//datepicker용
$(function(){
	$("#sdatepicker, #edatepicker").datepicker({
		dateFormat:"yy-mm-dd"/*,
		showOn: "both" ,
		buttonImage:"<c:url value='/Images/calendar-icon.jpg'/>",
		buttonImageOnly:false */
		
	});
});
</script>

<br/>
<div style="font-size: 2em; color: gray">이벤트 등록</div>
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

