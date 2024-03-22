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
        button 
        {
         position: absolute;
         left: 575px;
         top: 530px;
         font-size:15px;
         background-color:#C4A484;
        }
       .details 
        {
        margin-bottom: 25px;
        }
</style>
</head>

<body>
       <div class="container">
        <h2>Student Details</h2>
        <%
            
               String uid = request.getParameter("uid");
               Class.forName("com.mysql.cj.jdbc.Driver");
               Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techLive","root","root");
         	   String s = "SELECT * FROM addStudent WHERE uid=?";
               PreparedStatement p = cn.prepareStatement(s);
               p.setString(1,uid);
               ResultSet r = p.executeQuery();

               if (r.next()) 
               {
        %>
                    <div class="details">
                        <strong>Student ID:</strong> <%= r.getString("uid") %><br><br>
                        <strong>Name:</strong> <%= r.getString("name") %><br><br>
                        <strong>Email:</strong> <%= r.getString("email") %><br><br>
                        <strong>DOB:</strong> <%= r.getString("dob") %><br><br>
                        <strong>Gender:</strong> <%= r.getString("gender") %><br><br>
                        <strong>Course:</strong> <%= r.getString("course") %><br><br>
                        <strong>Duration:</strong> <%= r.getString("duration") %><br><br>
                        <!-- Add more fields as needed -->
                    </div>
        <%
                } 
                else 
                {
        %>
                    <p>No student found with ID <%= uid %>.</p>
        <%
                }
                %>
     </div>
    <button onclick="window.print()">Print Out</button>
</body>
</html>
