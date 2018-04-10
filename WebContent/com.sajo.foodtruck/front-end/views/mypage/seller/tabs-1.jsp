<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %> 
<div class="row">
<!-- 푸드트럭 정보 -->
<div class="col-xs-12 col-sm-6 col-md-8" style="width: 59%; float: left;">
	<h2>${seller.tname}</h2>
	<p><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>&emsp;${seller.addr} ${seller.addr2 }</p>
	<p><span class="glyphicon glyphicon-earphone" aria-hidden="true"></span>&emsp;${seller.tel}</p>
</div>
<!-- map -->	
<div class="col-xs-6 col-md-4" id="map" style="width:40%;height:200px;"></div>
       <!-- 지도 api 호출 -->
</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=faebfb3e90eb274180e0b284b0f3e3a3&libraries=services"></script>	
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	var geocoder = new daum.maps.services.Geocoder();// 주소-좌표 변환 객체를 생성합니다
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${seller.addr}', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
		if (status === daum.maps.services.Status.OK) {
			// 마커가 표시될 위치입니다 
	        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
				 map: map,
		         position: coords
		     });
			/*
			// 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new daum.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
	        });
	        infowindow.open(map, marker);
	        */
			// 마커가 지도 위에 표시되도록 설정합니다
			map.setCenter(coords);
			marker.setMap(map);
		} 
	});
</script>

${result}