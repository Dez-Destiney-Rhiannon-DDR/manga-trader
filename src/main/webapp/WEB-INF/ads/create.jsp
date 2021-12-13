<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Create a new Ad" />
    </jsp:include>

    <style>

        body {
            background-color: black;
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

<a class="btn btn-primary" href="/profile">Back to Profile</a>

    <div class="container">
        <h1 class="title">Create An Ad</h1>
        <form action="/ads/create" method="post">
            <div class="form-group">
                <label class="mini-title" for="title">Title</label>
                <input id="title" name="title" class="form-control" type="text">
            </div>
            <div class="form-group">
                <label class="mini-title" for="description">Description</label>
                <textarea id="description" name="description" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label class="mini-title" for="author">Author</label>
                <textarea id="author" name="author" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label class="mini-title" for="year">Release Year</label>
                <textarea id="year" name="year" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label class="mini-title" for="genre">Genre</label>
                <textarea id="genre" name="genre" class="form-control" type="text"></textarea>
            </div>
            <div class="form-group">
                <label class="mini-title" for="image">Image Address</label>
                <textarea id="image" name="image" class="form-control" type="text"></textarea>
                <small id="imageHelp" class="form-text text-muted">"How do I get an image address?"<br>
                    Step 1: Search up the image of your manga on your browser (Google, Safari, etc)<br>
                    Step 2: Right click the image of your choice and select "Copy Image Address"<br>
                    Step 3: Paste the Image Address into the form</small>
            </div>
            <input type="submit" class="btn btn-block btn-primary-2">
        </form>
    </div>
</body>
</html>
