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
    
    <form method="post" name="form">
    
    <div class="container-fluid py-4">
    
    
	 <div class="row">
        <div class="col-12">
          <div class="card mb-2">
          	<div class="card-body px-0 pt-3 pb-2">     		
					<div class="row">
						<div class="col-6 d-flex align-items-center">
							<h6 class="mb-0" style="margin-left: 35px; font-size: 22px">학업시간표</h6>
						</div>
						
						<div class="col-6 text-end" style="margin-top: 12px">
							<input type="submit" class="btn btn-primary btn-sm ms-auto" value="등록" onclick="javascript: form.action='Timetable_Insert.jsp';">
							<input type="submit" class="btn btn-primary btn-sm ms-auto" value="삭제" onclick="javascript: form.action='Timetable_Delete_Query.jsp';">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</div>
					
					<%
						try{
							Class.forName("com.mysql.jdbc.Driver");
							Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bbs", "root", "1234");
							Statement stmt = conn.createStatement();
							ResultSet rs = stmt.executeQuery("select * from period");
					%>
					
	<table style="width: 95%; margin-top: 8px; margin-left: 30px" class="table">
	<tr style="text-align: center; background-color: #fcfcfd">
		<td style="width: 10%; border-right: 1px solid #e9ecef; font-weight: bold"></td>
		<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">월</td>
		<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">화</td>
		<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">수</td>
		<td style="width: 18%; border-right: 1px solid #e9ecef; font-weight: bold">목</td>
		<td style="width: 18%; font-weight: bold">금</td>
	</tr>
	
	<%
		while(rs.next()){
			request.setCharacterEncoding("UTF-8");
			
			// 1교시 (월, 화, 수, 목, 금)
			String sm1 = rs.getString("sm1");
			String pm1 = rs.getString("pm1");
			String st1 = rs.getString("st1");
			String pt1 = rs.getString("pt1");
			String sw1 = rs.getString("sw1");
			String pw1 = rs.getString("pw1");
			String su1 = rs.getString("su1");
			String pu1 = rs.getString("pu1");
			String sf1 = rs.getString("sf1");
			String pf1 = rs.getString("pf1");
			
			// 2교시 (월, 화, 수, 목, 금)
			String sm2 = rs.getString("sm2");
			String pm2 = rs.getString("pm2");
			String st2 = rs.getString("st2");
			String pt2 = rs.getString("pt2");
			String sw2 = rs.getString("sw2");
			String pw2 = rs.getString("pw2");
			String su2 = rs.getString("su2");
			String pu2 = rs.getString("pu2");
			String sf2 = rs.getString("sf2");
			String pf2 = rs.getString("pf2");			
			
			// 3교시 (월, 화, 수, 목, 금)
			String sm3 = rs.getString("sm3");
			String pm3 = rs.getString("pm3");
			String st3 = rs.getString("st3");
			String pt3 = rs.getString("pt3");
			String sw3 = rs.getString("sw3");
			String pw3 = rs.getString("pw3");
			String su3 = rs.getString("su3");
			String pu3 = rs.getString("pu3");
			String sf3 = rs.getString("sf3");
			String pf3 = rs.getString("pf3");
			
			// 4교시 (월, 화, 수, 목, 금)
			String sm4 = rs.getString("sm4");
			String pm4 = rs.getString("pm4");
			String st4 = rs.getString("st4");
			String pt4 = rs.getString("pt4");
			String sw4 = rs.getString("sw4");
			String pw4 = rs.getString("pw4");
			String su4 = rs.getString("su4");
			String pu4 = rs.getString("pu4");
			String sf4 = rs.getString("sf4");
			String pf4 = rs.getString("pf4");			

			// 5교시 (월, 화, 수, 목, 금)
			String sm5 = rs.getString("sm5");
			String pm5 = rs.getString("pm5");
			String st5 = rs.getString("st5");
			String pt5 = rs.getString("pt5");
			String sw5 = rs.getString("sw5");
			String pw5 = rs.getString("pw5");
			String su5 = rs.getString("su5");
			String pu5 = rs.getString("pu5");
			String sf5 = rs.getString("sf5");
			String pf5 = rs.getString("pf5");
			
			// 6교시 (월, 화, 수, 목, 금)
			String sm6 = rs.getString("sm6");
			String pm6 = rs.getString("pm6");
			String st6 = rs.getString("st6");
			String pt6 = rs.getString("pt6");
			String sw6 = rs.getString("sw6");
			String pw6 = rs.getString("pw6");
			String su6 = rs.getString("su6");
			String pu6 = rs.getString("pu6");
			String sf6 = rs.getString("sf6");
			String pf6 = rs.getString("pf6");
			
			// 7교시 (월, 화, 수, 목, 금)
			String sm7 = rs.getString("sm7");
			String pm7 = rs.getString("pm7");
			String st7 = rs.getString("st7");
			String pt7 = rs.getString("pt7");
			String sw7 = rs.getString("sw7");
			String pw7 = rs.getString("pw7");
			String su7 = rs.getString("su7");
			String pu7 = rs.getString("pu7");
			String sf7 = rs.getString("sf7");
			String pf7 = rs.getString("pf7");
			
			// 8교시 (월, 화, 수, 목, 금)
			String sm8 = rs.getString("sm8");
			String pm8 = rs.getString("pm8");
			String st8 = rs.getString("st8");
			String pt8 = rs.getString("pt8");
			String sw8 = rs.getString("sw8");
			String pw8 = rs.getString("pw8");
			String su8 = rs.getString("su8");
			String pu8 = rs.getString("pu8");
			String sf8 = rs.getString("sf8");
			String pf8 = rs.getString("pf8");
			
			// 9교시 (월, 화, 수, 목, 금)
			String sm9 = rs.getString("sm9");
			String pm9 = rs.getString("pm9");
			String st9 = rs.getString("st9");
			String pt9 = rs.getString("pt9");
			String sw9 = rs.getString("sw9");
			String pw9 = rs.getString("pw9");
			String su9 = rs.getString("su9");
			String pu9 = rs.getString("pu9");
			String sf9 = rs.getString("sf9");
			String pf9 = rs.getString("pf9");
			
			// 10교시 (월, 화, 수, 목, 금)
			String sm10 = rs.getString("sm10");
			String pm10 = rs.getString("pm10");
			String st10 = rs.getString("st10");
			String pt10 = rs.getString("pt10");
			String sw10 = rs.getString("sw10");
			String pw10 = rs.getString("pw10");
			String su10 = rs.getString("su10");
			String pu10 = rs.getString("pu10");
			String sf10 = rs.getString("sf10");
			String pf10 = rs.getString("pf10");
			
			// 11교시 (월, 화, 수, 목, 금)
			String sm11 = rs.getString("sm11");
			String pm11 = rs.getString("pm11");
			String st11 = rs.getString("st11");
			String pt11 = rs.getString("pt11");
			String sw11 = rs.getString("sw11");
			String pw11 = rs.getString("pw11");
			String su11 = rs.getString("su11");
			String pu11 = rs.getString("pu11");
			String sf11 = rs.getString("sf11");
			String pf11 = rs.getString("pf11");
			
			// 12교시 (월, 화, 수, 목, 금)
			String sm12 = rs.getString("sm12");
			String pm12 = rs.getString("pm12");
			String st12 = rs.getString("st12");
			String pt12 = rs.getString("pt12");
			String sw12 = rs.getString("sw12");
			String pw12 = rs.getString("pw12");
			String su12 = rs.getString("su12");
			String pu12 = rs.getString("pu12");
			String sf12 = rs.getString("sf12");
			String pf12 = rs.getString("pf12");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>1교시<br>09:00~09:50</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm1 + "<br>" + pm1 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st1 + "<br>" + pt1 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw1 + "<br>" + pw1 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su1 + "<br>" + pu1 + "</td>");
			out.println("<td>" + sf1 + "<br>" + pf1 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>2교시<br>09:55~10:45</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm2 + "<br>" + pm2 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st2 + "<br>" + pt2 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw2 + "<br>" + pw2 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su2 + "<br>" + pu2 + "</td>");
			out.println("<td>" + sf2 + "<br>" + pf2 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>3교시<br>10:50~11:40</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm3 + "<br>" + pm3 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st3 + "<br>" + pt3 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw3 + "<br>" + pw3 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su3 + "<br>" + pu3 + "</td>");
			out.println("<td>" + sf3 + "<br>" + pf3 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>4교시<br>11:45~12:35</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm4 + "<br>" + pm4 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st4 + "<br>" + pt4 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw4 + "<br>" + pw4 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su4 + "<br>" + pu4 + "</td>");
			out.println("<td>" + sf4 + "<br>" + pf4 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>5교시<br>12:40~13:30</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm5 + "<br>" + pm5 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st5 + "<br>" + pt5 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw5 + "<br>" + pw5 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su5 + "<br>" + pu5 + "</td>");
			out.println("<td>" + sf5 + "<br>" + pf5 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>6교시<br>13:35~14:25</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm6 + "<br>" + pm6 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st6 + "<br>" + pt6 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw6 + "<br>" + pw6 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su6 + "<br>" + pu6 + "</td>");
			out.println("<td>" + sf6 + "<br>" + pf6 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>7교시<br>14:30~15:20</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm7 + "<br>" + pm7 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st7 + "<br>" + pt7 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw7 + "<br>" + pw7 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su7 + "<br>" + pu7 + "</td>");
			out.println("<td>" + sf7 + "<br>" + pf7 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>8교시<br>15:25~16:15</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm8 + "<br>" + pm8 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st8 + "<br>" + pt8 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw8 + "<br>" + pw8 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su8 + "<br>" + pu8 + "</td>");
			out.println("<td>" + sf8 + "<br>" + pf8 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>9교시<br>16:20~17:10</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm9 + "<br>" + pm9 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st9 + "<br>" + pt9 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw9 + "<br>" + pw9 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su9 + "<br>" + pu9 + "</td>");
			out.println("<td>" + sf9 + "<br>" + pf9 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>10교시<br>17:15~18:05</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm10 + "<br>" + pm10 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st10 + "<br>" + pt10 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw10 + "<br>" + pw10 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su10 + "<br>" + pu10 + "</td>");
			out.println("<td>" + sf10 + "<br>" + pf10 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>11교시<br>18:10~19:00</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm11 + "<br>" + pm11 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st11 + "<br>" + pt11 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw11 + "<br>" + pw11 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su11 + "<br>" + pu11 + "</td>");
			out.println("<td>" + sf11 + "<br>" + pf11 + "</td>");
			out.println("</tr>");
			
			out.println("<tr style='text-align: center'>");
			out.println("<td style='border-right: 1px solid #e9ecef; font-weight: bold;'>12교시<br>19:05~19:55</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sm12 + "<br>" + pm12 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + st12 + "<br>" + pt12 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + sw12 + "<br>" + pw12 + "</td>");
			out.println("<td style='border-right: 1px solid #e9ecef'>" + su12 + "<br>" + pu12 + "</td>");
			out.println("<td>" + sf12 + "<br>" + pf12 + "</td>");
			out.println("</tr>");
		}
	%>
</table>

<%
	} catch(SQLException e){
		e.printStackTrace();
	}
%>					
				</div>
     		</div>
     	  </div>
        </div>
     </div>
   </form>
   
   
   </main>
</body>
</html>


