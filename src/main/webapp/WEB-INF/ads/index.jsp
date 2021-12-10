<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

    <c:forEach var="ad" items="${ads}">
        <div class="col-md-6">
            <h2>Title: ${ad.title}</h2>
            <h3>Description: ${ad.description}</h3>

<%--            //add link here--%>

            <a href="${pageContext.request.contextPath}/ads/view?id=${ad.id}"><button type="submit">Click here for details</button>
            </a>
        </div>
    </c:forEach>
</div>

</body>
</html>
