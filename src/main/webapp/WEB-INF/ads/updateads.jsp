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
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div>
    <a class="btn btn-primary" href="/profile">Back to Profile</a>
</div>
<div class="container">
    <h1 class="title">Update your Ad</h1>


    <form action="/ads/updateads" method="post">
        <div class="form-group">
            <label class="mini-title" for="updateTitle">Title</label>
            <input id="updateTitle" name="updateTitle" class="form-control" type="text" value="${title}">
            <input type="hidden" name="ad_id" value="${ad_id}">
        </div>
        <div class="form-group">
            <label class="mini-title" for="updateDescription">Description</label>
            <textarea id="updateDescription" name="updateDescription" class="form-control" type="text">${description}</textarea>
        </div>
        <div class="form-group">
            <label class="mini-title" for="updateAuthor">Author</label>
            <textarea id="updateAuthor" name="updateAuthor" class="form-control" type="text">${author}</textarea>
        </div>
        <div class="form-group">
            <label class="mini-title" for="updateYear">Year</label>
            <textarea id="updateYear" name="updateYear" class="form-control" type="text">${year}</textarea>
        </div>
        <div class="form-group">
            <label class="mini-title" for="updateGenre">Genre</label>
            <textarea id="updateGenre" name="updateGenre" class="form-control" type="text">${genre}</textarea>
        </div>
        <div class="form-group">
            <label class="mini-title" for="updateImage">Image Address</label>
            <textarea id="updateImage" name="updateImage" class="form-control" type="text">${image}</textarea>
            <small id="imageHelp" class="form-text text-muted">"How do I get an image address?"<br>
                Step 1: Search up the image of your manga on your browser (Google, Safari, etc)<br>
                Step 2: Right click the image of your choice and select "Copy Image Address"<br>
                Step 3: Paste the Image Address into the form</small>
        </div>

        <input type="submit" class="btn btn-primary-2">
    </form>

</div>

</body>
</html>
