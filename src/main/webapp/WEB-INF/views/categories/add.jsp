<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>Add Category</title>
</head>
<body>
<form method="post" id="category" action="${pageContext.request.contextPath}/categories/add"></form>
<h1>Add category:</h1>
<table border="1">
    <tr>
        <th>Category Name</th>
    </tr>
    <tr>
        <td>
            <input type="text" name="category_name" form="category" required>
        </td>
        <td>
            <input type="submit" name="add" form="category">
        </td>
    </tr>
</table>
<h5><a href="${pageContext.request.contextPath}/logout">Log out</a></h5>
</body>
</html>
