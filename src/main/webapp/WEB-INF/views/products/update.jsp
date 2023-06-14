<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>Update Product</title>
</head>
<body>
<form method="post" id="product" action="${pageContext.request.contextPath}/products/update"></form>
<h1>Update product:</h1>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Category</th>
        <th>Product Name</th>
        <th>Producer</th>
        <th>Characteristics</th>
    </tr>
    <tr>
        <td>
            <input type="number" name="id" form="product" value="${product.id}" readonly>
        </td>
        <td>
            <select name="category_number" form="product" required>
                <c:forEach var="category" items="${categories}">
                    <option value="${category}" ${category.categoryNumber == product.category.categoryNumber ? 'selected' : ''}>${category}</option>
                </c:forEach>
            </select>
        </td>
        <td>
            <input type="text" name="product_name" form="product" value="${product.name}">
        </td>
        <td>
            <input type="text" name="producer" form="product" value="${product.producer}">
        </td>
        <td>
            <input type="text" name="characteristics" form="product" value="${product.characteristics}">
        </td>
        <td>
            <input type="submit" name="update" form="product">
        </td>
    </tr>
</table>
<h5><a href="${pageContext.request.contextPath}/logout">Log out</a></h5>
</body>
</html>
