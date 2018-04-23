<%@page import="com.javaclass.Util"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Cost Calculation</title>
	</head>

	<body>
	
		<%@ page import ="java.sql.*" %>
		<%@ page import ="java.sql.Connection"%>
		<%@ page import = "java.sql.Driver"%>
		<%@ page import = "java.sql.DriverManager"%>
		<%@ page import = "java.sql.SQLException" %>
		<%@page import="com.javaclass.Util"%>
		
		<%
			String src = request.getParameter("src");
			String dest = request.getParameter("dest");
			String calDist = request.getParameter("cal-dist");
			String calTime = request.getParameter("cal-time");
			String planType = request.getParameter("plan-type");
			String weight = request.getParameter("weight");
			String [] preCheck = request.getParameterValues("Pre-check");
			
			/*out.println("src : "+src+", dest : "+dest+", calDist : "+calDist+", calTime : "+calTime+", planType : "+planType+", weight : "+weight+", preCheck : ");
			
			for (int i = 0; i < preCheck.length;i++)
			{
				out.println(preCheck[i]+"\n");
			}
	*/
	
			String [] distInKm = calDist.split(" ");
				
			//System.out.println(distInKm[0]);
			String Distance[];

			double dist = 0.0;
			
			if ( distInKm[0].length() > 3)
			{
				Distance = distInKm[0].split(",");
				dist = (((Double.parseDouble(Distance[0])) * 1000) + Double.parseDouble(Distance[1]));
			}
			
			//out.println(dist);
			
			//double finalDistance = Double.parseDouble(distInKm[0]);
			double finalPlanRate = Double.parseDouble(planType);
			double finalWeight = Double.parseDouble(weight);
			
			
			//out.println("Distance = "+finalDistance);
			double cost = Util.costCal(dist,finalPlanRate, finalWeight, preCheck);
			//out.println(cost);
		%>
<!--+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->		
	
	</body>
</html>