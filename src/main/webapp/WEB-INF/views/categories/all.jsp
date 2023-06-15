<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>

<html>
<head>
    <title>All Categories</title>
</head>
<body>
<table border="1">
    <tr>
        <th>Number</th>
        <th>Name</th>
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
                <a href="${pageContext.request.contextPath}/categories/update?categoryNumber=${category.categoryNumber}">UPDATE</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/categories/delete?categoryNumber=${category.categoryNumber}">DELETE</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

<%@include file="../footer.jsp"%>