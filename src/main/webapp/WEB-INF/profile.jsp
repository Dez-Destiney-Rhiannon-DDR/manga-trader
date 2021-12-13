<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/profile.css">
</head>

    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <div class="row">
        <div class="col-md-4 d-flex justify-content-center">
        <img class="profile-pic" src= "${user.image}" width="300" height="300">
        </div>
        <div class="col-md-8">
            <h1 class="welcome">Welcome, ${user.username}!</h1>
            <h3 class="bio">${user.bio}</h3>
            <a href="/user/update"><button class="btn btn-primary">Edit your profile</button></a>&nbsp;
            <a href="/ads/create"><button class="btn btn-primary">Create an ad</button></a>
            </div>
        </div>
    </div>

<hr class="line">


<div class="container">
    <c:forEach var="ad" items="${ads}">
    <div class="row row-margin">
        <div class="col-md-6">
            <img src = "${ad.image}" width="400" height="500">
        </div>
        <div class="col-md-6">
            <h2 class="ad-title">${ad.title}</h2>
            <p class="ad-desc">${ad.description}</p>
            <a href="${pageContext.request.contextPath}/ads/updateads?ad_id=${ad.id}"><button class="btn btn-primary">Edit this ad</button></a>
            <a href="${pageContext.request.contextPath}/ads/delete?ad_id=${ad.id}" onclick="return confirm('Are you sure you want to delete this item?')"><button class="btn btn-primary">Delete this ad</button></a>
        </div>
    </div>
    </c:forEach>

    </div>

</body>
</html>
