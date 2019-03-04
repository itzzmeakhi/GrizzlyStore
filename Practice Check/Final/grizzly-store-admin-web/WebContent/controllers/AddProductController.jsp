<%@page import="com.cognizant.dao.ProductDao"%>
<%@page import="com.cognizant.bean.ProductBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core"%>

    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Add Product Controller </title>
</head>
<body>


	<%
     ProductDao prodDao = new ProductDao();
	 ProductBean prod = new ProductBean();
	 
	 prod.setProductName(request.getParameter("prodName"));
	 prod.setCategory(request.getParameter("prodCategory"));
	 prod.setDescription(request.getParameter("prodDesc"));
	 prod.setProductBrand(request.getParameter("prodBrand"));
	 prod.setPrice(Integer.parseInt(request.getParameter("prodPrice")));
	 prod.setDiscount(Integer.parseInt(request.getParameter("prodDiscount")));
	 prod.setRating(Integer.parseInt(request.getParameter("prodRating")));
			
     int insertStatus = 0;
     insertStatus = prodDao.insert(prod);
     request.setAttribute("insertStatus", insertStatus);
      %>
	<core:if test="${insertStatus==0}">
		<core:out value="Error while inserting !!! pls check"></core:out>
	</core:if>
	<core:redirect url="../add-product-list.jsp"></core:redirect>


</body>
</html>