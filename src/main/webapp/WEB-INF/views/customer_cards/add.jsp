<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Add Customer Card</title>
</head>
<body>
<div class="container">
    <h1>Add new customer card</h1>
    <form method="post" id="customer_card" action="${pageContext.request.contextPath}/customer_cards/add"></form>
    <div class="form-group">
        <label for="cust_surname">Surname</label>
        <input type="text" name="cust_surname" id="cust_surname" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="cust_name">Name</label>
        <input type="text" name="cust_name" id="cust_name" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="cust_patronymic">Patronymic</label>
        <input type="text" name="cust_patronymic" id="cust_patronymic" class="form-control">
    </div>
    <div class="form-group">
        <label for="phone_number">Phone number</label>
        <input type="text" name="phone_number" id="phone_number" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="city">City</label>
        <input type="text" name="city" id="city" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="street">Street</label>
        <input type="text" name="street" id="street" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="zip_code">Zip code</label>
        <input type="text" name="zip_code" id="zip_code" class="form-control">
    </div>
    <div class="form-group">
        <label for="percent">Percent</label>
        <input type="number" name="percent" id="percent" class="form-control" required>
    </div>
    <div class="form-group">
        <input type="submit" name="add" form="customer_card" class="btn btn-primary" value="Save">
        <a href="${pageContext.request.contextPath}/customer_cards" class="btn btn-secondary">Cancel</a>
    </div>
    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>

