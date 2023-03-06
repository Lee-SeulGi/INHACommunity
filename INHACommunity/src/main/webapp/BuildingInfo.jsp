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

	ul.tabs{
		margin: 0px;
		padding: 15px 0px 0px 0px;
		list-style: none;
	}
	
	ul.tabs li{
	  	display: inline-block;
		background: #f0f0f0;
		margin: 0px 0px 5px 0px;
		padding: 15px 20px;
		cursor: pointer;
	}
	
	ul.tabs li.current{
		background: #5E72E4;
		margin: 0px;
		color: #ffffff;
	}
	
	.tab-content{
	  	display: none;
		background: #ffffff;
		margin: 0px;
		padding: 20px 0px 10px 0px;
	}
	
	.tab-content.current{
		display: inherit;
	}

</style>

</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	$(document).ready(function(){
		
		$('ul.tabs li').click(function(){
			var tab_id = $(this).attr('data-tab');
	
			$('ul.tabs li').removeClass('current');
			$('.tab-content').removeClass('current');
	
			$(this).addClass('current');
			$("#"+tab_id).addClass('current');
		})
	
	});
</script>
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
          <h6 class="font-weight-bolder text-white mb-0">건물정보</h6>
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
							<h6 class="mb-0" style="margin-top: 12px; margin-left: 35px; font-size: 22px">건물정보</h6>
						</div>
					</div>
					
