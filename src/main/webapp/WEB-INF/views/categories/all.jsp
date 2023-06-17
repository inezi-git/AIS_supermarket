<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>

<html>
<head>
    <title>All Categories</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <div class="btn-group" role="group">
        <c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}"/>
        <c:if test="${userRole eq 'Manager'}">
            <div>
                <a href="${pageContext.request.contextPath}/categories/add" class="btn btn-primary">Add new category</a>
            </div>
            <a href="${pageContext.request.contextPath}/report/categories" class="btn btn-info">Get report about categories</a>
        </c:if>
    </div>
    <table class="table table-striped">
    <tr>
        <th>Number</th>
        <th>Name</th>
        <th></th>
        <th></th>

    </tr>
    <c:forEach var="category" items="${categories}">
        <tr>
            <td>
                <c:out value="${category.categoryNumber}"/>
            </td>
            <td>
                <c:out value="${category.categoryName}"/>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/categories/update?categoryNumber=${category.categoryNumber}"><i class="bi bi-pencil-fill"></i></a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/categories/delete?categoryNumber=${category.categoryNumber}"><i class="bi bi-trash"></i></a>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>

<%@include file="../footer.jsp"%>