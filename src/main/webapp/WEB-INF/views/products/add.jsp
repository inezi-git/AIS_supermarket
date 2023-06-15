<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Add Product</title>
</head>
<body>
<div class="container">
    <h1>Add new product</h1>
    <form method="post" id="product" action="${pageContext.request.contextPath}/products/add">
        <div class="form-group">
            <label for="category_number">Category</label>
            <select name="category_number" id="category_number" class="form-control" form="product" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category.categoryNumber}">${category.categoryNumber} ${category.categoryName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="product_name">Product name</label>
            <input type="text" name="product_name" id="product_name" class="form-control" form="product" required>
        </div>
        <div class="form-group">
            <label for="producer">Producer</label>
            <input type="text" name="producer" id="producer" class="form-control" form="product" required>
        </div>
        <div class="form-group">
            <label for="characteristics">Characteristics</label>
            <input type="text" name="characteristics" id="characteristics" class="form-control" form="product" required>
        </div>
        <div class="form-group">
            <input type="submit" name="add" form="product" class="btn btn-primary" value="Save">
            <a href="${pageContext.request.contextPath}/products" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>

