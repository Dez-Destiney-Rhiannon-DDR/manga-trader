<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">
    <h4>Search your favorite Manga!</h4>
    <div>
        <form method="GET" action="/ads-search">
            <div class="form-group">
                <label for="title">Title</label>
                <input id="title" name="q" class="form-control" type="text">
            </div>
            <input type="submit" class="btn btn-primary" value="Search">

        </form>
    </div>

    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>Title: ${ad.title}</h2>
            <h3>Description: ${ad.description}</h3>

<%--            //add link here to go to individual ad--%>

            <a href="${pageContext.request.contextPath}/ads/view?id=${ad.id}">Click for details</a>
        </div>
    </c:forEach>
</div>

</body>
</html>
