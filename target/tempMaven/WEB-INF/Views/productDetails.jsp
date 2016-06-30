<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="resources/css/ecart.css"/>
	<script type="text/javascript" src="resources/bootstrap/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="resources/bootstrap/js/bootstrap.js"></script>
	<style>
		div{
			border: 1px solid;
		}
	</style>
</head>
<body>
<%@ include file="header.jsp"%>
<form method="get" action="#">
<div class="container">
	<div class="row"><!-- big image -->
		<div class="col-md-4"></div>
		<div class="col-md-4">Big Image</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row"><!-- product image coursel -->
		<div class="col-md-3"></div>
		<div class="col-md-6">product image coursel</div>
		<div class="col-md-3"></div>
	</div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-2">
			<button type="button" onclick="function(){document.forms[0].action='addToCart']}">Add to cart</button>
		</div>
		<div class="col-md-2">
			<button type="button" onclick="function(){document.forms[0].action='buyNow']}">Buy Now</button>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row"><!-- product detail -->
memory & processor
-internal
-ram
-processor
-OS

display
-resolution
-touch screen

formfactor

camera
-front cam
-rare cam
-flash
-hd recording

internet & connectivity
-network
-audio jack
-bluetooth
-wifi
-USB connectivity

battery
-type
-backup

<br>
brand
designer
plain
company
model desc
color
type of cover
material

	</div>
</div>
</form>
</body>
</html>