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
    <title>Ad Page</title>
      <%@include file="/WEB-INF/partials/head.jsp"%>
  </head>
  <body>
  <div class="container">
      <h1>Title: ${ad.title}</h1>
      <h3>Author: ${ad.author}</h3>
       <h3>Genre: ${ad.genre}</h3>
    <h3>Release year: ${ad.year}</h3>
    <h3>Description: ${ad.description}</h3>

      <h1>Posted By: ${username}</h1>

      <a href="${pageContext.request.contextPath}/ads"><button type="submit">Back to Ads</button>
      </a>





  <%--      <input type="hidden" id="usernameLogin" value="<%="${user.username}" %>">--%>
<%--      <p id="username"><%="${username}" %></p>--%>
  </div>



  </body>
</html>
