<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<html>
<head>
    <title>Find Employee Info</title>
</head>
<body>
<div class="container">
<form method="post" action="${pageContext.request.contextPath}/employees/find-phone-and-address">
    <select name="surname" id="surname" required>
        <c:forEach var="surname" items="${surnames}">
            <option value="${surname}" ${param.surname == surname ? 'selected' : ''}>${surname}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Find" class="btn btn-primary">
</form>
<c:if test="${not empty errorMessage}">
    <h2>${errorMessage}</h2>
</c:if>
<c:if test="${not empty employeeData}">
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Phone Number</th>
                <th>Address</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>${employeeData.phone_number}</td>
                <td>${employeeData.city}, ${employeeData.street}, ${employeeData.zip_code}</td>
            </tr>
        </tbody>
    </table>
</c:if>
    <div>
        <a href="${pageContext.request.contextPath}/employees" class="btn btn-secondary">Back to all employees</a>
    </div>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>