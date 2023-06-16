<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Find Products by Category</title>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath}/products/find-by-category">
    <label for="category">Category:</label>
    <select name="category" id="category" required>
        <c:forEach var="category" items="${categories}">
            <option value="${category}" ${category == categoryName || param.category == category ? 'selected' : ''}>${category}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Find">
</form>
<c:if test="${not empty errorMessage}">
    <h2>${errorMessage}</h2>
</c:if>
<c:if test="${not empty products}">
    <h2>Results for Products in Category ${categoryName}:</h2>
    <table border="1">
        <thead>
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Producer</th>
            <th>Characteristics</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="product" items="${products}">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.producer}</td>
                <td>${product.characteristics}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
</body>
</html>
<%@include file="../header.jsp"%>