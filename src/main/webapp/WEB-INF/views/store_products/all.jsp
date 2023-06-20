<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>All Store Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <div class="btn-group" role="group">
        <c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}"/>
        <c:if test="${userRole eq 'Manager'}">
            <a href="${pageContext.request.contextPath}/store_products/add" class="btn btn-primary">Add new store product</a>
        </c:if>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">All store products</button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/store_products/promotional">Promotional</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/store_products/non-promotional">Non-promotional</a></li>
            </ul>
        </div>

        <form method="get" action="${pageContext.request.contextPath}/store_products/find-by-upc">
            <div class="d-flex justify-content-between">
                <input class="form-control" type="text" id="upc" placeholder="UPC" name="upc" value="${param.upc}" required>
                <input type="submit" value="Find" class="btn btn-primary">
            </div>
        </form>
        <form method="get" action="${pageContext.request.contextPath}/products/find-store-product-by-name">
            <div class="d-flex justify-content-between">
                <input class="form-control" type="text" placeholder="Store product name" id="name" name="name" value="${param.upc}" required>
                <input type="submit" value="Find" class="btn btn-primary">
            </div>
        </form>
        <c:if test="${userRole eq 'Manager'}">
            <a href="${pageContext.request.contextPath}/report/store_products" class="btn btn-info">Get report about store products</a>
        </c:if>

    </div>
<table class="table table-striped">
    <c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}" />
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
                <td>
                    <c:out value="${storeProduct.upc}"/>
                </td>
                <td>
                    <c:out value="${storeProduct.upcProm}"/>
                </td>
                <td>
                    <c:out value="${storeProduct.product}"/>
                </td>
                <td>
                    <fmt:formatNumber value="${storeProduct.price}" pattern="#.00"/>
                </td>
                <td>
                    <c:out value="${storeProduct.amount}"/>
                </td>
                <td>
                    <c:out value="${storeProduct.isPromotional}"/>
                </td>
                <c:if test="${userRole eq 'Manager'}">
                    <td>
                        <a href="${pageContext.request.contextPath}/store_products/update?upc=${storeProduct.upc}"><i class="bi bi-pencil-fill"></i></a>
                    </td>
                    <td>
                        <a href="${pageContext.request.contextPath}/store_products/delete?upc=${storeProduct.upc}"><i class="bi bi-trash"></i></a>
                    </td>
                </c:if>
            </tr>
        </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>
