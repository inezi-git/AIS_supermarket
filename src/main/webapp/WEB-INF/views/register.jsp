<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<html>
<head>
    <title>Sign up</title>
</head>
<body>
<div class="container">
    <h1>Sign up</h1>
    <form method="post" id="employee" action="${pageContext.request.contextPath}/register">
        <h4 style="color:red">${errorMessage}</h4>
        <div class="form-group">
            <label for="empl_surname">Surname</label>
            <input type="text" name="empl_surname" id="empl_surname" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="empl_name">Name</label>
            <input type="text" name="empl_name" id="empl_name" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="empl_patronymic">Patronymic</label>
            <input type="text" name="empl_patronymic" id="empl_patronymic" class="form-control">
        </div>
        <div class="form-group">
            <label for="empl_role">Role</label>
            <select name="empl_role" id="empl_role" class="form-control" required>
                <c:forEach var="role" items="${employeeRoles}">
                    <option value="${role}">${role.name()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" name="salary" id="salary" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="date_of_birth">Date of birth</label>
            <input type="date" name="date_of_birth" id="date_of_birth" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="date_of_start">Date of start</label>
            <input type="date" name="date_of_start" id="date_of_start" class="form-control" required>
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
            <label for="email">Email</label>
            <input type="text" name="email" id="email" class="form-control" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" name="add" id="add" class="btn btn-primary">
        </div>
    </form>
</div>
</body>
</html>
<%@include file="footer.jsp"%>
