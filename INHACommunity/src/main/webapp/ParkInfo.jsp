<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.sql.*"%>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html>
<html>
<head>
<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="assets/img/favicon.png">
<meta charset="UTF-8">
<title>인하공업전문대학 웹 서비스</title>
<!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />

<style>
.customoverlay {position:relative;bottom:50px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#111;text-align:center;border-radius:6px;font-size:14px;font-weight:500;overflow:hidden;background: #5E72E4;background: #5E72E4 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:500;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>

</head>
<body class="g-sidenav-show   bg-gray-100">

<div class="min-height-300 bg-primary position-absolute w-100"></div>

<aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/argon-dashboard/pages/dashboard.html " target="_blank">
        <img src="assets/img/logo-ct-dark.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold">Show more</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">

        
        
        
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Account pages</h6>
        </li>
        
        
        
        <li class="nav-item">
          <a class="nav-link " href="mypage.jsp">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-02 text-dark text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Profile</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="login.jsp">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-single-copy-04 text-warning text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Sign In</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="join_new.jsp">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
              <i class="ni ni-collection text-info text-sm opacity-10"></i>
            </div>
            <span class="nav-link-text ms-1">Sign Up</span>
          </a>
        </li>
        
        
        
      </ul>
    </div>
    
  </aside>
  <main class="main-content position-relative border-radius-lg ">
    
      <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl " id="navbarBlur" data-scroll="false">
      <div class="container-fluid py-1 px-3">    
       
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="main.jsp">HOME</a></li>
            <li class="breadcrumb-item text-sm text-white active" aria-current="page"><a class="opacity-5 text-white" href="mbbs.jsp">게시판</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="Timetable_Select.jsp">시간표</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="Calc.jsp">학점계산기</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="BuildingInfo.jsp">건물정보</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="ParkInfo.jsp">주차정보</a></li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">주차정보</h6>
        </nav> 
       </div>       
    </nav>
    
    <div class="container-fluid py-4">
    
	 <div class="row">
        <div class="col-12">
          <div class="card mb-2">
          	<div class="card-body px-0 pt-3 pb-2"> 
          	
          			<div class="row">    		
						<div class="col-6 d-flex align-items-center">
							<h6 class="mb-0" style="margin-top: 12px; margin-left: 35px; font-size: 22px">주차비</h6>
						</div>
					</div>
									<table class="table" style="width: 75%; margin-left: 50px; margin-top: 8px">
									<tr>
									<td>
										<table class="table" style="width: 20%">
											<tr>
												<th>정기주차 (정기권)</th>
											</tr>
											<tr>
												<td style="font-size: 14px">
													<h6>교직원, 외래교수, 재학생</h6>
													- 60,000원/학기 (15,000원/월)<br>
													- 외부 차량 정기주차 등록 불가<p>
													<h6>교내 입주업체</h6>
													- 120,000원/학기 (30,000원/월)<br>
													- 식당, 복사실 등<br>
													Tmap 주차 매니저 ID로 로그인 후 구매
												</td>
											</tr>
										</table>	
									</td>
									
									<td>
										<table class="table" style="width: 20%">
											<tr>
												<th>할인 (웹 할인권)</th>
											</tr>
											<tr>
												<td style="font-size: 14px">
													<h6>교직원, 외래교수</h6>
													- 1일 2,000원, 4시간 1,000원<br>
													(최초20분 무료, 이후 시간당 500원)<br>
													- Tmap 주차 매니저 ID로 로그인 후 구매<p>
													<h6>재학생</h6>
													- 최초 1시간 무료, 이후 시간당 300원<br>
													- Tmap 주차 매니저 ID로 로그인 후 구매
												</td>
											</tr>
										</table>	
									</td>
									
									<td>
										<table class="table" style="width: 20%">
											<tr>
												<th>일반 (외부차량)</th>
											</tr>
											<tr>
												<td style="font-size: 14px">
													- 20분 무료<br>
													- 최초 30분 1,000원 이후 30분당 500원
												</td>
											</tr>
										</table>	
									</td>
									
									<td>
										<table class="table" style="width: 20%">
											<tr>
												<th>무료</th>
											</tr>
											<tr>
												<td style="font-size: 14px">
													- 학교 주요 행사 진행 및 참석 차량<br>
													- 학교 업무용 차량, 공무차량, 공사 차량<br>
													- 우편물(택배) 차량<p>
												</td>
											</tr>
										</table>	
									</td>
									</tr>
								</table>
						
     		</div>

     	  </div>
        </div>
     </div>
     
     	 <div class="row">
        <div class="col-12">
          <div class="card mb-2">
          	<div class="card-body px-0 pt-3 pb-2">     		
          			<div class="row">    		
						<div class="col-6 d-flex align-items-center">
							<h6 class="mb-0" style="margin-top: 12px; margin-left: 35px; font-size: 22px">주차 가능 구역</h6>
						</div>
					</div>
					
<div id="map" style="width:95%; height:600px; margin-left: 32px; margin-top: 15px"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16f597e0a29c5b923afd4b93d374c451"></script>

<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.4480158, 126.6575041), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };
 
