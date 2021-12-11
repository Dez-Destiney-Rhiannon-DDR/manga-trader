<%--
  Created by IntelliJ IDEA.
  User: hermanator55
  Date: 9/15/21
  Time: 12:20 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update your Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div>
    <a class="back-button" href="/profile"><i class="fa fa-chevron-left" aria-hidden="true">Back to Profile</i></a>
</div>
<div class="container">
    <h1 class="display-4">Update your Ad</h1>


    <form action="/ads/updateads" method="post">
        <div class="form-group">
            <label for="updateTitle">Title</label>
            <input id="updateTitle" name="updateTitle" class="form-control" type="text" value="${title}">
            <input type="hidden" name="ad_id" value="${ad_id}">
        </div>
        <div class="form-group">
            <label for="updateDescription">Description</label>
            <textarea id="updateDescription" name="updateDescription" class="form-control" type="text">${description}</textarea>
        </div>
        <div class="form-group">
            <label for="updateAuthor">Author</label>
            <textarea id="updateAuthor" name="updateAuthor" class="form-control" type="text">${author}</textarea>
        </div>
        <div class="form-group">
            <label for="updateYear">Year</label>
            <textarea id="updateYear" name="updateYear" class="form-control" type="text">${year}</textarea>
        </div>
        <div class="form-group">
            <label for="updateGenre">Genre</label>
            <textarea id="updateGenre" name="updateGenre" class="form-control" type="text">${genre}</textarea>
        </div>
        <div class="form-group">
            <label for="updateImage">Image Address</label>
            <textarea id="updateImage" name="updateImage" class="form-control" type="text">${image}</textarea>
        </div>

        <input type="submit" class="btn btn-dark">
    </form>

</div>

</body>
</html>
