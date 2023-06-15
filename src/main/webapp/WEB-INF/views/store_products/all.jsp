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
    <a href="${pageContext.request.contextPath}/store_products/add" class="btn btn-primary">Add new store product</a>
<table class="table table-striped">
    <c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}" />
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
</table>
</div>
</body>
</html>

<%@include file="../footer.jsp"%>
