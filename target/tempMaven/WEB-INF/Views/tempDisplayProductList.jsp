<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>temp Display temp Product List</title>
</head>
<body>
<h2>List of Products</h2>
<div>
	<table>
	<th>Id</th>
	<th>Brand</th>
	<th>Model</th>
	<th>Price</th>
	<th>Quantity</th>
	<c:forEach items="${pList}" var="p" varStatus="status">
		<tr>
			<td><input type="text" value="${p.pId}"></td>
			<td><input type="text" value="${p.pBrand}"></td>
			<td><input type="text" value="${p.pModel}"></td>
			<td><input type="text" value="${p.pPrice}"></td>
			<td><input type="text" value="${p.pQty}"></td>
		</tr>
	</c:forEach>
	</table>
</div>
</body>
</html>