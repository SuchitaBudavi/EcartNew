<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
  <title>Mobile Covers</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default rounded borders and increase the bottom margin */
    .navbar {
      margin-bottom: 50px;
      border-radius: 0;
    }
    
    /* Remove the jumbotron's default bottom margin */
     .jumbotron {
      margin-bottom: 0;
     
    }
   
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: #f2f2f2;
      padding: 25px;
    }
    
    /* filet */
    .filter{
    	
    }
    
    .cartButton{
    	display: block; margin-left: auto; margin-right: auto
    }
    
    .btn-hover {
  font-weight: normal;
  color: #333333;
  cursor: pointer;
  background-color: inherit;
  border-color: transparent;
}
    
  </style>
</head>
<body>
<%@include file="headerNew.jsp"%>
<div class="container">
<table class="table table-bordered">
<thead>
	<tr>
		<td>Product</td>
		<td>Product Details</td>
		<td>Quantity</td>
		<td>Price</td>
		<td>Sub total</td>
		<td>Delete</td>
	</tr>
</thead>
<tbody>
<c:set var="total" scope="page" value="0"></c:set>
<c:forEach  items="${cartList}" var="carteItem">
<tr>
	<td>Image</td>
	<td>${carteItem.product_FK.pBrand}, ${carteItem.product_FK.pModel}</td>
	<td>${carteItem.qty}</td>
	<td>${carteItem.price}</td>
	<td>${(carteItem.qty)*(carteItem.price)}</td>
	<td><a href="deleteFromCart/${carteItem.product_FK.pId}/${carteItem.category_FK.cId}"><span class="glyphicon glyphicon-remove"></span></a></td>
	
</tr>
<c:set var="total" value="${total + ((carteItem.qty)*(carteItem.price))}"></c:set>
</c:forEach>
<tr><td></td><td></td><td></td><td>Total</td><td>${total}</td></tr>
</tbody>
</table>
<br><br>
<a href="placeOrder" class="btn btn-primary">Place Order</a>
</div>
<br><br>

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>
</footer>

</body>
</html>

