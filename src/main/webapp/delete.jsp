<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Student Details</title>
<style>
        body 
        {
        font-family: Arial, sans-serif;
         display: grid;
         place-items: center;
         min-height: 100vh;
         background-color: #E6E6FA;
        }
       .container 
        {
         margin: 20px;
         padding: 20px;
         border: 5px solid #ccc;
         border-radius: 5px;
         width: 300px;
        }
       .details 
        {
        margin-bottom: 25px;
        }
</style>
</head>

<body>
         <%
         String uid = request.getParameter("uid");
         Class.forName("com.mysql.cj.jdbc.Driver");
         Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techLive","root","root");  
         String s="DELETE FROM addStudent WHERE uid = "+uid;
         PreparedStatement p=cn.prepareStatement(s);
         int i=p.executeUpdate(s);
         if(i>0)
         {
        	 response.sendRedirect("deleteRegistration.html");
         }
         else
         {
        	 response.sendRedirect("noStudentDelete.html");
         }
          %>

</body>
</html>
