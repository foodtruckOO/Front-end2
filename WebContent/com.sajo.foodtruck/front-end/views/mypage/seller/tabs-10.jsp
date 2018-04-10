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
		if(ext.length > 0){
			if($.inArray(ext, ["gif","png","jpg","jpeg"]) == -1) { 
				alert("gif,png,jpg 파일만 업로드 할수 있습니다.");
				return false;  
			}                  
		}
		$("input:file").val().toLowerCase();
	});
	
	$("#table").on("click", "span", function() { 
		$(this).closest("tr").remove(); 
	});
	
	
	$('#btn2').click(function(){
		$.ajax(
				{
					url:'<c:url value="/Event/Upload.page"/>',//요청할 서버의 URL주소
					type:'post',//데이타 전송방식(디폴트는 get방식) 
					dataType:'text',//서버로 부터 응답 받을 데이타의 형식 설정
					
					data:
						//1]쿼리스트링 문자열로 전송-데이타가 적을때
						//'id='+$(':input:eq(0)').val()+'&pwd='+$(":input:eq(1)").val(),
						//2]JSON데이타 형식으로 전달-데이타가 적을때
						//{id:$(':text').val(),pwd:$(":password").val()},
						//3]$("form선택자").serialize()함수 사용-데이타가 많을때
						$('#frm').serialize(),
					success:function(data){//서버로부터 정상적인 응답을 받았을때 처리할 함수
						console.log('서버로 부터 받은 데이타:',data);
						/*여기안에 요청 결과를 표시해줄 코드 구현]
				     	서버로부터 정상적으로 응답을 받을때
					 	자동으로 호출되는 콜백 메소드]
					 	여기 안에서 서버로 부터 받은 데이타를
					 	원하는 위치에 뿌려주면 된다.
					 	※서버로 부터 받은 데이타는 매개변수로 전달됨(data)*/
					 	//서버에서 "Y" 혹은 "N"으로 응답할때]	
					 	//$('#lblDisplay').html(data=='Y'?$(':text').val()+"님 반갑습니다":'회원이 아닙니다');
					 	//서버에서 메시지로 응답할때]
						$('#lblDisplay').html(data);
					},
					error:function(data){console.log('에러:',data)}//서버로부터 비정상적인 응답을 받았을때 처리할 함수
				}
		);
	});

});
</script>
<script>
    function getImg(evt){
        //var files = evt.target.files;
        //var file = files[0];
        //console.log(file.name);
		var row = "<tr class='template-upload fade in'>"+
					"<td><span class='preview'><canvas width='80' height='60' style='background-color:red;'></canvas></span>"+
					"</td>"+
					"<td>"+
						"<p class='name'>"+$("input:file").val()+(count++)+"</p>"+
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
					"</td>"+"<td><span>날 누르면 삭제가 됨</span></td>"+
				"</tr>";
		$("#table").append(row); 
    }
</script>
<script>
	function del() {
		
	}
</script>
<form id="fileupload" action="#"method="POST" enctype="multipart/form-data">
	<div class="row fileupload-buttonbar">
		<div class="col-lg-7">
			<!-- The fileinput-button span is used to style the file input field as button -->
			<input type='file' id='file' name='file' onchange='getImg(event)'/>
	        <button id='btn-upload' class="btn btn-success fileinput-button" onfocus="this.blur();">
				<i class="glyphicon glyphicon-plus"></i> <span>Add files</span> 
			</button>
			<button type="submit" class="btn btn-primary start">
				<i class="glyphicon glyphicon-upload"></i> <span>Start upload</span>
			</button>
			<button type="reset" class="btn btn-warning cancel">
				<i class="glyphicon glyphicon-ban-circle"></i> <span>Cancel upload</span>
			</button>
			<button type="button" class="btn btn-danger delete" onclick="del()"> 
				<i class="glyphicon glyphicon-trash"></i> <span>Delete</span>
			</button>
		</div>
	</div>
	<br/>
	<table id="table" style="width: 100%;">
	</table>
</form>

<br/>

<form action="<c:url value='/ImgUpload.page'/>" method="POST" enctype="multipart/form-data">
	<input type="file" name="img" />
	<input type="submit" value="OK" /> 
</form>
<form action="<c:url value='/ImgUpload.page'/>" method="POST" enctype="multipart/form-data">
	<input type="file" name="img" />
	<input type="submit" value="OK" /> 
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

