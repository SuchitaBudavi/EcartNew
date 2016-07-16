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
  </style>
</head>
<body>
<%@include file="headerNew.jsp"%>
<div class="container">
<div class="col-sm-3">
	<div class="panel panel-primary filter">
		<div class="panel-heading">Filters</div>
		<div class="panel-body">BODY</div>
	</div>
</div>
<div class="col-sm-9">
<c:set var="size" scope="page" value="${fn:length(productList)}"></c:set>
<c:forEach begin="0" step="3" end="${size}" varStatus="count">
  <div class="row">
    <div class="col-sm-4">
      <div class="panel panel-info">
        <div class="panel-heading">${productList[count.index].pBrand}<br>${productList[count.index].pModel}</div>
        <div class="panel-body"><img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">${productList[count.index].pPrice}</div>
      </div>
    </div>
    <c:if test="${count.index+1 <=  (size-1)}">
    <div class="col-sm-4">
      <div class="panel panel-danger">
        <div class="panel-heading">${productList[count.index+1].pBrand}<br>${productList[count.index+1].pModel}</div>
        <div class="panel-body"><img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">${productList[count.index+1].pPrice}</div>
      </div>
    </div>
    </c:if>
    <c:if test="${count.index+2 <=  (size-1)}">
    <div class="col-sm-4">
      <div class="panel panel-success">
        <div class="panel-heading">${productList[count.index+2].pBrand}<br>${productList[count.index+2].pModel}</div>
        <div class="panel-body"><img src="http://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image"></div>
        <div class="panel-footer">${productList[count.index+2].pPrice}</div>
      </div>
    </div>
    </c:if>
  </div>
</c:forEach>
</div><br>
</div>
<br><br>

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>
</footer>

</body>
</html>

