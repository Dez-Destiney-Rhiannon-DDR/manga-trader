<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Manga Trader"/>
    </jsp:include>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/title.css">
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1 class="title title-pos pop">Manga Trader</h1>
    <h3 class="title mini-title-pos">マンガトレーダー</h3>
</div>
<div>
    <div class="btn-container-1 col text-center">
    <a style="font-family: 'Merriweather Sans', sans-serif !important;" href="/login" class="btn btn-primary" role="button">Login</a>
    </div>
    <div class="btn-container-2 col text-center">
    <a style="font-family: 'Merriweather Sans', sans-serif !important;" href="/register" class="btn btn-primary" role="button">Register</a>
    </div>
    <div class="btn-container-3 col text-center">
    <a style="font-family: 'Merriweather Sans', sans-serif !important;" href="/ads" class="btn btn-primary" role="button">Manga Catalog</a>
    </div>

</div>
</body>
</html>
