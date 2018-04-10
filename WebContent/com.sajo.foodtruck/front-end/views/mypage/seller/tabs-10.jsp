<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메뉴 등록 -->
<div style="font-size: 2em; color: gray">푸드트럭 이미지 등록</div>
<hr>

<style>                                         
	#file { width:0; height:0; }                    
</style>
<script>
var count = 1;
$(function(){         
	
	$('#btn-upload').click(function(e){
		//파일선택 버튼 큰버튼에 씌우기
		e.preventDefault();             
		$("input:file").click();           
		var ext = $("input:file").val().split(".").pop().toLowerCase();
		console.log("여기");
		if(ext.length > 0){
			if($.inArray(ext, ["gif","png","jpg","jpeg"]) == -1) { 
				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
				return false;  
			}                  
		}
		$("input:file").val().toLowerCase();
	});
	

});
</script>
<script>
    function getImg(evt){
		var form = new FormData(document.getElementById('fileupload'));
		$.ajax({ 
			url: '<c:url value="/Img/Upload.page"/>', 
			data: form,
			dataType: 'json', 
			type: 'POST', 
			contentType: false,
			processData: false,
			success: successCallback, 
			error: function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
    }
    
    var successCallback=function(data){
		console.log(data['name']);
    	
    	var row = "<tr class='template-upload fade in'>"+
		"<td><span class='preview'><canvas width='80' height='60' style='background-color:red;'></canvas></span>"+
		"</td>"+
		"<td>"+
			"<p class='name'>"+data['name']+(count++)+"</p>"+
			"<strong class='error text-danger'></strong>"+
		"</td>"+
		"<td>"+
			"<p class='size'>879.39 KB</p>"+
			"<div class='progress progress-striped active' role='progressbar'"+
				"aria-valuemin='0' aria-valuemax='100' aria-valuenow='0'>"+
				"<div class='progress-bar progress-bar-success' style='width: 0%;'></div>"+
			"</div>"+
		"</td>"+
		"<td>"+
			"<button class='btn btn-primary start'>"+
				"<i class='glyphicon glyphicon-upload'></i> <span>Start</span>"+
			"</button>"+

			"<button class='btn btn-warning cancel'>"+
				"<i class='glyphicon glyphicon-ban-circle'></i> <span>Cancel</span>"+
			"</button>"+
		"</tr>";
		$("#table").append(row); 
	};
</script>
<form id="fileupload" action="#"method="POST" enctype="multipart/form-data">
	<input type='file' id='file' name='file' onchange='getImg(event)'>
	<button id='btn-upload' class="btn btn-success fileinput-button" onfocus="this.blur();">
		<i class="glyphicon glyphicon-plus"></i> <span>Add files</span> 
	</button>
	
	<button type="submit" class="btn btn-primary start">
		<i class="glyphicon glyphicon-upload"></i> <span>Start upload</span>
	</button>
	<button type="reset" class="btn btn-warning cancel">
		<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel upload</span>
	</button>
	<button type="button" class="btn btn-danger delete" > 
		<i class="glyphicon glyphicon-trash"></i> <span>Delete</span>
	</button>
	
	<table id="table" style="width: 100%; margin-top: 20px;">
	</table>
</form>