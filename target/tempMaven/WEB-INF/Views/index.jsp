<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html lang="en">
<head>
  <title>Ecart</title>
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
    
    .carousel-inner > .item > img {
    margin: 0 auto;
}
  </style>
</head>
<body>
<%@include file="headerNew.jsp"%>
<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
<div>
	Login attempt unseccesSfull<br>
	${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
</div>
</c:if>
<div class="container">
<div id="phonesCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#phonesCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#phonesCarousel" data-slide-to="1"></li>
		      <li data-target="#phonesCarousel" data-slide-to="2"></li>
		      <li data-target="#phonesCarousel" data-slide-to="3"></li>
		    </ol>
		    <div class="carousel-inner" role="listbox">
		      	<div class="item active">
		       		 <img src="http://www.androidguys.com/wp-content/uploads/2015/03/galaxy_s6-hero.png" alt="iphone" width="900" height="250">
		       		 <div class="carousel-caption">
			            <h3>Samsung</h3>
          			</div>
		      	</div>
		
		     	<div class="item">
		        	<img src="http://www.notebookcheck.net/typo3temp/_processed_/csm_4_zu_3_teaser_05_a68d30babc.jpg" alt="samsung" width="900" height="300">
		        	 <div class="carousel-caption">
			            <h3>iPhone</h3>
          			</div>
		      	</div>
		    
		      	<div class="item">
		        	<img src="http://cdn.shopify.com/s/files/1/0196/3894/files/20150825165325322532_1024x1024.jpg?12903253272233953691" alt="iphone" width="900" height="300">
		        	 <div class="carousel-caption">
			            <h3>Samsung</h3>
          			</div>
		      	</div>
		      	<div class="item">
		        	<img src="http://www.notebookcheck.net/typo3temp/_processed_/csm_4_zu_3_teaser_05_a68d30babc.jpg" alt="samsung" width="900" height="300">
		        	<div class="carousel-caption">
			            <h3>iPhone</h3>
          			</div>
		      	</div>
			</div>	<!-- carousel-inner -->
			<!-- Left and right controls -->
			<a class="left carousel-control" href="#phonesCarousel" role="button" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#phonesCarousel" role="button" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		      <span class="sr-only">Next</span>
		    </a>
		</div>
</div>
<br><br>

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>
</footer>
</body>
</html>

