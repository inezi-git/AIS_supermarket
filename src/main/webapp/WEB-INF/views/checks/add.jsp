<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Create Check</title>
</head>
<body>
<div class="container">
<form method="post" id="createCheckForm" action="${pageContext.request.contextPath}/checks/add">
    <div>
        <label for="card_number">Customer Card:</label>
        <select name="card_number" id="card_number">
            <c:forEach var="card" items="${customerCards}">
                <option value="${card.cardNumber}">
                        ${card.customerFullName} (${card.percent}%)
                </option>
            </c:forEach>
        </select>
    </div>
    <table class="table table-striped">
        <thead>
        <tr>
            <th>UPC</th>
            <th>Product</th>
            <th>Selling price</th>
            <th>Amount</th>
            <th>Amount For Sale</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="storeProduct" items="${storeProducts}">
            <tr>
                <td>
                    <c:out value="${storeProduct.upc}"/>
                    <input type="hidden" name="upc" value="${storeProduct.upc}">
                </td>
                <td>
                    <c:out value="${storeProduct.product}"/>
                </td>
                <td>
                    <fmt:formatNumber value="${storeProduct.price}" pattern="#.00"/>
                </td>
                <td>
                    <c:out value="${storeProduct.amount}"/>
                </td>
                <td>
                    <input type="number" name="amount" value="0" min="0" max="${storeProduct.amount}">
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <br>
    <input type="submit" value="Create Check" href="${pageContext.request.contextPath}/checks/today">
</form>
</div>
</body>
</html>

<%@include file="../footer.jsp"%>