<div class="container">
	<ul class="tabs">
		<li class="tab-link current" data-tab="tab-1">본관</li>
		<li class="tab-link" data-tab="tab-2">1호관</li>
		<li class="tab-link" data-tab="tab-3">2호관</li>
		<li class="tab-link" data-tab="tab-4">3호관</li>
		<li class="tab-link" data-tab="tab-5">4호관</li>
		<li class="tab-link" data-tab="tab-6">5호관</li>
		<li class="tab-link" data-tab="tab-7">6호관</li>
		<li class="tab-link" data-tab="tab-8">7호관(도서관)</li>
		<li class="tab-link" data-tab="tab-9">8호관(평생교육원)</li>
		<li class="tab-link" data-tab="tab-10">9호관</li>
		<li class="tab-link" data-tab="tab-11">10호관</li>
		<li class="tab-link" data-tab="tab-12">11호관(종합실습관)</li>
		<li class="tab-link" data-tab="tab-13">생활관(다온관)</li>
		<li class="tab-link" data-tab="tab-14">항공기 실습장</li>
		<li class="tab-link" data-tab="tab-15">동아리관</li>
		<li class="tab-link" data-tab="tab-16">수준원점</li>
		<li class="tab-link" data-tab="tab-17">교육용 B-727 항공기</li>
		<li class="tab-link" data-tab="tab-18">테니스장</li>
		<li class="tab-link" data-tab="tab-19">농구장</li>
		<li class="tab-link" data-tab="tab-20">풋살경기장</li>
		<li class="tab-link" data-tab="tab-21">운동장</li>
		<li class="tab-link" data-tab="tab-22">정문</li>
		<li class="tab-link" data-tab="tab-23">후문</li>
	</ul>
	
	<div id="tab-1" class="tab-content current" style="text-align:center">
		
		<img src="./img/mainB.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>본관</h3>
		(정문에서 약 180m 직진 후 좌측에 본관 위치)<p>
		1978년 준공되었으며, 각종 직속기관과 교무처, 입학학생처와 같은 대학 본부가 있다.
		
	</div>
	
	<div id="tab-2" class="tab-content" style="text-align:center">
	
		<img src="./img/1B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>1호관</h3>
		(정문에서 약 180m 직진 후 우측에 1호관 위치)<p>
		1971년 준공되었으며, 서비스학부(관광경영학과, 항공경영학과, 항공운항학과, 호텔경영학과, 비서과)가 이용하는 건물로 항공기내실습실, 공항지상실습실, 
		호텔식음실습실, 전산실, 이미지메이킹실 등 다양한 실습실, 학과사무실, 강의실, 교수연구실 등이 입지해 있다. 아울러, 1층에는 여학생휴게실, CU 편의점 등 편의시설이 구비되어 있다.
	
	</div>
	
	<div id="tab-3" class="tab-content" style="text-align:center">
	
		<img src="./img/2B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>2호관</h3>
		(정문에서 약 200m 직진 후 우측의 3호관을 지나 2호관 위치)<p>
		주로 디자인계열 학과(산업디자인과와 패션디자인과)가 사용하는 건물로, 다양한 실습실, 학과사무실 등이 
		위치해 있고 이외에도 다른 학과(항공운항학과, 관광경영학과, 기계설계과)의 실습실 등이 입지해 있다.<p>
		5층에 시청각실이 있는데 시험 시 몇몇 과의 시험장으로 활용되기도 하며, 외부 강사 초청 강연 혹은 각종 학교 행사 시에 활용된다.<p>
		인하공전 방송국이 2호관에 있다.
		
	</div>
	
	<div id="tab-4" class="tab-content" style="text-align:center">
	
		<img src="./img/3B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>3호관</h3>
		(정문에서 약 200m 직진 후 우측에 3호관 위치)<p>
		1층에는 문화광장과 카페, 교직원 식당과 학생 식당이 있으며, 복사실과 편의점이 있다. 
		편의점과 복사실앞에 학생들이 모여서 밥을 먹거나 여유시간을 가질 수 있도록 테이블과 의자가 설치되어있다.<p>
		인하공전의 학생들의 99% 이상이 한 번쯤은 꼭 들렀을 건물로, 도무지 안 들릴래야 안 들릴 수 없는 구조로 되어 있다.
		
	</div>
	
	<div id="tab-5" class="tab-content" style="text-align:center">
	
		<img src="./img/4B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>4호관</h3>
		(정문에서 약 270m 직진 후 우회전하여 45m 직진 후 좌측으로 4호관 위치)<p>
		주로 컴퓨터학과와 정보통신/건축학과 학생들이 이용한다.<p>
		6층에는 많은수의 학생들을 수용할 수 있는 대강의실이 위치해있어, 주로 학과 회의나 교수회의, 신입생 OT 등의 교내행사가 열린다.
	
	</div>
	
	<div id="tab-6" class="tab-content" style="text-align:center">
	
		<img src="./img/5B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>5호관</h3>
		(정문에서 약 210m 직진 후 좌원하여 약 55m 직진 후 우측으로 5호관 위치)<p>
		공과계열 학생들이 강의실로 주로 이용하며, 2층에는 프린터와 PC를 이용할 수 있는 사이버 플라자가 있다.<p>
		5호관의 건물은 특이하게도 지하1층과 1층으로 들어가는 입구가 달라서, 신입생들이 5호관에서 강의실 위치를 잘 못찾기도 한다.
		
	</div>
	
	<div id="tab-7" class="tab-content" style="text-align:center">
	
		<img src="./img/6B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>6호관</h3>
		(정문에서 약 270m 직진 후 우측으로 10m이동 후 직진으로 70m 이동하면 6호관 위치)<p>
		항공기계과, 화공과, 전자과 등이 강의를 듣는 공간이다.<p>
		옆의 7호관 3층 건물과 계단이 연결되어 있으며, 7호관에서 6호관으로 이동이 용이하다. 단, 7호관 도서관으로 바로는 갈 수 없다.
		
	</div>
	
	<div id="tab-8" class="tab-content" style="text-align:center">
	
		<img src="./img/7B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>7호관(도서관)</h3>
		(정문에서 약 270m 직진 후 좌측으로 100m 이동 후 우측으로 약 30m 이동하면 7호관(도서관) 위치)<p>
		7호관은 주로 교수들의 연구실 혹은 학과 사무실이 있다. 또한, 컴퓨터 시스템과 학생들이 주로 이곳에서 수업을 듣는다.<p>
		
		도서관 1층에는 자유롭게 대화를 하며 학습 혹은 책을 읽을 수 있는 공간인 북카페가 있고, 
		책을 빌리거나 열람할 수 있는 서고, 2층에는 각종 학습을 진행할 수 있는 칸막이형 제 1 열람실과, 
		개방형 테이블이 설치되어 있는 제 2 열람실, PC를 이용할 수 있는 사이버 플라자, 그룹스터디룸 등이 있다. 
		도서관 열람실은 1년 365일 상시 개방이며, 오후 11시까지 개방이다. 시험 기간 중에는 철야개방을 한다. 
		단, 서고는 특별한 일이 없는 이상 평일 오후 7시에 닫고, 방학 중에는 오후 5시에 닫는다.
		
	</div>
	
	<div id="tab-9" class="tab-content" style="text-align:center">
	
		<img src="./img/8B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>8호관(평생교육원)</h3>
		(정문에서 약 270m 직진 후 좌측으로 135m 이동 후 우측으로 210m 이동하면 우측으로 8호관(평생교육관) 위치)<p>
		8호관은 평생교육원으로 많이 불리며, 드론반 수업, 자격증 수업, 토익 수업/시험 등을 본다.
	
	</div>
	
	<div id="tab-10" class="tab-content" style="text-align:center">
	
		<img src="./img/9B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>9호관</h3>
		(정문에서 약 270m 직진 후 좌측으로 135m 이동 후 우측으로 200m 이동하면 우측으로 9호관 위치)
	
	</div>
	
	<div id="tab-11" class="tab-content" style="text-align:center">
	
		<img src="./img/10B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>10호관</h3>
		(정문에서 약 270m 직진 후 우측으로 10m이동 후 직진 50m 이동하면 10호관 위치)<p>
		4호관 건물 옆에 위치한 공간으로, 1층에는 가구 설비 기구들이 존재하여 있어 자주 실습하는 모습을 볼 수 있다.
		구조는 소방서 건물과 비슷한 형태를 취하며, 실내건축과 전용 건물로 사용중이다.
	
	</div>
	
	<div id="tab-12" class="tab-content" style="text-align:center">
	
		<img src="./img/11B.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>11호관(종합실습관)</h3>
		(정문에서 약 170m 직진 후 우측으로 80m 이동하면 11호관(종합실습관) 위치)<p>
		다른 공과계열 학과(기계과, 화공과, 자동차과 등)와 비서학과가 이 곳을 실습을 위하여 자주 사용한다. 생활관을 제외하고 가장 최근에 지어진 건물이고, 통유리로 제작되어 있어 건물이 매우 이쁘다.
	
	</div>
	
	<div id="tab-13" class="tab-content" style="text-align:center">
	
		<img src="./img/residenceB.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>생활관(다온관)</h3>
		(정문에서 약 30m 직진 후 우측으로 100m 이동하면 12호관(생활관) 위치)<p>
		인하공업전문대학 60주년을 기념하기 위하여 완공된 건물로, 보미건설에서 건설하였다. 생활관은 지상 8층, 지하 1층으로 구성되어 있다.<p>
		생활관 내부의 모습은 <a href="https://blog.naver.com/happy_inhatc/221199875496" title="기숙사 내부 탐방">인하공업전문대학 공식 블로그</a>를 참고한다.
	
	</div>
	
	<div id="tab-14" class="tab-content" style="text-align:center">
	
		<img src="./img/aircraftT.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>항공기 실습장</h3>
		(정문에서 약 270m 직진 후 2시 방향 20m 직진 후 왼쪽 계단으로 오른 뒤 우회전하여 30m 직진 후 계단을 오르면 위치)
	
	</div>
	
	<div id="tab-15" class="tab-content" style="text-align:center">
	
		<img src="./img/club.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>동아리관</h3>
		(정문에서 약 170m 직진 후 우측으로 200m 이동 후 동아리관 위치)<p>
		동아리관은 2022년도부터 전공스터디룸으로 개편되었다. 동아리관 위치는 4호관 옆과 6호관 옆 이렇게 두 군데로 나뉜다. 
	
	</div>
	
	<div id="tab-16" class="tab-content" style="text-align:center">
	
		<img src="./img/water.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>수준원점</h3>
		(정문에서 약 270m 직진 후 좌측으로 100m 이동 후 우측 언덕으로 약 70m 이동하면 수준원점 위치)<p>
		국가등록문화재 제247호로, 1963년 12월 2일에 설치되었으며 이 수준원점을 통하여 대한민국의 특정 지역의 고도가 정해진다.
		해발 0m 기준 지점에는 사실상 설치하기가 불가능하므로, 설치된 곳의 해발고도를 기준으로 상대적인 고도를 정하는데, 수준원점의 고도는 26.6871m이다.
	
	</div>
	
	<div id="tab-17" class="tab-content" style="text-align:center">
	
		<img src="./img/b-727.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>교육용 B-727 항공기</h3>
		(정문에서 약 170m 직진 후 우측으로 60m 이동 후 우측으로 위치)<p>
		대한항공 376편 동체착륙 사고로 운항 불가 판정을 받은 대한항공 소속 보잉 727 항공기가 같은 한진재단 소속인 인하공업전문대학에 실습용으로 제공되었다.<p>
		종합 실습관과 항공기가 어우러진 경관이 생각보다 멋지며, 인하공전 캠퍼스의 명물이다.
	
	</div>
	
	<div id="tab-18" class="tab-content" style="text-align:center">
	
		<img src="./img/tennis.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>테니스장</h3>
		(정문 우측으로 풋살경기장, 농구장 다음에 위치)
		
	</div>
	
	<div id="tab-19" class="tab-content" style="text-align:center">
	
		<img src="./img/basketball.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>농구장</h3>
		(정문 우측으로 풋살경기장 다음에 위치)
	
	</div>
	
	<div id="tab-20" class="tab-content" style="text-align:center">
	
		<img src="./img/soccer.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>풋살경기장</h3>
		(정문 우측으로 위치)
	
	</div>
	
	<div id="tab-21" class="tab-content" style="text-align:center">
	
		<img src="./img/ground.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>운동장</h3>
		(정문에서 약 30m 직진 후 좌측에 위치)
	
	</div>
	
	<div id="tab-22" class="tab-content" style="text-align:center">
	
		<img src="./img/front.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>정문</h3>
	
	</div>
	
	<div id="tab-23" class="tab-content" style="text-align:center">
	
		<img src="./img/back.jpg" style="width:60%; height:450px; margin-bottom: 15px">
		<h3>후문</h3>
	
	</div>

