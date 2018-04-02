<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 

<!-- 푸드트럭 정보 -->
<div style="width: 59%; float: left;">
	<h2>${seller.tname}</h2>
	<p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&emsp;${seller.addr} ${seller.addr2 }</p>
	<p><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>&emsp;${seller.tel}</p>
	
</div>
<!-- map -->					
<div id="map" style="width:39%;height:200px;"></div>
       <!-- 지도 api 호출 -->


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2629a34c94733c8f257fcd6088a3e37a"></script>	
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 마커가 표시될 위치입니다 
	var markerPosition  = new daum.maps.LatLng(33.450701, 126.570667); 
	// 마커를 생성합니다
	var marker = new daum.maps.Marker({
	    position: markerPosition
	});	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
</script>