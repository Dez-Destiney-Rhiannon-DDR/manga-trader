<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1>Welcome to the Manga Trader!</h1>
</div>
<div>
    <a href="/login" class="btn btn-primary">login</a>
    <a href="/register" class="btn btn-primary">register</a>
    <a href="/ads" class="btn btn-primary">Manga Catalog</a>


</div>
</body>
</html>
