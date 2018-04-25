<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <title>home</title>
</head>

<body>


<div class="w3-teal">

    <div class="w3-bar w3-black">
        <a href="#" class="w3-bar-item w3-button">Home</a>
        <a href="upload" class="w3-bar-item w3-button">Upload</a>
        <a href="#" class="w3-bar-item w3-button">Login</a>
    </div>
    <div class="w3-container ">
        <h1>Home</h1>
    </div>


</div>
<div style="padding-left: 5em;padding-right: 5em;">
    <div class="w3-container" >

        <c:forEach var="app" items="${apps}"
                   varStatus="status">

            <div class="w3-card-4" style="width:22em;margin: 1em; display: inline-grid">
                <header class="w3-container w3-light-grey">
                    <h3>${app.name}</h3>
                </header>
                <div class="w3-container" style="margin-bottom: 1em">
                    <img src="${app.icon}" alt="Avatar" class="w3-left w3-circle w3-margin-right"
                         style="width:8em;height: 8em;margin-top: 1em;">
                    <p>${app.description}</p><br>
                </div>
                <button class="w3-button w3-block w3-dark-grey">Open</button>
                <%--<div style="padding:1em;">--%>
                    <%--<button class="w3-button w3-white w3-border w3-border-blue">disable</button>--%>
                    <%--<button class="w3-button w3-white w3-border w3-border-red">active</button>--%>
                <%--</div>--%>
            </div>

        </c:forEach>
    </div>
    <div class="footer w3-container w3-white">
        <hr>
        <h4> other websites </h4>
        <a href="upload.jsp">websites</a>
    </div>
</div>
</body>
</html>
