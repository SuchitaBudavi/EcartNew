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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/angular.js"></script>
</head>
<script>
	function updateSupplier(supplierId, supplierName){
		document.getElementById("updateSupplierId").value = supplierId;
		document.getElementById("updateSupplierName").value = supplierName;
	}
</script>
<body>
<%@ include file="adminHeader.jsp"%>
<div class="container">
<!-- Product table -->
<table class="table table-bordered">
<thead>
<tr>
	<th>Category</th>
	<th>Product Id</th>
	<th>Brand</th>
	<th>Model</th>
	<th>Price</th>
	<th>Quantity</th>
	<th>Supplier</th>
</tr>
</thead>
<tbody>
<tr>
	<th>${product.category_FK.cName}</th>
	<th>${product.pId}</th>
	<th>${product.pBrand}</th>
	<th>${product.pModel}</th>
	<th>${product.pPrice}</th>
	<th>${product.pQty}</th>
	<th>${product.supplier_FK.sName}</th>
</tr>
</tbody>
</table>
<!-- Feature table -->
<form:form action="${action}">
<table class="table table-bordered table-hover">
<tbody>
<tr><td>Color</td><td>${mobileCoverFeature.color}</td></tr>
<tr><td>Material</td><td>${mobileCoverFeature.material}</td></tr>
<tr><td>Case Type</td><td>${mobileCoverFeature.caseType}</td></tr>
<tr><td>Mobile Brand</td><td>${mobileCoverFeature.mobileBrand}</td></tr>
<tr><td>Mobile Model</td><td>${mobileCoverFeature.mobileModel}</td></tr>
<tr><td>Plain/Designed</td><td>${mobileCoverFeature.plainOrDesigned}</td></tr>
</tbody>
<tfoot>
<tr><td></td><td><a class="btn btn-default" href="<c:url value='/mobileCoverFeatureEdit/${product.category_FK.cId}/${product.pId}'/>">Edit Features</a></td></tr>
</tfoot>
</table>
<!-- Suppliers table -->
<table class="table table-bordered table-hover">
<thead>
<tr>
	<th>Supplier Id</th>
	<th>Name</th>
	<th>Product Price</th>
	<th>Product Quantity</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
</thead>
<tbody>
<c:forEach items="${multiSupplierList}" var="supplier" varStatus="count">
<tr>
	<td>${supplier.multiSupplierId.supplier_FK.sId}</td>
	<td>${supplier.multiSupplierId.supplier_FK.sName}</td> 
	<td>${supplier.pPrice}</td>
	<td>${supplier.pQty}</td>
	<td><input class="btn btn-default" type="button" value="Edit" onclick="updateSupplier(${supplier.multiSupplierId.supplier_FK.sId}, '${supplier.multiSupplierId.supplier_FK.sName}')" data-toggle="modal" data-target="#updateSupplierModal"></td>
	<td><a class="btn btn-default" href="${pageContext.request.contextPath}/deleteMultiSupplier/${mobileCoverFeature.mobileCoverFeatureId.category_FK.cId}/${mobileCoverFeature.mobileCoverFeatureId.product_FK.pId}/${supplier.multiSupplierId.supplier_FK.sId}">Delete</a></td>
</tr>
</c:forEach>
</tbody>
<tfoot>
<tr><td></td><td></td><td></td><td></td><td></td>
<td><input class="btn btn-default" data-toggle="modal" data-target="#addSupplierModal" type="button" value="Add Supplier"></td>
</tr>
</tfoot>
</table>
</form:form>
</div> <!-- container -->

<!-- Modal -->
<div id="addSupplierModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<c:url var="supplierAction" value="/addMultiSupplier/${mobileCoverFeature.mobileCoverFeatureId.category_FK.cId}/${mobileCoverFeature.mobileCoverFeatureId.product_FK.pId}"/>
<form action="${supplierAction}">
	<div class="modal-header">
	<b>Add Supplier</b>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	</div>
	<div class="modal-body">
	<table style="border-collapse: separate; border-spacing: 8px 10px;">
	<tr><td>Select Supplier:</td><td><form:select path="supplier.sId" items="${supplierList}" itemValue="sId" itemLabel="sName"></form:select></td></tr>
	<tr><td>Product Price:</td><td><input type="text" name="pPrice" value="0"></td></tr>
	<tr><td>Product Quantity:</td><td><input type="text" name="pQty" value="0"></td></tr>
	</table>
	</div>
	<div class="modal-footer">
	<button type="button" data-dismiss="modal">Cancel</button>
	<button type="submit">Add Supplier</button>
	</div>
</form>
</div>
</div>
</div>
<!-- Update price/quantity Modal -->
<div id="updateSupplierModal" class="modal fade" role="dialog">
<div class="modal-dialog">
<div class="modal-content">
<c:url var="supplierAction" value="/updateMultiSupplier/${mobileCoverFeature.mobileCoverFeatureId.category_FK.cId}/${mobileCoverFeature.mobileCoverFeatureId.product_FK.pId}"/>
<form method="post" action="${supplierAction}">
	<div class="modal-header">
	<b>Update Supplier</b>
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	</div>
	<div class="modal-body">
	<table style="border-collapse: separate; border-spacing: 8px 10px;">
	<tr><td>Supplier Id:</td><td><input id="updateSupplierId" type="number" name="sId" value="0" readonly/></td></tr>
	<tr><td>Supplier Name:</td><td><input id="updateSupplierName" type="text" name="sName" value="0" readonly/></td></tr>
	<tr><td>Product Price:</td><td><input type="text" name="pPrice"></td></tr>
	<tr><td>Product Quantity:</td><td><input type="text" name="pQty"></td></tr>
	</table>
	</div>
	<div class="modal-footer">
	<button type="button" data-dismiss="modal">Cancel</button>
	<button type="submit">Update Supplier</button>
	</div>
</form>
</div>
</div>
</div>
</body>
</html>