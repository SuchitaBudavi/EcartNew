<!DOCTYPE HTML> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>ECart</title>
</head>
<body>
<div class="container">
<%@ include file="header.jsp"%>
<div class="row top-buffer">
	<div class="col-md-12 col-sm-12 panel"></div>
</div>
<!-- Carousel  -->
<div class="row">
	<div class="col-md-12 col-sm-12 panel">
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
		       		 <img src="resources/iphones1.jpg" alt="iphone" width="900" height="250">
		       		 <div class="carousel-caption">
			            <h3>iPhone</h3>
          			</div>
		      	</div>
		
		     	<div class="item">
		        	<img src="D:\\study\\ECart\\EcartFrontEnd\\src\\main\\webapp\\WEB-INF\\resources\\media\\samsung1024_620.jpg" alt="samsung" width="900" height="300">
		        	 <div class="carousel-caption">
			            <h3>Samsung</h3>
          			</div>
		      	</div>
		    
		      	<div class="item">
		        	<img src="D:\\study\\ECart\\EcartFrontEnd\\src\\main\\webapp\\WEB-INF\\resources\\media\\iphone1024x620.jpg" alt="iphone" width="900" height="300">
		        	 <div class="carousel-caption">
			            <h3>iPhone</h3>
          			</div>
		      	</div>
		      	<div class="item">
		        	<img src="D:\\study\\ECart\\EcartFrontEnd\\src\\main\\webapp\\WEB-INF\\resources\\media\\samsung-1024x620.jpg" alt="samsung" width="900" height="300">
		        	<div class="carousel-caption">
			            <h3>Samsung</h3>
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
	<div class="col-md-1 col-sm-1 panel"></div>
</div>
</div><!-- container -->
<!-- Carousel  -->

<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
<div>
	Login attempt unseccesSfull<br>
	${sessionScope['SPRING_SECURITY_LAST_EXCEPTION'].message}
</div>
</c:if>
</body>
</html>
