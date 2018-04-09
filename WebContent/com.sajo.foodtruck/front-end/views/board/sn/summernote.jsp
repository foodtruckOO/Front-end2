<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<script src='//cdnjs.cloudflare.com/ajax/libs/jquery.form/3.51/jquery.form.min.js'></script>

<!-- include summernote -->
<link rel="stylesheet" href="<c:url value='/com.sajo.foodtruck/front-end/views/board/sn/dist/summernote.css'/>">
<script type="text/javascript" src="<c:url value='/com.sajo.foodtruck/front-end/views/board/sn/dist/summernote.js'/>"></script>
<!-- include summernote-ko-KR -->
<script src="<c:url value='/com.sajo.foodtruck/front-end/views/board/sn/dist/lang/summernote-ko-KR.js'/>"></script>
 
</head>
<body>
	<div id="summernote">에디터</div>
	<div>
		<p style="text-align:center;">
			<a href="javascript:save();" class="btn btn-primary">에디터1</a> 
			<a href="javascript:default_value();" class="btn btn-default">에디터2</a>
		</p>
	</div>
	<form name="inform" id="inform" method="post" action="summernote_result.php">
		<input type="hidden" name="content" id="content" value="" />
	</form>
<script>
$(document).ready(function() {
	$('#summernote').summernote({
		height:300,
		minHeight:100,
		maxHeight:null,
		focus:true,
		lang: 'ko-KR',
		callbacks: {
			onImageUpload: function(files, editor, welEditable){
				sendFile(files[0], editor, welEditable);
			}
		}
	});

	function sendFile(file, editor, welEditable) {
		var data = new FormData();
		data.append("uploadFile", file);
		$.ajax({
			data: data,
			type: "POST",
			url: "",
			enctype: 'multipart/form-data',
			cache: false,
			contentType: false,
			processData: false,
			success: function(url){
				//data = jQuery.parseJSON(dd);
				editor.insertImage(welEditable, url);
				if(data.status == "OK"){
					editor.summernote('insertImage', data.url);
				} else {
					alert(data.message);
				}
			},
			error: function(data){
				console.log(data);
			}
		});
	}
});

function save(){
	var markupStr = $('#summernote').summernote('code');
	$("#content").val(markupStr);
	$("#inform").submit();
}

function default_value(){
	var markupStr = 'ëí´í¸ ê°';
	$('#summernote').summernote('code', markupStr);
}
$(document).ready(function() {
	  $('#summernote').summernote();
	});
</script>
</body>
</html>
