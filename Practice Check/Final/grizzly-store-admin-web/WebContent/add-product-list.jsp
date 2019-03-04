<%@page import="java.util.ArrayList"%>
<%@page import="com.cognizant.bean.ProductBean"%>
<%@page import="java.util.List"%>
<%@page import="com.cognizant.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
		<link rel="stylesheet" type="text/css" href="assets/css/main.css">
		<link rel="stylesheet" type="text/css" href="assets/css/index.css">
	
	    <!-- JQuery -->
	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
		<!-- Google Fonts -->
	
	    <link href="https://fonts.googleapis.com/css?family=B612" rel="stylesheet">
</head>
<body>

    <jsp:include page="header.jsp"/>

	<div class="col ">
		<div class="add-product ">
			<div class="row">
				<div class="col-sm-8">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item "><a class="nav-link active na-col"
							data-toggle="tab" href="#home">
								<p class="h2">PRODUCTS</p>
						</a></li>
						<li class="nav-item"><a class="nav-link na-col"
							data-toggle="tab" href="#vendors">
								<p class="h2">VENDORS</p>
						</a></li>
					</ul>
				</div>
			</div>
			
			
			<div class="tab-content">
				<div id="home" class="tab-pane active">
					<br>
					<div
						class=" top-buffer d-flex flex-row align-items-center justify-content-between">
						<div class="d-flex">
							<button class="btn rounded-circle1 mr-4">Choose Action</button>
							<div class="rounded-circle1 mr-4">
								<input type="search" placeholder="Category Name "
									class=" rounded-circle1"><i
									class="fa fa-search searchIcon"></i>
							</div>
							<input type="text" list="sortby" class="rounded-circle1"
								name="sortby" placeholder="Sort By">
							<hr>
							<datalist id="sortby">
							<option value="Ascending">
							<option value="Descending">
							</datalist>
						</div>
						<div>
							<form action="add-product.jsp">
								<button class="btn btn-dark rounded-circle ">Add
									Product</button>
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
												<th class="no-border"></th>
												<th class="text-center">Products List</th>
												<th class="text-center">Brand</th>
												<th class="text-center">Category</th>
												<th class="text-center">Rating</th>
												<th class="text-center"></th>
											</tr>
										</thead>
										<tbody>


											<%
												ProductDao prodDao = new ProductDao();
												List<ProductBean> prodList = new ArrayList<ProductBean>();
												prodList = prodDao.readAll();
												request.setAttribute("prodDetails", prodList);
											%>

											<core:forEach items="${prodDetails}" var="prod">
												<tr>
													<td>
														<div class="round">
															<input type="checkbox" id="1" /> <label for="1"></label>
														</div>
													</td>
													<td><core:out value="${prod.getProductName()}"></core:out></td>
													<td><core:out value="${prod.getProductBrand()}"></core:out></td>
													<td><core:out value="${prod.getCategory()}"></core:out></td>
													<td><core:out value="${prod.getRating()}"></core:out></td>
													<td>
														<a class="btn btn-secondary rounded-circle ml-3 mr-3" href="product-desc.jsp?prodId=${prod.getProductId() }"
															>View</a>
														<a class="btn btn-secondary rounded-circle ml-3 mr-3" href="controllers/BlockProduct.jsp?prodId=${prod.getProductId() }"
															>Block</a>
														<a class="btn btn-secondary rounded-circle ml-3 mr-3" href="controllers/DeleteProductController.jsp?prodId=${prod.getProductId() }"
															>Remove</a>
													</td>
													
													
													
						

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
					<h3>VENDORS</h3>
					<p>Yet to be designed</p>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-1"></div>
	</div>
	</div>

</body>
</html>