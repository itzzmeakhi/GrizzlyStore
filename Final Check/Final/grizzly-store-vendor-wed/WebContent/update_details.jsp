
<%@page import="com.cognizant.bean.QuantityBean"%>
<%@page import="com.cognizant.bean.ProductBean"%>
<%@page import="com.cognizant.dao.ProductDao"%>
<%@page import="java.sql.Connection"%>

<%@page import="java.util.ArrayList"%>

<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title> Welcome to Grizzly Store ..!</title>

		<!-- Required meta tags -->

    	<meta charset="utf-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

		<!-- Bootstrap -->
	
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

		<!-- Font Awesome -->
	
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
	
		<!-- CSS -->
	
		
		<link rel="stylesheet" type="text/css" href="assets/css/index.css">
	
	    <!-- JQuery -->
	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
		<!-- Google Fonts -->
	
	    <link href="https://fonts.googleapis.com/css?family=B612" rel="stylesheet">
	    
	</head>
	<body>
	
		<%
			String username=(String)session.getAttribute("username");
			int id = Integer.parseInt(request.getParameter("id"));
			
			
			
		
		    if(username!=null) {
		    	
	
		    	
		    	
		    	
		    	
		    }else {
		    	response.sendRedirect("vendor-login.jsp");
		    }
		
		
		%>

    	<jsp:include page="header.jsp"/>
    	
 		<form action = "controllers/Vendor/UpdateController.jsp">
 		
 			<%
 			
 				ProductDao prodDao = new ProductDao();
 				QuantityBean data = prodDao.readQuality(id);
 			
 			
 			%>
			<input type="number" name="instock" id="instock" value="<%=data.getInStock() %>" required>
			<input type="number" name="buffer" id="buffer" value="<%=data.getBuffer() %>" required>
			<input type="number" name="pending" id="pending" value="<%=data.getPending() %>" required>
			<input type="text" name="pending" id="pending" value="<%=data.getProdId() %>" readonly>
			
			
			
			<input type="submit" value="Update">



		</form>
