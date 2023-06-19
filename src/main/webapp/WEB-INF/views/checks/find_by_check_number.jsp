<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Find By Check Number</title>
</head>
<body>
<div class="container">
<c:if test="${empty check}">
    <h2>Check with this number is not found</h2>
</c:if>
<c:if test="${not empty check}">
    <h2>Check with number ${check.checkNumber} is found</h2>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Print Date</th>
            <th>Cashier</th>
            <th>Customer Card</th>
            <th>Sum Total</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${check.printDate}</td>
            <td>${check.employee.employeeFullName}</td>
            <td>${check.customerCard != null ? check.customerCard.customerFullName + ' (' + check.customerCard.percent + '%)' : ''}</td>
            <td><fmt:formatNumber value="${check.sumTotal}" pattern="#,##0.00"/></td>
            <td><a href="${pageContext.request.contextPath}/checks/get?checkNumber=${check.checkNumber}">Details</a></td>
        </tr>
        </tbody>
    </table>
</c:if>
    <div class="form-group">
        <a href="${pageContext.request.contextPath}/checks/today" class="btn btn-secondary">Back to all my checks</a>
    </div>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>