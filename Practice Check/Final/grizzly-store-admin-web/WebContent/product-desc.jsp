<%@page import="com.cognizant.bean.ProductBean"%>
<%@page import="com.cognizant.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title> Product Description </title>


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
          <div class="add-product">
            <div class="row">
              <div class="col-md-8">
                <ul class="nav nav-tabs" role="tablist">
                  <li class="nav-item">
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
            
            <%
            
            
            	int prodId = Integer.parseInt(request.getParameter("prodId"));
            	
            	ProductDao prodDao = new ProductDao();
            	
            	ProductBean prod = prodDao.read(prodId);
    
            
            %>
            
            
            
            
            
            <div class="container-fluid">
            <div class="tab-content ">
              <div id="home" class="tab-pane active"><br>
              <div class="row top-buffer h2">
                <div class="mx-3">
                  <p> <% out.println(prod.getProductName()); %> <span class="h5">by <% out.println(prod.getProductBrand()); %></span><span class=""><i class="fas fa-pen-square h5 pl-3"></i></span></p>
                  <div class=" h6" style="color: #979797"><i class="fa fa-star"> <% out.println(prod.getRating()); %></i></div>
                </div>
              </div>
                <div class="row  top-buffer">
                  <div class="col-md-6">
                    <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                      <div class="carousel-inner">
                        <div class="carousel-item active">
                          <img class="d-block h-100 w-100" src="assets/images/dummy.png" alt="First slide">
                        </div>
                        <div class="carousel-item">
                          <img class="d-block h-100 w-100" src="assets/images/dummy2.png" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                          <img class="d-block h-100 w-100" src="assets/images/dummy3.png" alt="Third slide">
                        </div>
                      </div>
                      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </div>
                  </div>
                  <div class="col-md-4  d-flex flex-column justify-content-between">
                      <div class="row">
                        <div class="h5">Product Description <i class="fas fa-pen-square h5 pl-2"></i></div>
                        <p><% out.println(prod.getDescription()); %></p>
                      </div>
                      <div class="row ">
                        <span class="h3">Rs. <% out.println(prod.getPrice()); %> <span class="h6"> <% out.println(prod.getDiscount()); %>%<i class="fas fa-pen-square h5 pl-2"></i></span></span>
                      </div>
                  </div>
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
        <div class="col-sm-1">
          <div class="col d-md-flex align-items-end  h-100">
          <form action="add-product-list.html" class="form-group">
            <div class="row">
              <button type="submit" class="btn btn-dark rounded-circle right-buffer"><span>&nbsp;Finish&nbsp;</span>
                        </button>
            </div>
            <div class="row top-buffer">
              <button type="clear" class="btn btn-secondary rounded-circle right-buffer"><span style="color:black">Cancel</span>
                        </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>

</body>
</html>