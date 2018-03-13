<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Foodtruck:: ver1.0</title> 
 <!-- Bootstrap core CSS -->    
    <link href="<c:url value='/bootstrap/css/bootstrap.min.css'/>" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="<c:url value='/bootstrap/css/bootstrap-theme.min.css'/>" rel="stylesheet">
    <!-- YangGeum template CSS -->    
    <link rel="stylesheet" href="<c:url value='/bootstrap/css/template.css'/>" type="text/css" />
	<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
	<link rel="stylesheet" type="text/css"
	href="<c:url value ='/com.sajo.foodtruck/front-end/views/foodtruck/all/foodtruck.css'/>" />

<link rel="stylesheet" type="text/css" href="https://d1yr0lpy7kakcx.cloudfront.net/assets/css/service/layouts/renew/restaurant.css?v=20180223161205" />
</head>
<body>
<div id="TOP">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Top.jsp"/>
    </div>
    <div id="RIGHT">
		<jsp:include page="/com.sajo.foodtruck/front-end/template/Right.jsp"/>
    </div>
    
<div id="wrap" style="position: relative;">
    <div id="content" class="container-fluid clearfix" style="background: #fff; max-width: 100%">
        <link rel="stylesheet" type="text/css" href="https://d1yr0lpy7kakcx.cloudfront.net/assets/css/service/layouts/renew/restaurant.css?v=20180223161205"/>
<link rel="stylesheet" type="text/css" href="https://d1yr0lpy7kakcx.cloudfront.net/assets/css/service/layouts/renew/taste.css?v=20180223161205"/>

	<div class="res_content">
		<!--**레스토랑 지역별-->
		<div class="dq_title home"><h4>지역별 푸드트럭</h4></div>
		<div class="list_wrap row" id="area_list">
			<!--사진출처 - 압구정/청담:photo by Tony / 가로수길:photo by sellyourseoul / 이태원:photo by Caspian blue / 강남역:photo by ☺Yoshi☻ / 경희대:photo by Kys951 / 남포동:photo by Tracy Hunter / 대학로:photo by Gipe0001 / 부산서면:photo by Carey Ciuro / 성신여대:photo by Soymilkk / 숙명여대:photo by Mineralsab / 신촌:photo by Jude Lee -->
							<div class="reg_img_box col-sm-3 col-xs-6" >
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/1.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>홍대&합정</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" >
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/2.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>압구정&청담</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" >
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/3.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>가로수길</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" >
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/4.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>이태원&한남동</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" >
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/5.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>강남역</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" >
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/6.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>신촌&이대</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" >
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/7.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>종로</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/8.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>명동&남산</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/9.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>청담동</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/10.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>삼청동&인사동</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/11.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>숙대</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/12.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>경희대&외대</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/13.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>건대</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/14.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>성신여대</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/15.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>대학로</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/16.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>부산 서면</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/17.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>부산 남포동</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
							<div class="reg_img_box col-sm-3 col-xs-6" style="display:none">
					<div class="reg_img_box_thumbnail">
						<a href="restaurant/area/18.html" class="reg_img_card areas">
							<div class="reg_img_c02"></div>
							<div class="reg_img_t02">
								<h3>남이섬</h3>
							</div>
							<div class="res_deco2"></div>
						</a>
					</div>
				</div>
			
			<div class="reg_img_box more col-sm-3 col-xs-6" onclick="return moreArea(this);">
				<div class="reg_img_box_thumbnail">
					<a href="#" class="reg_img_card more">
						<div class="reg_img_c02"></div>
						<div class="reg_img_t02">
							<h3>+<br>지역 더보기</h3>
						</div>
					</a>
				</div>
			</div>
		</div>
		<div class="dq_title home">
			<h4>이달의 푸드트럭</h4>
		</div>
		<div class="list_wrap row">
			<div class="tv_img_box col-sm-6 col-xs-12">
				<div class="tv_img_box_thumbnail">
					<a href="restaurant/theme/suyo.html" class="tv_img_card">
						<div class="tv_img_t01">
							<h3><b>이달의</b><br>랭킹</h3>
						</div>
					</a>
				</div>
			</div>
			<div class="tv_img_box col-sm-6 col-xs-12">
				<div class="tv_img_box_thumbnail">
					<a href="restaurant/theme/back.html" class="tv_img_card">
						<div class="tv_img_t01">
							<h3><b>신규창업</b><br>푸드트럭</h3>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

   </div>
</div>


<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"></script>
<script type="text/javascript">
    if(!wcs_add) var wcs_add = {};
    wcs_add["wa"] = "5ec88f099a4f60";
    wcs_do();
</script>
<link rel="stylesheet" type="text/css" href="https://d1yr0lpy7kakcx.cloudfront.net/assets/css/service/layouts/renew/socialStyle.css?v=20180223161205" />
<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://s3.ap-northeast-2.amazonaws.com/dqstatic/assets/js/service/common/doShare.js"></script>
</body>
</html>
