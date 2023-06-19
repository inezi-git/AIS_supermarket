<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Find Store Product by UPC</title>
</head>
<body>
<div class="container">
    <c:if test="${empty storeProducts}">
        <h2>No store products with upc ${upc} were found</h2>
    </c:if>
    <c:if test="${not empty storeProducts}">
        <h2>Store product with upc ${upc} has been found</h2>
        <table class="table table-striped">
            <thead>
            <tr>
                <th>Product Name</th>
                <th>Price</th>
                <th>Amount</th>
                <c:if test="${userRole eq 'Manager'}">
                    <th>Producer</th>
                    <th>Characteristics</th>
                </c:if>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>${storeProducts.product_name}</td>
                <td><fmt:formatNumber value="${storeProducts.selling_price}" pattern="#.00"/></td>
                <td>${storeProducts.products_number}</td>
                <c:if test="${userRole eq 'Manager'}">
                    <td>${storeProducts.producer}</td>
                    <td>${storeProducts.characteristics}</td>
                </c:if>
            </tr>
            </tbody>
        </table>
    </c:if>
    <div>
        <a href="${pageContext.request.contextPath}/store_products" class="btn btn-secondary">Back to all store products</a>
    </div>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>