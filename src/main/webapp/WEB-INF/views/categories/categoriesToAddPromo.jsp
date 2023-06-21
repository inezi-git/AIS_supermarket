<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>CategoriesToAddPromo</title>
</head>
<body>
<div class="container">
    <div class="btn-group" role="group">
        <c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}"/>
        <c:if test="${userRole eq 'Manager'}">
            <a href="${pageContext.request.contextPath}/categories/add" class="btn btn-primary">Add new category</a>
            <a href="${pageContext.request.contextPath}/categories/statistics" class="btn btn-secondary">Statistics</a>
            <a href="${pageContext.request.contextPath}/report/categories" class="btn btn-info">Get report about categories</a>
            <a href="${pageContext.request.contextPath}/categories/categoriesToAddPromo" class="btn btn-secondary">Find categories to add promotional items</a>
        </c:if>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Category number</th>
            <th>Category name</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="category" items="${categories}">
            <tr>
                <td>
                    <c:out value="${category.categoryNumber}"/>
                </td>
                <td>
                    <c:out value="${category.categoryName}"/>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>

<%@include file="../footer.jsp"%>