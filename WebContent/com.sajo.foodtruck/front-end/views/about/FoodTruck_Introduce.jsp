<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<title>Foodtruck:: ver1.0</title>

<!-- Bootstrap core CSS -->
<link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>"
   rel="stylesheet">
<!-- Bootstrap theme -->
<link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>"
   rel="stylesheet">
<!-- YangGeum template CSS -->
<link rel="stylesheet"
   href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
<!-- Custom styles for this template -->

<!-- jQuery -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
   $(function() {
      var currentPosition = parseInt($("#sidebox").css("top"));
      $(window).scroll(function() {
         var position = $(window).scrollTop();
         $("#sidebox").stop().animate({
            "top" : position + currentPosition + "px"
         }, 1000);
      });

   });
   var TxtType = function(el, toRotate, period) {
      this.toRotate = toRotate;
      this.el = el;
      this.loopNum = 0;
      this.period = parseInt(period, 10) || 2000;
      this.txt = '';
      this.tick();
      this.isDeleting = false;
   };

   TxtType.prototype.tick = function() {
      var i = this.loopNum % this.toRotate.length;
      var fullTxt = this.toRotate[i];

      if (this.isDeleting) {
         this.txt = fullTxt.substring(0, this.txt.length - 1);
      } else {
         this.txt = fullTxt.substring(0, this.txt.length + 1);
      }

      this.el.innerHTML = '<span class="wrap">' + this.txt + '</span>';

      var that = this;
      var delta = 200 - Math.random() * 100;

      if (this.isDeleting) {
         delta /= 2;
      }

      if (!this.isDeleting && this.txt === fullTxt) {
         delta = this.period;
         this.isDeleting = true;
      } else if (this.isDeleting && this.txt === '') {
         this.isDeleting = false;
         this.loopNum++;
         delta = 500;
      }

      setTimeout(function() {
         that.tick();
      }, delta);
   };

   window.onload = function() {
      var elements = document.getElementsByClassName('typewrite');
      for (var i = 0; i < elements.length; i++) {
         var toRotate = elements[i].getAttribute('data-type');
         var period = elements[i].getAttribute('data-period');
         if (toRotate) {
            new TxtType(elements[i], JSON.parse(toRotate), period);
         }
      }
      // INJECT CSS
      var css = document.createElement("style");
      css.type = "text/css";
      css.innerHTML = ".typewrite > .wrap { border-right: 0.08em solid #fff}";
      document.body.appendChild(css);
   };
</script>
<style>
* {
   color: orange;
   text-decoration: none;
}
</style>
</head>

<body>
   <div id="TOP">
      <jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp" />
   </div>
   <div id="RIGHT">
      <jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp" />
   </div>
   <!-- 내용 시작 -->

   <script
      src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <!------ Include the above in your HEAD tag ---------->

   <!--made by vipul mirajkar thevipulm.appspot.com-->
   <div
      style="background-color: white; text-align: center; color: orange; padding-top: 5px;">
      <h1>
         <a href="" class="typewrite" data-period="2000"
            data-type='[ "We are challenging.", "We are creative.", "We are innovative.", "We are not giving up." ]'>
            <span class="wrap"></span>
         </a>
      </h1>
   </div>

   <script
      src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
   <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
   <!------ Include the above in your HEAD tag ---------->

   <div class="container"
      style="padding-top: 50px; padding-bottom: 30px; color: black;">
      <div class="row">
         <div class="col-sm-6 col-md-6">
            <img
               src="http://imgnews.naver.com/image/5407/2017/05/12/0000004990_002_20170512132825831.jpg"
               alt="" class="img-rounded img-responsive" />
         </div>
         <div class="col-sm-6 col-md-6">
            <blockquote>
               <p>
                  <strong>푸드트럭 소개</strong>
               </p>
               
                    <p style="color: black;">     
                            우리는 도전하는 사람이 되겠습니다<br/>
                            우리는 노력하는 사람이 되겠습니다<br/>                        
                            우리는 창의적인  사람이 되겠습니다<br/>
                            우리는 바른 사람이 되겠습니다
                    </p>  
                         
                              
                              
                              

                   
               <p>
                  <i class="glyphicon glyphicon-envelope"></i> jangsm0702@naver.com
                  <br /> <i class="glyphicon glyphicon-globe"></i>
                  www.bootsnipp.com <br /> <i class="glyphicon glyphicon-gift"></i>
                  march 03, 1995
               </p>
            </blockquote>
         </div>

      </div>
   </div>
   
   
   <div class="container"
      style="padding-top: 50px; padding-bottom: 30px; color: black;">
      <div class="row">
         <div class="col-sm-6 col-md-6">
            <img
               src="http://post.phinf.naver.net/MjAxNzEyMjJfMTkx/MDAxNTEzOTI4MDEyOTYx.jjswE-DrILMkuVUtJ20aSXrCojpvlAyg9AZRu6TsNKgg.JpzEVVSmCHsmODwBf5nUV8gyUeGGXX6w8G91AITg3PAg.JPEG/IMIXiuoUtmMA-noucry_bQ9jIacw.jpg"
               alt="" class="img-rounded img-responsive" style="position:absolute;left: 100%;padding-bottom: 200px"/>
         </div>
         <div class="col-sm-6 col-md-6" style="right: 50%">
            <blockquote>
               <p>
                  <strong>푸드트럭 소개</strong>
               </p>
               
                    <p style="color: black;">     
                            우리는 도전하는 사람이 되겠습니다<br/>
                            우리는 노력하는 사람이 되겠습니다<br/>                        
                            우리는 창의적인  사람이 되겠습니다<br/>
                            우리는 바른 사람이 되겠습니다
                    </p>  
                         
                              
                              
                              

                   
               <p>
                  <i class="glyphicon glyphicon-envelope"></i> jangsm0702@naver.com
                  <br /> <i class="glyphicon glyphicon-globe"></i>
                  www.bootsnipp.com <br /> <i class="glyphicon glyphicon-gift"></i>
                  march 03, 1995
               </p>
            </blockquote> 
         </div>

      </div>
   </div>






   <!-- 내용 끝 -->
   <div style="padding-top: 120px">
      <jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp" />
   </div>

   <!-- Bootstrap core JavaScript
    ================================================== -->
   <!-- Placed at the end of the document so the pages load faster -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
   <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
</body>
</html>