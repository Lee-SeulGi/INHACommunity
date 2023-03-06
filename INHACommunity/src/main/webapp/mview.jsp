<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.File"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="book.Book"%>
<%@ page import="book.BookDAO"%>
<%@ page import="lost.Lost"%>
<%@ page import="lost.LostDAO"%>
<%@ page import="post.Post"%>
<%@ page import="post.PostDAO"%>
<%@ page import="comment.Comment"%>
<%@ page import="comment.CommentDAO"%>
<!DOCTYPE html>
        <head>
        <meta charset="UTF-8">
        <meta name="viewport" content ="width=device-width", initial-scale="1">
        
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
  	<link rel="icon" type="image/png" href="assets/img/favicon.png">
  	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="assets/css/argon-dashboard.css?v=2.0.4" rel="stylesheet" />
        
    <style type="text/css">
a, a:hover{
	color: #000000;
	text-decoration: none; }
</style>
    <!-- Site Metas -->
    <title>인하공전 웹 서비스</title>
    
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="g-sidenav-show   bg-gray-100">
	<%
	PrintWriter script = response.getWriter();
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}else{
		script.println("<script>");
		script.println("alert('로그인이 필요한 기능입니다.')");
		script.println("location.href = 'login.jsp' ");
		script.println("</script>");
		
	}

	int boardID = Integer.parseInt(request.getParameter("boardID"));
	
	int bbsID=0;
	if(request.getParameter("bbsID")!=null){    //bbsID를 받기
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	int bookID = 0;
	if(request.getParameter("bookID")!=null){    //bbsID를 받기
		bookID = Integer.parseInt(request.getParameter("bookID"));
	}
	int lostID = 0;
	if(request.getParameter("lostID")!=null){    //bbsID를 받기
		lostID = Integer.parseInt(request.getParameter("lostID"));
	}
	int postID = 0;
	if(request.getParameter("postID")!=null){    //bbsID를 받기
	postID = Integer.parseInt(request.getParameter("postID"));
	}
	
	System.out.print("포스트 : "+ postID);
	System.out.print("보더 : "+ boardID);
	
	if(bbsID == 0 && bookID == 0 && lostID == 0 && postID == 0){
		script.println("<script>");
		script.println("alert('유호하지 않은 글입니다.')");
		script.println("location.href = 'mbbs.jsp' ");
		script.println("</script>");
	}
	
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	Book book = new BookDAO().getBook(bookID);
	Lost lost = new LostDAO().getLost(lostID);
	Post post = new PostDAO().getPost(postID);
	%>


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
     <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <h6>게시판 글 보기</h6>
            </div>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive p-0">
                <table class="table align-items-center mb-0">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">글 제목</th>
                      
                      <th class="text-xs font-weight-bold mb-0">
                      <%String real = "C:\\Users\\S\\jsp\\INHA\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\JSP\\bookUpload"; %>
							<% if(boardID == 1){ %>
							<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%></td>
							<%}else if(boardID == 2){ %>
							<td colspan="2"><%= book.getBookTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%></td>
							<%}else if(boardID == 3){  %>
							<td colspan="2"><%= lost.getLostTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%></td>
							<%}else if(boardID == 4){ %>
							<td colspan="2"><%= post.getPostTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%></td>
							<%}%>
                      </th>
                      <th class="text-secondary opacity-7"></th>
                   </tr>       
                  </thead>
                  
                  
                  <thead>
                      <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성자</th>
                      
                      <th class="text-xs font-weight-bold mb-0">
                      <% if(boardID == 1){ %>
							<td colspan="2"><%= bbs.getUserID() %></td>
							<%}else if(boardID == 2){ %>
							<td colspan="2"><%= book.getUserID() %></td>
							<%}else if(boardID == 3){ %>
							<td colspan="2"><%= lost.getUserID() %></td>
							<%}else if(boardID == 4){ %>
							<td colspan="2"><%= post.getUserID() %></td>
								<%} %>
                      </th>
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
                  
                  
                  <thead>
                      <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">작성일자</th>
                      
                      <th class="text-xs font-weight-bold mb-0">
                      <% if(boardID == 1){ %>
							<td colspan="2"><%= bbs.getBbsDate().substring(0,11)+
									bbs.getBbsDate().substring(11,13)+"시"+
									bbs.getBbsDate().substring(14,16)+"분" %></td>
										<%}else if(boardID == 2){ %>
											<td colspan="2"><%= book.getBookDate().substring(0,11)+
													book.getBookDate().substring(11,13)+"시"+
													book.getBookDate().substring(14,16)+"분" %></td>
										<%}else if(boardID == 3){ %>
											<td colspan="2"><%= lost.getLostDate().substring(0,11)+
													lost.getLostDate().substring(11,13)+"시"+
													lost.getLostDate().substring(14,16)+"분" %></td>
										<%}else if(boardID == 4){ %>
											<td colspan="2"><%= post.getPostDate().substring(0,11)+
													post.getPostDate().substring(11,13)+"시"+
													post.getPostDate().substring(14,16)+"분" %></td>
													<%} %>
                      </th>
                      
                      <th class="text-secondary opacity-7"></th>
                    </tr>
                  </thead>
     
                  <tbody>
                  
                  <tr>
                      <td>
                        <div class="d-flex px-2 py-1">
                          
                          <div class="d-flex flex-column justify-content-center">
                       		 <p class="text-xs font-weight-bold mb-0">내용</p>
                          </div>
                          
                        </div>
                      </td>
                      
                      
                      <td  colspan="2" style="height: 200px; text-align: left;">
                            <h6 class="mb-0 text-sm">
                            <% if(boardID == 1){ %>
							<%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%></h6>
                      </td>
                      <%
							File viewFile = new File(real+"\\"+bbsID+"자유사진.jpg");
							System.out.println();
							System.out.println("viewFile : " +viewFile);
							System.out.println("게시글 번호 :  : " +bbsID);
							if(viewFile.exists()){  	System.out.println("파일 로드완료"); %>
						
								<tr>
									<td colspan="6"><br><br><img src = "bookUpload/<%=bbsID %>자유사진.jpg" border="300px" width="300px" height="300px" title="첨부된 이미지">
									<br><br> </td>
								 </tr>
								 
							<% } }							
							else if(boardID == 2){ %>
									<%=book.getBookContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
									.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%>
								<%
							File viewFile = new File(real+"\\"+bookID+"중고책사진.jpg");
							System.out.println();
							System.out.println("viewFile : " +viewFile);
							System.out.println("게시글 번호 :  : " +bookID);
							if(viewFile.exists()){  	System.out.println("파일 로드완료"); %>
							
							<tr>
									<td colspan="6"><br><br><img src = "bookUpload/<%=bookID %>중고책사진.jpg" border="300px" width="300px" height="300px" title="첨부된 이미지">
									<br><br></td> </tr> 
							<%   } }			
						else if(boardID == 3){ %>
							<%=lost.getLostContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%></td>  
						<%
							File viewFile = new File(real+"\\"+lostID+"분실물사진.jpg");
							System.out.println();
							System.out.println("viewFile : " +viewFile);
							System.out.println("게시글 번호 :  : " +lostID);
							if(viewFile.exists()){  	System.out.println("파일 로드완료"); %>
							
							<tr>
									<td colspan="6"><br><br><img src = "bookUpload/<%=lostID %>분실물사진.jpg" border="300px" width="300px" height="300px" title="첨부된 이미지">
									<br><br></td> </tr>
							<%   } }			
						else if(boardID == 4){ %>
							<%=post.getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
							.replaceAll(">", "&gt;").replaceAll("\n", "<br>;")%></td>  
						<%
							File viewFile = new File(real+"\\"+postID+"공지사항사진.jpg");
							System.out.println();
							System.out.println("viewFile : " +viewFile);
							System.out.println("게시글 번호 :  : " +postID);
							if(viewFile.exists()){  	System.out.println("파일 로드완료"); %>
							
							<tr>
									<td colspan="6"><br><br><img src = "bookUpload/<%=postID %>공지사항사진.jpg" border="300px" width="300px" height="300px" title="첨부된 이미지">
									<br><br></td> </tr>
									
									
									 <%   } } %>
									  	
                    </tr>
                    
                   
                  
                   
                  </tbody>
                  
                  
                  
                </table>
                
                
                
                
                

					
					<div class="col-6 text-end">
					
					<%if(boardID == 1){ %>
				<a href="mbbs.jsp" class="btn bg-gradient-dark mb-0">목록</a>  
				<% }else if(boardID ==2){  %>
				<a href="mbook.jsp" class="btn bg-gradient-dark mb-0">목록</a>  
				<% }else if(boardID ==3){  %>
				<a href="mlost.jsp" class="btn bg-gradient-dark mb-0">목록</a>  
				<% }else if(boardID ==4){  %>
				<a href="post.jsp" class="btn bg-gradient-dark mb-0">목록</a>  
				<%} %>				
				
				<!--  작성자만 수정,삭제 버튼이 뜸 -->
								<%if(boardID == 1 && userID != null && userID.equals(bbs.getUserID())){ 	%>
							<a href = "mupdate.jsp?bbsID=<%=bbsID%>&boardID=1" class="btn bg-gradient-dark mb-0"> 수정</a>
							<a onclick = "return confirm('정말 삭제 하시겠습니까?')" href = "mdeleteAction.jsp?bbsID=<%=bbsID%>&boardID=1" class="btn bg-gradient-dark mb-0"> 삭제</a>
								<% }else if(boardID == 2 &&  userID != null && userID.equals(book.getUserID())){ %>
									<a href = "mupdate.jsp?bookID=<%=bookID%>&boardID=2" class="btn bg-gradient-dark mb-0"> 수정</a>
							<a onclick = "return confirm('정말 삭제 하시겠습니까?')" href = "mdeleteAction.jsp?bookID=<%=bookID%>&boardID=2" class="btn bg-gradient-dark mb-0"> 삭제</a>
							<% }else if(boardID == 3 &&  userID != null && userID.equals(lost.getUserID())){ %>
									<a href = "mupdate.jsp?lostID=<%=lostID%>&boardID=3" class="btn bg-gradient-dark mb-0"> 수정</a>
							<a onclick = "return confirm('정말 삭제 하시겠습니까?')" href = "mdeleteAction.jsp?lostID=<%=lostID%>&boardID=3" class="btn bg-gradient-dark mb-0"> 삭제</a>
							<% }else if(boardID == 4 &&  userID != null && userID.equals(post.getUserID())){ %>
									<a href = "mupdate.jsp?postID=<%=postID%>&boardID=4" class="btn bg-gradient-dark mb-0"> 수정</a>
							<a onclick = "return confirm('정말 삭제 하시겠습니까?')" href = "mdeleteAction.jsp?postID=<%=postID%>&boardID=4" class="btn bg-gradient-dark mb-0"> 삭제</a>
							
							<% } %>
                      
                    </div>
                    
                    
                    
                
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    
    <div class="row">
        <div class="col-12">
          <div class="card mb-4">
          
            <div class="card-header pb-0 px-3">
              <h6 class="mb-0">댓글, Comment</h6>
            </div>
            
            <div class="card-body pt-4 p-3">
              <ul class="list-group">
              
              <%
				ArrayList<Comment> list;
				CommentDAO commentDAO = new CommentDAO();
				if(boardID == 1){ 
					list	= commentDAO.getList(boardID, bbsID);
				}else if(boardID == 2){
					list	= commentDAO.getList(boardID, bookID);
				}else if(boardID == 3){
					list	= commentDAO.getList(boardID, lostID);
				}else{
					list	= commentDAO.getList(boardID, postID);
				}
					for(int i=0; i<list.size(); i++){
				%>
              
                <li class="list-group-item border-0 d-flex p-4 mb-2 bg-gray-100 border-radius-lg">
                
                  <div class="d-flex flex-column">
                    <h6 class="mb-3 text-sm">
                    <%= list.get(i).getCommentText() %>
                    </h6>
                    <span class="mb-2 text-xs">
                   	 작성자 : 
                    <span class="text-dark font-weight-bold ms-sm-2">
                    <%= list.get(i).getUserID() %>
                    </span></span>
                    <span class="mb-2 text-xs">
                   	작성시간 : 
                    <span class="text-dark ms-sm-2 font-weight-bold">
                    <%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %>
                    </span></span>
                  </div>
                  
                  <%
						if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //댓글 쓴사람과 지금 유저가 같을 때 삭제를 가능하게 함
					%>
                  <div class="ms-auto text-end">
                    <a onclick="return confirm('정말로 삭제하시겠습니까?')" class="btn btn-link text-danger text-gradient px-3 mb-0" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>">
                    <i class="far fa-trash-alt me-2" aria-hidden="true"></i>삭제</a>
                    
                  </div>
                  
                  <% } %>
                  
                </li>
                
                <% } %>
                
              </ul>
            </div>
          </div>
        </div>   
      </div>
      
      
    <div class="row">
        <div class="col-12">
          <%if(boardID == 1){ %>
			<form method="post"  action="commentAction.jsp?bbsID=<%= bbsID %>&boardID=1">
			<%}else if(boardID == 2){%>
			<form method="post"  action="commentAction.jsp?bookID=<%= bookID %>&boardID=2">
				<%}else if(boardID == 3){%>
				<form method="post"  action="commentAction.jsp?lostID=<%= lostID %>&boardID=3">
				<%}else if(boardID == 4){%>
				<form method="post"  action="commentAction.jsp?postID=<%= postID %>&boardID=4">
				<%} %>
          <div class="card mb-4">
				
                <div class="card-header pb-0 p-3">
                  <div class="row">
                    <div class="col-6 d-flex align-items-center">
                      <h6 class="mb-0">작성자 : <%= userID %></h6>
                    </div>
                    
                    <div class="col-6 text-end">
                      <input type="submit" class="btn bg-gradient-dark mb-0" value="댓글작성">
                    </div>
                    
                  </div>
                </div>
                
                <div class="card-body p-3">
                  
                  <input type="text" style="height:100px;" class="form-control" placeholder="상대방을 존중하는 댓글을 남깁시다." name = "commentText">
                  
                </div>
                
                <div class="card-body pb-0 p-3 text-center">
	                <div class="row">
	                <hr class="horizontal dark my-3">
	                <h5 class="mb-0">[형법]제311조 (모욕) 공연히 사람을 모욕한 자는 1년 이하의 징역이나 금고 또는 200만원 이하의 벌금에 처한다.</h5>
	                <hr class="horizontal dark my-3">
	                </div>
               	</div>
               	
              </div>
                </form>
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

<script src="assets/js/core/popper.min.js"></script>
  <script src="assets/js/core/bootstrap.min.js"></script>
  <script src="assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="assets/js/plugins/smooth-scrollbar.min.js"></script>
  
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example pages etc -->
  <script src="assets/js/argon-dashboard.min.js?v=2.0.4"></script>

</body>
</html>