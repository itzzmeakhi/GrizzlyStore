<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Log out Controller</title>
	</head>
	<body>
	
		<%
		
			session.invalidate();
			response.sendRedirect("../../vendor-login.jsp");
		
	
		%>
	
	
	
	</body>
</html>