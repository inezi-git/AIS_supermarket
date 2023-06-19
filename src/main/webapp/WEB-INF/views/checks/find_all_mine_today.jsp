<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Checks</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
<c:if test="${userRole eq 'Cashier'}">
    <div class="btn-group" role="group">
        <a href="${pageContext.request.contextPath}/checks/add" class="btn btn-primary">Add new check</a>
        <a href="${pageContext.request.contextPath}/checks/find-all-mine-by-period" class="btn btn-secondary">Find by period</a>
        <form method="get" action="${pageContext.request.contextPath}/checks/find-by-check-number">
            <div class="d-flex justify-content-between">
                <input type="text" id="checkNumber" placeholder="Check number" name="checkNumber" value="${param.checkNumber}" required>
                <input type="submit" value="Find" class="btn btn-primary">
            </div>
        </form>
    </div>
</c:if>
<c:if test="${empty checks}">
    <h2>No checks created by this cashier were found today</h2>
</c:if>
<c:if test="${not empty checks}">
    <h2>Checks created by me today</h2>
    <table class="table table-striped">
        <tr>
            <th>Check number</th>
            <th>Print date</th>
            <th>Customer card</th>
            <th>Sum total</th>
            <th>Details</th>
        </tr>

        <tbody>
        <c:forEach var="check" items="${checks}">
            <tr>
                <td>${check.checkNumber}</td>
                <td>${check.printDate}</td>
                <td>${check.customerCard != null ? check.customerCard.customerFullName + ' (' + check.customerCard.percent + '%)' : ''}</td>
                <td><fmt:formatNumber value="${check.sumTotal}" pattern="#,##0.00"/></td>
                <td><a href="${pageContext.request.contextPath}/checks/get?checkNumber=${check.checkNumber}"><i class="bi bi-three-dots"></i></a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</c:if>

<c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}" />
<c:if test="${userRole eq 'Manager'}">
    <tr><td><a href="${pageContext.request.contextPath}/report/checks">Get report about checks</a></td></tr>
</c:if>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>
