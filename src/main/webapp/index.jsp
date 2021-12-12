<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!"/>
    </jsp:include>
    <link rel="stylesheet" href="style/title.css">
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1 class="title title-pos">Manga Trader</h1>
    <h3 class="title mini-title-pos">マンガトレーダー</h3>
</div>
<div>
    <div class="btn-container-1 col text-center">
    <a href="/login" class="btn btn-primary">Login</a>
    </div>
    <div class="btn-container-2 col text-center">
    <a href="/register" class="btn btn-primary">Register</a>
    </div>
    <div class="btn-container-3 col text-center">
    <a href="/ads" class="btn btn-primary">Manga Catalog</a>
    </div>

</div>
</body>
</html>
