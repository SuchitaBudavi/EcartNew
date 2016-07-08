<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name='loginForm'
		  action="<c:url value='j_spring_security_check' />" method='POST'>
UserName: <input type="text" name="j_username"><br>
Password: <input type="password" name="j_password"><br>
<input type="submit" value="Login">
</form>
</body>
</html>