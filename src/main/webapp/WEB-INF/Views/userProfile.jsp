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
<div class="panel">
<form action="changeProfileDetails" method="post">
<h2>Update Your Details</h2><br><br><br>
<h4>First Name</h4>
<input type="text" name="fName" value="${sessionScope.loggedUser.fName}"/>
<h4>Last Name</h4>
<input type="text" name="lName" value="${sessionScope.loggedUser.lName}"/>
<h4>Contact</h4>
<input type="number" name="contactNum" value="${sessionScope.loggedUser.contactNum}"/>
<br><br>
<input class="btn btn-primary" type="submit" value="Update">
</form>
</div>
</div>
<br><br>

<footer class="container-fluid text-center">
  <p>Online Store Copyright</p>
</footer>

</body>
</html>

