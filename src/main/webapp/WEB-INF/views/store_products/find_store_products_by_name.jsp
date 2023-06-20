<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Store products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <c:if test="${empty storeProducts}">
        <h2>No store products found</h2>
    </c:if>
    <c:if test="${not empty storeProducts}">
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>UPC</th>
                    <th>UPC Promotional</th>
                    <th>Product</th>
                    <th>Selling price</th>
                    <th>Amount</th>
                    <th>Is Promotional</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="storeProduct" items="${storeProducts}">
                <tr>
                    <td>${storeProduct.upc}</td>
                    <td>${storeProduct.upcProm}</td>
                    <td>${storeProduct.product}</td>
                    <td><fmt:formatNumber value="${storeProduct.price}" pattern="#.00"/></td>
                    <td>${storeProduct.amount}</td>
                    <td>${storeProduct.isPromotional}</td>
                    <c:if test="${userRole eq 'Manager'}">
                        <td>
                            <a href="${pageContext.request.contextPath}/store_products/update?upc=${storeProduct.upc}"><i class="bi bi-pencil-fill"></i></a>
                        </td>
                        <td>
                            <a href="${pageContext.request.contextPath}/store_products/delete?upc=${storeProduct.upc}"><i class="bi bi-trash"></i></a>
                        </td>
                    </c:if>
                    <c:if test="${userRole eq 'Cashier'}">
                        <td>
                            <a href="${pageContext.request.contextPath}/store_products/update?upc=${storeProduct.upc}"><i class="bi bi-plus"></i></a>
                        </td>
                    </c:if>
                    </c:forEach>
                </tr>
            </tbody>
        </table>
    </c:if>
    <div class="form-group">
        <a href="${pageContext.request.contextPath}/store_products" class="btn btn-secondary">Back to all store products</a>
    </div>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>
