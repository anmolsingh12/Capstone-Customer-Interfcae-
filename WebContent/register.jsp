<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration JSP Page</title>
</head>
<body>
	<%@ page import ="java.sql.*" %>
		<%@ page import ="java.sql.Connection"%>
		<%@ page import = "java.sql.Driver"%>
		<%@ page import = "java.sql.DriverManager"%>
		<%@ page import = "java.sql.SQLException" %>
		<%@page import="com.javaclass.Auth"%>		
		<%
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String uname = request.getParameter("uname");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			
			boolean usernameExists = false;
			
			try {
				Class.forName("com.mysql.jdbc.Driver");
		        
		        Connection  con=DriverManager.getConnection
		                     ("jdbc:mysql://localhost:3306/Logistics","root","root");
		        
		      PreparedStatement st = con.prepareStatement("select * from UserDetails where uname = ?");
	          st.setString(1, uname);
	          
	          ResultSet r1 = st.executeQuery();
	          
	          boolean userExists = false;
	          
	          if(r1.next())
	          {
	        	  userExists = true;
	          }
	          
	          String validated;
	          
	          validated = Auth.passwordValidation(uname, pass);
	          
	          if((userExists == false) && ( validated == "no error" ))
	          {
	        	  PreparedStatement ps=con.prepareStatement
	                  ("insert into UserDetails values(?,?,?,?,?,?,?)");

	        
	           	    ps.setString(1, fname);
			        ps.setString(2, lname);
			        ps.setString(3, uname);
			        ps.setString(4, dob);
			        ps.setString(5, gender);
			        ps.setString(6, email);
			        ps.setString(7, pass);
			        
			        int i=ps.executeUpdate();
	          
	        
		          if(i>0)
		          {
		            out.println("Your Account has been Created");
		            out.println("Registered");
		          }
	          }
	          else
	          {
	        	  out.println(validated+" (Error in Password.)");
	        	  out.println("Incorrect Username or Redundant Username");
	        	  out.println("Not Registered");
	          }
	       
	       }
	       catch(Exception e)
			{
				e.printStackTrace();
			}
		%>
</body>
</html>