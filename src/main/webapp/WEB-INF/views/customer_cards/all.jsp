<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@include file="../header.jsp"%>
<html>
<head>
    <title>All customer cards</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/customer_cards/add" class="btn btn-primary">Add new customer card</a>
<table class="table table-striped">
    <c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}"/>
    <tr>
        <th>ID</th>
        <th>Full Name</th>
        <th>Phone number</th>
        <th>Address</th>
        <th>Percent</th>
        <th></th>
        <th></th>
    </tr>
    <c:forEach var="cashier" items="${customer_cards}">
        <tr>
            <td>
                <c:out value="${cashier.cardNumber}"/>
            </td>
            <td>
                <c:out value="${cashier.customerFullName}"/>
            </td>
            <td>
                <c:out value="${cashier.phoneNumber}"/>
            </td>
            <td>
                <c:out value="${cashier.customerAddress}"/>
            </td>
            <td>
                <c:out value="${cashier.percent}"/>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/customer_cards/update?cardNumber=${cashier.cardNumber}"><i class="bi bi-pencil-fill"></i></a>
            </td>
            <c:if test="${userRole eq 'Manager'}">
            <td>
                <a href="${pageContext.request.contextPath}/customer_cards/delete?cardNumber=${cashier.cardNumber}"><i class="bi bi-trash"></i></a>
            </td>
            </c:if>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>

<%@include file="../footer.jsp"%>