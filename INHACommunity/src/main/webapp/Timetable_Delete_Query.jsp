<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bbs", "root", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Delete from period");
		
		stmt.close();
		conn.close();
		
		response.sendRedirect("Timetable_Select.jsp");
	} catch(SQLException e){
		e.printStackTrace();
	}
%>

</body>
</html>