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
<h1>Find Store Product by UPC</h1>
<form method="post" action="${pageContext.request.contextPath}/store_products/find-by-upc">
    <select name="upc" id="upc" required>
        <c:forEach var="upc" items="${upcs}">
            <c:set var="selectedUpc" value="${requestScope.selectedUpc}" />
            <option value="${upc}" ${upc == selectedUpc || param.selectedUpc == upc ? 'selected' : ''}>${upc}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Find" class="btn btn-primary">
</form>
<c:if test="${not empty errorMessage}">
    <h2>${errorMessage}</h2>
</c:if>
<c:if test="${not empty product}">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Product Name</th>
            <th>Price</th>
            <th>Amount</th>
            <c:if test="${product.containsKey('characteristics')}">
                <th>Characteristics</th>
            </c:if>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${product.product_name}</td>
            <td><fmt:formatNumber value="${product.selling_price}" pattern="#.00"/></td>
            <td>${product.products_number}</td>
            <c:if test="${product.containsKey('characteristics')}">
                <td>${product.characteristics}</td>
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