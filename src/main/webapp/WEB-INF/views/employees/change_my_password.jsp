<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
  <title>Change My Password</title>
</head>
<body>
<div class="container">
  <form method="post" id="employee" action="${pageContext.request.contextPath}/employees/about-me/change-my-password">
    <c:if test="${not empty param.message}">
      <div class="alert alert-danger">${param.message}</div>
    </c:if>
    <c:if test="${not empty message}">
      <div class="alert alert-danger">${message}</div>
    </c:if>
    <td>
      <input type="password" name="password" form="employee" required>
    </td>
    <div class="form-group">
      <input type="submit" name="update" form="employee" value="Update" class="btn btn-primary">
      <a href="${pageContext.request.contextPath}/employees/about/me" class="btn btn-secondary">Cancel</a>
    </div>
  </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>
