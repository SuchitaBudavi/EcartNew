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
<table class="table table-bordered table-hover">
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
	<a href="<c:url value='/supplier/edit/${category.cId}'/>">Edit</a> /
	<a href="<c:url value='/supplier/delete/${category.cId}'/>">Delete</a>
	</td>
</tr>
</c:forEach>
</tbody>
</div>
</body>
</html>