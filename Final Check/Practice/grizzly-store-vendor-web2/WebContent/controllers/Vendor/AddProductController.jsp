
<%@page import="com.cognizant.bean.ProductBean"%>
<%@page import="com.cognizant.dao.ProductDao"%>
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


	<%-- <%
		ProductInsertDao pIDao = new ProductInsertDao();
		ProductBean prod = new ProductBean();

		prod.setProdId(request.getParameter("prodId"));
		prod.setProdName(request.getParameter("prodName"));
		prod.setProdCategory(request.getParameter("prodCategory"));
		prod.setProdDescription(request.getParameter("prodDesc"));
		prod.setProdBrand(request.getParameter("prodBrand"));
		prod.setProdPrice(Integer.parseInt(request.getParameter("prodPrice")));
		prod.setProdOffer(Integer.parseInt(request.getParameter("prodDiscount")));
		prod.setRating(Integer.parseInt(request.getParameter("prodRating")));
		//prod.setIsBlocked(0);
		int roleId = (int) session.getAttribute("userId");
		prod.setRoleId(roleId);

		int insertStatus = 0;
		insertStatus = pIDao.insertData(prod);
		request.setAttribute("insertStatus", insertStatus);
	%>
	<core:if test="${insertStatus==0}">
		<core:out value="Error while inserting !!! pls check"></core:out>
	</core:if>
	<core:redirect url="../../index.jsp"></core:redirect>
 --%>
 
 
 	<%
 	
 		ProductDao pDao = new ProductDao();
 		ProductBean prod = new ProductBean();
 		
 		
 		Integer roleId = (int) session.getAttribute("userId");
 		
 		prod.setRoleId(roleId);
 		prod.setProdName(request.getParameter("prodName"));
 		prod.setProdBrand(request.getParameter("prodBrand"));
 		prod.setProdDescription(request.getParameter("prodDesc"));
 		prod.setProdCategory(request.getParameter("prodCategory"));
 		prod.setProdPrice(Integer.parseInt(request.getParameter("prodPrice")));
 		prod.setProdOffer(Integer.parseInt(request.getParameter("prodDiscount")));
 		prod.setRating(Integer.parseInt(request.getParameter("prodRating")));
		prod.setProdId(request.getParameter("prodId"));
		
		int insertStatus = 0;
		
		insertStatus = pDao.insertProduct(prod);
		
		out.println(insertStatus);
 	
 	
 	
 	
 	%>

</body>
</html>