<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<html>
<head>
    <title>Check Details</title>
</head>
<body>
<div class="container">
<table class="table table-striped">
    <thead>
    <tr>
        <th>Check Number</th>
        <th>Cashier</th>
        <th>Customer Card</th>
        <th>Print Date</th>
        <th>Sum Total</th>
        <th>VAT</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>${check.checkNumber}</td>
        <td>${check.employee.employeeFullName}</td>
        <td>${check.customerCard.customerFullName}</td>
        <td>${check.printDate}</td>
        <td><fmt:formatNumber value="${check.sumTotal}" pattern="#.00"/></td>
        <td><fmt:formatNumber value="${check.vat}" pattern="#.00"/></td>
    </tr>
    </tbody>
</table>
<br>
<h2>Purchased products</h2>
<table class="table table-striped">
    <thead>
    <tr>
        <th>UPC</th>
        <th>Name</th>
        <th>Amount</th>
        <th>Price</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="sale" items="${sales}">
        <c:if test="${sale.productNumber > 0}">
            <tr>
                <td>${sale.storeProduct.upc}</td>
                <td>${sale.storeProduct.product.name}</td>
                <td>${sale.productNumber}</td>
                <td><fmt:formatNumber value="${sale.sellingPrice}" pattern="#.00"/></td>
            </tr>
        </c:if>
    </c:forEach>
    </tbody>
</table>
    <div class="form-group">
        <a href="${pageContext.request.contextPath}/checks/today" class="btn btn-secondary">Back to all my checks today</a>
    </div>
</div>
</body>
</html>
<%@ include file="../footer.jsp"%>