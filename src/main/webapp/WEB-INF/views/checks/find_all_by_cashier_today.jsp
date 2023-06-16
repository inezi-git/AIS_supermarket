<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Checks</title>
</head>
<body>
<c:if test="${userRole eq 'Cashier'}">
    <div class="container">
        <tr><td><a href="${pageContext.request.contextPath}/checks/add">Sell Store Products</a></td></tr>
    </div>
</c:if>

<c:if test="${empty checks}">
    <h2>No checks found today</h2>
</c:if>
<c:if test="${not empty checks}">

    <table border="1">
        <thead>
        <tr>
            <th>Print Date</th>
            <th>Customer Card</th>
            <th>Sum Total</th>
            <th>Details</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="check" items="${checks}">
            <tr>
                <td>${check.printDate}</td>
                <td>${check.customerCard.customerFullName} (${check.customerCard.percent}%)</td>
                <td><fmt:formatNumber value="${check.sumTotal}" pattern="#,##0.00"/></td>
                <td><a href="${pageContext.request.contextPath}/checks/get?checkNumber=${check.checkNumber}">Details</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}" />
<c:if test="${userRole eq 'Manager'}">
    <tr><td><a href="${pageContext.request.contextPath}/report/checks">Get report about checks</a></td></tr>
</c:if>
</body>
</html>
<%@include file="../footer.jsp"%>
