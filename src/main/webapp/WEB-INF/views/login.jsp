<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>
<html>
<head>
    <title>Login</title>
</head>
<body>
<div class="container">
    <h1>Log in</h1>
<form method="post" id="login" action="${pageContext.request.contextPath}/login">
    <h4 style="color:red">${errorMessage}</h4>
    <div class="form-group">
        <label for="email">Email</label>
        <input type="text" name="email" id="email" class="form-control" required>
    </div>
    <div class="form-group">
        <label for="password">Password</label>
        <input type="password" name="password" id="password" class="form-control" required>
    </div>
    <div class="form-group">
        <input type="submit" name="login_employee" class="btn btn-primary" value="Submit" required>
    </div>
</form>
</div>
</body>
</html>
<%@include file="footer.jsp"%>
