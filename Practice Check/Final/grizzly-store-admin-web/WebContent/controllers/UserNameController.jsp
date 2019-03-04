<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.cognizant.dao.ConnectionDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> UserName Controller </title>
</head>

<body>


	<%
	
	
	ConnectionDao conDao = new ConnectionDao();
	
	Connection con = conDao.Connect();
	
	String userName = request.getParameter("UserName");
	
	String checkUserNameQuery = "SELECT * FROM users WHERE username='"+userName+"'";
	
	Statement stmt = con.createStatement();
	
	ResultSet rs = stmt.executeQuery(checkUserNameQuery);
	
	
	if(rs.next()) { %>
	
		


	<% 
	} else { %>




		<p>Invalid Username..!!</p>


	<%
		}
	%>


</body>
</html>