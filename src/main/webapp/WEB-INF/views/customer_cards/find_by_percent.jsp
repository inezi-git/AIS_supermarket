<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
  <title>Find Customers by Card Percentage</title>
</head>
<body>
<div class="container">
<form method="post" action="${pageContext.request.contextPath}/customer_cards/find-by-percent">
  <select name="percent" id="percent" required>
    <c:forEach var="p" items="${percentages}">
      <option value="${p}" ${percent == p || param.percent == p ? 'selected' : ''}>${p}%</option>
    </c:forEach>
  </select>
  <input type="submit" value="Find" class="btn btn-primary">
</form>
<c:if test="${not empty errorMessage}">
  <h2>${errorMessage}</h2>
</c:if>
<c:if test="${not empty customers}">
  <table class="table table-striped">
    <thead>
    <tr>
      <th>Full Name</th>
      <th>Phone Number</th>
      <th>Address</th>
      <th>Card Percentage</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="customer" items="${customers}">
      <tr>
        <td>${customer.customerFullName}</td>
        <td>${customer.phoneNumber}</td>
        <td>${customer.customerAddress}</td>
        <td>${customer.percent}%</td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</c:if>
  <div>
    <a href="${pageContext.request.contextPath}/customer_cards" class="btn btn-secondary">Back to all customers</a>
  </div>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>