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
      String uid = request.getParameter("uid");
      String name = request.getParameter("name");
      String email = request.getParameter("email");
      String dob = request.getParameter("dob");
      String gender= request.getParameter("gender");
      String course = request.getParameter("course");
      String duration = request.getParameter("duration");
      
      Class.forName("com.mysql.cj.jdbc.Driver");
	  Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techLive","root","root");
      String s="update addStudent set name=?,email=?,dob=?,gender=?,course=?,duration=? where uid=?";
	  PreparedStatement p=cn.prepareStatement(s);
		
	  p.setString(1, name);
      p.setString(2, email);
      p.setString(3, dob);
      p.setString(4, gender);
      p.setString(5, course);
      p.setString(6, duration);
      p.setString(7, uid);
    
      p.executeUpdate();
	  response.sendRedirect("updateRegistration.html");
		
%>
</body>
</html>