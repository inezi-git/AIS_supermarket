<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>Update Category</title>
</head>
<body>
<form method="put" id="category" action="${pageContext.request.contextPath}/category/update"></form>
<h1>Update category:</h1>
<table border="1">
    <tr>
        <th>Category name</th>
    </tr>
    <tr>
        <td>
            <input type="text" name="category_name" form="category" value="${category.categoryName}" required>
        </td>
    </tr>
</table>
<h5><a href="${pageContext.request.contextPath}/logout">Log out</a></h5>
</body>
</html>
