<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ecart.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/angular-route.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ecart.js"></script>
<style>
body,html{
    height: 100%;
  }

  nav.sidebar, .main{
    -webkit-transition: margin 200ms ease-out;
      -moz-transition: margin 200ms ease-out;
      -o-transition: margin 200ms ease-out;
      transition: margin 200ms ease-out;
  }

  .main{
    padding: 10px 10px 0 10px;
  }

 @media (min-width: 765px) {

    .main{
      position: absolute;
      width: calc(100% - 40px); 
      margin-left: 40px;
      float: right;
    }

    nav.sidebar:hover + .main{
      margin-left: 200px;
    }

    nav.sidebar.navbar.sidebar>.container .navbar-brand, .navbar>.container-fluid .navbar-brand {
      margin-left: 0px;
    }

    nav.sidebar .navbar-brand, nav.sidebar .navbar-header{
      text-align: center;
      width: 100%;
      margin-left: 0px;
    }
    
    nav.sidebar a{
      padding-right: 13px;
    }

    nav.sidebar .navbar-nav > li:first-child{
      border-top: 1px #e5e5e5 solid;
    }

    nav.sidebar .navbar-nav > li{
      border-bottom: 1px #e5e5e5 solid;
    }

    nav.sidebar .navbar-nav .open .dropdown-menu {
      position: static;
      float: none;
      width: auto;
      margin-top: 0;
      background-color: transparent;
      border: 0;
      -webkit-box-shadow: none;
      box-shadow: none;
    }

    nav.sidebar .navbar-collapse, nav.sidebar .container-fluid{
      padding: 0 0px 0 0px;
    }

    .navbar-inverse .navbar-nav .open .dropdown-menu>li>a {
      color: #777;
    }

    nav.sidebar{
      width: 200px;
      height: 100%;
      margin-left: -160px;
      float: left;
      margin-bottom: 0px;
    }

    nav.sidebar li {
      width: 100%;
    }

    nav.sidebar:hover{
      margin-left: 0px;
    }

    .forAnimate{
      opacity: 0;
    }
  }
   
  @media (min-width: 1330px) {

    .main{
      width: calc(100% - 200px);
      margin-left: 200px;
    }

    nav.sidebar{
      margin-left: 0px;
      float: left;
    }

    nav.sidebar .forAnimate{
      opacity: 1;
    }
  }

  nav.sidebar .navbar-nav .open .dropdown-menu>li>a:hover, nav.sidebar .navbar-nav .open .dropdown-menu>li>a:focus {
    color: #CCC;
    background-color: transparent;
  }

  nav:hover .forAnimate{
    opacity: 1;
  }
  section{
    padding-left: 15px;
  }
</style>
</head>
<body ng-app="userProfile">
{{10+20}}{{message}} Alaa
<%@ include file="header.jsp" %>
<div class="container">
<nav class="navbar navbar-default sidebar" role="navigation">
<div class="container-fluid">
<div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>      
    </div>
<div class="collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
   <ul class="nav navbar-nav">
   <li><a href="#/changePwd">Change Password<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-lock"></span></a></li>
   <li><a href="#/updateProfile">Update Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
   <li><a href="#/updateContact">Email & Contact<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-earphone"></span></a></li>
   <li><a href="#/userAddresses">Addresses<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicons-newspaper"></span></a></li>
   </ul>
</div>
</nav>
<div>
Main content
<ng-view></ng-view>
</div>
<!-- <div class="col-md-3 col-xs-3" style="height: 100%; border: 1px solid">
<div class="row">
<a href="#">Change Password<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-lock"></span></a>
</div>
<div class="row">
<a href="#">Update Profile<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a>
</div>
</div>
<div class="col-md-9 col-xs-9 style="height: 100%;  border: 1px solid"></div> -->
</body>
</html>
