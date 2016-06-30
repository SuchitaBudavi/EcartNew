<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<div class="row"> <!-- admin header -->
	<div class="col-md-2 col-sm-2 panel"></div>
		<!-- <div class="col-md-8 col-sm-8 panel"><img class="hidden-sm" src="${pageContext.request.contextPath}/resources/media/flipkart_logo.jpg" alt="flipkart"/>
		<input type="text" size="75" name="searchText" id="searchText" placeholder="search"/>
		<button type="submit">Search</button></div>-->
		<div class="col-md-8 col-sm-8 panel"></div>
	<div class="col-md-2 col-sm-2 panel"><a href="">Logout</a></div>
</div>
<div class="row"> <!-- navbar -->
<div class="navbar navbar-default row">
<ul class="nav navbar-nav">
<li><a href="getAllCategories">Category</a></li>
<li><a href="getAllProducts">Product</a></li>
<li><a href="getAllSuppliers">Supplier</a></li>
</ul>
</div>
</div> <!-- navbar -->
</div><!-- container -->
</body>
</html>