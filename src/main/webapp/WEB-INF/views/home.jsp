<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <title>home</title>
</head>


<style>
    body, h1, h2, h3, h4, h5, h6 {
        font-family: "Raleway", sans-serif
    }

    body, html {
        height: 100%;
        line-height: 1.8;
    }

    /* Full height image header */
    .bgimg-1 {
        background-position: center;
        background-size: cover;
        /*background-image: url("/image/Sheffield-gb12161_uxga.jpg");*/
        min-height: 100%;
    }

    .w3-bar .w3-button {
        padding: 16px;
    }
</style>

<body>


<%@include file="header.jsp" %>

<br><br><br>

<div class="w3-container ">
    <%--<h1>Home</h1>--%>

    ${user.name}
    ${user.balance}
</div>


<%--<div style="padding-left: 5em;padding-right: 5em;">--%>
<%--<div class="w3-container" >--%>

<%--<c:forEach var="app" items="${apps}"--%>
<%--varStatus="status">--%>

<%--<div class="w3-card-4" style="width:22em;margin: 1em; display: inline-grid">--%>
<%--<header class="w3-container w3-light-grey">--%>
<%--<h3>${app.name}</h3>--%>
<%--<h3>Price: ${app.price}</h3>--%>
<%--</header>--%>
<%--<div class="w3-container" style="margin-bottom: 1em">--%>
<%--<img src="${app.icon}" alt="Avatar" class="w3-left w3-circle w3-margin-right"--%>
<%--style="width:8em;height: 8em;margin-top: 1em;">--%>
<%--<p>${app.description}</p><br>--%>
<%--</div>--%>
<%--<button class="w3-button w3-block w3-dark-grey">Open</button>--%>
<%--&lt;%&ndash;<div style="padding:1em;">&ndash;%&gt;--%>
<%--&lt;%&ndash;<button class="w3-button w3-white w3-border w3-border-blue">disable</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;<button class="w3-button w3-white w3-border w3-border-red">active</button>&ndash;%&gt;--%>
<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
<%--</div>--%>

<%--</c:forEach>--%>
<%--</div>--%>


<div style="padding-left: 10%;">
    <div class="w3-container w3-center">

        <c:forEach var="app" items="${apps}"
                   varStatus="status">


            <div class="w3-card-4" style="width:30%; margin-right:10%; margin-top:5%; display: inline-block">

                <div class="w3-container w3-center">
                    <h3>${app.name}</h3>
                    <img src="${app.icon}" alt="Avatar" style="width:80%">
                    <h5  style="height: 3em;">${app.description}</h5>
                </div>

                <div class="w3-section" style="padding-left: 5%; padding-right: 5%">
                    <button class="w3-green w3-btn" style="width: 100%;">${app.price}</button>
                </div>

            </div>

        </c:forEach>
    </div>


    <%--<div class="footer w3-container w3-white">--%>
        <%--<hr>--%>
        <%--<h4> other websites </h4>--%>
        <%--<a href="upload.jsp">websites</a>--%>
    <%--</div>--%>

</div>

<footer class="w3-center w3-black w3-padding-64" style="margin-top: 10%">
    <h4> other websites </h4>
</footer>

</body>
</html>
