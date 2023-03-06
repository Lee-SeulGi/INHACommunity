<!--
=========================================================
* Argon Dashboard 2 - v2.0.4
=========================================================

* Product Page: https://www.creative-tim.com/product/argon-dashboard
* Copyright 2022 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import = "java.io.PrintWriter" %>
   <%@ page import = "bbs.BbsDAO" %>
   <%@ page import = "bbs.Bbs" %>
   <%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">


<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  <title>
    게시판 글 올리기
  </title>
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
</head>

<body class="g-sidenav-show   bg-gray-100">
<%
		String userID = null;
		if(session.getAttribute("userID")!= null){
			userID = (String) session.getAttribute("userID");
		}
		
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

  <div class="min-height-300 bg-primary position-absolute w-100"></div>
  
  <aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" target="_blank">
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
            <li class="breadcrumb-item text-sm text-white active" aria-current="page"><a class="opacity-5 text-white" href="main.jsp">Home</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="mbbs.jsp">게시판</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="Timetable_Insert.jsp">시간표</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="Calc.jsp">학점계산기</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="BuildingInfo.jsp">건물정보</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="ParkInfo.jsp">주차정보</a></li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">게시판</h6>
        </nav> 
       </div>       
    </nav>
    
    <div class="container-fluid py-4">
    
    
    
    
    <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">

                    <h5 class="font-weight-bolder">
                      	<a href="main.jsp" title="홈 바로가기" >HOME</a>
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">홈으로 바로가기</span>
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                    <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">

                    <h5 class="font-weight-bolder">
                     	 <a href="mbbs.jsp" title="자유 게시판 바로가기" >자유게시판</a>
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">만남과 소통의 장소</span>

                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                    <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">

                    <h5 class="font-weight-bolder">
                      	<a href="mbook.jsp"  title="중고책 게시판 바로가기" >중고책 게시판</a>
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">중고책 자유공고</span>

                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-success shadow-success text-center rounded-circle">
                    <i class="ni ni-paper-diploma text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">

                    <h5 class="font-weight-bolder">
                      	<a href="mlost.jsp"  title="분실물 게시판 바로가기">분실물 게시판</a>
                    </h5>
                    <p class="mb-0">
                      <span class="text-success text-sm font-weight-bolder">분실물 찾아주기</span>
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                    <i class="ni ni-cart text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    
	<hr class="horizontal dark my-3">
    
    		<!--  검색 기능 시작 -->
				<form method="post" name="search" action="search.jsp">
				<table class="pull-right">
				<input type="hidden" value="1" name="boardID">
					<tr>
						<td><select class="form-control" name="searchField">
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select></td>
						
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
							
						<td><button type="submit" class="btn bg-gradient-dark mb-0">검색</button></td>
					</tr>
				</table>	
			</form>
			<!--  검색 기능 끝 -->

    
      <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>자유게시판 목록</h6>
              <span class="text-success text-sm font-weight-bolder">여러 사람에게 알리거나 건의하고 싶은 내용을 자유롭게 올려 보세요!</span>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">번호</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">제목</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성자</th>
                      <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성일</th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  <tbody>
                  
                  <%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber); %>
					
						 <% 	if(list.size() == 0){ %>
						 
					<td><h4> There are no registered posts.</h4> </td> <% } %>
					
					<% for(int i =0; i < list.size(); i++){ %>
                  
                    <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                       		 <p class="text-xs font-weight-bold mb-0"><%= list.get(i).getBbsID() %></p>
                          </div>
                          
                        </div>
                      </td>
                      
                      
                      <td>
                            <h6 class="mb-0 text-sm"><a href = "mview.jsp?boardID=1&bbsID=<%= list.get(i).getBbsID() %>"><%= list.get(i).getBbsTitle()%></h6>
                      </td>
                      
                      
                      <td class="align-middle text-center text-sm">
                        <p class="text-xs font-weight-bold mb-0"><%= list.get(i).getUserID()%></p>
                      </td>
                      
                      
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)+"시" + list.get(i).getBbsDate().substring(14,16)+"분"%></span>
                      </td>
                      
                      
                      
                    </tr>
                    
                    <% 	}	%>
                   
                  </tbody>
                  
                  
                  
                </table>
                
                <%	if(pageNumber != 1){		%>
							<a href="mbbs.jsp?pageNumber=<%=pageNumber -1 %>" class="btn bg-gradient-dark mb-0">
							이전</a>
					<%	}		if(bbsDAO.nextPage(pageNumber +1)){ %>
							 <a href="mbbs.jsp?pageNumber=<%=pageNumber +1 %>" class="btn bg-gradient-dark mb-0">
								다음</a> 		<% 	}	%>

					
					<div class="col-6 text-end">
                      <a class="btn bg-gradient-dark mb-0" href="mwrite.jsp?boardID=1"><i class="fas fa-plus"></i>&nbsp;&nbsp;글쓰기</a>
                    </div>
                
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    
    
    
    </div>
    
    
    
    
  </main>
  
  
  
  
  
  
  
  <!--   Core JS Files   -->
  <script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/argon-dashboard.min.js?v=2.0.4"></script>
</body>

</html>