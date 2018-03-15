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

<script
   src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<script>   
      $(function(){
         var currentPosition = parseInt($("#sidebox").css("top"));
         $(window).scroll(function() {
            var position = $(window).scrollTop(); 
            $("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
         });
         
      });
      
      
      
   </script>
<style>
.mail-box {
    border-collapse: collapse;
    border-spacing: 0;
    display: table;
    table-layout: fixed;
    width: 100%;
    
}
.mail-box aside {
    display: table-cell;
    float: none;
    height: 100%;
    padding: 0;
    vertical-align: top;
}
.mail-box .sm-side {
    background: none repeat scroll 0 0 #e5e8ef;
    border-radius: 4px 0 0 4px;
    width: 25%;
}
.mail-box .lg-side {
    background: none repeat scroll 0 0 #fff;
    border-radius: 0 4px 4px 0;
    width: 75%;
}
.mail-box .sm-side .user-head {
    background: none repeat scroll 0 0 #00a8b3;
    border-radius: 4px 0 0;
    color: #fff;
    min-height: 80px;
    padding: 10px;
}
.user-head .inbox-avatar {
    float: left;
    width: 65px;
}
.user-head .inbox-avatar img {
    border-radius: 4px;
}
.user-head .user-name {
    display: inline-block;
    margin: 0 0 0 10px;
}
.user-head .user-name h5 {
    font-size: 14px;
    font-weight: 300;
    margin-bottom: 0;
    margin-top: 15px;
}
.user-head .user-name h5 a {
    color: #fff;
}
.user-head .user-name span a {
    color: #87e2e7;
    font-size: 12px;
}
a.mail-dropdown {
    background: none repeat scroll 0 0 #80d3d9;
    border-radius: 2px;
    color: #01a7b3;
    font-size: 10px;
    margin-top: 20px;
    padding: 3px 5px;
}
.inbox-body {
    padding: 20px;
}
.btn-compose {
    background: none repeat scroll 0 0 #ff6c60;
    color: #fff;
    padding: 12px 0;
    text-align: center;
    width: 100%;
}
.btn-compose:hover {
    background: none repeat scroll 0 0 #f5675c;
    color: #fff;
}
ul.inbox-nav {
    display: inline-block;
    margin: 0;
    padding: 0;
    width: 100%;
}
.inbox-divider {
    border-bottom: 1px solid #d5d8df;
}
ul.inbox-nav li {
    display: inline-block;
    line-height: 45px;
    width: 100%;
}
ul.inbox-nav li a {
    color: #6a6a6a;
    display: inline-block;
    line-height: 45px;
    padding: 0 20px;
    width: 100%;
}
ul.inbox-nav li a:hover, ul.inbox-nav li.active a, ul.inbox-nav li a:focus {
    background: none repeat scroll 0 0 #d5d7de;
    color: #6a6a6a;
}
ul.inbox-nav li a i {
    color: #6a6a6a;
    font-size: 16px;
    padding-right: 10px;
}
ul.inbox-nav li a span.label {
    margin-top: 13px;
}
ul.labels-info li h4 {
    color: #5c5c5e;
    font-size: 13px;
    padding-left: 15px;
    padding-right: 15px;
    padding-top: 5px;
    text-transform: uppercase;
}
ul.labels-info li {
    margin: 0;
}
ul.labels-info li a {
    border-radius: 0;
    color: #6a6a6a;
}
ul.labels-info li a:hover, ul.labels-info li a:focus {
    background: none repeat scroll 0 0 #d5d7de;
    color: #6a6a6a;
}
ul.labels-info li a i {
    padding-right: 10px;
}
.nav.nav-pills.nav-stacked.labels-info p {
    color: #9d9f9e;
    font-size: 11px;
    margin-bottom: 0;
    padding: 0 22px;
}
.inbox-head {
    background: none repeat scroll 0 0 #41cac0;
    border-radius: 0 4px 0 0;
    color: #fff;
    min-height: 80px;
    padding: 20px;
}
.inbox-head h3 {
    display: inline-block;
    font-weight: 300;
    margin: 0;
    padding-top: 6px;
}
.inbox-head .sr-input {
    border: medium none;
    border-radius: 4px 0 0 4px;
    box-shadow: none;
    color: #8a8a8a;
    float: left;
    height: 40px;
    padding: 0 10px;
}
.inbox-head .sr-btn {
    background: none repeat scroll 0 0 #00a6b2;
    border: medium none;
    border-radius: 0 4px 4px 0;
    color: #fff;
    height: 40px;
    padding: 0 20px;
}
.table-inbox {
    border: 1px solid #d3d3d3;
    margin-bottom: 0;
}
.table-inbox tr td {
    padding: 12px !important;
}
.table-inbox tr td:hover {
    cursor: pointer;
}
.table-inbox tr td .fa-star.inbox-started, .table-inbox tr td .fa-star:hover {
    color: #f78a09;
}
.table-inbox tr td .fa-star {
    color: #d5d5d5;
}
.table-inbox tr.unread td {
    background: none repeat scroll 0 0 #f7f7f7;
    font-weight: 600;
}
ul.inbox-pagination {
    float: right;
}
ul.inbox-pagination li {
    float: left;
}
.mail-option {
    display: inline-block;
    margin-bottom: 10px;
    width: 100%;
}
.mail-option .chk-all, .mail-option .btn-group {
    margin-right: 5px;
}
.mail-option .chk-all, .mail-option .btn-group a.btn {
    background: none repeat scroll 0 0 #fcfcfc;
    border: 1px solid #e7e7e7;
    border-radius: 3px !important;
    color: #afafaf;
    display: inline-block;
    padding: 5px 10px;
}
.inbox-pagination a.np-btn {
    background: none repeat scroll 0 0 #fcfcfc;
    border: 1px solid #e7e7e7;
    border-radius: 3px !important;
    color: #afafaf;
    display: inline-block;
    padding: 5px 15px;
}
.mail-option .chk-all input[type="checkbox"] {
    margin-top: 0;
}
.mail-option .btn-group a.all {
    border: medium none;
    padding: 0;
}
.inbox-pagination a.np-btn {
    margin-left: 5px;
}
.inbox-pagination li span {
    display: inline-block;
    margin-right: 5px;
    margin-top: 7px;
}
.fileinput-button {
    background: none repeat scroll 0 0 #eeeeee;
    border: 1px solid #e6e6e6;
}
.inbox-body .modal .modal-body input, .inbox-body .modal .modal-body textarea {
    border: 1px solid #e6e6e6;
    box-shadow: none;
}
.btn-send, .btn-send:hover {
    background: none repeat scroll 0 0 #00a8b3;
    color: #fff;
}
.btn-send:hover {
    background: none repeat scroll 0 0 #009da7;
}
.modal-header h4.modal-title {
    font-family: "Open Sans",sans-serif;
    font-weight: 300;
}
.modal-body label {
    font-family: "Open Sans",sans-serif;
    font-weight: 400;
}
.heading-inbox h4 {
    border-bottom: 1px solid #ddd;
    color: #444;
    font-size: 18px;
    margin-top: 20px;
    padding-bottom: 10px;
}
.sender-info {
    margin-bottom: 20px;
}
.sender-info img {
    height: 30px;
    width: 30px;
}
.sender-dropdown {
    background: none repeat scroll 0 0 #eaeaea;
    color: #777;
    font-size: 10px;
    padding: 0 3px;
}
.view-mail a {
    color: #ff6c60;
}
.attachment-mail {
    margin-top: 30px;
}
.attachment-mail ul {
    display: inline-block;
    margin-bottom: 30px;
    width: 100%;
}
.attachment-mail ul li {
    float: left;
    margin-bottom: 10px;
    margin-right: 10px;
    width: 150px;
}
.attachment-mail ul li img {
    width: 100%;
}
.attachment-mail ul li span {
    float: right;
}
.attachment-mail .file-name {
    float: left;
}
.attachment-mail .links {
    display: inline-block;
    width: 100%;
}

.fileinput-button {
    float: left;
    margin-right: 4px;
    overflow: hidden;
    position: relative;
}
.fileinput-button input {
    cursor: pointer;
    direction: ltr;
    font-size: 23px;
    margin: 0;
    opacity: 0;
    position: absolute;
    right: 0;
    top: 0;
    transform: translate(-300px, 0px) scale(4);
}
.fileupload-buttonbar .btn, .fileupload-buttonbar .toggle {
    margin-bottom: 5px;
}
.files .progress {
    width: 200px;
}
.fileupload-processing .fileupload-loading {
    display: block;
}
* html .fileinput-button {
    line-height: 24px;
    margin: 1px -3px 0 0;
}
* + html .fileinput-button {
    margin: 1px 0 0;
    padding: 2px 15px;
}
@media (max-width: 767px) {
.files .btn span {
    display: none;
}
.files .preview * {
    width: 40px;
}
.files .name * {
    display: inline-block;
    width: 80px;
    word-wrap: break-word;
}
.files .progress {
    width: 20px;
}
.files .delete {
    width: 60px;
}
}
ul {
    list-style-type: none;
    padding: 0px;
    margin: 0px;
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
   

   <div class="container" style="border-left: 100%;border-right: 100%;padding-right: 70px">

      <div class="mail-box">
         
         <aside class="lg-side">
            <div class="inbox-head">
               <h3>창업설명회계획&신청</h3>
               <form action="#" class="pull-right position">
                  <div class="input-append">
                     <input type="text" class="sr-input" placeholder="Search Mail">
                     <button class="btn sr-btn" type="button">
                        <i class="fa fa-search"></i>
                     </button>
                  </div>
               </form>
            </div>
            <div class="inbox-body">
               
               <table class="table table-inbox table-hover">
                  <tbody>
                     <tr class="unread">
                        <td class="inbox-small-cells">
                           </td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message  dont-show">PHPClass</td>
                        <td class="view-message ">Added a new class: Login Class
                           Fast Site</td>
                        <td class="view-message  inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message  text-right">9:27 AM</td>
                     </tr>
                     <tr class="unread">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Google Webmaster</td>
                        <td class="view-message">Improve the search presence of
                           WebSite</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">March 15</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">JW Player</td>
                        <td class="view-message">Last Chance: Upgrade to Pro for</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">March 15</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Tim Reid, S P N</td>
                        <td class="view-message">Boost Your Website Traffic</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">April 01</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i
                           class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">Freelancer.com <span
                           class="label label-danger pull-right">urgent</span></td>
                        <td class="view-message">Stop wasting your visitors</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">May 23</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i
                           class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">WOW Slider</td>
                        <td class="view-message">New WOW Slider v7.8 - 67% off</td>
                        <td class="view-message inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">March 14</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i
                           class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">LinkedIn Pulse</td>
                        <td class="view-message">The One Sign Your Co-Worker Will
                           Stab</td>
                        <td class="view-message inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">Feb 19</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Drupal Community<span
                           class="label label-success pull-right">megazine</span></td>
                        <td class="view-message view-message">Welcome to the Drupal
                           Community</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">March 04</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Facebook</td>
                        <td class="view-message view-message">Somebody requested a
                           new password</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">June 13</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Skype <span
                           class="label label-info pull-right">family</span></td>
                        <td class="view-message view-message">Password successfully
                           changed</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">March 24</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i
                           class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">Google+</td>
                        <td class="view-message">alireza, do you know</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">March 09</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i
                           class="fa fa-star inbox-started"></i></td>
                        <td class="dont-show">Zoosk</td>
                        <td class="view-message">7 new singles we think you'll like</td>
                        <td class="view-message inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">May 14</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">LinkedIn</td>
                        <td class="view-message">Alireza: Nokia Networks, System
                           Group and</td>
                        <td class="view-message inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">February 25</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="dont-show">Facebook</td>
                        <td class="view-message view-message">Your account was
                           recently logged into</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">March 14</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Twitter</td>
                        <td class="view-message">Your Twitter password has been
                           changed</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">April 07</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">InternetSeer Website
                           Monitoring</td>
                        <td class="view-message">http://golddesigner.org/
                           Performance Report</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">July 14</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i
                           class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">AddMe.com</td>
                        <td class="view-message">Submit Your Website to the AddMe
                           Business Directory</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">August 10</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Terri Rexer, S P N</td>
                        <td class="view-message view-message">Forget Google
                           AdWords: Un-Limited Clicks fo</td>
                        <td class="view-message inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">April 14</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Bertina</td>
                        <td class="view-message">IMPORTANT: Don't lose your
                           domains!</td>
                        <td class="view-message inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">June 16</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i
                           class="fa fa-star inbox-started"></i></td>
                        <td class="view-message dont-show">Laura Gaffin, S P N</td>
                        <td class="view-message">Your Website On Google (Higher
                           Rankings Are Better)</td>
                        <td class="view-message inbox-small-cells"></td>
                        <td class="view-message text-right">August 10</td>
                     </tr>
                     <tr class="">
                        <td class="inbox-small-cells"><input type="checkbox"
                           class="mail-checkbox"></td>
                        <td class="inbox-small-cells"><i class="fa fa-star"></i></td>
                        <td class="view-message dont-show">Facebook</td>
                        <td class="view-message view-message">Alireza Zare Login
                           faild</td>
                        <td class="view-message inbox-small-cells"><i
                           class="fa fa-paperclip"></i></td>
                        <td class="view-message text-right">feb 14</td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </aside>
      </div>
   </div>






   <!-- 내용 끝 -->
   <div>
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