
<%@page import="com.cognizant.dao.ConnectionDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="assets/css/index.css">
	</head>
	<body>


	<%
		ConnectionDao conDao = new ConnectionDao();

		Connection con = conDao.Connect();

		String detailsQuery = "SELECT name, address, mobile FROM vendors WHERE id="+ session.getAttribute("userId");

		Statement stmt = con.createStatement();

		ResultSet rs = stmt.executeQuery(detailsQuery);

		if (rs.next()) {
	%>


	<div class="container-fluid n">

		<div class="row align-items-center" style="padding: 20px;">
		
			<div class="col-md-2">
			
				<span class="nav-brand" style="font-size: 20px;">GRIZZLY
					<img src="assets/images/logo-nav.png" width="50px" height="50px" />STORE
				</span>
			</div>
			
			<div class="col-md-2 lead">
			
				<div class="searchContainer rounded-circle search-box">
				
					<input class="searchBox" type="search" name="search" placeholder="Search"> <i class="fa fa-search searchIcon"></i>
					
				</div>
			</div>
			
			<div class="col-md-4"></div>
			
			<div class="col-md-1 lead text-right">
				<i class="fa fa-bell"></i>
			</div>
			
			<div class="col-md-2 lead text-center">
				Welcome,
				<%=rs.getString("name")%>
			</div>
			
			<div class="col-md-1 lead text-right">
			
				<a href="controllers/Vendor/LogOutController.jsp" class="btn btn-secondary rounded-circle">Logout</a>
				<!-- <button type="submit" class="btn btn-secondary rounded-circle">
					<span style="color: black">Logout</span>
				</button> -->
			</div>
			
		</div>
		
	</div>
	
	<!--  Profile Section  -->

	<div class="container-fluid ">
	
		<div class="row">
		
			<div class=" col-md-3">
			
				<div class="card profile">
				
					<div class="align-items-center d-md-flex card-title justify-content-between">
					
						<div class="card-title h5 p-2">PROFILE</div>
						
					<div>
					
					<h5 class="pr-2">Edit</h5>
					
				</div>
				
			</div>
			
			<img class="card-img-top" src="assets/images/human.png" alt=" Profile_pic">
			
				<div class="card-body">
				
					<p class="card-text profile-text">
					
						<%=rs.getString("name")%>
						
						<br> <strong> Contact </strong> <br>
						<%=rs.getString("mobile")%>
						
						<br> <strong> Address </strong> <br>
						<%=rs.getString("address")%>
						
						
					</p>
					
				</div>
				
				<a href = "#"> Contact Grizzly </a>
				
			</div>
			
		</div>


		<%
			}
		%>
		
	</body>
</html>