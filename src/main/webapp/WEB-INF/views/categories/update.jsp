<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>Update Category</title>
</head>
<body>
<form method="post" id="employee" action="${pageContext.request.contextPath}/categories/update"></form>
<h1>Update category:</h1>
<table border="1">
    <tr>
        <th>Number</th>
        <th>Name</th>
    </tr>
    <tr>
        <td>
            <input type="number" name="category_number" form="employee" value="${category.categoryNumber}" readonly>
        </td>
        <td>
            <input type="text" name="category_name" form="employee" value="${category.categoryName}" required>
        </td>
        <td>
            <input type="submit" name="update" form="employee">
        </td>
    </tr>
</table>
<h5><a href="${pageContext.request.contextPath}/logout">Log out</a></h5>
</body>
</html>
