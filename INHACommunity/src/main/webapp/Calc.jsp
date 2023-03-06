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
          <h6 class="font-weight-bolder text-white mb-0">학점계산기</h6>
        </nav> 
       </div>       
    </nav>
    
    <div class="container-fluid py-4">
    
	 <div class="row">
        <div class="col-12">
          <div class="card mb-2">
          	<div class="card-body px-0 pt-0 pb-2">
    <p>      		
    <form method="post" name="form">
	<table class="table" >
		<tr align=center height="50">
            <th style="width: 250px">과목명</th>
            <th style="width: 85px">점수</th>
            <th style="width: 80px">학점</th>
            <th style="width: 50px">전공</th>
            <th style="width: 250px">과목명</th>
            <th style="width: 85px">점수</th>
            <th style="width: 80px">학점</th>
            <th style="width: 50px">전공</th>
         </tr>
         
         <%
         for (int i = 1; i < 21; i += 2) {
            String subject = "_subject";
            String score = "_score";
            String grade = "_grade";
            String major = "_major";
         %>
         
         <tr align=center height="50">
            <td><input type="text" name="<%=subject + i%>"
               style="width: 200px; height: 30px; border: none; text-align: center;" class="ni education_hat mr-2"></td>
            <td><select title="과목별 점수 선택" name="<%=score + i%>" 
               style="width: 64px; height: 30px" class="ni education_hat mr-2">
                  <option value="0" class="ni education_hat mr-2">선택</option>
                  <option value="4.5" class="ni education_hat mr-2">A+</option>
                  <option value="4" class="ni education_hat mr-2">A</option>
                  <option value="3.5" class="ni education_hat mr-2">B+</option>
                  <option value="3" class="ni education_hat mr-2">B</option>
                  <option value="2.5" class="ni education_hat mr-2">C+</option>
                  <option value="2" class="ni education_hat mr-2">C</option>
                  <option value="1.5" class="ni education_hat mr-2">D+</option>
                  <option value="1" class="ni education_hat mr-2">D</option>
                  <option value="0" class="ni education_hat mr-2">F</option>
                  <option value="0" class="ni education_hat mr-2">P</option>
            </select></td>
            <td><input type="text" name="<%=grade + i%>" maxlength="2"
               size="2" style="border: none; weight: 20px; height: 30px; text-align: center;" class="ni education_hat mr-2"></td>
            <td><input type="checkbox" name="<%=major + i%>"
               style="width: 10px; height: 30px;"></td>

            <td><input type="text" name="<%=subject + (i + 1)%>"
               style="width: 200px; height: 30px; border: none; text-align: center;" class="ni education_hat mr-2"></td>
            <td><select title="과목별 점수 선택" name="<%=score + (i + 1)%>"
               style="width: 64px; height: 30px;" class="ni education_hat mr-2">
                  <option value="0" class="ni education_hat mr-2">선택</option>
                  <option value="4.5" class="ni education_hat mr-2">A+</option>
                  <option value="4" class="ni education_hat mr-2">A</option>
                  <option value="3.5" class="ni education_hat mr-2">B+</option>
                  <option value="3" class="ni education_hat mr-2">B</option>
                  <option value="2.5" class="ni education_hat mr-2">C+</option>
                  <option value="2" class="ni education_hat mr-2">C</option>
                  <option value="1.5" class="ni education_hat mr-2">D+</option>
                  <option value="1" class="ni education_hat mr-2">D</option>
                  <option value="0" class="ni education_hat mr-2">F</option>
                  <option value="0" class="ni education_hat mr-2">P</option>
            </select></td>
            <td><input type="text" name="<%=grade + (i + 1)%>" maxlength="2"
               size="2" style="border: none; height: 30px; text-align: center;" class="ni education_hat mr-2"></td>
            <td><input type="checkbox" name="<%=major + (i + 1)%>"
               style="width: 10px; height: 30px;" class="ni education_hat mr-2"></td>
        <%
        	}
        %>
         
      </table>
		
		<p>
	  <table class="noneborder" align=center>
	  	<tr>
	  		<td><input type="submit" class="btn btn-primary btn-sm ms-auto" value="계산" onclick="javascript: form.action='Calc.jsp';">&nbsp;</td>
	  		<td><input type="submit" class="btn btn-primary btn-sm ms-auto" value="초기화" onclick="javascript: form.action='Calc.jsp';"></td>
	  	</tr>
	  </table>
	  
	  </form>
          	
     		</div>
     	  </div>
        </div>
     </div>
	<div class="row">
        <div class="col-12">
          <div class="card mb-3">
          	<div class="card-body px-0 pt-1 pb-2">
          	
          	<%
	         double totalgrade = 0;		// 모든 학점들의 합
	         double totalgap = 0;		// (학점 * 등급) 값의 누계
	         double avgresult = 0;		// (totalgap / totalgrade) 총 평점
	         double avground;			// avgresult 값을 소숫점 한자리까지 표시한 값
	         
	         int[] igrade = new int[23];
	         int[] iscore = new int[23];
	         
	         String[] grade = new String[23];
	         String[] score = new String[23];
	         
	         for (int i = 1; i < 21; i++) {
	            grade[i] = request.getParameter("_grade" + i);
	            score[i] = request.getParameter("_score" + i);
	
	            if ((grade[i] == null || "".equals(grade[i]))) { // 입력하지 않은 애들 처리
	               igrade[i] = 0;
	            }
	            else {
	              //System.out.println(Double.parseDouble(grade[i]));
	              //System.out.println(Double.parseDouble(score[i]));
	              
	              totalgap = totalgap + (Double.parseDouble(grade[i]) * Double.parseDouble(score[i]));
	              totalgrade = totalgrade + Double.parseDouble(grade[i]);
	            }
	         }
	         
	         avgresult = totalgap / totalgrade;
	         avground = (Math.round(avgresult * 100) / 100.0);
	         
	         // 콘솔 확인용
	         System.out.println("총 평점 : " + avground);
	         System.out.println("누계 값: " + totalgap);
	         System.out.println("이수 학점 : " + totalgrade);   
		%>
		
		<p>
		<div style="text-align:center">
			<span style="font-size: 20px; font-weight: bold;" class="ni education_hat mr-2">총 평점&nbsp;</span>
			<span style="font-size: 28px; font-weight: bold; color: red;" class="ni education_hat mr-2"> <%= avground %>&nbsp;&nbsp;</span>
			<span style="font-size: 20px; font-weight: bold;" class="ni education_hat mr-2">이수학점&nbsp;</span>
			<span style="font-size: 28px; font-weight: bold; color: red;" class="ni education_hat mr-2"> <%= (Math.round(totalgrade * 100) / 100) %></span>
        </div>
        <p>
        </div>
        </div>
        </div>
        </div>

		<div class="container-fluid">
			<div class="row align-items-center justify-content-lg-center">
				<div class="col-lg-8 mb-lg-0 mb-4">
					<div class="copyright text-center text-sm text-muted text-lg-start">
						ⓘ 간단한 계산을 할 수 있는 웹 계산기입니다. 학점변환 결과는 일반적인 변환식을 적용한 결과로, 정확한 변환 결과는 해당 학교의 학적과를 통해 확인해주세요.
					</div>
				</div>
			</div>
		</div>

   </div>
   </main>
</body>
</html>


