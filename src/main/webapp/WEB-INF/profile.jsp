<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${user.username}!</h1>
    </div>

    <button class="btn btn-secondary">Edit your profile</button>
    <a href="/ads/create"><button class="btn btn-secondary">Create an ad</button></a>


    <h2>Your ads:</h2>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h4>${ad.title}</h4>
            <p>${ad.description}</p>
            <a href="${pageContext.request.contextPath}/ads/updateads?ad_id=${ad.id}"><button class="btn btn-primary">Edit this ad</button></a>
            <a href="${pageContext.request.contextPath}/ads/delete?ad_id=${ad.id}" onclick="return confirm('Are you sure you want to delete this item?')"><button class="btn btn-primary">Delete this ad</button></a>
        </div>
    </c:forEach>



</body>
</html>
