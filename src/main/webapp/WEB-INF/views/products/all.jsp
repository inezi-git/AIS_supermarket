<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>All Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <div class="btn-group" role="group">
        <div>
            <a href="${pageContext.request.contextPath}/products/add" class="btn btn-primary">Add new product</a>
        </div>
        <div>
            <a href="${pageContext.request.contextPath}/products/find-by-category" class="btn btn-primary">Find by category</a>
        </div>
        <form method="get" action="${pageContext.request.contextPath}/products/find-by-name">
            <div class="d-flex justify-content-between">
                <input class="form-control" type="text" placeholder="Product name" id="name" name="name" value="${param.name}" required>
                <input type="submit" value="Find">
            </div>
        </form>

    </div>

<table class="table table-striped">
<c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}" />
    <tr>
        <th>ID</th>
        <th>Category</th>
        <th>Name</th>
        <th>Producer</th>
        <th>Characteristics</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach var="product" items="${products}">
        <tr>
            <td>
                <c:out value="${product.id}"/>
            </td>
            <td>
                <c:out value="${product.category}"/>
            </td>
            <td>
                <c:out value="${product.name}"/>
            </td>
            <td>
                <c:out value="${product.producer}"/>
            </td>
            <td>
                <c:out value="${product.characteristics}"/>
            </td>
            <c:if test="${userRole eq 'Manager'}">
            <td>
                <a href="${pageContext.request.contextPath}/products/update?id=${product.id}"><i class="bi bi-pencil-fill"></i></a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/products/delete?id=${product.id}"><i class="bi bi-trash"></i></a>
            </td>
            </c:if>
        </tr>
    </c:forEach>
</table>
</div>

</body>
</html>

<%@include file="../footer.jsp"%>
