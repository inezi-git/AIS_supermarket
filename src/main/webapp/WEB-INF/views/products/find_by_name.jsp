<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
<c:if test="${empty products}">
    <h2>No products found</h2>
</c:if>
<c:if test="${not empty products}">
    <table class="table table-striped">
        <tr>
            <th>ID</th>
            <th>Category</th>
            <th>Name</th>
            <th>Producer</th>
            <th>Characteristics</th>
            <th></th>
            <th></th>
        </tr>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td>${product.category.categoryName}</td>
                <td>${product.name}</td>
                <td>${product.producer}</td>
                <td>${product.characteristics}</td>

            <c:if test="${userRole eq 'Manager'}">
                <td>
                    <a href="${pageContext.request.contextPath}/products/update?id=${product.id}"><i class="bi bi-pencil-fill"></i></a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/products/delete?id=${product.id}"><i class="bi bi-trash"></i></a>
                </td>
            </c:if>
        </c:forEach>
            </tr>
        </tbody>
    </table>
    <div class="form-group">
        <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Back to all products</a>
    </div>
</c:if>
</div>
</body>
</html>

<%@include file="../footer.jsp"%>
