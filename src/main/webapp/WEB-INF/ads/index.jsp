<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <link rel="stylesheet" href="style/catalog.css">
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container">

    <h1 class="manga-catalog">Manga Catalog</h1>

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

    <c:forEach var="ad" items="${ads}">
        <div class="row row-margin">
        <div class="col-md-6">

<%--           <c:url value="${ad.image}"/>--%>
    <a href="${pageContext.request.contextPath}/ads/view?id=${ad.id}">
        <div class="grid">
        <figure class="effect-sadie">
            <img src = "${ad.image}" width="400" height="500">
            <figcaption>
                <p class="see-more">See More</p>
            </figcaption>
        </figure>
       </div></a>


    </div>
        <div class="col-md-6">
            <h2 class="ad-title">${ad.title}</h2>
            <p class="ad-desc">${ad.description}</p>

<%--            //add link here--%>

<%--            <button type="submit">Click here for details</button>--%>
            </a>
        </div>
        </div>
    </c:forEach>
</div>

</body>
</html>
