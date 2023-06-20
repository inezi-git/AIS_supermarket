<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
  <title>Category Statistics</title>
</head>
<body>
<div class="container">
<table class="table table-striped">
  <thead>
  <tr>
    <th>Category name</th>
    <th>Number of products</th>
    <th>Number of store products</th>
    <th>Min price</th>
    <th>Max price</th>
    <th>Average price</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="category" items="${categories}">
    <tr>
      <td>
        <c:out value="${category.key}"/>
      </td>
      <td>
        <c:out value="${category.value.total_products}"/>
      </td>
      <td>
        <c:out value="${category.value.total_store_products}"/>
      </td>
      <td>
        <fmt:formatNumber value="${category.value.min_price}" pattern="#.00"/>
      </td>
      <td>
        <fmt:formatNumber value="${category.value.max_price}" pattern="#.00"/>
      </td>
      <td>
        <fmt:formatNumber value="${category.value.avg_price}" pattern="#.00"/>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
  <div>
    <a href="${pageContext.request.contextPath}/categories" class="btn btn-secondary">Back to all categories</a>
  </div>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>