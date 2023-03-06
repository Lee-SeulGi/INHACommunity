<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
 <%@ page import = "bbs.BbsDAO" %>
 <%@ page import = "bbs.Bbs" %>
<%@ page import="book.Book"%>
<%@ page import="book.BookDAO"%>
<%@ page import="lost.Lost"%>
<%@ page import="lost.LostDAO"%>
<%@ page import="post.Post"%>
<%@ page import="post.PostDAO"%>
<!DOCTYPE html>
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content ="width=device-width", initial-scale="1">
        
    <style type="text/css">
a, a:hover{
	color: #000000;
	text-decoration: none; }
</style>
    <!-- Site Metas -->
    <title>인하공전 웹 서비스</title>
    
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

    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
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
	PrintWriter script = response.getWriter();
	int boardID=0;
	int id = 0;
	String title = null;
	String content = null;
	if(request.getParameter("boardID")!=null){    //bbsID를 받기
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	System.out.println("업뎃에서boardID : "+boardID);
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	} 
	if(userID ==null){
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp' ");
		script.println("</script>");
	}
	int bbsID=0;
	if(request.getParameter("bbsID")!=null){    //bbsID를 받기
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	int bookID=0;
	if(request.getParameter("bookID")!=null){    //bbsID를 받기
		bookID = Integer.parseInt(request.getParameter("bookID"));
	}
	
	int lostID=0;
	if(request.getParameter("lostID")!=null){    //bbsID를 받기
		lostID = Integer.parseInt(request.getParameter("lostID"));
	}
	
	int postID=0;
	if(request.getParameter("postID")!=null){    //bbsID를 받기
		postID = Integer.parseInt(request.getParameter("postID"));
	}
	
	if(bbsID == 0 && bookID ==0 && lostID == 0 && postID == 0){
		script.println("<script>");
		script.println("alert('작성자만 수정 가능합니다.')");
		script.println("location.href = 'main.jsp' ");
		script.println("</script>");
	}
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	Book book = new BookDAO().getBook(bookID);
	Lost lost = new LostDAO().getLost(lostID);
   Post post = new PostDAO().getPost(postID);

	if(boardID == 1){
		 id = bbsID;
		 title = bbs.getBbsTitle();
		 content = bbs.getBbsContent();
	}else if(boardID == 2){
		 id = bookID;
		 title = book.getBookTitle();
		 content = book.getBookContent();
	}else if(boardID == 3){
		 id = lostID;
		 title = lost.getLostTitle();
		 content = lost.getLostContent();
	}else if(boardID == 4){
		 id = postID;
		 title = post.getPostTitle();
		 content = post.getPostContent();
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
            <li class="breadcrumb-item text-sm text-white active" aria-current="page">Home</li>
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
  
   <section class="section wb">
   
   
   <div class="row">
        <div class="col-12">
          
          <form action="mupdateAction.jsp" method="post">
          
          <input type = "hidden"  name = "ID"  value=<%= id %>>
			<%System.out.println("id" +id); %>
			<input type = "hidden"  name = "boardID" value=<%= boardID %>>
          
          <div class="card mb-4">
				
                <div class="card-header pb-0 p-3">
                  <div class="row">
                    <div class="col-6 d-flex align-items-center">
                      <h6 class="mb-0">게시판 글 수정 양식</h6>
                    </div>
                    
                    
                  </div>
                </div>
                
                <div class="card-body p-3">

                	
                	<input type="text" style="height:50px;" class="form-control" placeholder="글 제목" 
								name="Title" maxlength="50" value="<%= title %>">
                  
	                <hr class="horizontal dark my-3">
                  
									
				<textarea class="form-control" placeholder="글 내용"name="Content" 
									maxlength="2048" style="height: 350px;"><%= content%></textarea>
									
				<div class="card-body pb-0 p-3 text-center">
									
					<input type="file" name="fileName">
                  
                </div>
                    
	                <hr class="horizontal dark my-3">
                    <div class="col-6 text-end">
                      <input type="submit" class="btn bg-gradient-dark mb-0" value="수정하기">
                    </div>
                    
                </div>
                
               
               	
              </div>
                </form>
         </div>
         
         <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="js/bootstrap2.js"></script>
    </div>
   
   
   
   </section>

  
  </div>
  
  
  
  </main>

    <!-- Core JavaScript
    ================================================== -->
    <script src="js/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.1.1.min2.js"></script>
    <script src="js/tether.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/custom.js"></script>

</body>
</html>