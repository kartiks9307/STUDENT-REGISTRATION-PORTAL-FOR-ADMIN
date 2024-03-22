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
          background-image: url('edit.png');
          height: 100%;
          background-position: 10% 25%;
          background-size: cover;
          font-family: Arial, sans-serif;
          display: grid;
          place-items: center;
          min-height: 100vh;
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
        <div class="container">
        <h2>Update Details</h2>
        <%
            String uid = request.getParameter("uid");
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techLive","root","root");
         	String s = "SELECT * FROM addStudent WHERE uid=?";
         	PreparedStatement p = cn.prepareStatement(s);
            p.setString(1,uid);
            ResultSet r = p.executeQuery();
            if (r.next() ) 
            {
        %>           <form action="update.jsp?uid=<%= uid %>" method="post">
            
                     <label for="username">Name:</label>
                     <input type="text" name="name" value="<%=r.getString("name")%>"> <br><br>
                    
                     <label for="email">Email:</label>
                     <input type="email" name="email" value="<%=r.getString("email")%>"> <br><br>
                     
                      <label for="dob">DOB:</label>
                     <input type="date" name="dob" value="<%=r.getString("dob")%>"> <br><br>
                    
                    
                     <label for="gender">Gender:</label>
                     <input type="text" name="gender" value="<%=r.getString("gender")%>"> <br><br>
                    
                    
                     <label for="course">Course:</label>
                     <input type="text" name="course" value="<%=r.getString("course")%>"> <br><br>
                     
                     <label for="duration">Duration:</label>
                     <input type="text" name="duration" value="<%=r.getString("duration")%>"><br><br>
                     
                     <div style="text-align: center;">
                     <input type="submit" value="Update"/> 
                     </div>
                     </form>
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
</body>
</html>
