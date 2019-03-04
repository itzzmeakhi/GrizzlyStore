<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.cognizant.dao.ConnectionDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Login Controller </title>
</head>


<body>

	<%
	
	
	
		ConnectionDao conDao = new ConnectionDao();
	
		Connection con = conDao.Connect();
		
		String username = request.getParameter("userName");
		String password = request.getParameter("password");
		

		
		String loginQuery = "SELECT * FROM users WHERE username='"+username+"' AND password='"+password+"' AND is_blocked='NO'";
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(loginQuery);
		
		
		if(rs.next()) { 
			session.setAttribute("username", rs.getString(2));
			session.setAttribute("userId", rs.getString(1));
			response.sendRedirect("../add-product.jsp");
		} else {
			
			response.sendRedirect("../login.jsp?loginError");
		
	
		
	
		}
	%>























</body>
</html>