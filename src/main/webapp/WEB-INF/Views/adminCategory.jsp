<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Category</title>
<style>
.error {
	color: #ff0000;
}
</style>
</head>
<body>
<%@ include file="adminHeader.jsp" %>
<div class="container">
<c:url var="addAction" value="/categoryAdd"></c:url>
<form:form action="${addAction}" commandName="category">
<c:choose>
<c:when test="${category.cId != 0}">
<div class="row">	<!-- Add category -->
<div class="col-md-2 col-xs-2">Category Name: <form:input path="cName" type="text"/></div>
<form:errors path="cName" cssClass="error" />
<div class="col-md-2 col-xs-2">Category Id: <form:input path="cId" type="number" readonly="true"/></div>
</div>
<div class="row"><form:errors path="cName" cssClass="error" /></div><br>
<div class="row">
<div class="col-md-4 col-xs-4"><input class="btn" type="submit" value="Edit Category"/>
<input class="btn" type="submit" value="Cancel"/></div>
</div>
</c:when>
<c:otherwise>
<div class="row">	<!-- Add Supplier -->
<div class="col-md-2 col-xs-2">Category Name: <form:input path="cName" type="text"/></div>
<div class="col-md-2 col-xs-2" style="display: none">Category Id: <form:input path="cId" type="number"/></div>
</div>
<div class="row"><form:errors path="cName" cssClass="error" /></div><br>
<div class="row">
<div class="col-md-2 col-xs-2"><input class="btn" type="submit" value="Add Category"/></div>
</div>
</c:otherwise>
</c:choose><br>
 <!-- Add Category -->
<table class="table table-bordered table-hover panel">
<thead>
<tr>
	<th>Id</th>
	<th>name</th>
	<th>Update/Delete</th>
</tr>
</thead>
<tbody>
<c:forEach items="${categoryList}" var="category"> 
<tr>
	<td>${category.cId}</td>
	<td>${category.cName}</td>
	<td>
	<a href="<c:url value='/category/edit/${category.cId}'/>">Edit</a> /
	<a href="<c:url value='/category/delete/${category.cId}'/>">Delete</a>
	</td>
</tr>
</c:forEach>
</tbody>
</table>
</form:form>
</div>
</body>
</html>