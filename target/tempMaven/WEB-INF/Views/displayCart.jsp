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
<div class="container panel">
<div class="row"><!-- repeat for number of items in cart -->
	<div class="col-md-5 col-xs-5">ITEM</div>
	<div class="col-md-1 col-xs-1">QUANTITY</div>
	<div class="col-md-2 col-xs-2">AMOUNT</div>
	<div class="col-md-1 col-xs-1">DISCOUNT</div>
	<div class="col-md-2 col-xs-2">SUB TOTAL</div>
	<div class="col-md-1 col-xs-1"><a href=""><span class="glyphicon glyphicon-remove-sign"></span></a></div>
</div>
<div class="row"><!-- repeat for number of items in cart -->
	<div class="col-md-5 col-xs-5">ITEM</div>
	<div class="col-md-1 col-xs-1">QUANTITY</div>
	<div class="col-md-2 col-xs-2">AMOUNT</div>
	<div class="col-md-1 col-xs-1">DISCOUNT</div>
	<div class="col-md-2 col-xs-2">SUB TOTAL</div>
	<div class="col-md-1 col-xs-1"><a href=""><span class="glyphicon glyphicon-remove-sign"></span></a></div>
</div>
<div class="row">
	<div class="col-md-10"></div>
	<div class="col-md-1">TOTAL</div>
	<div class="col-md-1">Amt</div>
</div> <!-- Total -->
<div class="row">
	<div class="col-md-10"></div>
	<div class="col-md-2"><button type="button">Place Order</button></div>
</div>
</div><!-- container -->
</body>
</html>