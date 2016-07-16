<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ include file="adminHeader.jsp" %>
<div class="container">
<c:url var="addAction" value="/categoryAdd"></c:url>
<form:form action="${addAction}" commandName="category">
<c:choose>
<c:when test="${! empty category.cId}">
<div class="row">	<!-- Add category -->
<div class="col-md-2 col-xs-2">Category Name: <input type="text" name="cName" value="${category.cName}" required/></div>
<div class="col-md-2 col-xs-2">Category Id: <input type="number" name="cId" value="${category.cId}" readonly/></div>
</div>
<div class="row">
<div class="col-md-4 col-xs-4"><input class="btn" type="submit" value="Edit Category"/>
<input class="btn" type="submit" value="Cancel"/></div>
</div>
</c:when>
<c:otherwise>
<div class="row">	<!-- Add Supplier -->
<div class="col-md-2 col-xs-2">Category Name: <input type="text" name="cName" required/></div>
<div class="col-md-2 col-xs-2" style="display: none">Category Id: <input type="number" name="cId" value="0"/></div>
</div>
<div class="row">
<div class="col-md-2 col-xs-2"><input class="btn" type="submit" value="Add Category"/></div>
</div>
</c:otherwise>
</c:choose>
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