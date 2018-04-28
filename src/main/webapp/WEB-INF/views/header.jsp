<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<title>APP</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
    body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
    body, html {
        height: 100%;
        line-height: 1.8;
    }
    /* Full height image header */
    .bgimg-1 {
        background-position: center;
        background-size: cover;
        background-image: url("/image/Sheffield-gb12161_uxga.jpg");
        min-height: 100%;
    }
    .w3-bar .w3-button {
        padding: 16px;
    }
</style>


<body>

<%--<div class="w3-bar w3-black">--%>
    <%--<a href="home" class="w3-bar-item w3-button">Home</a>--%>
    <%--<a href="upload" class="w3-bar-item w3-button">Upload</a>--%>
    <%--<a href="signup" class="w3-bar-item w3-button">SignUp</a>--%>
    <%--<a href="login" class="w3-bar-item w3-button">Login</a>--%>
<%--</div>--%>


<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <a href="http://localhost:8080/" class="w3-bar-item w3-button w3-wide">TEAM15</a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
            <a href="home" class="w3-bar-item w3-button"><i class="fa fa-home"></i> HOME</a>
            <a href="upload" class="w3-bar-item w3-button"><i class="fa fa-upload"></i> UPLOAD</a>
            <c:if test="${sessionScope.user == null}">
            <a href="login" class="w3-bar-item w3-button"><i class="fa fa-sign-in"></i> SIGN IN</a>
            </c:if>
            <c:if test="${sessionScope.user != null}">
            <div class="w3-dropdown-hover">
                <button class="w3-button"><i class="fa fa-user-circle"></i> ${sessionScope.user.name}</button>
                <div class="w3-dropdown-content w3-bar-block w3-border">
                    <a href="#" class="w3-bar-item w3-button"><i class="fa fa-address-book-o"></i> Detail</a>
                    <a href="signOut" class="w3-bar-item w3-button"><i class="fa fa-sign-out"></i> SIGN OUT</a>
                </div>
            </div>

            <a href="#" class="w3-bar-item w3-button"><i class="fa fa-diamond"></i> ${sessionScope.user.balance}</a>
            </c:if>


            <a href="signUp" class="w3-bar-item w3-button"><i class="fa fa-sign-out	"></i> SIGN UP</a>

        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->

        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>

<br><br><br>

</body>



</html>
