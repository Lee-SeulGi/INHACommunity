<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

 <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="assets/img/favicon.png">
  
  
<title>인하공업전문대학 웹 서비스</title>

 <!-- Design fonts -->
    <link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet"> 

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- FontAwesome Icons core CSS -->
    <link href="css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="style.css" rel="stylesheet">

    <!-- Responsive styles for this template -->
    <link href="css/responsive.css" rel="stylesheet">

    <!-- Colors for this template -->
    <link href="css/colors.css" rel="stylesheet">

    <!-- Version Garden CSS for this template -->
    <link href="css/version/garden.css" rel="stylesheet">

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


<body class="g-sidenav-show bg-gray-100">

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
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">Home</li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="mbbs.jsp">게시판</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="Timetable_Insert.jsp">시간표</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="Calc.jsp">학점계산기</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="BuildingInfo.jsp">건물정보</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-white" href="ParkInfo.jsp">주차정보</a></li>
          </ol>
          <h6 class="font-weight-bolder text-white mb-0">Home</h6>
        </nav> 
       </div>       
    </nav>
    
    
  <div class="container-fluid py-4">
  
  
  	<div class="card shadow-lg mx-4">
      <div class="card-body p-3">
        <div class="row px-4">
        
        	<div class="col-auto">
            	<div class="avatar avatar-xl position-relative">
              		<a href="main.jsp"><img src="assets/img/logo_col.png" alt="profile_image" class="w-100 border-radius-lg shadow-sm"></a>
           		 </div>
         	 </div>
          
          <div class="col-auto my-auto">
            <div class="h-100">
              <h5 class="mb-1">
                	인하공업전문대학
              </h5>
              <p class="mb-0 font-weight-bold text-sm">
                INHA TECHNICAL COLLEGE
              </p>
            </div>
          </div>
          
          
        </div>
      </div>
    </div>
    
    
    <div class="row mt-4">

        
        <div class="col-lg-5">
          <div class="card">
            <div class="card-header pb-0 p-3">
              <h6 class="mb-0">게시판 목록</h6>
            </div>
            <div class="card-body p-3">
              <ul class="list-group">
              
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center">
                    <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                      <i class="ni ni-mobile-button text-white opacity-10"></i>
                    </div>
                    <div class="d-flex flex-column">
                      <h6 class="mb-1 text-dark text-sm"> <a href = "mbbs.jsp">자유게시판</a></h6>
                      <span class="text-xs">모든 사용자, <span class="font-weight-bold">all users</span></span>
                    </div>
                  </div>
                  <div class="d-flex">
                    <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button>
                  </div>
                </li>
                
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex align-items-center">
                    <div class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                      <i class="ni ni-tag text-white opacity-10"></i>
                    </div>
                    <div class="d-flex flex-column">
                      <h6 class="mb-1 text-dark text-sm"><a href = "post.jsp">관리자 게시판</a></h6>
                      <span class="text-xs">관리자 <span class="font-weight-bold">administer</span></span>
                    </div>
                  </div>
                  <div class="d-flex">
                    <button class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></button>
                  </div>
                </li>
               
                
              </ul>
            </div>
          </div>
        </div>
        
        
        
      </div>
  
  	<div class="row mt-4">
      

				<!-- 오른쪽 포스트 목록 -->
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget">
                                <h2 class="widget-title">포스트 목록</h2>
                                <div class="blog-list-widget">
                                    <div class="list-group">
                                        
                                            <div class="w-100 last-item justify-content-between">
                                            	<hr class="invis">
                                            		<div class="a">
                                            			<a href="#" onclick="Control.Modal.openDialog(this, event, 'img/poster2.png');">
                                                		<img src="img/poster2.png" alt="" class="img-fluid float-left">
                                                		</a>
                                                	</div>
                                                <small>2022 11/05</small>
                                                
                                            </div>
                                    </div>
                                </div><!-- end blog-list -->
                            </div><!-- end widget -->


                            
                        </div><!-- end sidebar -->
                    </div><!-- end col -->
                    

      

				<!-- 오른쪽 포스트 목록 -->
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget">
                               
                                <div class="blog-list-widget">
                                    <div class="list-group">
                                        
                                            <div class="w-100 last-item justify-content-between">
                                            	
                                                <hr class="invis">
                                                	<div class="a">
                                                		<img src="img/poster3.jpg" alt="" class="img-fluid float-left">
                                                	</div>
                                                <small>2022 11/03</small>
                                                
                                            </div>
                                    </div>
                                </div><!-- end blog-list -->
                            </div><!-- end widget -->


                            
                        </div><!-- end sidebar -->
                    </div><!-- end col -->
                    
 

				<!-- 오른쪽 포스트 목록 -->
                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="sidebar">
                            <div class="widget">
                              
                                <div class="blog-list-widget">
                                    <div class="list-group">
                                        
                                            <div class="w-100 last-item justify-content-between">
                                            	
                                                <hr class="invis">
                                                	<div class="a">
                                                		<img src="img/poster1.png" alt="" class="img-fluid float-left">
                                                	</div>
                                                <small>2022 11/01</small>
                                            </div>
                                    </div>
                                </div><!-- end blog-list -->
                            </div><!-- end widget -->


                            
                        </div><!-- end sidebar -->
                    </div><!-- end col -->
                    
                    
        
   </div>

  	
  	
  
  
  
  
  
  
  
  
  </div>

  </main>
  
  
  
  
  
  
  
  
  
  


</body>
</html>