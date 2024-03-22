<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>

<body>
	<%
	    String email=request.getParameter("email");
		String password=request.getParameter("password");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techLive","root","root");
		String s="select * from adminTable where email=? and password=?";
		PreparedStatement p=cn.prepareStatement(s);
		
	    p.setString(1,email);
		p.setString(2,password);
		
		ResultSet r=p.executeQuery();
		if(r.next())
		{
			response.sendRedirect("admin.html");
		}
		else 
		{
			response.sendRedirect("error.html");
		}
	%>
</body>
</html>