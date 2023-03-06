<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO"%>
<%@ page import="book.BookDAO"%>
<%@ page import="lost.LostDAO"%>
<%@ page import="post.PostDAO"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:useBean id="book" class="book.Book" scope="page" />
<jsp:useBean id="lost" class="lost.Lost" scope="page" />
<jsp:useBean id="post" class="post.Post" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
<jsp:setProperty name="book" property="bookTitle" />
<jsp:setProperty name="book" property="bookContent" />
<jsp:setProperty name="lost" property="lostTitle" />
<jsp:setProperty name="lost" property="lostContent" />
<jsp:setProperty name="post" property="postTitle" />
<jsp:setProperty name="post" property="postContent" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	PrintWriter script = response.getWriter();
	String encType = "utf-8";		
	int maxSize=5*1024*1024;	
	String realFolder="";
	String saveFolder = "bookUpload";		//사진을 저장할 경로
	ServletContext context = this.getServletContext();		//절대경로를 얻는다
	realFolder = context.getRealPath(saveFolder);			//saveFolder의 절대경로를 얻음
	MultipartRequest multi = null;
	multi = new MultipartRequest(request,realFolder,maxSize,encType,  new DefaultFileRenamePolicy());
	String fileName = multi.getFilesystemName("fileName");
	System.out.println("액션에서 가져온 fileName : "+fileName);
	

	
	//파일업로드를 직접적으로 담당		
	String bbsContent = null; 
	String bbsTitle = null;
	String bookTitle = null;
	String bookContent = null;
	String lostContent = null;
	String lostTitle = null; 
	String postContent = null;
	String postTitle = null; 
	String site = null;
	
	int boardID = 0;
	 boardID = Integer.parseInt(multi.getParameter("num"));
	 System.out.println(" 라이트액션 boardID :" +boardID);
	int result = 0;
	if (multi.getParameter("title") != null && !multi.getParameter("title").equals("") &&
			multi.getParameter("content") != null && !multi.getParameter("content").equals("") ){
		if(boardID == 1){
			 bbsTitle = multi.getParameter("title");
			 bbsContent = multi.getParameter("content");
			 bbs.setBbsTitle(bbsTitle);
			bbs.setBbsContent(bbsContent);
		}else if(boardID == 2){
			bookTitle = multi.getParameter("title");
			bookContent = multi.getParameter("content");
			 book.setBookTitle(bookTitle);
			book.setBookContent(bookContent);
		}else if(boardID == 3){
			lostTitle = multi.getParameter("title");
			 lostContent = multi.getParameter("content");
			lost.setLostTitle(lostTitle);
			lost.setLostContent(lostContent);
		}else if(boardID == 4){
			postTitle = multi.getParameter("title");
			 postContent = multi.getParameter("content");
			post.setPostTitle(postTitle);
			post.setPostContent(postContent);
		}
	}
	
	String userID = null; // 아이디 확인
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	
	if (userID == null) { // 로그그인이 안되어 있는 경우
		script.println("<script>");
		script.println("alert('로그인을 하세요.')");
		script.println("location.href = 'login.jsp' ");
		script.println("</script>");
	} else {
		
			if ((lostContent != null && lostTitle != null) || (bookContent != null && bookTitle != null)
					|| ( bbsTitle != null && bbsContent != null) || ( postTitle != null && postContent != null)  ) 
			{
				System.out.println(" 액션에서 bbsTitle "+ bbsTitle);
				System.out.println(" 액션에서  book.getBookTitle() "+  book.getBookTitle());
				System.out.println(" 액션에서  lost.getLostContent() "+  lost.getLostContent());
				System.out.println(" 액션에서  lost.getLostContent() "+  lost.getLostContent());
				 
				if(boardID == 1){
				BbsDAO bbsDAO = new BbsDAO();
				 result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				 site = "location.href = 'mbbs.jsp' ";
					if(fileName != null){
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+(bbsDAO.getNext() -1)+"자유사진.jpg");
						System.out.println("액션에서 게시글번호 : " +bbsDAO.getNext());
						System.out.println("액션에서 사진번호: " +(bbsDAO.getNext()-1)+"자유사진.jpg");
						System.out.println("액션에서 fileName " +fileName);
						System.out.println(" 액션에서 oldFile "+ oldFile);
						System.out.println(" 액션에서 newFile : "+ newFile);
						oldFile.renameTo(newFile);
					}else if (fileName == null ){
						System.out.println("첨부된 사진 없음");
					}
				 
				}else if(boardID == 2){
				BookDAO bookDAO = new BookDAO();
				 result = bookDAO.write(book.getBookTitle(), userID, book.getBookContent());
				 site = "location.href = 'mbook.jsp' ";
					if(fileName != null){
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+(bookDAO.getNext() -1)+"중고책사진.jpg");
						System.out.println("게시글번호 : " +bookDAO.getNext());
						System.out.println("사진번호: " +bookDAO.getNext()+"중고책사진.jpg");
						System.out.println("fileName " +fileName);
						System.out.println(" oldFile "+ oldFile);
						System.out.println(" newFile : "+ newFile);
						oldFile.renameTo(newFile);
					}else if (fileName == null ){
						System.out.print("첨부된 사진 없음");
					}
				 
				} else if(boardID == 3){
				LostDAO lostDAO = new LostDAO();
				 result = lostDAO.write(lost.getLostTitle(), userID, lost.getLostContent());
				 site = "location.href = 'mlost.jsp' ";
					if(fileName != null){
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+(lostDAO.getNext() -1)+"분실물사진.jpg");
						System.out.println("게시글번호 : " +lostDAO.getNext());
						System.out.println("사진번호: " +lostDAO.getNext()+"사진.jpg");
						System.out.println("fileName " +fileName);
						System.out.println(" oldFile "+ oldFile);
						System.out.println(" newFile : "+ newFile);
						oldFile.renameTo(newFile);
					}else if (fileName == null ){
						System.out.print("첨부된 사진 없음");
					}
				}	else if(boardID == 4){
					PostDAO postDAO = new PostDAO();
					 result = postDAO.write(post.getPostTitle(), userID, post.getPostContent());
					 site = "location.href = 'post.jsp' ";
						if(fileName != null){
							File oldFile = new File(realFolder+"\\"+fileName);
							File newFile = new File(realFolder+"\\"+(postDAO.getNext() -1)+"공지사항사진.jpg");
							System.out.println("게시글번호 : " +postDAO.getNext());
							System.out.println("사진번호: " +postDAO.getNext()+"사진.jpg");
							System.out.println("fileName " +fileName);
							System.out.println(" oldFile "+ oldFile);
							System.out.println(" newFile : "+ newFile);
							oldFile.renameTo(newFile);
						}else if (fileName == null ){
							System.out.print("첨부된 사진 없음");
						}
					}	
				if (result == -1) {
					script.println("<script>");
					script.println("alert(' 글쓰기 실패 (DB 오류).')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println(site);
					script.println("</script>");
				}
			} else {
				script.println("<script>");
				script.println("alert('입력 안된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
	}
	%>

</body>
</html>