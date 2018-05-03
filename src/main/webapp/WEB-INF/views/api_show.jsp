<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Our Api</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script>

    </script>

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
            background-image: url("/image/Sheffield-gb12161_uxga.jpg");
            min-height: 100%;
        }

        .w3-bar .w3-button {
            padding: 16px;
        }
    </style>

    <script>
        function myAccFunc() {
            var x = document.getElementById("demoAcc");
            if (x.className.indexOf("w3-show") == -1) {
                x.className += " w3-show";
            } else {
                x.className = x.className.replace(" w3-show", "");
            }
        }

        // document.getElementById("myBtn").click();

        function w3_open() {
            document.getElementById("mySidebar").style.display = "block";
            // document.getElementById("myOverlay").style.display = "block";
        }

        function w3_close() {
            document.getElementById("mySidebar").style.display = "none";
            // document.getElementById("myOverlay").style.display = "none";
        }

        function convertFunc(which) {
            if (which == "api1") {
                $("#api1").show();
                $("#api2").hide();
                $("#code").hide();
            }

            if (which == "api2") {
                $("#api1").hide();
                $("#api2").show();
                $("#code").hide();
            }

            if (which == "code") {
                $("#api1").hide();
                $("#api2").hide();
                $("#code").show();
            }

        }

    </script>
</head>


<%@include file="header.jsp" %>

<body>

<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px;margin-top: 150px"
     id="mySidebar">
    <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">

        <div class="w3-container w3-display-container w3-padding-16" style="color: black">
            <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
            <h2>OUR API</h2>
        </div>

        <a onclick="convertFunc('api1')" class="w3-bar-item w3-button"> START API</a>

        <a onclick="convertFunc('api2')" class="w3-bar-item w3-button"> EXTRA CHARGE API</a>

        <a onclick="convertFunc('code')" class="w3-bar-item w3-button"> CODE EXAMPLE</a>

    </div>
</nav>


<div class="w3-container">



    <div id="api1" class="w3-card-4 w3-light-grey" style="width:50%; margin-left: 30%;">
        <h1 class="w3-center">START API</h1>
        <div  style=" margin-left: 2em;">
            <h4>
                This api is for other apps connecting to our platform. We will call other apps by<br>
                there location of home page followed username like this<br>
                "http://localhost:8080/Restaurant/restaurant?userName=admin". The other apps should<br>
                send a request to our platform ask the state of that user. It should allow users to<br>
                access their app only if our platform return a state success says this user has<br>
                logined. To call this api app also need send your own userName and password in our<br>
                platform.<br>

                This api url is http://143.167.9.220:8080/cloud/start and require parameters<br>
                userName, password, targetUserName.<br>
                Where userName is your userName targetUserName is the user you want to check.<br>
                It will return json data if success it is {state: success} if not it will be<br>
                {state: error, msg: a message says where goes wrong}<br>
                See code examples by click CODE EXAMPLE<br>
            </h4>
        </div>
    </div>



    <div id="api2" class="w3-card-4 w3-light-grey" style="width:50%; margin-left: 30%; display: none;">
        <h1 class="w3-center">CODE EXAMPLE</h1>
        <div  style=" margin-left: 2em;">
            <h4>
                Normally our platform only charge user when user first open an app. However if<br>
                other app wants extra charge for other reasons. This api is developed for extra<br>
                charge.<br>
                This api url is http://143.167.9.220:8080/cloud/reducePeanut and require parameters<br>
                userName, password, appName, targetUserName.<br>
                Where userName is your userName targetUserName is the user you want to charge.<br>
                It will return json data if success it is {state: success} if not it will be<br>
                {state: error, msg: a message says where goes wrong}<br>
                See code examples by click CODE EXAMPLE<br>
            </h4>

        </div>
    </div>

    <div id="code" class="w3-card-4 w3-light-grey" style="width:50%; margin-left: 30%; display: none;">
        <div class="w3-code">
            package com.team_15.filter;<br><br>


            import javax.servlet.*;<br>
            import javax.servlet.http.HttpServletRequest;<br>
            import javax.servlet.http.HttpServletResponse;<br>
            import javax.servlet.http.HttpSession;<br>
            import java.io.BufferedReader;<br>
            import java.io.IOException;<br>
            import java.io.InputStreamReader;<br>
            import java.net.MalformedURLException;<br>
            import java.net.URL;<br>
            import java.net.URLConnection;<br>

            public class LoginFilter implements Filter {<br>

            public void destroy() {<br>

            }<br>

            public void doFilter(ServletRequest srequest, ServletResponse sresponse,<br>
            FilterChain chain) throws IOException, ServletException {<br>

            String url = "http://143.167.20.204:8080/start";<br>
            HttpServletRequest request = (HttpServletRequest) srequest;<br>
            String targetUserName = (String) request.getParameter("userName");<br>
            HttpServletResponse response = (HttpServletResponse) sresponse;<br>
            if (targetUserName == null || targetUserName.equals("")) {<br>
            response.sendRedirect("login");<br>
            return;<br>
            }<br>

            // if not login redirect to login page<br>
            if(getPermission(url, targetUserName).equalsIgnoreCase("error")){<br>
            response.sendRedirect("login");<br>
            return;<br>
            }<br>
            chain.doFilter(srequest, sresponse);<br>
            }<br>

            public void init(FilterConfig config) {<br>
            }<br>

            public static String getPermission(String url, String targetUserName) throws MalformedURLException {<br>
            String Result = "";<br>
            String urlNameString = url + "?userName=admin&password=123456&targetUserName=" + targetUserName;<br>
            URL realURL = new URL(urlNameString);<br>
            try {<br>
            URLConnection connection = realURL.openConnection();<br>
            connection.setRequestProperty("accept", "*/*");<br>
            connection.setRequestProperty("connection", "Keep-Alive");<br>
            connection.setRequestProperty("ExchangeUser-Agent", "Mozilla/5.0");<br>
            connection.connect();<br>
            BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream()));<br>
        </div>
    </div>
</div>


</body>


</html>
