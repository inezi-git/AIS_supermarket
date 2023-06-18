<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ include file="../header.jsp"%>
<html>
<head>
  <title>About me</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<div class="container">
    <c:if test="${not empty currentCashier}">
      <table class="table table-striped">
    <tr>
      <th>Employee ID</th>
      <th>Full Name</th>
      <th>Salary</th>
      <th>Date of Birth</th>
      <th>Date of Start</th>
      <th>Phone Number</th>
      <th>Address</th>
      <th>Email</th>
    </tr>
    <tbody>
    <tr>
      <td>${currentCashier.id}</td>
      <td>${currentCashier.employeeFullName}</td>
      <td><fmt:formatNumber value="${currentCashier.salary}" pattern="#.00"/></td>
      <td>${currentCashier.dateOfBirth}</td>
      <td>${currentCashier.dateOfStart}</td>
      <td>${currentCashier.phoneNumber}</td>
      <td>${currentCashier.address}</td>
      <td>${currentCashier.email}</td>
    </tr>
    </tbody>
  </table>
</c:if>
    <div>
        <a href="${pageContext.request.contextPath}/employees/about-me/change-password" class="btn btn-secondary">Change my password</a>
    </div>
  </div>
</body>
</html>
<%@ include file="../footer.jsp"%>