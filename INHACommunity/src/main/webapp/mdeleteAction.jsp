<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="bbs.Bbs"%>
<%@ page import="book.Book"%>
<%@ page import="book.BookDAO"%>
 <%@ page import="lost.Lost"%>
<%@ page import="lost.LostDAO"%>
 <%@ page import="post.Post"%>
<%@ page import="post.PostDAO"%>
<%@ page import="java.io.PrintWriter"%>
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
		if(request.getParameter("bbsID")!=null){    //bbsID를 받기
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	
		}
		System.out.println("삭제에서 boardID)"+ boardID);
	}else 	if(boardID == 2){
		if(request.getParameter("bookID")!=null){    
			bookID = Integer.parseInt(request.getParameter("bookID"));

		}
	}else 	if(boardID == 3){
		if(request.getParameter("lostID")!=null){   
			lostID = Integer.parseInt(request.getParameter("lostID"));
			System.out.println("삭제에서 lostID)"+ lostID);
		}
	}else 	if(boardID == 4){
		System.out.println("관리자");
			if(request.getParameter("postID")!=null){    
				System.out.println("request.getParameterpostID)"+ request.getParameter("postID"));
				postID = Integer.parseInt(request.getParameter("postID"));
			}
	}
	
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
	
	
			if(boardID == 1){
				BbsDAO bbsDAO = new BbsDAO();
				 result = bbsDAO.delete(bbsID);
				 site = "location.href = 'mbbs.jsp' ";
				}else if(boardID == 2){
					BookDAO bookDAO = new BookDAO();
					result = bookDAO.delete(bookID);
				 site = "location.href = 'mbook.jsp' ";
			
				
				} else if(boardID == 3){
					LostDAO lostDAO = new LostDAO();
					 result = lostDAO.delete(lostID);
						System.out.println("삭제에서 result)"+ result);
				 site = "location.href = 'mlost.jsp' ";
				}	else if(boardID == 4){
						System.out.println("postID : "+ postID);
					PostDAO postDAO = new PostDAO();
					 result = postDAO.delete(postID);
						System.out.println("result : "+ result);
				 site = "location.href = 'post.jsp' ";
				}	
	
			if(result == -1){
				script.println("<script>");
				script.println("alert(' 글 삭제 실패.')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				script.println("<script>");
				script.println("alert(' 글 삭제 성공')");
				script.println(site);
				script.println("</script>");
			}
		
	%>
</body>
</html>