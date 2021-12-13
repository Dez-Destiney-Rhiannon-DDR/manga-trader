<%--
  Created by IntelliJ IDEA.
  User: hermanator55
  Date: 9/15/21
  Time: 10:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <jsp:include page="/WEB-INF/partials/head.jsp">
            <jsp:param name="title" value="Edit Profile"/>
        </jsp:include>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@300&display=swap" rel="stylesheet">

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
<a class="btn btn-primary" href="/profile">Back to Profile</a>
<div class="container">
    <h1 class="title"> Update your Profile</h1>

    <form action="/user/update" method="post">
        <form>
            <div class="form-group">
                <label class="mini-title" for="exampleInputEmail1">Email Address</label>
                <input type="email" class="form-control" id="exampleInputEmail1" name="email" aria-describedby="emailHelp" value="${email}">
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>
            <div class="form-group">
                <label class="mini-title" for="exampleInputPassword1">Username</label>
                <input type="text" name="username" class="form-control" id="exampleInputPassword1" value="${username}">
            </div>
            <div class="form-group">
                <label class="mini-title" for="bio">Bio</label>
                <input type="text" name="bio" class="form-control" id="bio" value="${bio}">
            </div>
            <div class="form-group">
                <label class="mini-title" for="image">Profile Picture (Image Address)</label>
                <input type="text" name="image" class="form-control" id="image" value="${image}">
                <small id="imageHelp" class="form-text text-muted">"How do I get an image address?"<br>
                Step 1: Search up the image of your manga on your browser (Google, Safari, etc)<br>
                Step 2: Right click the image of your choice and select "Copy Image Address"<br>
                Step 3: Paste the Image Address into the form</small>
            </div>
            <button type="submit" class="btn btn-block btn-primary-2">Submit</button>
        </form>
    </form>
</div>

</body>
</html>
