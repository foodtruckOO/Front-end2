<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<!-- 마이페이지 이벤트 등록 -->

<!-- datepicker용 -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
<!-- jQuery -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="<c:url value='/backend/js/jquery.validate.js'/>"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    
<script>
$(":button").click(function(){
	$("#span").html("");
	//console.log("버튼클릭했고, "+$("#sdatepicker").val()+" "+$("#edatepicker").val()+typeof $("#edatepicker").val());
	var sdate = parseInt($("#sdatepicker").val().replace("-", "").replace("-", ""));
	var edate = parseInt($("#edatepicker").val().replace("-", "").replace("-", ""));
	//console.log(edate>sdate?"종료날짜가 더 큼":"시작날짜가 더 큼");
	//console.log(sdate+"  "+$("#sdatepicker").val()+"  "+$("#sdatepicker").val().replace("-", "").replace("-", ""));
	if(sdate>edate){
		dateerror="시작날짜는 종료날짜보다 클 수 없습니다";
		$("#span").html("시작날짜는 종료날짜보다 클 수 없습니다");
	}
	else if($("#frm").valid()){
		dateerror="";
		if(confirm('이대로 작성하시겠습니까?')){
			$("#frm").submit();
		}
	}
});
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
			시작일자 : <input type="text" id="sdatepicker" name="startdate" size="15" value='${s_date}'>
		</div>
		<div style="display: inline-block; position: relative;"align="left">
			종료일자 : <input type="text" id="edatepicker" name="enddate" size="15" value='${s_date}'>
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