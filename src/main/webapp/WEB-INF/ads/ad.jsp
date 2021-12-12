<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: destineyrodney
  Date: 12/9/21
  Time: 2:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
      <jsp:param name="title" value="Viewing A Manga"/>
    </jsp:include>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@300&display=swap" rel="stylesheet">
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
        text-align: center;
      }

      .desc {
        font-family: 'Merriweather Sans', sans-serif;
        color: white;
        font-size: 20px;
        margin-top: 50px;
        margin-bottom: 50px;
        text-align: center;
      }

      img {
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        position: absolute;
        margin-left: auto;
        margin-right: auto;
        width: 600px;
        height: 700px;
        z-index: -1;
        opacity: 0.2;
      }

      .info {
        font-family: 'Merriweather Sans', sans-serif;
        color: white;
        font-size: 25px;
        margin-top: 20px;
        margin-bottom: 20px;
        text-align: center;
      }

      .post {
        font-family: 'Merriweather Sans', sans-serif;
        color: white;
        font-size: 35px;
        margin-top: 120px;
        margin-bottom: 70px;
        text-align: center;
      }

      ul {
        background-color: black;
      }

      .btn-primary {
        margin-top: 50px;
        background-color: #444444 !important;
        border: none !important;
        font-size: 15px;
        font-family: 'Merriweather Sans', sans-serif !important;
      }

      .btn-primary:hover {
        background-color: #333333 !important;
        border: none !important;
      }

    </style>

  </head>
  <body>
  <div class="container">
    <ul>
    <li><img src = "${ad.image}" width="400" height="500"></li>
  </ul>

      <h1 class="title">Title: ${ad.title}</h1>
      <h3 class="desc">Description: ${ad.description}</h3>
      <h3 class="info">Author: ${ad.author}</h3>
      <h3 class="info">Genre: ${ad.genre}</h3>
      <h3 class="info">Release year: ${ad.year}</h3>

      <h1 class="post">Posted By: ${username}</h1>

      <a class="btn btn-primary" href="${pageContext.request.contextPath}/ads">Back to Ads</a>





  <%--      <input type="hidden" id="usernameLogin" value="<%="${user.username}" %>">--%>
<%--      <p id="username"><%="${username}" %></p>--%>
  </div>



  </body>
</html>
