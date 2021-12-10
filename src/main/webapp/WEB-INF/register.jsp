<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: shermanhall
  Date: 9/10/21
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="Register" value="register" />
    </jsp:include>
</head>
<body>

<div class="container">

<h1>Register</h1>

<h1>Please fill in your information</h1>
<%--  error message partial --%>
<form method="POST" action="/register">

    <div class="form-group">
        <label for="username">Username</label>
        <input id="username" name="username" class="form-control" type="text">
    </div>

    <div class="form-group">
        <label for="email">Email</label>
        <input id="email" name="email" class="form-control" type="email">
    </div>

    <div class="form-group">
        <label for="password">Password</label>
        <input id="password" name="password" class="form-control" type="password">
    </div>

    <input type="submit" class="btn btn-primary" value="register">

</form>

</div>


</body>
</html>