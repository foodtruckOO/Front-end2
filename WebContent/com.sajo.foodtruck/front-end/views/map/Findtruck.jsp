<%@page import="com.sun.xml.internal.txw2.Document"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@ include file="/com.sajo.foodtruck/front-end/Common/IsMember.jsp" %> --%>
<!DOCTYPE html>
<html lang="ko">
<!-- JQuery CDN 호출 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 소재지 js 호출 -->
<script src="<c:url value='/com.sajo.foodtruck/front-end/views/map/sojaeji.js'/>"></script>
 
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>Foodtruck:: ver1.0</title>

	<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
	</style>

    <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
     <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
    <!-- Custom styles for this template -->    
	 
	<script>
		$(function(){
			var currentPosition = parseInt($("#sidebox").css("top"));
			$(window).scroll(function() {
				var position = $(window).scrollTop(); 
				$("#sidebox").stop().animate({"top":position+currentPosition+"px"},1000);
			}); 
			
		});
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
	<section style="padding-top: 80px; margin-right: 80px; margin-left: 80px;">
	  <article> 
	  <h2>푸드트럭찾기</h2><hr align="left" style="border: solid 1px #FE9A2E; width: 20%">
	  </article>
	  
	  <!-- 주소검색 -->
	  <article>
		<fieldset>
		<legend>주소그룹</legend>
		<div style="margin-left: 30px;">
		<select class="form-control" name="sido" id="sido" style="width: 10%; float: left; margin-right: 5px"></select>
		<select class="form-control" name="gugun" id="gugun" style="width: 10%; float: left; margin-right: 5px"></select>
		<!-- <select class="form-control" name="dong" id="dong" style="width: 10%; float: left; margin-right: 5px"></select> -->
		<input id="address" class="form-control" type="text" placeholder="상호명" style="width: 20%; float:left; margin-right: 5px"/>
		<input id="submit" class="btn btn-primary" type="button" value="검색"/>
		</div>
		</fieldset>
	  </article><br><br>
		
	  <!-- 지도호출 -->
      <article style="margin-right:30px; margin-left: 30px">
        <div id="map" style="width:100%;height:500px;"></div>
        <!-- 지도 api 호출 -->
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07081f33b5c3c2dd65b5d5a0b0e85296&libraries=services"></script>
      </article><br><br>
           
      <article>
      <h2>검색결과영역</h2><hr align="left" style="border: solid 1px #FE9A2E; width: 20%">
      </article><br>
      
    <article style="float: right; margin-right: 30px">		
		<select class="form-control">
			<option value="거리">거리순</option>
			<option value="추천">추천순</option>
			<option value="인기" selected="selected">인기순</option>
		</select>
	</article><br><br>
      	
	<article style="margin-right:30px; margin-left: 30px">
	<table class="table table-bordered table-hover">
		<tr style="text-align: center">
			<th style="width:10%;">번호</th>
			<th style="width:20%">업소명</th>
			<th style="width:25%">주소</th>
			<th style="width:20%">대표메뉴</th>
			<th style="width:15%">연락처</th>
		</tr>
		<c:if test="${empty requestScope.list }" var="flag">
			<tr>
				<td colspan="6">등록된 자료가 없습니다</td>
			</tr>
		</c:if>
	</table>
	</article>
	
	<!-- footer -->
	<article>
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Footer.jsp"/>
 	</article>
    </section>
	<!-- 내용 끝 -->
	
	
	<!-- 주소검색 -->
	<script type="text/javascript">
	new sojaeji('sido', 'gugun');
	</script>
	
	<!-- 지도생성 / 설정-->
	<script>
	var markers = [];
	var infowindow;
	
	var container = document.getElementById('map');
	var options = {
		center: new daum.maps.LatLng(37.47893444641687, 126.87900549310089),
		level: 3
	};
	var map = new daum.maps.Map(container, options);
	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성
	var mapTypeControl = new daum.maps.MapTypeControl();
	// 지도에 컨트롤을 추가해야 지도위에 표시
	// daum.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성
	var zoomControl = new daum.maps.ZoomControl();
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
	    {
	    	content: 
		    '<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            강남푸드트럭존' + 
            '            <div class="close" onclick="closeOverlay(0)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="<c:url value='/com.sajo.foodtruck/front-end/images/KakaoTalk_20180308_190036939.png'/>" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 강남구</div>' + 
            '                <div class="jibun ellipsis">1.스테이크트럭</div>' + 
            '                <div class="jibun ellipsis" style="color:red;">2.솜사탕트럭</div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>', 
	        latlng: new daum.maps.LatLng(37.498362532645366 , 127.02784205652671)
	    },
	    {
	    	content:
    		'<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            수원푸드트레일러존' + 
            '            <div class="close" onclick="closeOverlay(1)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="<c:url value='/com.sajo.foodtruck/front-end/images/KakaoTalk_20180308_190036939.png'/>" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 강남구</div>' + 
            '                <div class="jibun ellipsis">1.스테이크트럭</div>' + 
            '                <div class="jibun ellipsis" style="color:red;">2.솜사탕트럭</div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>', 
	        latlng: new daum.maps.LatLng(37.266858938781496, 127.00106821183854)
	    },
	    {
	    	content:
    		'<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            명동푸드트럭존' + 
            '            <div class="close" onclick="closeOverlay(2)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="<c:url value='/com.sajo.foodtruck/front-end/images/KakaoTalk_20180308_190036939.png'/>" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 중구</div>' + 
            '                <div class="jibun ellipsis">1.스테이크트럭</div>' + 
            '                <div class="jibun ellipsis" style="color:red;">2.솜사탕트럭</div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>', 
	        latlng: new daum.maps.LatLng(37.56091477322354 , 126.98605602341398)
	    },
	    {
	    	content:
    		'<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            여의도푸드트럭존' + 
            '            <div class="close" onclick="closeOverlay(3)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="<c:url value='/com.sajo.foodtruck/front-end/images/KakaoTalk_20180308_190036939.png'/>" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 영등포구</div>' + 
            '                <div class="jibun ellipsis">1.스테이크트럭</div>' + 
            '                <div class="jibun ellipsis" style="color:red;">2.솜사탕트럭</div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>',
	        latlng: new daum.maps.LatLng(37.52164383539954, 126.924377760945)
	    },
	    {
	    	content:
    		'<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            한강푸드트럭존' +
            '            <div class="close" onclick="closeOverlay(4)" title="닫기"></div>' +  
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="<c:url value='/com.sajo.foodtruck/front-end/images/KakaoTalk_20180308_190036939.png'/>" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 성동구</div>' + 
            '                <div class="jibun ellipsis">1.스테이크트럭</div>' + 
            '                <div class="jibun ellipsis" style="color:red;">2.솜사탕트럭</div>' + 
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>',
	        latlng: new daum.maps.LatLng(37.53139936666415 , 127.06432970206485)
	    },
	    {
	    	content:
    		'<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + 
            '            가산푸드트럭존' + 
            '            <div class="close" onclick="closeOverlay(5)" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body">' + 
            '            <div class="img">' +
            '                <img src="<c:url value='/com.sajo.foodtruck/front-end/images/KakaoTalk_20180308_190036939.png'/>" width="73" height="70">' +
            '           </div>' + 
            '            <div class="desc">' + 
            '                <div class="ellipsis">서울특별시 금천구</div>' + 
            '                <div class="jibun ellipsis">1.스테이크트럭</div>' + 
            '                <div class="jibun ellipsis" style="color:red;">2.솜사탕트럭</div>' +
            '                <div><a href="<c:url value='/com.sajo.foodtruck/front-end/views/main.jsp'/>" target="_blank" class="link">상세보기</a></div>' +  
            '            </div>' + 
            '        </div>' + 
            '    </div>' +    
            '</div>',
	        latlng: new daum.maps.LatLng(37.478844076216944 , 126.87874277973434)
	    }
	];

	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	var overlays=[];
	
	for (var i = 0; i < positions.length; i ++) {	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new daum.maps.Size(24, 35);   
	    // 마커 이미지를 생성합니다    
	    var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 	    
	    // 마커를 생성합니다
	    var marker = new daum.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        image : markerImage // 마커 이미지 
	    });
	   	var overlay = new daum.maps.CustomOverlay({
	        content: positions[i].content,
	        position: positions[i].latlng
	    });
	   	overlays.push(overlay);
	    daum.maps.event.addListener(marker, 'click', openOverlay(map, marker, overlay));
	   
	} 
	
	function openOverlay(map,marker,overlay){
		 return function() {
			overlay.setMap(map);
		 };
	}
	// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
    function closeOverlay(index) {
        	overlays[index].setMap(null);     	
	}
	


	// 장소 검색 객체를 생성합니다
	var ps = new daum.maps.services.Places();
	// 키워드를 생성한다
	var keyword="";
	<!-- 검색한 주소값 keyword에 저장 -->
	$(function(){
		$('#submit').click(function(){
			var a=$('#sido').val();			
			var b=$('#gugun').val();
			//var c=$('#dong').val();
			var d=$('#address').val()==null?" ":$('#address').val();
			keyword = a+" "+b+" "+d;
			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			removeMarker();
			// 키워드로 장소를 검색합니다
			ps.keywordSearch(keyword, placesSearchCB); 
			console.log(keyword);
		});
	});
	
	// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === daum.maps.services.Status.OK) {
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new daum.maps.LatLngBounds();
	        for (var i=0; i<data.length; i++) {
	            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
	        }       
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds);
	     	// 지도의 중심좌표를 얻어옵니다 
		    var latlng = map.getCenter();
		    //var message = '<p>중심 좌표는 위도 ' + latlng.getLat() + ', 경도 ' + latlng.getLng() + '입니다</p>';
			// 마커가 표시될 위치입니다 
		    var markerPosition  = new daum.maps.LatLng(latlng.getLat(), latlng.getLng()); 
		    // 마커를 생성합니다
		    var marker = new daum.maps.Marker({
		        position: markerPosition
		    });
		    // 마커가 지도 위에 표시되도록 설정합니다
		    marker.setMap(map);
		    // 생성된 마커를 배열에 추가합니다
		    markers.push(marker);

		    var iwContent = '<div style="width:180px;">현위치 좌표<br><br> 위도:'+latlng.getLat()+'<br> 경도:'+latlng.getLng()+'<br/><br/></div>',
		    iwPosition = new daum.maps.LatLng(latlng.getLat(), latlng.getLng());
			// 인포윈도우를 생성합니다
			infowindow = new daum.maps.InfoWindow({
		    position : iwPosition, 
		    content : iwContent 
			});
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker);
	    } 
	}
	//지도위에 추가된 마커를 삭제하는 함수
	function removeMarker() {
		for ( var i = 0; i < markers.length; i++ ) {
		infowindow.close();
		markers[i].setMap(null);
		} 
	}
	</script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="<c:url value='/bootstrap/js/bootstrap.min.js'/>"></script>
    </body>
</html>