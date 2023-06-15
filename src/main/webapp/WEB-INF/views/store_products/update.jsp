<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<html>
<head>
    <title>Update Store Product</title>
</head>
<body>
<div class="container">
    <h1>Update store product:</h1>
    <form method="post" id="store_product" action="${pageContext.request.contextPath}/store_products/update">
        <div class="form-group">
            <label for="UPC">UPC</label>
            <input type="text" name="UPC" id="UPC" class="form-control" value="${storeProduct.upc}" readonly>
        </div>
        <div class="form-group">
            <label for="UPC_prom">UPC Promotional</label>
            <input type="text" name="UPC_prom" id="UPC_prom" class="form-control" value="${storeProduct.upcProm}" readonly>
        </div>
        <div class="form-group">
            <label for="id_product">Product</label>
            <select name="id_product" id="id_product" class="form-control" required>
                <c:forEach var="product" items="${products}">
                    <option value="${product.id}" ${product.id == storeProduct.product.id ? 'selected' : ''}>${product.name}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="selling_price">Selling Price</label>
            <input type="text" name="selling_price" id="selling_price" class="form-control" value="<fmt:formatNumber value='${storeProduct.price}' pattern='#.00' currencySymbol='.'/>"
                   required pattern="^\d+(\.\d{2})?$" title="Please enter a valid value in the format #.00">
        </div>
        <div class="form-group">
            <label for="products_number">Amount</label>
            <input type="number" name="products_number" id="products_number" class="form-control" value="${storeProduct.amount}" required>
        </div>
        <div class="form-group">
            <label for="promotional_product">Is Promotional</label>
            <select name="promotional_product" id="promotional_product" class="form-control" required>
                <option value="true" ${storeProduct.isPromotional ? 'selected' : ''}>Yes</option>
                <option value="false" ${!storeProduct.isPromotional ? 'selected' : ''}>No</option>
            </select>
        </div>
        <div class="form-group">
            <input type="submit" name="update" form="store_product" value="Update" class="btn btn-primary">
            <a href="${pageContext.request.contextPath}/store_products" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>