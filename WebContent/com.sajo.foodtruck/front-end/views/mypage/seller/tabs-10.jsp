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
$(function(){          
	$('#btn-upload').click(function(e){
		e.preventDefault();             
		$("input:file").click();               
		var ext = $("input:file").val().split(".").pop().toLowerCase();
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

<form id="fileupload" action="#"method="POST" enctype="multipart/form-data">
	<div class="row fileupload-buttonbar">
		<div class="col-lg-7">
			<!-- The fileinput-button span is used to style the file input field as button -->
			<input type='file' id='file' name='file' />
			<button id='btn-upload' class="btn btn-success fileinput-button" onfocus="this.blur();">
				<i class="glyphicon glyphicon-plus"></i> <span>Add files...</span> 
			</button>
			<button type="submit" class="btn btn-primary start">
				<i class="glyphicon glyphicon-upload"></i> <span>Start upload</span>
			</button>
			<button type="reset" class="btn btn-warning cancel">
				<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel upload</span>
			</button>
			<button type="button" class="btn btn-danger delete">
				<i class="glyphicon glyphicon-trash"></i> <span>Delete</span>
			</button>
		</div>
	</div>
</form>
<!-- 
<script type="text/javascript"> 
	$(function() { 
		$("#addTR").click(function () { 
			var row = "<tr>"; 
			row += "<td><input type='text' name='idx[]' value='' /></td>"; 
			row += "<td><span>날 누르면 삭제가 됨</span></td>"; 
			row += "</tr>"; 
			$("#table").append(row); 
		}); 
		$("#table").on("click", "span", function() { 
			$(this).closest("tr").remove(); 
		}); 
	}); 
</script> 
<button id="addTR"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button> 
<a class="glyphicon glyphicon-plus" aria-hidden="true"></span>
<table id="table"> 
	<tr> 
		<td><input type="text" /></td> 
	</tr> 
</table>

 -->

