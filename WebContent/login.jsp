<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="com.javaclass.SaveName"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login JSP Page</title>
	</head>
	
	<body>
		<%@ page import ="java.sql.*" %>
		<%@ page import ="java.sql.Connection"%>
		<%@ page import = "java.sql.Driver"%>
		<%@ page import = "java.sql.DriverManager"%>
		<%@ page import = "java.sql.SQLException" %>
		<%@ page import = "java.io.*" %>
		<%@ page import = "java.io.IOException" %>
		<%!
			String user = "";
			String password = "";
		%>
		
		<%
			
			String uname = (String)request.getParameter("Username");
			
			String pass = (String)request.getParameter("Pass");
			try
			{
				Class.forName("com.mysql.jdbc.Driver"); 
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Logistics",
				"root","root"); 
				Statement st= con.createStatement(); 
				ResultSet rs = st.executeQuery("SELECT * FROM UserDetails where uname = '"+uname+"'");
				
				while(rs.next())
	                {
	                    user = rs.getString(3);
	             
	                    password = rs.getString(7);
	                }
				
				if( (user .equals(uname)) && (password.equals(pass)))
				{
					SaveName.name=uname;
					response.sendRedirect("CustomerInterface.html");
				}
				
				else
				{
					response.sendRedirect("login-signup.html");
				}
				
				
			}catch(Exception e)
			{
				e.printStackTrace();
			} 
		%>
	</body>
</html>