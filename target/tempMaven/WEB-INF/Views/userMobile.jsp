<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mobiles</title>
</head>
<body>
<%@ include file="header.jsp"%>
<%-- <input type="text" name="${pageCategoryId}"/> --%>
<div class="container"><!-- filter -->
<form method="post" action="${pageContext.request.contextPath}/user/product/filter">
<div class = "col-md-3 col-xs-3" style="border:1px solid">
<div class="col-md-12">
<div class="row">
<input class="btn btn-default btn-lg" type="submit" value="Filter"/>
</div>
<div class="row">
<c:forEach items="${brandList}" var="brand">
<input type="checkbox" name="brand" value="${brand}">${brand}<br>
</c:forEach>
</div>
</div>
</div><!-- filter -->
<div class = "col-md-9 col-xs-9" style="border:1px solid"><!-- product list -->
<div class="col-md-12">
<c:set var="size" scope="page" value="${fn:length(productList)}"></c:set>
<c:forEach begin="0" step="3" end="${size}" varStatus="count">
<div class="row panel"><!-- rows will repeat according to the number of products -->
	<div class="col-md-4 col-xs-3" style="border:1px solid">
		<!-- <div class="pImage">Image</div> -->
		<div name="pBrand">${productList[count.index].pBrand}</div>
		<div name="pModel">${productList[count.index].pModel}</div>
		<div name="pPrice">${productList[count.index].pPrice}</div>
		<!-- <div class="pCompare" style="font-size:8pt">
			<input type="checkbox" class="pcompare" value=""> Add to compare
		</div> -->
		<div><a href="user/addToCart/${productList[count.index].pId}" class="btn btn-default">Add to Cart</a></div>
	</div>
	<!-- check the counter -->
	<c:if test="${count.index+1 <=  (size-1)}">
	<div class="col-md-4 col-xs-3" style="border:1px solid">
		<div name="pBrand">${productList[count.index+1].pBrand}</div>
		<div name="pModel">${productList[count.index+1].pModel}</div>
		<div name="pPrice">${productList[count.index+1].pPrice}</div>
		<div><a href="${pageContext.request.contextPath}/user/addToCart/${productList[count.index+1].pId}" class="btn btn-default">Add to Cart</a></div>
	</div>
	</c:if>
	<c:if test="${count.index+2 <=  (size-1)}">
	<div class="col-md-4 col-xs-3" style="border:1px solid">
		<div name="pBrand">${productList[count.index+2].pBrand}</div>
		<div name="pModel">${productList[count.index+2].pModel}</div>
		<div name="pPrice">${productList[count.index+2].pPrice}</div>
		<div><a href="${pageContext.request.contextPath}/addToCart/${productList[count.index+2].pId}" class="btn btn-default">Add to Cart</a></div>
	</div>
	</c:if>
</div>
</c:forEach>
</div><!-- column 12 for gapping -->
</div><!-- product list -->
</form>
</div>
</body>
</html>