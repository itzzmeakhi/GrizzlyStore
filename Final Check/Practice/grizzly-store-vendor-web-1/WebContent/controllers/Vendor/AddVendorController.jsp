<%@page import="com.cognizant.bean.VendorBean"%>
<%@page import="com.cognizant.dao.AddVendorDao"%>
<%@page import="java.math.BigDecimal"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="core" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Add Vendor</title>
</head>
<body>

	<%	
		AddVendorDao vendorDao = new AddVendorDao();
		VendorBean vendor = new VendorBean();
		
		vendor.setUsername(request.getParameter("userName"));
		vendor.setPassword(request.getParameter("password"));
		vendor.setName(request.getParameter("name"));
		vendor.setMobile(Long.parseLong(request.getParameter("mobile")));
		vendor.setAddress(request.getParameter("address"));
	

		int insertStatus = 0;
		insertStatus = vendorDao.insert(vendor);
		request.setAttribute("insertStatus", insertStatus);
	%>
	
	<core:if test="${insertStatus==0}">
		<core:out value="Error while inserting !!! pls check"></core:out>
	</core:if>
	<core:redirect url="../../vendor-login.jsp"></core:redirect>

</body>
</html>