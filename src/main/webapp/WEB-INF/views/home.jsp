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

    <div class="w3-container">
        <h1>Home</h1>
    </div>
</div>

<div class="w3-container" style="display: -webkit-inline-box;">

    <c:forEach var="app" items="${apps}"
               varStatus="status">

        <div class="w3-card-4" style="width:30%;margin: 10px">
            <header class="w3-container w3-light-grey">
                <h3>${app.name}</h3>
            </header>
            <div class="w3-container">
                <img src="${app.icon}" alt="Avatar" class="w3-left w3-circle w3-margin-right"
                     style="width:100px;height: 100px;margin-top: 20px;">
                <p>${app.description}</p><br>
            </div>
            <button class="w3-button w3-block w3-dark-grey">Open</button>
        </div>
    </c:forEach>


</div>
</body>
</html>
