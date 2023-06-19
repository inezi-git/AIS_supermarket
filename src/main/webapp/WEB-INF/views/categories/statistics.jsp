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
    <th>Min price</th>
    <th>Max price</th>
    <th>Average price</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="category" items="${categories}">
    <tr>
      <td>
        <c:out value="${category.category_name}"/>
      </td>
      <td>
        <c:out value="${category.productData.totalProducts}"/>
      </td>
      <td>
        <fmt:formatNumber value="${category.productData.minPrice}" pattern="#.00"/>
      </td>
      <td>
        <fmt:formatNumber value="${category.productData.maxPrice}" pattern="#.00"/>
      </td>
      <td>
        <fmt:formatNumber value="${category.productData.avgPrice}" pattern="#.00"/>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>
</div>
</body>
</html>
<%@include file="../header.jsp"%>