<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>ALl Checks by Date Range</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<div class="container">
    <div class="form-group">
        <a href="${pageContext.request.contextPath}/checks/find-all-by-cashier-and-period" class="btn btn-secondary">Find by cashier and period</a>
        <c:set var="userRole" value="${sessionScope.chosenEmployee.employeeRole.name}"/>
        <c:if test="${userRole eq 'Manager'}">
            <a href="${pageContext.request.contextPath}/report/checks" class="btn btn-info">Get report about checks</a>
        </c:if>
    </div>
    <h2>Find All Checks by Date Range</h2>
    <form method="post" action="${pageContext.request.contextPath}/checks/find-all-by-period">
        <label for="startDate">From:</label>
        <input class="form-control" type="date" id="startDate" name="startDate" value="${startDate.toLocalDate()}" required>
        <input class="form-control" type="time" id="startTime" name="startTime" value="${startDate.toLocalTime()}" required>
        <label for="endDate">To:</label>
        <input class="form-control" type="date" id="endDate" name="endDate" value="${endDate.toLocalDate()}" required>
        <input class="form-control" type="time" id="endTime" name="endTime" value="${endDate.toLocalTime()}" required>
        <input type="submit" value="Find" class="btn btn-primary">
    </form>
    <c:if test="${empty checks}">
        <h2>No checks were found on this period</h2>
    </c:if>
    <c:if test="${not empty checks}">
        <h2>Checks found:</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Print Date</th>
                    <th>Cashier</th>
                    <th>Customer Card</th>
                    <th>Sum Total</th>
                    <th>Details</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="check" items="${checks}">
                    <tr>
                        <td>${check.printDate}</td>
                        <td>${check.employee.employeeFullName}</td>
                        <td>${check.customerCard.customerFullName} (${check.customerCard.percent}%)</td>
                        <td><fmt:formatNumber value="${check.sumTotal}" pattern="#,##0.00"/></td>
                        <td><a href="${pageContext.request.contextPath}/checks/get?checkNumber=${check.checkNumber}"><i class="bi bi-three-dots"></i></a></td>
                        <c:if test="${userRole eq 'Manager'}">
                            <td>
                                <a href="${pageContext.request.contextPath}/checks/delete?id=${product.id}"><i class="bi bi-trash"></i></a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <c:set var="totalSum" value="0" />
        <c:forEach var="check" items="${checks}">
            <c:set var="totalSum" value="${totalSum + check.sumTotal}" />
        </c:forEach>
        <h4>Total Sum: <fmt:formatNumber value="${totalSum}" pattern="#,##0.00"/></h4>
    </c:if>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>