<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
    <title>My Checks By Date Range</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
<form method="post" action="${pageContext.request.contextPath}/checks/find-all-mine-by-period">
    <label for="startDate">Start Date:</label>
    <input type="date" id="startDate" name="startDate" value="${startDate.toLocalDate()}" required>
    <input type="time" id="startTime" name="startTime" value="${startDate.toLocalTime()}" required>
    <br><br>
    <label for="endDate">End Date:</label>
    <input type="date" id="endDate" name="endDate" value="${endDate.toLocalDate()}" required>
    <input type="time" id="endTime" name="endTime" value="${endDate.toLocalTime()}" required>
    <br><br>
    <input type="submit" value="Find" class="btn btn-primary">
</form>
<c:if test="${empty checks}">
    <h2>No checks created by me were found on this period</h2>
</c:if>
<c:if test="${not empty checks}">
    <table class="table table-striped">
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
                <td>${check.customerCard != null ? check.customerCard.customerFullName + ' (' + check.customerCard.percent + '%)' : ''}</td>
                <td><fmt:formatNumber value="${check.sumTotal}" pattern="#,##0.00"/></td>
                <td><a href="${pageContext.request.contextPath}/checks/get?checkNumber=${check.checkNumber}"><i class="bi bi-three-dots"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>
<div class="form-group">
    <a href="${pageContext.request.contextPath}/checks/find-by-check-number" class="btn btn-secondary">Find by check number</a>
</div>
<div class="form-group">
    <a href="${pageContext.request.contextPath}/checks/today" class="btn btn-secondary">Back to all my checks today</a>
</div>
</div>
</body>
</html>
<%@ include file="../footer.jsp"%>
