
<%@page import="com.cognizant.bean.ProductQuantityBean"%>
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
			
		
		    if(username!=null) {
		    	
		    	ProductDao prodDao = new ProductDao();
				List<ProductBean> prodList = new ArrayList<ProductBean>();
				int roleId = (int)session.getAttribute("userId");
				prodList = prodDao.readAll(roleId);
				request.setAttribute("prodDetails", prodList);
		    	
		    }else {
		    	response.sendRedirect("vendor-login.jsp");
		    }
		
		
		%>

    	<jsp:include page="header.jsp"/>

		<div class="col ">
	
			<div class="add-product ">
		
				<div class="row">
				
					<div class="col-sm-8">
					
						<ul class="nav nav-tabs" role="tablist">
						
							<li class="nav-item ">
							
								<a class="nav-link active na-col" data-toggle="tab" href="#home">
									<p class="h2"> PRODUCTS </p>
								</a>
								
							</li>
							
							<li class="nav-item">
							
								<a class="nav-link na-col" data-toggle="tab" href="#vendors">
									<p class="h2"> INVENTORY </p>
								</a>
								
							</li>
							
						</ul>
						
					</div>
					
				</div>
			
			
				<div class="tab-content">
				
					<div id="home" class="tab-pane active">
					
						<br>
						<div class=" top-buffer d-flex flex-row align-items-center justify-content-between">
						
							<div class="d-flex">
							
								<button class="btn rounded-circle1 mr-4">Choose Action</button>
								
								<div class="rounded-circle1 mr-4">
									<input type="search" placeholder="Category Name " class=" rounded-circle1">
									<i class="fa fa-search searchIcon"></i>
								</div>
								
								<input type="text" list="sortby" class="rounded-circle1" name="sortby" placeholder="Sort By">
								
								<hr>
								
								<datalist id="sortby">
									<option value="Ascending">
									<option value="Descending">
								</datalist>
								
							</div>
							
						<div>
						
						<form action="add-product.jsp">
							<button class="btn btn-dark rounded-circle ">Add Product</button>
						</form>
						
					</div>
					
				</div>
					<div class="row top-buffer">
						<div class="col">
							<div class="table-wrapper-scroll-y">
							
							
								<form>
									<table class="table h4 w-100 h-100">
									
										<thead>
										
											<tr>
											
												<th>
												
																										
												</th>
												
												<th> Products List </th>
												
												<th> ID </th>
												
												<th> Brand </th>
												
												<th> Category </th>
												
												<th> Offer </th>
												
												<th> Actions </th>
												
													
													
											
												<%-- <%
													
													ProductDao prodDao = new ProductDao();
													List<String> columnNamesList = new ArrayList<String>();
													columnNamesList = prodDao.readProductColumnNames();
													request.setAttribute("columnNames", columnNamesList);
									
												%>
												
												<core:forEach items="${columnNames}" var="name">
												
													<th><core:out value="${name }"></core:out></th>
									
												</core:forEach> --%>
												
											<tr>
											
										</thead>
													
										<tbody>
										
											<%
												
											%>

											<core:forEach items="${prodDetails}" var="prod">
												<tr>
													<td>
														<div class="round">
															<input type="checkbox" id="1" /> <label for="1"></label>
														</div>
													</td>
													<td><core:out value="${prod.getProdName()}"></core:out></td>
													<td><core:out value="${prod.getId()}"></core:out></td>
													<td><core:out value="${prod.getProdBrand()}"></core:out></td>
													<td><core:out value="${prod.getProdCategory()}"></core:out></td>
													<td><core:out value="${prod.getProdOffer()}"></core:out></td>
													<td>
														<a class="btn btn-secondary rounded-circle ml-3 mr-3" href="view_product.jsp?id=${prod.getId() }"
															>View</a>
														<a class="btn btn-secondary rounded-circle ml-3 mr-3" href="controllers/Vendor/DeleteProductController.jsp?id=${prod.getId() }"
															>Remove</a>
													</td>
													
												</tr>
													
                     						</core:forEach>
			
											
										</tbody>
										
										
										
									</table>
								</form>
							</div>
						</div>
					</div>
				</div>
				<div id="vendors" class="container tab-pane fade">
					<br>
					
					<%
					
						ProductDao proDao = new ProductDao();
						List<ProductQuantityBean> prodQuanList = new ArrayList<ProductQuantityBean>();
						Integer roleId = (int)session.getAttribute("userId");
						prodQuanList = proDao.readQuantity(roleId);
						request.setAttribute("prodQuanDetails", prodQuanList);
						
			
					%>
					
					<form class = "vendor">
									
						<table class="table h4 w-100 h-100">
									
							<thead>
										
								<tr>
											
									<th>
												
																										
									</th>
												
									<th> Products List </th>
												
									<th> ID </th>
												
									<th> In Stock </th>
												
									<th> Rem </th>
												
									<th> Buffer </th>
												
									<th> Price / Item </th>
									
									<th> Pending </th>
									
									<th> Rating </th>
									
									<th> Actions </th>
									
								</tr>
								
							</thead>
							
							<tbody>
							
							
							
								<core:forEach items = "${prodQuanDetails }" var = "prodQuanList">
									
									<tr>
										
										<td> </td>
										<td><core:out value="${prodQuanList.getProdName()}"></core:out></td>
										<td><core:out value="${prodQuanList.getProdId()}"></core:out></td>
										
										<td><core:out value="${prodQuanList.getInStock()}"></core:out></td>
										
										<td><core:out value="${prodQuanList.getRem()}"></core:out></td>
										<td><core:out value="${prodQuanList.getBuffer()}"></core:out></td>
										<td><core:out value="${prodQuanList.getProdPrice()}"></core:out></td>
										<td><core:out value="${prodQuanList.getPending()}"></core:out></td>
										<td><core:out value="${prodQuanList.getRating()}"></core:out></td>
										<td>
											<a class="btn btn-secondary rounded-circle ml-3 mr-3" href="update_details.jsp?id=${prodQuanList.getProdId() }"
															>Manage</a>
										</td>
										
							
									</tr>
										
										
								</core:forEach>
									
							
					
					
							
							
							
							
							</tbody>
							
						</table>
						
					</form>
												
					
			
					
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
	</div>
	</div>

</body>
</html>
