<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "bbs.BbsDAO" %>
    <%@ page import = "bbs.Bbs" %>
    <%@ page import="book.Book"%>
<%@ page import="book.BookDAO"%>
   <%@ page import="lost.Lost"%>
<%@ page import="lost.LostDAO"%>
<%@ page import="post.Post"%>
<%@ page import="post.PostDAO"%>
    <%@ page import = "java.io.PrintWriter" %>
    <% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
	PrintWriter script = response.getWriter();
	int result =0;
	String site = null;
	int boardID=0;
	if(request.getParameter("boardID")!=null){    //bbsID를 받기
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	String userID = null;
	if(session.getAttribute("userID")!= null){
		userID = (String) session.getAttribute("userID");
	}

	int bookID=0;
	int lostID=0;
	int bbsID=0;
	int postID=0;
	String Title = null;
	String Content = null;
	if(boardID == 1){
		if(request.getParameter("ID")!=null){    //bbsID를 받기
		bbsID = Integer.parseInt(request.getParameter("ID"));
		}
	}else 	if(boardID == 2){
		if(request.getParameter("ID")!=null){    //bbsID를 받기
			bookID = Integer.parseInt(request.getParameter("ID"));
		}
	}else 	if(boardID == 3){
		if(request.getParameter("ID")!=null){    //bbsID를 받기
			lostID = Integer.parseInt(request.getParameter("ID"));
		}
	}else 	if(boardID == 4){
		if(request.getParameter("ID")!=null){    //bbsID를 받기
			postID = Integer.parseInt(request.getParameter("ID"));
		}
	}
	Title = request.getParameter("Title");
	Content = request.getParameter("Content");
	
	
	System.out.println("lostID : " +lostID);
	System.out.println("bookID : " +bookID);
	System.out.println("bbsID : " +bbsID);
	System.out.println("post : " +postID);
	System.out.println("title : " +Title);
	System.out.println("content : " +Content);
	
	if(userID == null){  // session 을 받아서 로그인이 되어 있는 경우
		
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp' ");
		script.println("</script>"); }
	
	
	Bbs bbs = new BbsDAO().getBbs(bbsID);
	Book book = new BookDAO().getBook(bookID);
	Lost lost = new LostDAO().getLost(lostID);
	Post post = new PostDAO().getPost(postID);
	// 입력 안된 사안이 있을 때 ( 권한이 있을 때)
	
		if ( (Title != null && !Title.equals("")) &&  (Content != null && !Content.equals("") ) ) 
			{
			if(boardID == 1){
				BbsDAO bbsDAO = new BbsDAO();
				result = bbsDAO.update(bbsID, Title,Content);
				 site = "location.href = 'mbbs.jsp' ";
				}else if(boardID == 2){
				BookDAO bookDAO = new BookDAO();
				result = bookDAO.update(bookID, Title,Content);
				 site = "location.href = 'mbook.jsp' ";
								 
				} else if(boardID == 3){
				LostDAO lostDAO = new LostDAO();
				result = lostDAO.update(lostID, Title,Content);
				 site = "location.href = 'mlost.jsp' ";
				}	 else if(boardID == 4){
					System.out.println("444444444"
							);
					PostDAO postDAO = new PostDAO();
					result = postDAO.update(postID,Title,Content);
					 site = "location.href = 'post.jsp' ";
					}	
			if(result == -1){
				script.println("<script>");
				script.println("alert(' 글 수정 실패.')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				script.println("<script>");
				script.println("alert(' 글 수정 성공')");
				script.println(site);
				script.println("</script>");
			}
		}else{
			script.println("<script>");
			script.println("alert('제목과 내용을 모두 입력하시오.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>