<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*" %>

<style>
        body  
        {
          background-image: url('notes_6.jpg');
          height: 100%;
          background-position: 10% 25%;
          background-size: cover;
        }
</style>

<%
           String id = request.getParameter("userId");
           try 
           {
	           Class.forName("com.mysql.cj.jdbc.Driver");
           }               
           catch (ClassNotFoundException e) 
           
           {
               e.printStackTrace();
           }
               Connection cn = null;
               PreparedStatement p = null;
               ResultSet r = null;
%>
           <h2 align="center"  style="color: #E6E6FA;"><font><strong>DATABASE RECORDS</strong></font></h2>
           <table align="center" cellpadding="5" cellspacing="5" border="1">
  
            <tr bgcolor="#faebd7">
            <td><b>uid</b></td>
            <td><b>name</b></td>
            <td><b>email</b></td>
            <td><b>dob</b></td>
            <td><b>gender</b></td>
            <td><b>course</b></td>
            <td><b>duration</b></td>
            </tr>
<%
            try 
            { 
	           cn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techLive","root","root");
	           String s ="SELECT * FROM addStudent";
	           p = cn.prepareStatement(s);
               r = p.executeQuery();
               while(r.next())
               {
%>
                <tr bgcolor="#E6E6FA">
                <td><%=r.getString("uid") %></td>
                <td><%=r.getString("name") %></td>
                <td><%=r.getString("email") %></td>
                <td><%=r.getString("dob") %></td>
                <td><%=r.getString("gender") %></td>
                <td><%=r.getString("course") %></td>
                <td><%=r.getString("duration") %></td>
                </tr>
<% 
                  }
               } 
              catch (Exception e) 
              {
               e.printStackTrace();
              }
%>
</table>