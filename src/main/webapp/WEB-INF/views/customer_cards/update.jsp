<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>

<html>
<head>
    <title>Update Customer Card</title>
</head>
<body>
<div class="container">
    <h1>Update customer card:</h1>
    <form method="post" id="customer_card" action="${pageContext.request.contextPath}/customer_cards/update">
        <c:if test="${not empty param.message}">
            <div class="alert alert-danger">${param.message}</div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="alert alert-danger">${message}</div>
        </c:if>
        <div class="form-group">
            <label for="card_number">ID</label>
            <input type="text" name="card_number" id="card_number" class="form-control" value="${customerCard.cardNumber}" readonly>
        </div>
        <div class="form-group">
            <label for="cust_surname">Surname</label>
            <input type="text" name="cust_surname" id="cust_surname" class="form-control" value="${customerCard.customerFullName.surname}" required>
        </div>
        <div class="form-group">
            <label for="cust_name">Name</label>
            <input type="text" name="cust_name" id="cust_name" class="form-control" value="${customerCard.customerFullName.name}" required>
        </div>
        <div class="form-group">
            <label for="cust_patronymic">Patronymic</label>
            <input type="text" name="cust_patronymic" id="cust_patronymic" class="form-control" value="${customerCard.customerFullName.patronymic}">
        </div>
        <div class="form-group">
            <label for="phone_number">Phone number</label>
            <input type="text" name="phone_number" id="phone_number" class="form-control" value="${customerCard.phoneNumber}" required>
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <input type="text" name="city" id="city" class="form-control" value="${customerCard.customerAddress.city}" required>
        </div>
        <div class="form-group">
            <label for="street">Street</label>
            <input type="text" name="street" id="street" class="form-control" value="${customerCard.customerAddress.street}" required>
        </div>
        <div class="form-group">
            <label for="zip_code">Zip code</label>
            <input type="text" name="zip_code" id="zip_code" class="form-control" value="${customerCard.customerAddress.zipCode}" required>
        </div>
        <div class="form-group">
            <label for="percent">Percent</label>
            <input type="number" name="percent" id="percent" class="form-control" value="${customerCard.percent}" required>
        </div>
        <div class="form-group">
            <input type="submit" name="update" form="customer_card" value="Update" class="btn btn-primary">
            <a href="${pageContext.request.contextPath}/customer_cards" class="btn btn-secondary">Cancel</a>
        </div>
    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>