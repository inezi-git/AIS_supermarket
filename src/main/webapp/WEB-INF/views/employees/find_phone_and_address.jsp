<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>Find Employee Info</title>
</head>
<body>
<h1>Find Employee Phone and Address</h1>
<form method="post" action="${pageContext.request.contextPath}/employees/find-phone-and-address">
    <label for="surname">Employee Surname:</label>
    <select name="surname" id="surname" required>
        <c:forEach var="surname" items="${surnames}">
            <option value="${surname}" ${param.surname == surname ? 'selected' : ''}>${surname}</option>
        </c:forEach>
    </select>
    <input type="submit" value="Find">
</form>
<c:if test="${not empty errorMessage}">
    <h2>${errorMessage}</h2>
</c:if>
<c:if test="${not empty employeeData}">
    <h2>Results for Employee ${employeeData.surname}:</h2>
    <table border="1">
        <tr>
            <th>Phone Number</th>
            <td>${employeeData.phone_number}</td>
        </tr>
        <tr>
            <th>Address</th>
            <td>${employeeData.city}, ${employeeData.street}, ${employeeData.zip_code}</td>
        </tr>
    </table>
</c:if>
<h5><a href="${pageContext.request.contextPath}/logout">Log out</a></h5>
</body>
</html>
