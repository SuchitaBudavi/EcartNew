<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
  <title>Mobile Cover</title>
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
<div class="col-sm-7" style="border: 1px solid">
<div id="myCarousel" class="carousel slide courselImg" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
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
<div class="col-sm-5" style="border: 1px solid">
<div class="container">
<h2>Mobile Brand<br>Mobile Model</h2>
<ul>
	<li>OS</li>
	<li>Processor</li>
	<li>screen size</li>
</ul>
<a href="user/addToCart/${productList[count.index+1].pId}/${productList[count.index+1].category_FK.cId}" class="btn btn-primary">Add to Cart</a>
</div>
</div>
</div>
<br><br>

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>
</footer>

</body>
</html>

