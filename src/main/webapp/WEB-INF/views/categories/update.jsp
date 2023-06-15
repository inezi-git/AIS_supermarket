<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<html>
<head>
    <title>Update Category</title>
</head>
<body>
<div class="container">
    <h1>Update category:</h1>
    <form method="post" id="category" action="${pageContext.request.contextPath}/categories/update">
        <div class="form-group">
            <label for="category_number">Number</label>
            <input type="number" name="category_number" id="category_number" class="form-control" value="${category.categoryNumber}" readonly>
        </div>
        <div class="form-group">
            <label for="category_name">Name</label>
            <input type="text" name="category_name" id="category_name" class="form-control" value="${category.categoryName}" required>
        </div>
        <div class="form-group">
            <input type="submit" name="update" form="category" value="Update" class="btn btn-primary">
            <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>