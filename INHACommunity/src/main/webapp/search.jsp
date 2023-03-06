<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
   <!DOCTYPE html>
   <%@ page import = "java.io.PrintWriter" %>
  <%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="book.Book"%>
<%@ page import="book.BookDAO"%>
<%@ page import="lost.Lost"%>
<%@ page import="lost.LostDAO"%>
   <%@ page import = "java.util.ArrayList" %>
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
PrintWriter script = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		String userID = null;
		if(session.getAttribute("userID")!= null){
			userID = (String) session.getAttribute("userID");
		}
		
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		int boardID =  Integer.parseInt(request.getParameter("boardID"));
		System.out.println("검색에서 boardID :" +boardID);
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
     
    
    <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>검색 내용 :<%= request.getParameter("searchText") %></h6>
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
				System.out.println("서치필드 : "+ request.getParameter("searchField"));
				System.out.println("서치텍스트 : "+ request.getParameter("searchText"));
				String field = request.getParameter("searchField");
				String text = request.getParameter("searchText");
				if(boardID == 1){
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getSearch(request.getParameter("searchField"), request.getParameter("searchText"));
					if(  request.getParameter("searchField") == "0" ||  request.getParameter("searchField").equals("0")){
						script.println("<script>");
						script.println("alert('선택 사항이 없습니다.')");
						script.println( "location.href = 'mbbs.jsp' ");
						script.println("</script>");
					}
					if (list.size() == 0) {
						script.println("<script>");
						script.println("alert('항목이 없습니다.')");
						script.println( "location.href = 'mbbs.jsp' ");
						script.println("</script>");
					}
					for (int i = 0; i < list.size(); i++) { %>
                  
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
							<a href="mbbs.jsp?pageNumber=<%=pageNumber -1 %>&boardID=1&searchField=<%=field%>?searchText=<%=text%>" class="btn bg-gradient-dark mb-0">
							이전</a>
					<%	}		if(bbsDAO.nextPage(pageNumber +1)){ %>
							 <a href="mbbs.jsp?pageNumber=<%=pageNumber +1 %>&boardID=1&searchField=<%=field%>?searchText=<%=text%>" class="btn bg-gradient-dark mb-0">
								다음</a> 		<% 	}	%>

					
					<div class="col-6 text-end">
                      <a class="btn bg-gradient-dark mb-0" href="mwrite.jsp?boardID=1"><i class="fas fa-plus"></i>&nbsp;&nbsp;글쓰기</a>
                    </div>
                    
                    
             <% }else if(boardID == 2){ 
				BookDAO bookDAO = new BookDAO();
					ArrayList<Book> list = bookDAO.getSearch(request.getParameter("searchField"), request.getParameter("searchText"));
					if(  request.getParameter("searchField") == "0" ||  request.getParameter("searchField").equals("0")){
						script.println("<script>");
						script.println("alert('선택 사항이 없습니다.')");
						script.println( "location.href = 'mbook.jsp' ");
						script.println("</script>");
					}
					if (list.size() == 0) {
						script.println("<script>");
						script.println("alert('항목이 없습니다.')");
						script.println( "location.href = 'mbook.jsp' ");
						script.println("</script>");
					}
					for (int i = 0; i < list.size(); i++) {
					%>
					
					<tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                       		 <p class="text-xs font-weight-bold mb-0"><%= list.get(i).getBookID() %></p>
                          </div>
                          
                        </div>
                      </td>
                      
                      
                      <td>
                            <h6 class="mb-0 text-sm"><a href = "mview.jsp?boardID=2&bookID=<%= list.get(i).getBookID() %>"><%= list.get(i).getBookTitle()%></h6>
                      </td>
                      
                      
                      <td class="align-middle text-center text-sm">
                        <p class="text-xs font-weight-bold mb-0"><%= list.get(i).getUserID()%></p>
                      </td>
                      
                      
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%= list.get(i).getBookDate().substring(0,11) + list.get(i).getBookDate().substring(11,13)+"시" + list.get(i).getBookDate().substring(14,16)+"분"%></span>
                      </td>
                      
                      
                      
                    </tr>
                    
                    <% 	}	%>
                   
                  </tbody>
                  
                  
                  
                </table>
                
                <%	if(pageNumber != 1){		%>
							<a href="mbook.jsp?pageNumber=<%=pageNumber -1 %>&boardID=2&searchField=<%=field%>?searchText=<%=text%>" class="btn bg-gradient-dark mb-0">
							이전</a>
					<%	}		if(bookDAO.nextPage(pageNumber +1)){ %>
							 <a href="mbook.jsp?pageNumber=<%=pageNumber +1 %>&boardID=2&searchField=<%=field%>?searchText=<%=text%>" class="btn bg-gradient-dark mb-0">
								다음</a> 		<% 	}	%>

					
					<div class="col-6 text-end">
                      <a class="btn bg-gradient-dark mb-0" href="mwrite.jsp?boardID=2"><i class="fas fa-plus"></i>&nbsp;&nbsp;글쓰기</a>
                    </div>
                    
                    
           <%  }else if(boardID ==3){
				LostDAO lostDAO = new LostDAO();
					ArrayList<Lost> list = lostDAO.getSearch(request.getParameter("searchField"), request.getParameter("searchText"));
					if(  request.getParameter("searchField") == "0" ||  request.getParameter("searchField").equals("0")){
						script.println("<script>");
						script.println("alert('선택 사항이 없습니다.')");
						script.println( "location.href = 'mlost.jsp' ");
						script.println("</script>");
					}
					if (list.size() == 0) {
						script.println("<script>");
						script.println("alert('항목이 없습니다.')");
						script.println( "location.href = 'mlost.jsp' ");
						script.println("</script>");
					}
					for (int i = 0; i < list.size(); i++) {
					%>
					 <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                       		 <p class="text-xs font-weight-bold mb-0"><%= list.get(i).getLostID() %></p>
                          </div>
                          
                        </div>
                      </td>
                      
                      
                      <td>
                            <h6 class="mb-0 text-sm"><a href = "mview.jsp?boardID=3&lostID=<%= list.get(i).getLostID() %>"><%= list.get(i).getLostTitle()%></h6>
                      </td>
                      
                      
                      <td class="align-middle text-center text-sm">
                        <p class="text-xs font-weight-bold mb-0"><%= list.get(i).getUserID()%></p>
                      </td>
                      
                      
                      <td class="align-middle text-center">
                        <span class="text-secondary text-xs font-weight-bold"><%= list.get(i).getLostDate().substring(0,11) + list.get(i).getLostDate().substring(11,13)+"시" + list.get(i).getLostDate().substring(14,16)+"분"%></span>
                      </td>
                      
                      
                      
                    </tr>
                    
                    <% 	}	%>
                   
                  </tbody>
                  
                  
                  
                </table>
                
                <%	if(pageNumber != 1){		%>
							<a href="mbbs.jsp?pageNumber=<%=pageNumber -1 %>&boardID=3&searchField=<%=field%>?searchText=<%=text%>" class="btn bg-gradient-dark mb-0">
							이전</a>
					<%	}		if(lostDAO.nextPage(pageNumber +1)){ %>
							 <a href="mbbs.jsp?pageNumber=<%=pageNumber +1 %>&boardID=3&searchField=<%=field%>?searchText=<%=text%>" class="btn bg-gradient-dark mb-0">
								다음</a> 		<% 	}	%>

					
					<div class="col-6 text-end">
                      <a class="btn bg-gradient-dark mb-0" href="mwrite.jsp?boardID=3"><i class="fas fa-plus"></i>&nbsp;&nbsp;글쓰기</a>
                    </div>
                    
                    
                    
                    
             
                    <%} %>
                
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    
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