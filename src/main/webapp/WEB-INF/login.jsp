<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>

    <style>

        body {
            background-color: black;
        }

        h1 {
            font-weight: 0 !important;
        }

        .title {
            font-family: 'Merriweather', serif;
            color: white;
            font-size: 50px;
            margin-top: 50px;
            margin-bottom: 30px;
        }

        .mini-title {
            font-family: 'Merriweather Sans', sans-serif;
            color: white;
            font-size: 15px;
            margin-top: 10px;
        }

        .btn-primary {
            background-color: #444444 !important;
            border: none !important;
            font-size: 14px;
            font-family: 'Merriweather Sans', sans-serif !important;
            margin: 20px;
        }
        .btn-primary-2 {
            background-color: #444444 !important;
            border: none !important;
            font-size: 14px;
            font-family: 'Merriweather Sans', sans-serif !important;
            color: white !important;
            margin-top: 20px;
        }


        .btn-primary:hover {
            background-color: #333333 !important;
            border: none !important;
        }

        .btn-primary-2:hover {
            background-color: #333333 !important;
            border: none !important;
        }

    </style>

</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <%-- include login page --%>


    <a class="btn btn-primary" href="/">Back to Homepage</a>

    <div class="container">
        <div>
        <%@ include file="partials/messages.jsp"%>
    </div>
        <h1 class="title">Please Log In</h1>
        <form action="/login" method="POST">
            <div class="form-group">
                <label class="mini-title" for="username">Username</label>
                <input id="username" name="username" class="form-control" type="text">
            </div>

            <div class="form-group">
                <label class="mini-title" for="password">Password</label>
                <input id="password" name="password" class="form-control" type="password">
            </div>
            <input type="submit" class="btn btn-primary-2 btn-block" value="Log In">
        </form>
    </div>
</body>
</html>
