
<%@page import="com.cognizant.bean.ProductBean"%>
<%@page import="com.cognizant.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Add Product Controller </title>
</head>
<body>

	<%
	
		ProductDao prodDao = new ProductDao();
		ProductBean prod= new ProductBean();
		
		Integer roleId = (int) session.getAttribute("userId");
		
		prod.setRoleId(roleId);
		prod.setProdName(request.getParameter("prodName"));
		prod.setProdBrand(request.getParameter("prodBrand"));
		prod.setProdDesc(request.getParameter("prodDesc"));
		prod.setProdCategory(request.getParameter("prodCategory"));
		prod.setProdId(request.getParameter("prodId"));
		prod.setProdPrice(Integer.parseInt(request.getParameter("prodPrice")));
		prod.setProdOffer(Integer.parseInt(request.getParameter("prodDiscount")));
		prod.setProdRating(Integer.parseInt(request.getParameter("prodRating")));
		
		int insertStatus = 0;
		insertStatus = prodDao.insertProduct(prod);
		
		request.setAttribute("insertStatus", insertStatus);
	

	%>
	
	<core:if test="${insertStatus==0}">
		<core:out value="Error while inserting !!! pls check"></core:out>
	</core:if>
	<core:redirect url="../../index.jsp"></core:redirect>

	

</body>
</html>