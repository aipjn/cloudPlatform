<!DOCTYPE html>
<html>
<title>TEAM15</title>
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

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-white w3-card" id="myNavbar">
        <a href="#home" class="w3-bar-item w3-button w3-wide">TEAM15</a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
            <a href="#contact" class="w3-bar-item w3-button"><i class="fa fa-envelope"></i> CONTACT</a>
        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->

        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close</a>
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button">CONTACT</a>
</nav>

<!-- Header with full-height image -->
<header class="bgimg-1 w3-display-container w3-grayscale-min" id="home">
    <div class="w3-display-left w3-text-white" style="padding:48px">
        <span class="w3-jumbo w3-hide-small">Welcome to Sheffield Life</span><br>
        <span class="w3-xxlarge w3-hide-large w3-hide-medium">Welcome to Sheffield Life</span><br>
        <%--<span class="w3-large">Stop wasting valuable time with projects that just isn't you.</span>--%>
        <p><a href="home" class="w3-button w3-white w3-padding-large w3-large w3-margin-top w3-opacity w3-hover-opacity-off">Start for convenient</a></p>
    </div>
    <div class="w3-display-bottomleft w3-text-grey w3-large" style="padding:24px 48px">
        <i class="fa fa-facebook-official w3-hover-opacity"></i>
        <i class="fa fa-instagram w3-hover-opacity"></i>
        <i class="fa fa-snapchat w3-hover-opacity"></i>
        <i class="fa fa-pinterest-p w3-hover-opacity"></i>
        <i class="fa fa-twitter w3-hover-opacity"></i>
        <i class="fa fa-linkedin w3-hover-opacity"></i>
    </div>
</header>

<!-- About Section -->
<div class="w3-container" style="padding:128px 16px" id="about">
    <h3 class="w3-center">Enjoy Our Design App</h3>
    <%--<p class="w3-center w3-large">Key features of our company</p>--%>
    <div class="w3-row-padding w3-center" style="margin-top:64px">
        <%--<div class="w3-quarter">--%>
            <%--<i class="fa fa-desktop w3-margin-bottom w3-jumbo w3-center"></i>--%>
            <%--<p class="w3-large">Responsive</p>--%>
            <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>--%>
        <%--</div>--%>
        <div class="w3-half">
            <i class="fa fa-exchange w3-margin-bottom w3-jumbo"></i>
            <p class="w3-large">Exchange</p>
            <p>Check the Real Time Exchange Rates and find the nearest exchange bank</p>
        </div>

        <div class="w3-half">
            <i class="material-icons" style="font-size:72px">restaurant</i>
            <p class="w3-large">Restaurant</p>
            <p>Try different restaurants with different cuisines</p>
        </div>
        <%--<div class="w3-quarter">--%>
            <%--<i class="fa fa-cog w3-margin-bottom w3-jumbo"></i>--%>
            <%--<p class="w3-large">Support</p>--%>
            <%--<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore.</p>--%>
        <%--</div>--%>
    </div>
</div>





<!-- Contact Section -->
<div class="w3-container w3-light-grey" style="padding:128px 16px" id="contact">
    <h3 class="w3-center">CONTACT</h3>
    <p class="w3-center w3-large">Lets get in touch. Send us a message.</p>
    <div class="w3-row-padding" style="margin-top:64px">
        <div style="margin-left: 40%">
            <p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i> Sheffield, UK</p>
            <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"> </i> Email: team15cloud@gmail.com</p>
            <br>
        </div>
    </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black w3-padding-64">
    <a href="#home" class="w3-button w3-light-grey"><i class="fa fa-arrow-up w3-margin-right"></i>To the top</a>
    <%--<div class="w3-xlarge w3-section">--%>

    <%--</div>--%>
    <%--<p>Thanks</p>--%>
</footer>


</body>
</html>