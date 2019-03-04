
<%@page import="com.cognizant.dao.ConnectionDao"%>
<%@page import="java.nio.charset.StandardCharsets"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

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
		
		 MessageDigest md = MessageDigest.getInstance("SHA-256");
		 
	     byte[] hashInBytes = md.digest(password.getBytes(StandardCharsets.UTF_8));

		 // bytes to hex
	        
	     StringBuilder sb = new StringBuilder();
		 
	     for (byte b : hashInBytes) {
	     	sb.append(String.format("%02x", b));
	     }
		

		
		String loginQuery = "SELECT * FROM users WHERE username='"+username+"' AND password='"+sb.toString()+"' AND is_blocked='NO' AND role='VD'";
		
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(loginQuery);
		
		int loginCount = 0;
		
		if(loginCount < 3) {
		
		
			if(rs.next()) { 
				session.setAttribute("username", rs.getString("username"));
				session.setAttribute("userId", rs.getInt("role_id"));
				response.sendRedirect("../../index.jsp");
			}  else {
				loginCount++;
				out.println(loginCount);
				response.sendRedirect("../../vendor-login.jsp");
				
			}
		
		
	
		} else {
			response.sendRedirect("../../index.jsp");
		}
		
	%>























</body>
</html>