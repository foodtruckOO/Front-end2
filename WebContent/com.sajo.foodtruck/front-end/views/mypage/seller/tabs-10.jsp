<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 메뉴 등록 -->
<div style="font-size: 2em; color: gray">푸드트럭 정보 등록</div>
<hr>

<style>                                         
	#file { width:0; height:0; }                    
</style>
<script>
var count = 1;
$(function(){
	
	
	$.ajax({ 
		url: '<c:url value="/selectSubImg.page"/>', 
		dataType: 'json', 
		type: 'POST', 
		contentType: false,
		processData: false,
		success: start, 
		error: function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
	});
	
	
	$('#btn-main').click(function(e){
		var flagMain = confirm("푸드트럭 소개를 작성하셨나요?\r\n");
		if(flagMain){
		//파일선택 버튼 큰버튼에 씌우기
		e.preventDefault();             
		$("#fileMain").click();
		$("#fileMain").val().toLowerCase();
		}
		else{
			$('#mainArea').focus();
			return false;
		}
	});
	
	$('#btn-sub').click(function(e){
		if($('tr').length>5) {
			alert("이미지는 최대 5개까지입니다");
			return false;
		}
		//파일선택 버튼 큰버튼에 씌우기
		e.preventDefault();             
		$("#fileSub").click();
		$("#fileSub").val().toLowerCase();
	});
});

