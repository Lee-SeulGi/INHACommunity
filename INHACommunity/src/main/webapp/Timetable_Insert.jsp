<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
          <h6 class="font-weight-bolder text-white mb-0">시간표</h6>
        </nav> 
       </div>       
    </nav>
    
    <form action="Timetable_Insert_Query.jsp" method="post">
    
    <div class="container-fluid py-4">
    
	 <div class="row">
        <div class="col-12">
          <div class="card mb-2">
          	<div class="card-body px-0 pt-3 pb-2">     		
				
				<div class="row">
						<div class="col-6 d-flex align-items-center">
							<h6 class="mb-0" style="margin-left: 35px; font-size: 22px">새 학업시간표 등록</h6>
						</div>
						
						<div class="col-6 text-end" style="margin-top: 12px">
							<input type="reset" class="btn btn-primary btn-sm ms-auto" value="초기화">
							<input type="submit" class="btn btn-primary btn-sm ms-auto" value="저장" onclick="javascript: form.action='Timetable_Insert_Query.jsp';">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
				</div>
				
				<table style="width: 95%; margin-top: 8px; margin-left: 30px" class="table">
				<tr style="text-align: center; background-color: #fcfcfd">
					<td style="width: 10%; border-right: 1px solid #e9ecef; font-weight: bold"></td>
					<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">월</td>
					<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">화</td>
					<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">수</td>
					<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">목</td>
					<td style="width: 18%; font-weight: bold">금</td>
				</tr>
				
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">1교시<br>09:00~09:50</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm1" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm1" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st1" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt1" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw1" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw1" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su1" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu1" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf1" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf1" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">2교시<br>09:55~10:45</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm2" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm2" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st2" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt2" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw2" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw2" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su2" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu2" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf2" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf2" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">3교시<br>10:50~11:40</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm3" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm3" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st3" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt3" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw3" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw3" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su3" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu3" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf3" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf3" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">4교시<br>11:45~12:35</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm4" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm4" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st4" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt4" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw4" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw4" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su4" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu4" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf4" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf4" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">5교시<br>12:40~13:30</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm5" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm5" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st5" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt5" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw5" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw5" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su5" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu5" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf5" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf5" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">6교시<br>13:35~14:25</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm6" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm6" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st6" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt6" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw6" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw6" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su6" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu6" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf6" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf6" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">7교시<br>14:30~15:20</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm7" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm7" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st7" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt7" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw7" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw7" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su7" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu7" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf7" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf7" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">8교시<br>15:25~16:15</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm8" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm8" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st8" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt8" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw8" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw8" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su8" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu8" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf8" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf8" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">9교시<br>16:20~17:10</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm9" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm9" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st9" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt9" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw9" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw9" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su9" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu9" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf9" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf9" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">10교시<br>17:15~18:05</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm10" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm10" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st10" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt10" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw10" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw10" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su10" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu10" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf10" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf10" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">11교시<br>18:10~19:00</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm11" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm11" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st11" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt11" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw11" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw11" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su11" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu11" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf11" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf11" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>
				<tr style="text-align: center">
					<td style="border-right: 1px solid #e9ecef; font-weight: bold;">12교시<br>19:05~19:55</td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sm12" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pm12" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_st12" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pt12" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_sw12" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pw12" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td style="border-right: 1px solid #e9ecef;"><input type="text" name="_su12" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pu12" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
					<td><input type="text" name="_sf12" placeholder="과목명" style="height: 22px; border: none; text-align: center;"> <br> <input type="text" name="_pf12" placeholder="교수명" style="height: 22px; border: none; text-align: center;"></td>
				</tr>				
				</table>
     		</div>
     	  </div>
        </div>
     </div>
   </div>
   </form>
   </main>
</body>
</html>


