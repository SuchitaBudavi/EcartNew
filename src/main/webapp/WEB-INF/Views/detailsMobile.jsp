<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
  <title>Mobile Details</title>
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
    
    .courselImg{
    	width: 50%;
    	margin: auto;
    }
.carousel-inner{
  width:100%;
  max-height: 300px !important;
}
  </style>
</head>
<body>
<%@include file="headerNew.jsp"%>
<div class="container">
<div class="row">
<div class="col-sm-7">
<div id="myCarousel" class="carousel slide courselImg" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img style="background-position: 67.4807% 51.75%;" class="courselImg" src="http://www.vodafone.co.nz/cms/images/iphone-6s-plus-rose-gold.png" alt="Chania">
    </div>

    <div class="item">
      <img style="background-position: 67.4807% 51.75%;" class="courselImg" src="http://www.vodafone.co.nz/cms/images/iphone-6s-plus-rose-gold.png" alt="Chania">
    </div>

   <!--  <div class="item">
      <img style="background-position: 67.4807% 51.75%;" src="http://img5a.flixcart.com/image/mobile/u/j/g/mi-redmi-note-3-na-1100x1100-imaegcrfg5yc7hpe.jpeg" alt="Flower">
    </div> -->
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> <!-- Coursel -->
</div>
<div class="col-sm-5">
<div class="container">
<h2>${product.pBrand}<br>${product.pModel}</h2>
<ul>
	<li>${featureDetails.os}</li>
	<li>${featureDetails.processor}</li>
	<li>${featureDetails.screenSize}</li>
	<li>${featureDetails.color}</li>
</ul>
<br>
<h4>Price:  ${product.pPrice}</h4>
<a href="/EcartFrontEnd/user/addToCartFromDetails/${product.pId}/${product.category_FK.cId}" class="btn btn-primary">Add to Cart</a>
</div>
</div>
</div> <!-- Row 1 -->
<div class="row panel">
<h2>Detailed Features</h2>
</div>
<div class="row panel">
<table class="table table-bordered">
<tbody>
<tr>
	<td>Operating System</td>
	<td>${featureDetails.os}</td>
</tr>
<tr>
	<td>Processor & RAM</td>
	<td>${featureDetails.processor}, ${featureDetails.ram} GB</td>
</tr>
<tr>
	<td>Internal Memory</td>
	<td>${featureDetails.internalMemory} GB</td>
</tr>
<tr>
	<td rowspan="2">Camera</td>
	<td>Front Cam: ${featureDetails.frontCam} MP</td>
</tr>
<tr>
	<td>Rare  Cam: ${featureDetails.rareCam} MP</td>
</tr>
<tr>
	<td>Screen Size & Resolution</td>
	<td>${featureDetails.screenSize}", ${featureDetails.resolution}</td>
</tr>
<tr>
	<td>Battery</td>
	<td>${featureDetails.battery}, ${featureDetails.batteryDesc}</td>
</tr>
</tbody>
</table>
</div><!-- row table -->
<br><br>
<div class="row">
<h3>Suppliers</h3>

</div>
</div>
<br><br>


<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>
</footer>

</body>
</html>

