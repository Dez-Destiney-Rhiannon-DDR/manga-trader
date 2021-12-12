<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads"/>
    </jsp:include>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@300&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="style/catalog.css">
</head>
<body>

<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <div class=" col-md-9">

    <h1 class="manga-catalog">Manga Catalog</h1>

    <div>
        <form method="GET" action="/ads-search">
            <div class="form-group d-flex">
                <input id="title" name="q" class="form-control mr-1" type="text">&nbsp;
                <input type="submit" class="btn btn-primary" value="Search">
            </div>

        </form>
    </div>
    </div>

    <c:forEach var="ad" items="${ads}">
        <div class="row row-margin">
        <div class="col-md-6">

<%--           <c:url value="${ad.image}"/>--%>
    <a href="${pageContext.request.contextPath}/ads/view?id=${ad.id}">
        <div class="grid grow">
        <figure class="effect-sadie grow">
            <img src = "${ad.image}" width="400" height="500">
            <figcaption>
                <p class="see-more grow">See More</p>
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
