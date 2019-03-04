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



	
	
	
	<!--  Navbar  -->


  
	<%-- <div class="container-fluid n">
		<div class="row align-items-center" style="padding: 20px;">
			<div class="col-md-2">
				<span class="nav-brand" style="font-size: 20px;">GRIZZLY<img
					src="assets/images/logo-nav.png" width="50px" height="50px" />STORE
				</span>
			</div>
			<div class="col-md-2 lead">
				<div class="searchContainer rounded-circle search-box">
					<input class="searchBox" type="search" name="search"
						placeholder="Search"> <i class="fa fa-search searchIcon"></i>
				</div>
			</div>
			<div class="col-md-4"></div>
			<div class="col-md-1 lead text-right">
				<i class="fa fa-bell"></i>
			</div>
			<div class="col-md-2 lead text-center">Welcome, <%= rs.getString("name")  %></div>
			<div class="col-md-1 lead text-right">
				<button type="submit" class="btn btn-secondary rounded-circle">
					<span style="color: black">Logout</span>
				</button>
			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="container-fluid ">
      <div class="row">
      
      <!--  Profile Section  -->
      
        <div class=" col-md-3">
          <div class="card profile">
            <div class="align-items-center d-md-flex card-title justify-content-between">
              <div class="card-title h5 p-2">PROFILE</div>
              <div><h5 class="pr-2">Edit</h5></div>
              </div>
              <img class="card-img-top" src="assets/images/human.png" alt="Card image cap">
              <div class="card-body">
              <p class="card-text profile-text">  <%= rs.getString("name")  %> <br> <strong> ID </strong> <br> <% out.println(session.getAttribute("userId")); %> <br> <strong> Designation</strong> <br>  <%= rs.getString("designation")  %> <br> <strong>Office</strong> <br> <%= rs.getString("location")  %></p>
            </div>
          </div>
        </div>
         --%>
        
        <!--  ADD product and Vendors Section  -->
        
        

        
        <jsp:include page="header.jsp"/>
        
        
        
        <div class="col-md-8">
          <div class="add-product">
            <div class="row">
              <div class="col-md-8">
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item ">
                    <a class="nav-link active na-col" data-toggle="tab" href="#home">
                      <p class="h2">PRODUCTS</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link na-col" data-toggle="tab" href="#vendors">
                      <p class="h2">VENDORS</p>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
            <div class=" tab-content">
              <div id="home" class="tab-pane active"><br>
                <div class="row top-buffer">
                  <div class="col-md-6">
                    <img width="600" src="assets/images/add-image.png" alt="product-image">
                  </div>
                  <div class="col-md-4">
                  
                  		  <!--  Insert Form -->


							<form action="controllers/AddProductController.jsp">
							
							
								<input type="number" class="form-control" name="prodId" id="prodId" placeholder="Product ID (AUTO INCREAMENT)" readonly/>
								
								<hr>
								
								<input type="text" list="prod-category" class="form-control" id="prodCategory" name="prodCategory" placeholder="Category"/>
								
								
								
								<datalist id="prod-category">
									<option value="Electronics">
									<option value="Books">
									<option value="Toys">
								</datalist>
								
								<hr>
								
								<input type="text" class="form-control" name="prodName" id="prodName" placeholder="Name" />
								
								<hr>
								
								<input type="text" class="form-control" name="prodBrand" id="prodBrand" placeholder="Brand" />
								
								<hr>
								
								<input type="text" class="form-control" name="prodDesc" id="prodDesc" placeholder="Description" />
								
								<hr>
								
								<input type="number" class="form-control" name="prodPrice" id="prodPrice" placeholder="Price" />
								
								<hr>
					
								<input type="number" class="form-control" name="prodDiscount" id="prodDiscount" placeholder="Discount" />
								
								<hr>
								
								<input type="number" class="form-control" name="prodRating" id="prodRating" placeholder="Rating" />
								
								<hr>


								<button type="submit" class="btn btn-dark rounded-circle">
									<span>&nbsp;&nbsp;Add&nbsp;&nbsp; </span>
								</button>


								<button type="clear" class="btn btn-secondary rounded-circle">
									<span style="color: black">Cancel</span>
								</button>
								
								<a href = "add-product-list.jsp" class = "btn brn-secondary rounded-circle"> View </a>

							</form>



						</div>
                </div>
                
                <!--  Product Images  -->
                
                <div class="row d-flex pt-5">
                  <div class="col-md-1"><img src="assets/images/add-image2.png" alt="product-image2"></div>
                  <div class="col-md-1"><img src="assets/images/add-image2.png" alt="product-image2"></div>
                  <div class="col-md-1"><img src="assets/images/add-image2.png" alt="product-image2"></div>
                  <div class="col-md-1"><img src="assets/images/add-image2.png" alt="product-image2"></div>
                </div>
              </div>

              <div id="vendors" class="container tab-pane fade"><br>
                <h3>VENDORS</h3>
                <p>Yet to be designed</p>
              </div>
            </div>
          </div>
        </div>
        
        
        </div>
      </div>
    </div>
    
  

</body>
</html>