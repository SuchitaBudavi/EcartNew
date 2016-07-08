<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ecart.css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/jquery-1.12.4.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.js"></script>
</head>
<body>
Mobile Cover Feature:
<c:url var="addAction" value="/mobileCoverFeatureSave"/>
<form action="${addAction}">
<table>
<input type="number" name="mobileCoverFeatureId.product_FK.pId" value="${mobileCoverFeature.mobileCoverFeatureId.product_FK.pId}"/>
<input type="number" name="mobileCoverFeatureId.category_FK.cId" value="${mobileCoverFeature.mobileCoverFeatureId.category_FK.cId}"/>
<tr><td>Color:</td><td><input type="text" name="color" path="color" value="${mobileCoverFeature.color}"/></td></tr>
<tr><td>Material:</td><td><input type="text" name="material" path="material" value="${mobileCoverFeature.material}"/></td></tr>
<tr><td>Case Type:</td><td><input type="text" name="caseType" path="caseType" value="${mobileCoverFeature.caseType}"/></td></tr>
<tr><td>Mobile Brand:</td><td><input type="text" name="mobileBrand" path="mobileBrand" value="${mobileCoverFeature.mobileBrand}"/></td></tr>
<tr><td>Mobile Model:</td><td><input type="text" name="mobileModel" path="mobileModel" value="${mobileCoverFeature.mobileModel}"/></td></tr>
<tr><td>Plain/Designed:</td><td><input type="text" name="plainOrDesigned" path="plainOrDesigned" value="${mobileCoverFeature.plainOrDesigned}"/></td></tr>
</table>
<input type="submit" value="Save">
</form>
</body>
</html>