<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ecart.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script> --%>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
<div class="row"> <!-- admin header -->
	<div class="col-md-2 col-xs-2 panel"></div>
		<!-- <div class="col-md-8 col-xs-8 panel"><img class="hidden-sm" src="${pageContext.request.contextPath}/resources/media/flipkart_logo.jpg" alt="flipkart"/>
		<input type="text" size="75" name="searchText" id="searchText" placeholder="search"/>
		<button type="submit">Search</button></div>-->
		<div class="col-md-8 col-xs-8 panel"></div>
	<div class="col-md-2 col-xs-2 panel"><a href="${pageContext.request.contextPath}/logout">Logout</a></div>
</div>
<div class="row"> <!-- navbar -->  
<div class="navbar navbar-default row">
<div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
  </div>
<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
<ul class="nav navbar-nav">
<li><a href="${pageContext.request.contextPath}/getAllCategories">Category</a></li>
<li><a href="${pageContext.request.contextPath}/getAllProducts">Product</a></li>
<li><a href="${pageContext.request.contextPath}/getAllSuppliers">Supplier</a></li>
</ul>
</div>
</div>
</div> <!-- navbar -->
</div><!-- container -->
</body>
</html>