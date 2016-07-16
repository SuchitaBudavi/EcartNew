<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
.modal {
  text-align: center;
  padding: 0!important;
}

.modal:before {
  content: '';
  display: inline-block;
  height: 100%;
  vertical-align: middle;
  margin-right: -4px;
}

.modal-dialog {
  display: inline-block;
  text-align: left;
  vertical-align: middle;
}

button{
  background-color: #0099ff; 
  border-color: #130269; 
}

.headerTable{
	border-collapse: separate;
	border-spacing: 10px;
}

</style>
</head>
<body>
<div class="jumbotron">
  <div class="container text-center">
    <h1></h1>
    <p></p>
  </div>
</div>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="index">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
      <c:forEach items="${sessionScope.categotyList}" var="category">
        <li><a href="user/product/${category.cId}">${category.cName}</a></li>
      </c:forEach>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <sec:authorize access="isAnonymous()"><li><a href="#" data-toggle="modal" data-target="#signupModal"> Signup</a></li></sec:authorize>
	  <sec:authorize access="isAnonymous()"><li><a href="#" data-toggle="modal" data-target="#loginModal"> Log In</a></li></sec:authorize>
      <sec:authorize access="isAuthenticated()">
      	<li><a href="#"><span class="glyphicon glyphicon-user"></span>
	      	<c:if test="${(sessionScope.loggedUserEmail != null) || (sessionScope.loggedUserEmail != '')}">
	      		${sessionScope.loggedUser.fName}
	      	</c:if>
      	</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
        <li><a href="logout">Logout</a></li>
      </sec:authorize>
      <li><a href="customerCare">Customer Care</a></li>
      </ul>
    </div>
  </div>
</nav>

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
		<table class="headerTable">
				<!-- <input type="text" name="email" placeholder="Email" size="30" required><br><br>
				<input type="password" name="password" placeholder="Password" size="30" required><br><br> -->
				<tr><td>Email:</td><td><input type="text" name="j_username" placeholder="Email" size="30" required></td></tr>
				<tr><td>Password: </td><td><input type="password" name="j_password" placeholder="Password" size="30" required></td></tr>
		</table>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn btn-primary">Cancel</button>
			<button type="submit" class="btn btn-primary">Login</button>
		</div>
	</form>
</div><!-- modal content -->
</div>
</div><!-- modal -->

<!-- Modal SignUp-->
<div id="signupModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
	<form method="post" action="signUp">
		<div class="modal-header">
		<b>Sing Up</b>
			<button type="button" class="close" data-dismiss="modal">&times;</button>
		</div>
		<div class="modal-body">
		<table class="headerTable">
			<tr><td>First Name:</td><td><input type="text" name="fName" placeholder="First name" size="30" required></td></tr>
			<tr><td>Last Name:</td><td><input type="text" name="lName" placeholder="Last name" size="30" required></td></tr>
			<tr><td>Email:</td><td><input type="email" name="email" placeholder="Email" size="30" required></td></tr>
			<tr><td>Password:</td><td><input type="password" name="password" placeholder="Password" size="30" required></td></tr>			
		</table>
		</div>
		<div class="modal-footer">
			<button type="button" data-dismiss="modal" class="btn btn-primary"> Cancel </button>
			<button type="submit" class="btn btn-primary">Sign up</button>
		</div>
	</form>
</div>
</div>
</div><!-- modal -->
</body>
</html>