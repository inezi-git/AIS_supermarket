<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>All Employees</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/employees/add" class="btn btn-primary">Add new employee</a>
<table class="table table-striped">
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Role</th>
        <th>Salary</th>
        <th>Date of birth</th>
        <th>Date of start</th>
        <th>Phone number</th>
        <th>Address</th>
        <th>Email</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach var="cashier" items="${employees}">
        <tr>
            <td>
                <c:out value="${cashier.id}"/>
            </td>
            <td>
                <c:out value="${cashier.employeeFullName}"/>
            </td>
            <td>
                <c:out value="${cashier.employeeRole.name}"/>
            </td>
            <td>
                <fmt:formatNumber value="${cashier.salary}" pattern="#.00"/>
            </td>
            <td>
                <c:out value="${cashier.dateOfBirth}"/>
            </td>
            <td>
                <c:out value="${cashier.dateOfStart}"/>
            </td>
            <td>
                <c:out value="${cashier.phoneNumber}"/>
            </td>
            <td>
                <c:out value="${cashier.address}"/>
            </td>
            <td>
                <c:out value="${cashier.email}"/>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/employees/update?id=${cashier.id}"><i class="bi bi-pencil-fill"></i></a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/employees/delete?id=${cashier.id}"><i class="bi bi-trash"></i></a>
            </td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>

<%@include file="../footer.jsp"%>
