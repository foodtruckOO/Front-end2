<%@page import="com.sajo.foodtruck.board.ComstomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Foodtruck:: ver1.0</title>

    <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
    <!-- Custom styles for this template -->    
	
	<!-- jQuery -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script>	
		$(function(){
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop(); 
				$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			});
			
		});
		
		
		function isDelete(){
		    var con= confirm("삭제하시겠습니까??");	
		    if(con==true)
		       location.href= "<c:url value='delete.board?cb_no=${rice.cb_no }'/>";
		       
		}
		
	</script>
  </head>

<body>
	<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
    </div>
    <div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp"/>
    </div>
	<!-- 내용 시작 -->
	  <div class="allWrap">
        <div class="partWrap">
            <!-- 탑메뉴 및 로고 감싸는 div 끝 -->
            <!--Left메뉴 및 실제 내용 감싸는 div시작-->
            <div class="section">
              
                <div class="body">
                    <div class="content">
                    	<fieldset style="padding-bottom: 30px">
	                    	<legend>상세 보기</legend>
	                        
			                  	<table  bgcolor="gray" cellspacing="1" style="align-self: center;"> 
			                  		<tr bgcolor="white" >
			                  			<td  align="center">작성자</td>
			                  			<td >
			                  			${rice.name }
			                  			</td>
			                  		</tr>    
			                  		<tr bgcolor="white" >
			                  			<td  align="center">작성일</td>
			                  			<td >
			                  			${rice.postdate }
			                  			</td>
			                  		</tr>
			                  		             	
			                  		<tr bgcolor="white" >
			                  			<td  align="center">제목</td>
			                  			<td >
			                            ${rice.title }              			
			                  			</td>
			                  		</tr>
			                  		<tr bgcolor="white" >
			                  			<td align="center">내용</td>
			                  			<td>
			                  			${rice.content }
			                  			</td>			                  			
			                  		</tr>
			                  		<tr bgcolor="white" >
			                  			<td align="center">첨부파일</td>
			                  			<td>
			                  			${rice.attachedfile }
			                  			</td>			                  			
			                  		</tr>
			                  		<tr bgcolor="white"align="center">
			                  			<td colspan="2">
			                  			
			                  			 <a href="<c:url value='/sujung.board?cb_no=${rice.cb_no }'/>">수정</a>  <a href="#" onclick="isDelete()">삭제</a>  
			                   			 <%  %>
			                  			 <a href="<c:url value='/Com.board'/>">목록</a>
			                  			</td>
			                  		</tr>                  	
			                  	</table> 
		                  		<!-- 이전글/다음글 -->
			                     <table  >
			                           <tr>
			                            <td>이전글:</td>
			                            <td></td>
			                           </tr>
			                           <tr>
			                            <td>다음글:</td>
			                            <td></td>
			                           </tr>
			                     </table> 
	                    </fieldset>                        
                    </div>
                </div>
            </div>
            <!--Left메뉴 및 실제 내용 감싸는 div끝-->
            <!--footer를 감싸는 div 시작-->
            
            <!--footer를 감싸는 div 끝-->
        </div>
    </div>
	
	
	
	
	
	
	
	
	
	<!-- 내용 끝 -->
    <div>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
 	</div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>