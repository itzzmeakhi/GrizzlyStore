<%@page import="com.cognizant.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Delete Controller</title>
</head>
<body>

<%

	int prodId = Integer.parseInt(request.getParameter("prodId"));

	ProductDao prodDao = new ProductDao();
	
	int deleteStatus=0;
	
	deleteStatus = prodDao.deleteProduct(prodId);
	
	if(deleteStatus == 1) {
		response.sendRedirect("../add-product-list.jsp");
	} else {
		out.println("Error while Deleting");
	}
	
	













%>

</body>
</html>