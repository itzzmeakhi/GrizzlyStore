<%@page import="com.cognizant.dao.LoginDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "core" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "sql" uri = "http://java.sun.com/jsp/jstl/sql" %>
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
		<link rel="stylesheet" type="text/css" href="assets/css/mediaqueries.css">
	
	    <!-- JQuery -->
	
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	
		<!-- Google Fonts -->
	
	    <link href="https://fonts.googleapis.com/css?family=B612" rel="stylesheet">
		<%-- <link href="https://fonts.googleapis.com/css?family=Amatic+SC" rel="stylesheet">--%>
		
		<script>  
		
			var request; 
			
			function checkUserName()  
			{  
				var username = document.loginForm.UserName.value;  
				var url="controller.jsp?UserName="+username;  
			  
				if(window.XMLHttpRequest) {  
					request=new XMLHttpRequest();  
				}  
				else if(window.ActiveXObject) {  
					request=new ActiveXObject("Microsoft.XMLHTTP");  
				}  
			  
				try {  
					request.onreadystatechange=getUserNameInfo;  
					request.open("GET",url,true);  
					request.send();  
				} catch(e){alert("Unable to connect to server");}  
			}  
			  
			function getUserNameInfo() {  
				if(request.readyState==4){  
					var val=request.responseText;  
					document.getElementById('amit').innerHTML=val; 
					
					if(val) {
						$('.password').append('<input type=password class="form-control"' + 
		                        'onclick="GetTextValue()"' + 
		                            'id=btSubmit placeholder=Enter your password />');
		                }
						
						
						
						//<input type = "text" class = "form-control" placeholder = "Enter your Username" id = "UserName" name = "UserName" onkeyup = "checkUserName()" required>
					}
				}  
			 
  
		</script>  
	</head>
	<body>
	
		<!-- Main Container -->

		<div class = "container-fluid main-container">

        	<div class = "row">

				<div class = "col offset-sm-2 col-sm-8">

					<img src = "assets/images/logo.jpg" class = "img-fluid" alt = "Grizzly_store_logo">

				</div>

			</div>

			<form class = "login-form" name = "loginForm"> 

				<div class = "row">

					<div class = "col offset-sm-4 col-sm-4 justify-content-md-center">

						<h1> GRIZZLY STORE </h1>

					</div>

				</div>

				<div class = "row">

					<div class = "col offset-sm-5 col-sm-2">

						<div class = "form-group">

							<div class="input-group mb-2">

        						<!--<div class="input-group-prepend">
          							<div class="input-group-text"><i class="fas fa-user"></i></div>
        						</div>-->

								<input type = "text" class = "form-control" placeholder = "Enter your Username" id = "UserName" name = "UserName" onkeyup = "checkUserName()" required>

							</div>

						</div>

                	</div>

				</div>
				
				<div class = "row">

					<div class = "col offset-sm-5 col-sm-2">

						<div class = "form-group">

							<div class="input-group mb-2 password">

        						<!--<div class="input-group-prepend">
          							<div class="input-group-text"><i class="fas fa-user"></i></div>
        						</div>-->

					

							</div>

						</div>

                	</div>

				</div>


            	<div class = "row">

                	<div class = "col offset-sm-5 col-sm-2">

				    	<input type = "submit" class = "btn btn-login" value = "Continue" onclick = "checkUserName()">

                	</div>

            	</div>
            	
            	<span id="amit"> </span> 


			</form>
			
			


		</div>
		
		
	</body>
	
</html>