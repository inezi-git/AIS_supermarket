<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
  <title>Customer Cards</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
<c:if test="${empty customerCards}">
  <h2>No customer cards found</h2>
</c:if>
<c:if test="${not empty customerCards}">
  <table class="table table-striped">
    <tr>
      <th>Card Number</th>
      <th>Full Name</th>
      <th>Phone Number</th>
      <th>Address</th>
      <th>Discount Percent</th>
      <th></th>
      <th></th>
    </tr>
    <tbody>
    <c:forEach var="customerCard" items="${customerCards}">
      <tr>
        <td>${customerCard.cardNumber}</td>
        <td>${customerCard.customerFullName}</td>
        <td>${customerCard.phoneNumber}</td>
        <td>${customerCard.customerAddress}</td>
        <td>${customerCard.percent}%</td>

        <c:if test="${userRole eq 'Manager'}">
        <td>
          <a href="${pageContext.request.contextPath}/products/update?id=${product.id}"><i class="bi bi-pencil-fill"></i></a>
        </td>
        <td>
          <a href="${pageContext.request.contextPath}/products/delete?id=${product.id}"><i class="bi bi-trash"></i></a>
        </td>
        </c:if>
    </c:forEach>
      </tr>
    </tbody>
  </table>
  <div class="form-group">
    <a href="${pageContext.request.contextPath}/customer_cards" class="btn btn-secondary">Back to all customer cards</a>
  </div>
</c:if>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>