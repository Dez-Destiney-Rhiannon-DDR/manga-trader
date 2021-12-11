<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>

    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <div class="col-md-6">
        <img src = "${user.image}" width="300" height="300">
        </div>
        <div class="col-md-6">
            <h1>Welcome, ${user.username}!</h1>
            <h3>${user.bio}</h3>
            <a href="/user/update"><button class="btn btn-secondary">Edit your profile</button></a>
            <a href="/ads/create"><button class="btn btn-secondary">Create an ad</button></a>
        </div>
    </div>

    <h2>Your ads:</h2>

<div class="container">
    <c:forEach var="ad" items="${ads}">
    <div class="row">
        <div class="col-md-6">
            <img src = "${ad.image}" width="400" height="500">
        </div>
        <div class="col-md-6">
            <h2>${ad.title}</h2>
            <p>${ad.description}</p>
            <a href="${pageContext.request.contextPath}/ads/updateads?ad_id=${ad.id}"><button class="btn btn-primary">Edit this ad</button></a>
            <a href="${pageContext.request.contextPath}/ads/delete?ad_id=${ad.id}" onclick="return confirm('Are you sure you want to delete this item?')"><button class="btn btn-primary">Delete this ad</button></a>
        </div>
    </div>
    </c:forEach>

    </div>

</body>
</html>
