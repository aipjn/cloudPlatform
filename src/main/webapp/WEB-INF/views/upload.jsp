<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <title>upload</title>
    <style>
        body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}
        body, html {
            height: 100%;
            line-height: 1.8;
        }
        /*img{*/
            /*position:absolute;*/
            /*z-index:-1;*/
        /*}*/
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

        .names{
            float:left;padding-top: 0.5em;padding-right: 0.5em;color: black;width: 8em;
        }

    </style>

</head>


<body>
<div id="loading"  style="display: none;text-align: center;
    opacity: 0.8;background: #b7b5b0;
    z-index: 999; position:absolute;height: 100%;width: 100%">
    <img src="/image/loading_12.gif" >
</div>

<%@include file="header.jsp"%>

<div id = "upage" style="text-align: -webkit-center" style="position: absolute;">



    <div class="w3-container w3-center" style="margin-top:2em;">
        <h1>To earn peanuts, upload your own app :)</h1>
    </div>

    <form class="w3-container w3-light-grey w3-text-blue w3-margin" style="width: 50%">

        <div class="w3-row w3-section">
            <div class="names"><span>App Name:</span></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" id="appName" name="appName" type="text" maxlength="30"
                       placeholder="Your app name">
            </div>
        </div>
        <div class="w3-row w3-section">
            <div class="names"><span>Description:</span></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" id="description" name="description" maxlength="50"
                       type="text" placeholder="One sentence to describe your app">
            </div>
        </div>

        <div class="w3-row w3-section">
            <div class="names"><span>Price:</span></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" id="price" name="price" max="10"
                       type="number" placeholder="How much is per use of your app (should be no more than 10)">
            </div>
        </div>

        <div class="w3-row w3-section">
            <div class="names"><span>Location:</span></div>
            <div class="w3-rest">
                <input class="w3-input w3-border" id="location" name="location"
                       type="text" placeholder="Location of your home page like 'app/home' It can be null">
            </div>
        </div>

        <div class="w3-row w3-section">
            <div class="names"><span>Icon:</span></div>
            <%--<div class="w3-rest" style="float:left">--%>
                <%--<input class="w3-input w3-border" id="picFileVal"--%>
                       <%--placeholder="Choose a picture as your app icon" type="text" disabled="disabled">--%>
            <%--</div>--%>
            <div style="float:left">
                <input type="button" value="Choose an icon" onclick="picFile.click()" class="w3-blue w3-btn">
                <input type="file" id="picFile" style="display:none" onchange="change();">
            </div>
        </div>
        <div class="w3-center">
            <img src="image/icon_demo.jpg" id="preview" class="w3-center" style="width: 20%">
        </div>


        <div class="w3-row w3-section">
            <div class="names"><span>War File:</span></div>
            <%--<div class="w3-rest" style="float:left">--%>
                <%--<input class="w3-input w3-border" style="width:23em;"  id="warFileVal"--%>
                       <%--placeholder="Choose your app war file" type="text" disabled="disabled">--%>
            <%--</div>--%>

            <div style="float:left">
                <input type="button" value="Choose a war file" onclick="warFile.click()" class="w3-blue w3-btn">
                <input type="file" id="warFile" style="display:none" onchange="warFileVal.value=this.value;$('#warFileVal').show();">
            </div>

            <div style="float: right">
                <input class="w3-input w3-leftbar w3-light-grey"  id="warFileVal" type="text" style="display: none" disabled="disabled">
            </div>

        </div>
        <button type="button" class="w3-btn w3-block w3-section w3-blue w3-ripple w3-padding" onclick="check();">Upload</button>
    </form>
</div>


</body>
</html>
