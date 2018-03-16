<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.net.URLEncoder"%>

  <!-- 여기 -->
 <div class="stars1" style="float: left; width: 25%;"> 
    <form action="">                 
       <input class="star star-5" id="star-5" type="radio" name="star"/> 
       <label class="star star-5" for="star-5"></label> 
       <input class="star star-4" id="star-4" type="radio" name="star"/> 
       <label class="star star-4" for="star-4"></label> 
       <input class="star star-3" id="star-3" type="radio" name="star"/> 
       <label class="star star-3" for="star-3"></label> 
       <input class="star star-2" id="star-2" type="radio" name="star"/> 
       <label class="star star-2" for="star-2"></label> 
       <input class="star star-1" id="star-1" type="radio" name="star" checked="checked"/> 
       <label class="star star-1" for="star-1"></label> 
    </form> 
 </div>
 <div class="col-md-9" style="float: right; width: 75%">    
    <input id="review" class="form-control" type="text"  style="width: 70%; float:left; margin-right: 10px"/>
    <input id="submit" class="btn btn-primary" type="button" value="등록"/>
 </div>             
 <!-- 저기 -->
