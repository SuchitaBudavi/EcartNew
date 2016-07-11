<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mobiles</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container"><!-- filter -->
<div class = "col-md-3 col-xs-3" style="border:1px solid">
<form action="filter">
<div class="col-md-12">
<div class="row">
<input class="btn btn-default btn-lg" type="button" value="Filter"/>
</div>
<div class="row">
<input type="checkbox" name="brand" value="iPhone"> iPhone<br>
<input type="checkbox" name="brand" value="samsung"> Samsung<br>
</div>
</div>
</form>
</div><!-- filter -->
<div class = "col-md-9 col-xs-9" style="border:1px solid"><!-- product list -->
<div class="col-md-12">
<div class="row panel"><!-- rows will repeat according to the number of products -->
	<div class="col-md-4 col-xs-3" style="border:1px solid">
		<div class="pImage">Image</div>
		<div class="pName">Product Name</div>
		<div class="pAmount">Product Amount</div>
		<div class="pCompare" style="font-size:8pt">
			<input type="checkbox" class="pcompare" value=""> Add to compare
		</div>
	</div>
	<div class="col-md-4 col-xs-3" style="border:1px solid">sdfes</div>
	<div class="col-md-4 col-xs-3" style="border:1px solid">sdfs</div>
</div>
<div class="row panel"><!-- rows will repeat according to the number of products -->
	<div class="col-md-4 col-xs-3" style="border:1px solid">
		<div class="pImage">Image</div>
		<div class="pName">Product Name</div>
		<div class="pAmount">Product Amount</div>
		<div class="pCompare">
			<input type="checkbox" class="pcompare" value=""> Add to compare
		</div>
	</div>
	<div class="col-md-4 col-xs-3" style="border:1px solid">sdfes</div>
	<div class="col-md-4 col-xs-3" style="border:1px solid">sdfs</div>
</div>
</div><!-- column 12 for gapping -->
</div><!-- product list -->
</div>
</body>
</html>