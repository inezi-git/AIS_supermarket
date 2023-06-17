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
        <tr>
            <th>Phone Number</th>
            <th>Address</th>
        </tr>
        <tr>
            <td>${employeeData.phone_number}</td>
            <td>${employeeData.city}, ${employeeData.street}, ${employeeData.zip_code}</td>
        </tr>
    </table>
</c:if>
</div>
</body>
</html>
<%@include file="../footer.jsp"%>