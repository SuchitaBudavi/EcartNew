<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
</head>
<body>
<%@ include file="header.jsp"%>
<div class="container"><!-- filter -->
<div class = "col-md-3 col-xs-3" style="border:1px solid">
<div class="col-md-12">
      Content goes here
</div>
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