</div>					
									
						
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
							<h6 class="mb-0" style="margin-top: 12px; margin-left: 35px; font-size: 22px">캠퍼스 지도</h6>
						</div>
					</div>
     				
<div id="map" style="width:95%; height:500px; margin-left: 32px; margin-top: 15px"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=16f597e0a29c5b923afd4b93d374c451"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.4480158, 126.6575041), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
	var positions = [
	    {
	        content: '<div>본관</div>', 
	        latlng: new kakao.maps.LatLng(37.4480158, 126.6570042)
	    },
	    {
	        content: '<div>1호관</div>', 
	        latlng: new kakao.maps.LatLng(37.4474326, 126.6580041)
	    },
	    {
	        content: '<div>2호관</div>', 
	        latlng: new kakao.maps.LatLng(37.447627, 126.6585596)
	    },
	    {
	        content: '<div>3호관</div>',
	        latlng: new kakao.maps.LatLng(37.447975197767526, 126.65796347536153)
	    },
	    {
	        content: '<div>4호관</div>',
	        latlng: new kakao.maps.LatLng(37.448247326948426, 126.65859509880032)
	    },
	    {
	        content: '<div>5호관</div>',
	        latlng: new kakao.maps.LatLng(37.448432381916824, 126.65715901280424)
	    },
	    {
	        content: '<div>6호관</div>',
	        latlng: new kakao.maps.LatLng(37.448902620371, 126.6577501804671)
	    },
	    {
	        content: '<div>7호관(도서관)</div>',
	        latlng: new kakao.maps.LatLng(37.44909473002206, 126.65719554442255)
	    },
	    {
	        content: '<div>8호관(평생교육원)</div>',
	        latlng: new kakao.maps.LatLng(37.450430482167135, 126.65797489916393)
	    },
	    {
	        content: '<div>9호관</div>',
	        latlng: new kakao.maps.LatLng(37.45059272714346, 126.65799676338594)
	    },
	    {
	        content: '<div>10호관</div>',
	        latlng: new kakao.maps.LatLng(37.448585217510754, 126.65859921384985)
	    },
	    {
	        content: '<div>11호관(종합실습관)</div>',
	        latlng: new kakao.maps.LatLng(37.44692099733078, 126.65795697387813)
	    },
	    {
	        content: '<div>생활관(다온관)</div>',
	        latlng: new kakao.maps.LatLng(37.44591496069368, 126.65746997075448)
	    },
	    {
	        content: '<div>항공기 실습장</div>',
	        latlng: new kakao.maps.LatLng(37.449142137204404, 126.65800901799305)
	    },
	    {
	        content: '<div>동아리관</div>',
	        latlng: new kakao.maps.LatLng(37.448258008546404, 126.65917423245313)
	    },
	    {
	        content: '<div>수준원점</div>',
	        latlng: new kakao.maps.LatLng(37.44944661069993, 126.65736345812103)
	    },
	    {
	        content: '<div>교육용 B-727 항공기</div>',
	        latlng: new kakao.maps.LatLng(37.44705448589002, 126.65738284371254)
	    },
	    {
	        content: '<div>테니스장</div>',
	        latlng: new kakao.maps.LatLng(37.44691956961786, 126.65514022758174)
	    },
	    {
	        content: '<div>농구장</div>',
	        latlng: new kakao.maps.LatLng(37.44674978042826, 126.65562129468549)
	    },
	    {
	        content: '<div>풋살경기장</div>',
	        latlng: new kakao.maps.LatLng(37.44660238267962, 126.65605705366067)
	    },
	    {
	        content: '<div>운동장</div>',
	        latlng: new kakao.maps.LatLng(37.44727002515017, 126.65636477376142)
	    },
	    {
	        content: '<div>정문</div>',
	        latlng: new kakao.maps.LatLng(37.44619354605574, 126.65644315262934)
	    },
	    {
	        content: '<div>후문</div>',
	        latlng: new kakao.maps.LatLng(37.45075684028735, 126.65788582666806)
	    }
	];
	
	for (var i = 0; i < positions.length; i ++) {
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng // 마커의 위치
	    });
	
	    // 마커에 표시할 인포윈도우를 생성합니다 
	    var infowindow = new kakao.maps.InfoWindow({
	        content: positions[i].content // 인포윈도우에 표시할 내용
	    });
	
	    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
	    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
	    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
	}
	
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
	    return function() {
	        infowindow.open(map, marker);
	    };
	}
	
	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
	    return function() {
	        infowindow.close();
	    };
	}
</script>     				
     
     
     
     </div>
     </div>
     </div>
     </div>
     

					
     </div>   
   </main>
</body>
</html>


