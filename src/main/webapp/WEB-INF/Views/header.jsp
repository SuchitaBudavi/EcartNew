<!DOCTYPE HTML> 
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <meta http-equiv="refresh" content="0; URL=./onLoad"/> -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ecart.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>
<!-- <body onload="window.location = 'onLoad'"> -->
<body>
<header>
	<div class="row"> <!-- search -->
		<div class="col-md-2 col-sm-2 panel"></div>
		<!-- <div class="col-md-8 col-sm-8 panel"><img class="hidden-sm" src="${pageContext.request.contextPath}/resources/media/flipkart_logo.jpg" alt="flipkart"/>
		<input type="text" size="75" name="searchText" id="searchText" placeholder="search"/>
		<button type="submit">Search</button></div>-->
		<div class="col-md-2 col-sm-2 panel"></div>
	</div>
	<div class="row"> <!-- Navigation -->
		<div class="col-md-1 col-sm-1"></div>
		<div class="col-md-10 col-sm-10">
		<div class="navbar navbar-default row">
			  <div class="navbar-header">
			      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
			        <span class="sr-only">Toggle navigation</span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			        <span class="icon-bar"></span>
			      </button>
    		</div>
    		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    		<ul class="nav navbar-nav">
    		<c:forEach items="${sessionScope.categotyList}" var="category">
    			<%-- <li class="dropdown"><a data-toggle="dropdown" href="">${category.cName}<span class="caret"></span></a></li> --%>
    			<li><a href="user/product/${category.cId}">${category.cName}</a></li>
    			<%-- <c:forEach items="${categoryProduct.value}" var="product">
    				<ul class="dropdown-menu">
    					<li><a href="">${product.value}</a></li>
    				</ul>
    			</c:forEach> --%>
    		</c:forEach>
    		</ul>
			<!-- <ul class="nav navbar-nav">
				<li class="dropdown"><a data-toggle="dropdown" href="">Moiles<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="product/mobile?pType=mobiles&brand=iphone">iPhone</a></li>
						<li><a href="product/mobile?pType=mobiles&brand=samsung">Samsung</a></li>
					</ul>
				</li>
				<li class="dropdown"><a data-toggle="dropdown" href="">Mobile Covers<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="product/cover?pType=covers&brand=iphone">iPhone</a></li>
						<li><a href="product/cover?pType=mobiles&brand=samsung">Samsung</a></li>
					</ul>
				</li>
			</ul> -->
			<ul class="nav navbar-nav navbar-right">
				<li><a href="customerCare.jsp">Customer Care</a></li>
				<li><a href="#" data-toggle="modal" data-target="#signupModal"> Signup</a></li>
				<li><a href="#" data-toggle="modal" data-target="#loginModal"> Log In</a></li>
				<li class="dropdown"><a data-toggle="dropdown" href=""><span class="glyphicon glyphicon-cog"></span></a>
					<ul class="dropdown-menu">
						<li><a href="manageProfile">Manage Profile</a></li>
						<li><a href="logout">Logout</a></li>
					</ul>
				</li>
			</ul>
			</div>	
		</div>
		</div>
		<div class="col-md-1 col-sm-1"></div>
	</div><!-- row -->
</header>

<!-- Modal SignUp-->
<div id="signupModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
	<form method="post" action="signUp">
		<div class="modal-header">
		<b>SING UP</b>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
				<input type="text" name="fName" placeholder="First name" size="30" required><br><br>
				<input type="text" name="lName" placeholder="Last name" size="30" required><br><br>
				<input type="email" name="email" placeholder="Email" size="30" required><br><br>
				<input type="password" name="password" placeholder="Password" size="30" required><br><br>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal">Cancel</button>
			<button type="submit">Sign up</button>
		</div>
	</form>
</div>
</div>
</div><!-- modal -->


<!-- Modal Login-->
<div id="loginModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<!-- <form method="post" action="login"> -->
	<form method="post" action="j_spring_security_check">
		<div class="modal-header">
		<b>Login</b>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
		${errorMessage}<br>
				<!-- <input type="text" name="email" placeholder="Email" size="30" required><br><br>
				<input type="password" name="password" placeholder="Password" size="30" required><br><br> -->
				<input type="text" name="j_username" placeholder="Email" size="30" required><br><br>
				<input type="password" name="j_password" placeholder="Password" size="30" required><br><br>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal">Cancel</button>
			<button type="submit">Login</button>
		</div>
	</form>
</div><!-- modal content -->
</div>
</div><!-- modal -->

</body>
</html>