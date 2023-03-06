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

	String sm1 = request.getParameter("_sm1");
	String pm1 = request.getParameter("_pm1");
	String st1 = request.getParameter("_st1");
	String pt1 = request.getParameter("_pt1");
	String sw1 = request.getParameter("_sw1");
	String pw1 = request.getParameter("_pw1");
	String su1 = request.getParameter("_su1");
	String pu1 = request.getParameter("_pu1");
	String sf1 = request.getParameter("_sf1");
	String pf1 = request.getParameter("_pf1");
	
	String sm2 = request.getParameter("_sm2");
	String pm2 = request.getParameter("_pm2");
	String st2 = request.getParameter("_st2");
	String pt2 = request.getParameter("_pt2");
	String sw2 = request.getParameter("_sw2");
	String pw2 = request.getParameter("_pw2");
	String su2 = request.getParameter("_su2");
	String pu2 = request.getParameter("_pu2");
	String sf2 = request.getParameter("_sf2");
	String pf2 = request.getParameter("_pf2");

	String sm3 = request.getParameter("_sm3");
	String pm3 = request.getParameter("_pm3");
	String st3 = request.getParameter("_st3");
	String pt3 = request.getParameter("_pt3");
	String sw3 = request.getParameter("_sw3");
	String pw3 = request.getParameter("_pw3");
	String su3 = request.getParameter("_su3");
	String pu3 = request.getParameter("_pu3");
	String sf3 = request.getParameter("_sf3");
	String pf3 = request.getParameter("_pf3");
	
	String sm4 = request.getParameter("_sm4");
	String pm4 = request.getParameter("_pm4");
	String st4 = request.getParameter("_st4");
	String pt4 = request.getParameter("_pt4");
	String sw4 = request.getParameter("_sw4");
	String pw4 = request.getParameter("_pw4");
	String su4 = request.getParameter("_su4");
	String pu4 = request.getParameter("_pu4");
	String sf4 = request.getParameter("_sf4");
	String pf4 = request.getParameter("_pf4");
	
	String sm5 = request.getParameter("_sm5");
	String pm5 = request.getParameter("_pm5");
	String st5 = request.getParameter("_st5");
	String pt5 = request.getParameter("_pt5");
	String sw5 = request.getParameter("_sw5");
	String pw5 = request.getParameter("_pw5");
	String su5 = request.getParameter("_su5");
	String pu5 = request.getParameter("_pu5");
	String sf5 = request.getParameter("_sf5");
	String pf5 = request.getParameter("_pf5");
	
	String sm6 = request.getParameter("_sm6");
	String pm6 = request.getParameter("_pm6");
	String st6 = request.getParameter("_st6");
	String pt6 = request.getParameter("_pt6");
	String sw6 = request.getParameter("_sw6");
	String pw6 = request.getParameter("_pw6");
	String su6 = request.getParameter("_su6");
	String pu6 = request.getParameter("_pu6");
	String sf6 = request.getParameter("_sf6");
	String pf6 = request.getParameter("_pf6");
	
	String sm7 = request.getParameter("_sm7");
	String pm7 = request.getParameter("_pm7");
	String st7 = request.getParameter("_st7");
	String pt7 = request.getParameter("_pt7");
	String sw7 = request.getParameter("_sw7");
	String pw7 = request.getParameter("_pw7");
	String su7 = request.getParameter("_su7");
	String pu7 = request.getParameter("_pu7");
	String sf7 = request.getParameter("_sf7");
	String pf7 = request.getParameter("_pf7");
	
	String sm8 = request.getParameter("_sm8");
	String pm8 = request.getParameter("_pm8");
	String st8 = request.getParameter("_st8");
	String pt8 = request.getParameter("_pt8");
	String sw8 = request.getParameter("_sw8");
	String pw8 = request.getParameter("_pw8");
	String su8 = request.getParameter("_su8");
	String pu8 = request.getParameter("_pu8");
	String sf8 = request.getParameter("_sf8");
	String pf8 = request.getParameter("_pf8");
	
	String sm9 = request.getParameter("_sm9");
	String pm9 = request.getParameter("_pm9");
	String st9 = request.getParameter("_st9");
	String pt9 = request.getParameter("_pt9");
	String sw9 = request.getParameter("_sw9");
	String pw9 = request.getParameter("_pw9");
	String su9 = request.getParameter("_su9");
	String pu9 = request.getParameter("_pu9");
	String sf9 = request.getParameter("_sf9");
	String pf9 = request.getParameter("_pf9");
	
	String sm10 = request.getParameter("_sm10");
	String pm10 = request.getParameter("_pm10");
	String st10 = request.getParameter("_st10");
	String pt10 = request.getParameter("_pt10");
	String sw10 = request.getParameter("_sw10");
	String pw10 = request.getParameter("_pw10");
	String su10 = request.getParameter("_su10");
	String pu10 = request.getParameter("_pu10");
	String sf10 = request.getParameter("_sf10");
	String pf10 = request.getParameter("_pf10");
	
	String sm11 = request.getParameter("_sm11");
	String pm11 = request.getParameter("_pm11");
	String st11 = request.getParameter("_st11");
	String pt11 = request.getParameter("_pt11");
	String sw11 = request.getParameter("_sw11");
	String pw11 = request.getParameter("_pw11");
	String su11 = request.getParameter("_su11");
	String pu11 = request.getParameter("_pu11");
	String sf11 = request.getParameter("_sf11");
	String pf11 = request.getParameter("_pf11");
	
	String sm12 = request.getParameter("_sm12");
	String pm12 = request.getParameter("_pm12");
	String st12 = request.getParameter("_st12");
	String pt12 = request.getParameter("_pt12");
	String sw12 = request.getParameter("_sw12");
	String pw12 = request.getParameter("_pw12");
	String su12 = request.getParameter("_su12");
	String pu12 = request.getParameter("_pu12");
	String sf12 = request.getParameter("_sf12");
	String pf12 = request.getParameter("_pf12");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/bbs", "root", "1234");
		Statement stmt = conn.createStatement();
		stmt.executeUpdate("Insert into period values ('"+
							sm1 +"','" + pm1 + "', '" + st1 +"' ,'" + pt1 + "' ,'" + sw1 + "' ,'" + pw1 + "' ,'" + su1 + "' ,'" + pu1 + "' ,'" + sf1 + "' ,'" + pf1 + "' ,'" +
							sm2 +"','" + pm2 + "', '" + st2 +"' ,'" + pt2 + "' ,'" + sw2 + "' ,'" + pw2 + "' ,'" + su2 + "' ,'" + pu2 + "' ,'" + sf2 + "' ,'" + pf2 + "' ,'" +
							sm3 +"','" + pm3 + "', '" + st3 +"' ,'" + pt3 + "' ,'" + sw3 + "' ,'" + pw3 + "' ,'" + su3 + "' ,'" + pu3 + "' ,'" + sf3 + "' ,'" + pf3 + "' ,'" +
							sm4 +"','" + pm4 + "', '" + st4 +"' ,'" + pt4 + "' ,'" + sw4 + "' ,'" + pw4 + "' ,'" + su4 + "' ,'" + pu4 + "' ,'" + sf4 + "' ,'" + pf4 + "' ,'" +
							sm5 +"','" + pm5 + "', '" + st5 +"' ,'" + pt5 + "' ,'" + sw5 + "' ,'" + pw5 + "' ,'" + su5 + "' ,'" + pu5 + "' ,'" + sf5 + "' ,'" + pf5 + "' ,'" +
							sm6 +"','" + pm6 + "', '" + st6 +"' ,'" + pt6 + "' ,'" + sw6 + "' ,'" + pw6 + "' ,'" + su6 + "' ,'" + pu6 + "' ,'" + sf6 + "' ,'" + pf6 + "' ,'" +
							sm7 +"','" + pm7 + "', '" + st7 +"' ,'" + pt7 + "' ,'" + sw7 + "' ,'" + pw7 + "' ,'" + su7 + "' ,'" + pu7 + "' ,'" + sf7 + "' ,'" + pf7 + "' ,'" +
							sm8 +"','" + pm8 + "', '" + st8 +"' ,'" + pt8 + "' ,'" + sw8 + "' ,'" + pw8 + "' ,'" + su8 + "' ,'" + pu8 + "' ,'" + sf8 + "' ,'" + pf8 + "' ,'" +
							sm9 +"','" + pm9 + "', '" + st9 +"' ,'" + pt9 + "' ,'" + sw9 + "' ,'" + pw9 + "' ,'" + su9 + "' ,'" + pu9 + "' ,'" + sf9 + "' ,'" + pf9 + "' ,'" +
							sm10 +"','" + pm10 + "', '" + st10 +"' ,'" + pt10 + "' ,'" + sw10 + "' ,'" + pw10 + "' ,'" + su10 + "' ,'" + pu10 + "' ,'" + sf10 + "' ,'" + pf10 + "' ,'" +
							sm11 +"','" + pm11 + "', '" + st11 +"' ,'" + pt11 + "' ,'" + sw11 + "' ,'" + pw11 + "' ,'" + su11 + "' ,'" + pu11 + "' ,'" + sf11 + "' ,'" + pf11 + "' ,'" +
							sm12 +"','" + pm12 + "', '" + st12 +"' ,'" + pt12 + "' ,'" + sw12 + "' ,'" + pw12 + "' ,'" + su12 + "' ,'" + pu12 + "' ,'" + sf12 + "' ,'" + pf12
							+ "')");
		
		stmt.close();
		conn.close();
		
		response.sendRedirect("Timetable_Select.jsp");
	} catch(SQLException e){
		e.printStackTrace();
	}
%>

</body>
</html>