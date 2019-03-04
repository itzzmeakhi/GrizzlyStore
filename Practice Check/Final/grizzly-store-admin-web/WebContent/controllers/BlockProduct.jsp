<%@page import="com.cognizant.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Block Product </title>
</head>
<body>

<%

	int prodId = Integer.parseInt(request.getParameter("prodId"));

	ProductDao prodDao = new ProductDao();
	
	int blockStatus=0;
	
	blockStatus = prodDao.blockProduct(prodId);
	
	if(blockStatus == 1) {
		response.sendRedirect("../add-product-list.jsp");
	} else {
		out.println("Error while blocking");
		response.sendRedirect("../add-product.jsp");
	}
	
	













%>






</body>
</html>