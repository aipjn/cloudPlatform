<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: kylan
  Date: 2018/4/30
  Time: 下午7:18
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Detail</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>

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
            if (which == "expense") {
                $("#expense").show();
                $("#income").hide();
            }

            if (which == "income") {
                $("#expense").hide();
                $("#income").show();
            }

        }

    </script>
</head>


<%@include file="header.jsp" %>

<body>

<nav class="w3-sidebar w3-bar-block w3-white w3-collapse w3-top" style="z-index:3;width:250px;margin-top: 150px"
     id="mySidebar">
    <div class="w3-padding-64 w3-large w3-text-grey" style="font-weight:bold">

        <div class="w3-container w3-display-container w3-padding-16" style="color: black;">
            <i onclick="w3_close()" class="fa fa-remove w3-hide-large w3-button w3-display-topright"></i>
            <h2>Account Detail</h2>
        </div>

        <a onclick="convertFunc('expense')" class="w3-bar-item w3-button">Expenses Record</a>

        <a onclick="convertFunc('income')" class="w3-bar-item w3-button">Incomes Record</a>
    </div>
</nav>


<div class="w3-container">



    <div id="expense" class="w3-card-4 w3-light-grey w3-center" style="width:50%; margin-left: 30%;">
        <h1>Expenses Record</h1>
        <br>
        <c:forEach var="exp" items="${expense}"
                   varStatus="status">

            <c:if test="${exp == null}">
                <h4>You have not try any app.</h4>
            </c:if>

            <c:if test="${exp != null}">
                <h4>You spend <i class="fa fa-diamond"></i>${exp.price}  on ${exp.appName} at ${exp.time}</h4>
                <br>

            </c:if>
        </c:forEach>
    </div>



    <div id="income" class="w3-card-4 w3-light-grey w3-center" style="width:50%; margin-left: 30%; display: none;">
        <h1>Incomes Record</h1>
        <br>
        <c:forEach var="inc" items="${income}"
                   varStatus="status">

            <c:if test="${inc == null}">
                <h1>Sorry, no income now.</h1>
            </c:if>

            <c:if test="${inc != null}">
                <h4>You earn <i class="fa fa-diamond"></i>${inc.price}  on ${inc.appName} at ${inc.time}</h4>
                <br>

            </c:if>
        </c:forEach>
    </div>
</div>


</body>


</html>