var start=function(data){
	for(var i=0; i<data['list'].length; i++){	
	var row = "<tr>"+
	"<td>&emsp;</td>"+
	"<td>"+
		"<img src='http://localhost:8080/Front-end_FoodTruckProj/seller/<%=request.getSession().getAttribute("USER_ID")%>/FOODTRUCKS/"+(data['list'][i])+"' alt='이미지를 찾을 수 없습니다..'"+
		" style='width: 80px; height: 50px; margin-top: 4px' />"+
	"</td>"+
	"<td>"+
		"<p class='name'>"+(data['list'][i])+"</p>"+
	"</td>"+
	"<td>"+
		"이미지 업로드 됨!"+
	"</td>"+
	"<td>"+
		"<button id='"+(data['list'][i])+"' class='btn btn-danger delete' onclick='deleteFunc(this)'>"+
			"<i class='glyphicon glyphicon-trash'></i> <span>삭제</span>"+
		"</button>"+
	"</td>"+
	"</tr>"; 
	$("#subTable").append(row);  
	}
};

	function deleteFunc(test){
		console.log($(test).attr('id'));
		$.ajax({ 
			url: '<c:url value="/Img/Delete.page"/>', 
			data: {"id":$(test).attr('id')},
			dataType: 'json',
			type: 'POST', 
			success: console.log("good"), 
			error: function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
		$(test).parent().parent().hide();
	}
</script>
<script>
    function getImg2(evt){
    	var ext2 = $("#btn-main").val().split(".").pop().toLowerCase();
		if(ext2.length > 0){
			if($.inArray(ext2, ["gif","png","jpg","jpeg"]) == -1) { 
				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
				return false;  
			}                  
		}		
		console.log("hi");

		var formData = new FormData($("#fileuploadMain")[0]);
		$.ajax({ 
			url: '<c:url value="/Img/Main/Upload.page"/>', 
			data: formData,
			dataType: 'json', 
			type: 'POST', 
			contentType: false,
			processData: false,
			success: successCallback2, 
			error: function(request,status,error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
		});
		$('#fileMain').val('');
    }
    
    var successCallback2=function(data){
		console.log(data['name']);
    	
    	var row = "<tr>"+
    	"<td><div class='checkbox'>"+
        "<label hidden>"+
          "<input type='checkbox'>"+
        "</label>"+
		"</div>"+
		"</td>"+
		"<td>"+
			"<img src='http://localhost:8080/Front-end_FoodTruckProj/seller/<%=request.getSession().getAttribute("USER_ID")%>/FOODTRUCKS/MAIN/"+data['name']+"' alt='이미지를 찾을 수 없습니다..'"+
			" style='width: 200px; height: 160px; margin-top: 4px' />"+
		"</td>"+
		"<td>"+
			"<p class='name'>"+data['name']+(count++)+"</p>"+
			"</td>"+
			"<td  colspan='3'>"+
				data['intro']+
			"</td>"+
			"</tr>"; 
		//$("#mainTable").empty();
		//$("#mainTable").append(row);
		var im = "<img src='http://localhost:8080/Front-end_FoodTruckProj/seller/<%=request.getSession().getAttribute("USER_ID")%>/FOODTRUCKS/MAIN/"+data['name']+
					"' alt='이미지를 찾을 수 없습니다..' style='width: 100%; height: 100%; top:0px' />";
    	$("#mainDiv").empty();
    	$("#mainDiv").css("padding-bottom","0px");
    	$("#mainDiv").append(im);
		
	};
</script>
<script>
    function getImg(evt){
    	var ext = $("#btn-sub").val().split(".").pop().toLowerCase();
		if(ext.length > 0){
			if($.inArray(ext, ["gif","png","jpg","jpeg"]) == -1) { 
				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
				return false;  
			}                  
		}		
		var form = new FormData(document.getElementById('fileupload'));
		console.log(form.file);
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
		$('#fileSub').val('');
    }
    
    var successCallback=function(data){
		console.log(data['name']);
    	
    	var row = "<tr>"+"<tr>"+
    	"<td>&emsp;</td>"+
		"<td>"+
			"<img src='http://localhost:8080/Front-end_FoodTruckProj/seller/<%=request.getSession().getAttribute("USER_ID")%>/FOODTRUCKS/"+data['name']+"' alt='이미지를 찾을 수 없습니다..'"+
			" style='width: 80px; height: 50px; margin-top: 4px' />"+
		"</td>"+
		"<td>"+
			"<p class='name'>"+(count++)+data['name']+"</p>"+
		"</td>"+
		"<td>최신 이미지 업로드!!"+
		"</td>"+
		"<td>"+
			"<button id='"+data['name']+"' class='btn btn-danger delete' onclick='deleteFunc(this)'>"+
				"<i class='glyphicon glyphicon-trash'></i> <span>삭제</span>"+
			"</button>"+
		"</td>"+
		"</tr>";
		var plus = $("#subTable");
		$("#subTable").empty(); 
		$("#subTable").append(row); 
		$("#subTable").append(plus); 
		
	};
</script>

<form id="fileuploadMain" action="#"method="POST" enctype="multipart/form-data" style="display: inline;">
	<div style="background-color: red; width: 22%; float: left; padding-bottom: 22%; margin-left: 2%;" id="mainDiv"></div>
	<input type='file' id='fileMain' name='fileMain' accept="image/gif, image/jpeg, image/png" onchange='getImg2(event)' style="display: none">
	<textarea class="form-control" rows="5" name="intro" style="resize: none; width: 72%; float: right;" id="mainArea" p></textarea>
	<br/><br/><br/><br/><br/><br/><br/><span>&emsp;안녕</span>
	<button id='btn-main' type="submit" class="btn btn-primary start" style="float: right; margin-top: 10px;">
		<i class="glyphicon glyphicon-upload"></i> <span>메인이미지 등록</span>
	</button>
	<table id="mainTable" style="width: 100%; margin-top: 20px; margin-bottom: 30px;">
	</table>
</form>
<form id="fileupload" action="#" method="POST" enctype="multipart/form-data" style="display: inline; float: right;">
	<input type='file' id='fileSub' name='file' accept="image/gif, image/jpeg, image/png" onchange='getImg(event)' style="display: none">
	<button id='btn-sub' class="btn btn-success fileinput-button" onfocus="this.blur();">
		<i class="glyphicon glyphicon-upload"></i> <span>서브이미지 등록</span> 
	</button>
</form>
<table id="subTable" style="width: 100%; margin-top: 20px;">
</table>