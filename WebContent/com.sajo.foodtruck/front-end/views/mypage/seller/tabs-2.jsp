<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!--Modal위치 조정-->
<style>
.modal {
        text-align: center;
}
 
@media screen and (min-width: 768px) { 
        .modal:before {
                display: inline-block;
                vertical-align: middle;
                content: " ";
                height: 100%;
        }
}
 
.modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
}
</style>

<script>
	$(function() {
		$('html, body').css({'height': '100%'});
	});
</script>

<c:if test="${empty requestScope.list}" var="flag">
	<h2>등록된 이미지가 없습니다.</h2>
</c:if>
<c:if test="${not flag}">
	<c:forEach var="list" items="${list}" varStatus="loop">
		<!-- 메뉴 -->
		<div class="col-md-4" style="margin-bottom: 20px;">
			<form action="<c:url value='/deleteMenu.page'/>" method="POST">
				<input type="hidden" name="fno" value="${list.fno}"/>
				<input type="hidden" name="newPicture" value="${list.newPicture}"/>
				<button style="position: relative; float: right; z-index: 1; color: black;">
				<span class="glyphicon glyphicon-remove" aria-hidden="true" /></button>
			</form>
			<form action="<c:url value='/editMenu.page'/>"  method="POST">
				<input type="hidden" name="fno" value="${list.fno}"/>
				<button style="position: relative; float: right; z-index: 1; color: black;">
				<span class="glyphicon glyphicon-edit" aria-hidden="true" /></button>
			</form>
			<div data-toggle="modal" data-target="#menuModal${loop.count }" style="cursor: pointer;">
				<!-- 메뉴 이미지 -->
				<div style="display: block; padding-top: 100%; position: relative;">
					<img src="http://localhost:8080/Front-end_FoodTruckProj/seller/api/MENU/${list.newPicture }" alt="이미지를 찾을 수 없습니다.."
							 style="width: 100%; height:100%; top: 0px; position: absolute;">
				</div>
			  	<!-- 가격 -->	
			  	<div style="height: 80PX; background-color: #efefe7; text-align: center;padding-top: 8px">
			  		<span style="font-weight: bold; font-size: 1.5em;">${list.fname}</span><br/>
			  		<span style="font-weight: bold; color: darkgray; font-size: 1.2em;">${list.price}</span>
			  	</div>
		  	</div>
		</div>
		<!-- 그림 세개당 한줄 -->
		
		<!-- Modal -->
		<div class="modal fade" id="menuModal${loop.count }" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title" id="myModalLabel">Modal titles</h4>
		      </div>
		      <div class="modal-body">
		        <!-- 모달안의 내용 -->
		        <div style="width: 100%; display: block; padding-top: 60%; position: relative;">
		        	<div style="width: 60%; height:100%; top: 0px; position: absolute;">
		        		<img src="http://localhost:8080/Front-end_FoodTruckProj/seller/api/MENU/${list.newPicture}" alt="이미지를 찾을 수 없습니다.."
							 style="width: 100%;top: 0px; position: relative;"/>
					</div>
					<div style="width: 40%; height:100%; top: 0px; padding:2%;
								 margin-left:60%; position: absolute; word-spacing: pre-wrap;" >
						<span style="font-weight: bold; font-size: 1.5em; text-align: center;">${list.fname}</span><br/>
				  		<span style="font-weight: bold; color: darkgray; font-size: 1.2em;">${list.price }</span><br/><hr>
						<div style="height:70%; overflow: auto;">${list.content }</div>
					</div>	
				</div>
		        <!-- 모달안의 내용끝 -->
		      </div>
		      <div class="modal-footer">
		      	<form action="<c:url value='/deleteMenu.page'/>">
					<input type="hidden" name="fno" value="${list.fno}"/>
					<button class="btn btn-primary" style="position: relative;">삭제하기</button>
		        	<button type="button" class="btn btn-default" data-dismiss="modal" style="position: relative;">닫기</button>
				</form>
		      </div>
		    </div>
		  </div>
		</div>
	</c:forEach>
</c:if>