<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html ng-app>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ecart.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
	<script>
	function categoryChange(){
		var value = document.getElementById("selected_category").value;
		//alert("seleted value: "+value);
		window.location.pathname = "${pageContext.request.contextPath}/getSelectedCatProduct/"+value;	
	}
	</script>
</head>
<body>
<div class="container">
<%@ include file="adminHeader.jsp" %>
<div class="container">
<div class="row panel">
	<div class="col-md-2 col-xs-2"></div>
	<div class="col-md-4 col-xs-4">Select Category: <form:select path="category.cId" items="${categoryList}" itemValue="cId" itemLabel="cName" id="selected_category" style="width: 200px" onchange="javascript:categoryChange();"></form:select></div>
	<div class="col-md-2 col-xs-2"><input type="number" placeholder="Product Num"></div>
	<div class="col-md-2 col-xs-2"><input type="submit" name="Search"></div>
	<div class="row-md-3 col-xs-3"></div>
</div>
<div class="row panel">
<table class="table table-bordered table-hover">
<thead>
<tr>
	<th>Category</th>
	<th>Product Id</th>
	<th>Brand</th>
	<th>Model</th>
	<th>Price</th>
	<th>Quantity</th>
	<th>Supplier</th>
	<th>Edit/Delete</th>
</tr>
</thead>
<tbody>
<c:forEach items="${productList}" var="product">
<tr>
	<th>${product.category_FK.cName}</th>
	<th>${product.pId}</th>
	<th>${product.pBrand}</th>
	<th>${product.pModel}</th>
	<th>${product.pPrice}</th>
	<th>${product.pQty}</th>
	<th>${product.supplier_FK.sName}</th>
	<th><a href="<c:url value='/productDetails/${product.category_FK.cId}/${product.pId}'/>">Edit</a> /
	<a href="<c:url value='productDelete/${product.category_FK.cId}/${product.pId}'/>">Delete</a></th>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</body>
</html>