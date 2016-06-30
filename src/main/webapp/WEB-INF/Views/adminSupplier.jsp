<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ecart.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
<%@ include file="adminHeader.jsp" %>
<c:url var="addAction" value="/supplier/add"></c:url>
<form:form action="${addAction}" commandName="supplier">
<c:choose>
<c:when test="${! empty supplier.sId}">
<div class="row">	<!-- Add Supplier -->
<div class="col-md-2">Supplier Id: <input type="number" name="sId" value="${supplier.sId}" readonly/></div>
<div class="col-md-2">Supplier Name: <input type="text" name="sName" value="${supplier.sName}" required/></div>
</div>
<div class="row">
<div class="col-md-2">Street: <input type="text" name="street" value="${supplier.sAddress.street}"/></div>
<div class="col-md-2">City: <input type="text" name="city" value="${supplier.sAddress.city}"/></div>
<div class="col-md-2">State: <input type="text" name="state" value="${supplier.sAddress.state}"/></div>
<div class="col-md-2">pincode: <input type="number" name="pincode" value="${supplier.sAddress.pincode}" required/></div>
</div>
<div class="row">
<div class="col-md-4"><input class="btn" type="submit" value="Edit Supplier"/>
<input class="btn" type="submit" value="Cancel"/></div>
</div>
</c:when>
<c:otherwise>
<div class="row">	<!-- Add Supplier -->
<div class="col-md-2">Supplier Id: <input type="number" name="sId" required/></div>
<div class="col-md-2">Supplier Name: <input type="text" name="sName" required/></div>
</div>
<div class="row">
<div class="col-md-2">Street: <input type="text" name="street"/></div>
<div class="col-md-2">City: <input type="text" name="city"/></div>
<div class="col-md-2">State: <input type="text" name="state"/></div>
<div class="col-md-2">pincode: <input type="number" name="pincode" required/></div>
</div>
<div class="row">
<div class="col-md-2"><input class="btn" type="submit" value="Add Supplier"/></div>
</div>
</c:otherwise>
</c:choose>
 <!-- Add Supplier -->
<br><br>
<h3>Supplier List</h3>
<table class="table table-bordered table-hover">
<thead>
<tr>
	<th>Id</th>
	<th>name</th>
	<th>Street</th>
	<th>City</th>
	<th>State</th>
	<th>Pincode</th>
	<th>Update/Delete</th>
</tr>
</thead>
<tbody>
<c:forEach items="${supplierList}" var="supplier"> 
<tr>
	<td>${supplier.sId}</td>
	<td>${supplier.sName}</td>
	<td>${supplier.sAddress.street}</td>
	<td>${supplier.sAddress.city}</td>
	<td>${supplier.sAddress.state}</td>
	<td>${supplier.sAddress.pincode}</td>	
	<td>
	<a href="<c:url value='/supplier/edit/${supplier.sId}'/>">Edit</a> /
	<a href="<c:url value='/supplier/delete/${supplier.sId}'/>">Delete</a>
	</td>
</tr>
</c:forEach>
</tbody>
</table>
</form:form>
</div>
</body>
</html>