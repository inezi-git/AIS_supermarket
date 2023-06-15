<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<th>Product</th>
<th>Selling Price</th>
<th>Amount</th>
<th>Is Promotional</th>

<html>
<head>
    <title>Add Store Product</title>
</head>
<body>
<div class="container">
    <h1>Add new store product</h1>
    <form method="post" id="store_product" action="${pageContext.request.contextPath}/store_products/add"></form>
    <div class="form-group">
        <label for="id_product">Category</label>
        <select name="id_product" id="id_product" class="form-control" form="store_product" required>
            <c:forEach var="product" items="${products}">
                <option value="${product.id}">${product.id} ${product.name}</option>
            </c:forEach>
        </select>
    </div>
    <div class="form-group">
        <label for="selling_price">Selling price</label>
        <input type="number" name="selling_price" id="selling_price" class="form-control" form="store_product" required>
    </div>
    <div class="form-group">
        <label for="products_number">Amount</label>
        <input type="number" name="products_number" id="products_number" class="form-control" form="store_product" required>
    </div>
    <div class="form-group">
        <label for="promotional_product">Is Promotional</label>
        <select name="promotional_product" id="promotional_product" form="store_product" required>
            <option value="true">Yes</option>
            <option value="false">No</option>
        </select>
    </div>
    <div class="form-group">
        <input type="submit" name="add" form="store_product" class="btn btn-primary" value="Save">
        <a href="${pageContext.request.contextPath}/store_products" class="btn btn-secondary">Cancel</a>
    </div>
    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>

