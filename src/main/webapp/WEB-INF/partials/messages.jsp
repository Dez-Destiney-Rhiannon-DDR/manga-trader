<%--
  Created by IntelliJ IDEA.
  User: dezmonemusgrove
  Date: 12/10/21
  Time: 3:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="US-ASCII" isErrorPage="true"%>
<html>
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@300&display=swap" rel="stylesheet">
</head>
<body>
<p style = "color: red">${errorMsg}
    <br>
    <br>
    <a href="/register">${Register}</a>
</p>
<%--<div class="container">--%>
<%--    <h1 class="title title-pos pop">Manga Trader</h1>--%>
<%--    <h3 class="title mini-title-pos">マンガトレーダー</h3>--%>
<%--</div>--%>
<%--<div>--%>
<%--    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgleqNjNbU_ezp8T9LZh2qLhhYiqCRly6Z1w&usqp=CAU" class="img-fluid" alt="Responsive image">--%>
<%--</div>--%>
<%--<% if(response.getStatus() == 500){ %>--%>
<%--<span style="color: red; ">Error: <%=exception.getMessage() %></span><br>--%>

<%--&lt;%&ndash; include login page &ndash;%&gt;--%>
<%--<%@ include file="/WEB-INF/login.jsp"%>--%>
<%--<%}else {%>--%>
<%--Hi There, error code is <%=response.getStatus() %><br>--%>
<%--Please go to <a href="/partials/messages.jsp">login page</a>--%>
<%--<%} %>--%>

</body>
</html>

<%--Error messages--%>

<%--Isn't it frustrating when a site won't let you submit a form but won't tell you why? Implement functionality to display error messages to users if they do something wrong, for example, if they try to register but their passwords don't match, or if they try to create a ad without a title.--%>

<%--Consider storing error messages temporarily in the session and having a messages.jsp partial to handle this.--%>