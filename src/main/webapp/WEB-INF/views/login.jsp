<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Login">
    <link rel="icon" href="image/sheffield_573b22062c317.png">
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">


    <title>Login</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <script>

        document.onkeydown = function (event) {
            if (event.keyCode == "13") {
                login();
            }
        };

        function login() {

            var name = $("#userName").val();
            var password = $("#inputPassword").val();
            var data = {
                name: name,
                password: password
            };
            var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;

            if (myReg.test(name)) {
                data = {
                    email: name,
                    password: password
                };
            }

            $.ajax({
                url: 'userLogin',
                method: 'post',
                contentType:"application/json",
                data: JSON.stringify(data),
                success: function (data) {
                    if(data.state == "success"){
                        window.location.href = "home";
                        return true;
                    }
                    alert("wrong username or wrong password, please check");
                },
                error: function () {
                    alert("error");
                }
            });
        }
    </script>

    <style>
        body{
            background-image: url("/image/Footprint-Photography-Sheffield-from-the-air-005-Edit.jpg");
            background-size: 100%;
        }
    </style>
</head>
<body>

    <%@include file="header.jsp"%>

    <div class="w3-center" style="background: white">
        <form class="form-signin">
            <!--<img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">-->
            <img class="mb-4" src="image/SheffieldLogo.png" class="img-responsive" width="250" height="111">
            <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
            <label for="userName" class="sr-only">Username</label>
            <input type="text" id="userName"  class="form-control"  placeholder="Username/Email" >
            <label for="inputPassword" class="sr-only">Password</label>
            <input type="password" id="inputPassword"  class="form-control" placeholder="Password" >
            <%--<div class="checkbox mb-3">--%>
                <%--<label>--%>
                    <%--<input type="checkbox" value="accept"> I agree to the Terms of Service and the Privacy Policy.--%>
                <%--</label>--%>
            <%--</div>--%>
            <button class="btn btn-lg btn-primary btn-block" type="button" onclick="login();">Login</button>
            <p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>
        </form>
    </div>


</body>
</html>
