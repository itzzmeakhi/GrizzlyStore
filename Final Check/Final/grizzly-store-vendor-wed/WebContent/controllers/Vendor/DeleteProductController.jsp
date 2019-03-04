<%@page import="com.cognizant.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Product Controller</title>
</head>
<body>




<%

	int id = Integer.parseInt(request.getParameter("id"));

	ProductDao prodDao = new ProductDao();
	
	int deleteStatus=0;
	
	deleteStatus = prodDao.deleteProduct(id);
	
	if(deleteStatus == 1) {
		response.sendRedirect("../../index.jsp");
	} else {
		out.println("Error while Deleting");
	}
	
	













%>

</body>
</html>