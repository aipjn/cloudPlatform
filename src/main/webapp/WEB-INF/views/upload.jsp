<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js/upload.js"></script>
    <title>upload</title>
    <style>
        .names{
            float:left;padding-top: 0.5em;padding-right: 0.5em;color: black;width: 8em;
        }

    </style>
</head>

<body>


<div class="w3-teal">

    <div class="w3-bar w3-black">
        <a href="#" class="w3-bar-item w3-button">Home</a>
        <a href="#" class="w3-bar-item w3-button">Upload</a>
        <a href="#" class="w3-bar-item w3-button">Login</a>
    </div>

    <div class="w3-container">
        <h1>Home</h1>
    </div>
</div>

<div style="text-align: -webkit-center">
    <div class="w3-container w3-center" style="margin-top:2em;">
        <h1>To earn peanuts, upload your own app</h1>
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
                <input class="w3-input w3-border" id="description" name="description" maxlength="100"
                       type="text" placeholder="One sentence to describ your app">
            </div>
        </div>

        <div class="w3-row w3-section">
            <div class="names"><span>Icon:</span></div>
            <div class="w3-rest" style="float:left">
                <input class="w3-input w3-border" style="width:23em;" id="picFileVal"
                       placeholder="Choose a picture as your app icon" type="text" disabled="disabled">
            </div>
            <div style="float:right">
                <input type="button" value="Choose a file" onclick="picFile.click()" class="w3-input w3-white w3-border w3-border-blue">
                <input type="file" id="picFile" style="display:none" onchange="change();picFileVal.value=this.value">
            </div>
        </div>
        <div style="padding-left:40%">
            <img src="image/demo.jpeg"  id="preview" alt="" class="w3-left w3-circle w3-margin-right"
                style="width:100px;height: 100px;margin: 20px;">
        </div>
        <div class="w3-row w3-section">
            <div class="names"><span>War File:</span></div>
            <div class="w3-rest" style="float:left">
                <input class="w3-input w3-border" style="width:23em;"  id="warFileVal"
                       placeholder="Choose your app war file" type="text" disabled="disabled">
            </div>
            <div style="float:right">
                <input type="button" value="Choose a file" onclick="warFile.click()" class="w3-input w3-white w3-border w3-border-blue">
                <input type="file" id="warFile" style="display:none" onchange="change();warFileVal.value=this.value">
            </div>
        </div>
        <button type="button" class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" onclick="upload();">Upload</button>
    </form>
</div>

</body>
</html>
