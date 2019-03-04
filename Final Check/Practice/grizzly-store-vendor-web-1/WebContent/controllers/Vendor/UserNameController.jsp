<%@page import="com.cognizant.dao.ConnectionDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
	
	String req = request.getParameter("action");
	
	
	
	
	if(req.equals("avail")) {
		
		String userNameAvailable = request.getParameter("UserNameAvailable");
		String userNameAvailableQuery = "SELECT * FROM users WHERE username='"+userNameAvailable+"' AND role ='VD'";
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(userNameAvailableQuery);
		
		if(rs.next()) { %>
			<div class="row">

				<div class="col offset-sm-5 col-sm-3">
					<p> Username already taken ..!! </p>
				</div>
				
			</div>
		<% } else { %>
			<div class="row">

				<div class="col offset-sm-5 col-sm-3">

					<p> Username Available ..!! </p>
					
				</div>
			</div>

		<%
			}
		
		rs.close();
		stmt.close();
	} else if(req.equals("valid")) {
		
		String userName = request.getParameter("UserName");
		String checkUserNameQuery = "SELECT * FROM users WHERE username='"+userName+"' AND role='VD'";
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(checkUserNameQuery);
		
		if(rs.next()) { %>
			
		<% } else { %>
		
			<div class="row">

				<div class="col offset-sm-5 col-sm-3">

					<p> Invalid Username ..!! </p>
					
				</div>
			</div>

		<%
			}
		
		rs.close();
		stmt.close();
		
		
		
		
	}
	

	

	
	
	%>


</body>
</html>