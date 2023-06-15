<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="en_US" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Update Employee</title>
</head>
<body>
<div class="container">
    <h1>Update employee:</h1>
    <form method="post" id="employee" action="${pageContext.request.contextPath}/employees/update">
        <c:if test="${not empty param.message}">
            <div class="alert alert-danger">${param.message}</div>
        </c:if>
        <c:if test="${not empty message}">
            <div class="alert alert-danger">${message}</div>
        </c:if>
        <div class="form-group">
            <label for="id">ID</label>
            <input type="text" name="id" id="id" class="form-control" value="${employee.id}" readonly>
        </div>
        <div class="form-group">
            <label for="empl_surname">Surname</label>
            <input type="text" name="empl_surname" id="empl_surname" class="form-control" value="${employee.employeeFullName.surname}" required>
        </div>
        <div class="form-group">
            <label for="empl_name">Name</label>
            <input type="text" name="empl_name" id="empl_name" class="form-control" value="${employee.employeeFullName.name}" required>
        </div>
        <div class="form-group">
            <label for="empl_patronymic">Patronymic</label>
            <input type="text" name="empl_patronymic" id="empl_patronymic" class="form-control" value="${employee.employeeFullName.patronymic}">
        </div>
        <div class="form-group">
            <label for="empl_role">Role</label>
            <select name="empl_role" id="empl_role" class="form-control" required>
                <c:forEach var="role" items="${employeeRoles}">
                    <option value="${role}" ${role == employee.employeeRole ? 'selected' : ''}>${role.name()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="salary">Salary</label>
            <input type="text" name="salary" id="salary" class="form-control" value="<fmt:formatNumber value='${employee.salary}' pattern='#.00' currencySymbol='.'/>" required pattern="^\d+(\.\d{2})?$" title="Please enter a valid value in the format #.00">
        </div>
        <div class="form-group">
            <label for="date_of_birth">Date of birth</label>
            <input type="date" name="date_of_birth" id="date_of_birth" class="form-control" value="${employee.dateOfBirth}" required>
        </div>
        <div class="form-group">
            <label for="date_of_start">Date of start</label>
            <input type="date" name="date_of_start" id="date_of_start" class="form-control" value="${employee.dateOfStart}" required>
        </div>
        <div class="form-group">
            <label for="phone_number">Phone number</label>
            <input type="text" name="phone_number" id="phone_number" class="form-control" value="${employee.phoneNumber}" required>
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <input type="text" name="city" id="city" class="form-control" value="${employee.address.city}" required>
        </div>
        <div class="form-group">
            <label for="street">Street</label>
            <input type="text" name="street" id="street" class="form-control" value="${employee.address.street}" required>
        </div>
        <div class="form-group">
            <label for="zip_code">Zip code</label>
            <input type="text" name="zip_code" id="zip_code" class="form-control" value="${employee.address.zipCode}" required>
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" name="email" id="email" class="form-control" value="${employee.email}" required>
        </div>
        <div class="form-group">
            <label for="password">Enter Password</label>
            <input type="password" name="password" id="password" class="form-control" required>
        </div>
        <div class="form-group">
            <input type="submit" name="update" form="employee" value="Update" class="btn btn-primary">
            <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">Cancel</a>
        </div>

    </form>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>
