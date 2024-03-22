<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
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
	    String uid=request.getParameter("uid");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String cc="";
		String []course=request.getParameterValues("course");
		for(int i=0;i<course.length;i++)
		{
			cc+=course[i]+" ";
		}
		
		String duration=request.getParameter("duration");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techLive","root","root");
     	String s="insert into addStudent values(?,?,?,?,?,?,?)";
		PreparedStatement p=cn.prepareStatement(s);
		
		p.setString(1,uid);
		p.setString(2,name);
		p.setString(3,email);
		p.setString(4,dob);
		p.setString(5,gender);
        p.setString(6,cc);
	    p.setString(7,duration);
	
		int i=p.executeUpdate();
		if(i>0)
		{
			response.sendRedirect("registration.html");
			
		}
		else
		{
			response.sendRedirect("error.html");
		}
		
	%>
	
	
</body>
</html>