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
<form method="post" action="${pageContext.request.contextPath}/checks/find-by-check-number">
    <select name="checkNumber" id="checkNumber" required>
        <c:forEach var="checkNumber" items="${checkNumbers}">
            <c:set var="selectedCheckNumber" value="${requestScope.selectedCheckNumber}" />
            <option value="${checkNumber}" ${checkNumber == selectedCheckNumber
            || param.selectedCheckNumber == checkNumber ? 'selected' : ''}>${checkNumber}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Find" class="btn btn-primary">
</form>
<c:if test="${not empty errorMessage}">
    <h2>${errorMessage}</h2>
</c:if>
<c:if test="${not empty check}">
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
            <td>${check.customerCard.customerFullName} (${check.customerCard.percent}%)</td>
            <td><fmt:formatNumber value="${check.sumTotal}" pattern="#,##0.00"/></td>
            <td><a href="${pageContext.request.contextPath}/checks/get?checkNumber=${check.checkNumber}">Details</a></td>
        </tr>
        </tbody>
    </table>
</c:if>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>