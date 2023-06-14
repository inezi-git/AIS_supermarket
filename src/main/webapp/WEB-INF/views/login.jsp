<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<html>
<head>
    <title>Login</title>
</head>
<body>
<form method="post" id="login" action="${pageContext.request.contextPath}/login"></form>
<h1>Login:</h1>
<h4 style="color:red">${errorMessage}</h4>
<table border="1">
    <tr>
        <th>Email</th>
        <th>Password</th>
        <th>Submit</th>
    </tr>
    <tr>
        <td>
            <input type="text" name="email" form="login" required>
        </td>
        <td>
            <input type="password" name="password" form="login" required>
        </td>
        <td>
            <input type="submit" name="login_employee" form="login" required>
        </td>
    </tr>
</table>
<h5>
    <a href="${pageContext.request.contextPath}/register">Register new employee</a>
</h5>
</form>
</body>
</html>
