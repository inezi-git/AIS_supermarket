<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Add Category</title>
</head>
<body>
<div class="container">
    <h1>Add new category</h1>
    <form method="post" id="category" action="${pageContext.request.contextPath}/categories/add">
        <div class="form-group">
            <label for="category_name">Category name</label>
            <input type="text" name="category_name" id="category_name" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" name="add" form="category" class="btn btn-primary" value="Save">
            <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>

