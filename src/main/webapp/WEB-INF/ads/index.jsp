<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
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

<%--           <c:url value="${ad.image}"/>--%>
            <img src = "${ad.image}" width="400" height="500">
            <h2>${ad.title}</h2>
            <h3>${ad.description}</h3>

<%--            //add link here--%>

            <a href="${pageContext.request.contextPath}/ads/view?id=${ad.id}"><button type="submit">Click here for details</button>
            </a>
        </div>
    </c:forEach>
</div>

</body>
</html>
