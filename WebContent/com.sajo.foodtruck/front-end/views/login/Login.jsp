<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>   
<html> 
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
<link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">


<script src='https://www.google.com/recaptcha/api.js'></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<style type="text/css">
body, html {
    height: 100%;
    background-repeat: no-repeat;
    background-image: linear-gradient(rgb(239, 151, 19), rgb(255, 255, 255));
}  
 
.card-container.card {
    max-width: 381px;
    padding: 40px 33px;
}

.btn {
    font-weight: 700;
    height: 36px;
    -moz-user-select: none;
    -webkit-user-select: none;
    user-select: none;
    cursor: default;
}

/*
 * Card component
 */
.card {
    background-color: #F7F7F7;
    /* just in case there no content*/
    padding: 20px 25px 30px;
    margin: 0 auto 25px;
    margin-top: 20px;
    /* shadows and rounded borders */
    -moz-border-radius: 2px;
    -webkit-border-radius: 2px;
    border-radius: 2px;
    -moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    -webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
    box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
}

.profile-img-card {
    width: 96px;
    height: 96px;
    margin: 0 auto 10px;
    display: block;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    border-radius: 50%;
}

/*
 * Form styles
 */
.profile-name-card {
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    margin: 10px 0 0;
    min-height: 1em;
}

.reauth-email {
    display: block;
    color: #404040;
    line-height: 2;
    margin-bottom: 10px;
    font-size: 14px;
    text-align: center;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin #inputid,
.form-signin #inputPassword {
    direction: ltr;
    height: 44px;
    font-size: 16px;
}

.form-signin input[type=user],
.form-signin input[type=password],
.form-signin input[type=text],
.form-signin button {
    width: 100%;
    display: block;
    margin-bottom: 10px;
    z-index: 1;
    position: relative;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}

.form-signin .form-control:focus {
    border-color: rgb(104, 145, 162);
    outline: 0;
    -webkit-box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
    box-shadow: inset 0 1px 1px rgba(0,0,0,.075),0 0 8px rgb(104, 145, 162);
}

.btn.btn-signin {
    /*background-color: #4d90fe; */
    background-color: rgb(104, 145, 162);
    /* background-color: linear-gradient(rgb(104, 145, 162), rgb(12, 97, 33));*/
    padding: 0px;
    font-weight: 700;
    font-size: 14px;
    height: 36px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    border-radius: 3px;
    border: none;
    -o-transition: all 0.218s;
    -moz-transition: all 0.218s;
    -webkit-transition: all 0.218s;
    transition: all 0.218s;
}

.btn.btn-signin:hover,
.btn.btn-signin:active,
.btn.btn-signin:focus {
    background-color: rgb(12, 97, 33);
}

.forgot-password {
    color: rgb(104, 145, 162);
}

.forgot-password:hover,
.forgot-password:active,
.forgot-password:focus{
    color: rgb(12, 97, 33);
}
</style>
</head>
<script type="text/javascript">
	function popupOpen3(){
	var windowW=600;
	var windowH=380;
	var left=Math.ceil((window.screen.width-windowW)/2);
	var top=Math.ceil((window.screen.height-windowH)/2);
	var popUrl = "<c:url value='/com.sajo.foodtruck/front-end/views/login/find/findIdPw.jsp'/>";	//팝업창에 출력될 페이지 URL
	var popOption = "width="+windowW+", height="+windowH+", resizable=no, scrollbars=no, status=no, left="+left+", top="+top+", location=no;";    //팝업창 옵션(optoin)
		window.open(popUrl,"",popOption);
		parent.close();
	}
	$(function(){
		$("#trans").click(function(){
		 	if(typeof(grecaptcha)!='undefiend'){
				if(grecaptcha.getResponse()!=""){
				$("#frm").submit();
				}
				else{
				alert("인증을 확인하세요");
				}
			}
		}); 
			
			
	})
</script>
<body>
	<div class="container">
        <div class="card card-container">
        <h2>로그인</h2><hr style="border: solid 1px #FE9A2E;">
            <!-- <img class="profile-img-card" src="//lh3.googleusercontent.com/-6V8xOA6M7BA/AAAAAAAAAAI/AAAAAAAAAAA/rzlHcD0KYwo/photo.jpg?sz=120" alt="" /> -->
            <img id="profile-img" class="profile-img-card" src="<c:url value='/com.sajo.foodtruck/front-end/images/user.png'/>" />
            <p id="profile-name" class="profile-name-card"></p>
            <form class="forSm-signin" method="post" action="<c:url value='/com.sajo.foodtruck/front-end/views/login/LoginProcess.jsp'/>" id="frm">
                <span id="reauth-email" class="reauth-email"></span>
                <label>아이디</label>
                <input name="user" type="text" id="inputid" class="form-control" placeholder="아이디를 입력해주세요" value="<%=request.getParameter("user") == null ? "" : request.getParameter("user")%>" required autofocus><br>
                <label>비밀번호</label>
                <input name="pass" type="password" id="inputPassword" class="form-control" placeholder="비밀번호를 입력해주세요" value="<%=request.getParameter("pass") == null ? "" : request.getParameter("pass")%>" required>
                
                <!-- 리캡차 적용 부분 -->
                <div style="padding-top: 15px"  id="grecaptcha" class="g-recaptcha" data-sitekey="6LfsmVAUAAAAACAOAuJ0UQKoN5E8V8Y66a9JSSD0"></div>
                <!-- 적용 끝 -->
                <!-- <div id="remember" class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me"> 아이디저장
                    </label>
                </div> -->
                <br>
                <input class="btn btn-lg btn-primary btn-block btn-signin" type="button" id="trans" value="로그인"/>
                <p style="color: red; font-weight: bold"><%=request.getAttribute("ERROR") == null ? "":request.getAttribute("ERROR")%></p>
            </form><!-- /form -->
            <a href="javascript:popupOpen3();" class="forgot-password">아이디 또는 비밀번호를 잊어버리셨나요?</a>
        </div><!-- /card-container -->
    </div><!-- /container -->
   
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
  
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>