var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 
// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(35.8755582, 128.6053956); 
 
// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});
 
// 마커가 지도 위에 표시되도록 설정합니다
//marker.setMap(map);
 
// 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({
    content : "<div style='position: absolute; left: 0px; top: 0px;'><div style='width:140px;padding:1px;text-align:center;'>주차가능구역</div></div>" 
});
  
// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
//infowindow.open(map, marker); 
 
var imageSrc = "./img/parkmaker.png";                              // 마커이미지 주소
    imageSize = new kakao.maps.Size(40, 40);                // 마커이미지의 크기
    imageOption = {offset: new kakao.maps.Point(17, 36)};   // 마커의 좌표와 일치시킬 이미지 안에서의 좌표설정
      
// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
 
 
var arr = new Array();
arr[0] = ["제1주차장 (본관과 5호관 사이)", 37.448199, 126.656982, "본관과 5호관 사이","17567279"];
arr[1] = ["제2주차장 (4호관 옆)",37.448416, 126.658049, "4호관 옆","17565806"];
arr[2] = ["제3주차장 (종합실습관 지하)",37.446889, 126.657997, "종합실습관 지하","19265258"];
arr[3] = ["제4주차장 (7호관 옆)",37.449448, 126.657008, "7호관 옆","27203660"];
 
var markerTmp;      // 마커
var customOverlay;  // 오버레이
var contentStr;
 
for (var i=0;i<arr.length;i++) {
    markerTmp = new daum.maps.Marker({
        position: new daum.maps.LatLng(arr[i][1],arr[i][2]),
        title: arr[i][0],
        image: markerImage,
        map:map
    });
 
    contentStr = "<div class='customoverlay'><a href='https://map.kakao.com/link/map/"+ arr[i][4] +"' target='_blank'><span class='title'>"+ arr[i][0] +"</span></a></div>";
 
    customOverlay = new kakao.maps.CustomOverlay({
        map: map,
        position: new daum.maps.LatLng(arr[i][1],arr[i][2]),
        content: contentStr,
        yAnchor: 1 
    });
}
 
 
// 지도 타입 변경 컨트롤을 생성한다
var mapTypeControl = new kakao.maps.MapTypeControl();
 
// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);    
 
// 지도에 확대 축소 컨트롤을 생성한다
var zoomControl = new kakao.maps.ZoomControl();
 
// 지도의 우측에 확대 축소 컨트롤을 추가한다
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
 
// 아래 코드는 지도 위의 마커를 제거하는 코드입니다
// marker.setMap(null);    
</script>
			
			<br>
     		</div>

     	  </div>
        </div>
     </div>

    	
     
	</div>   
   </main>
</body>
</html>


