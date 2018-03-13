<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Sing in">
    <meta name="author" content="Jijing">
    <link rel="icon" href="image/sheffield_573b22062c317.png">

    <title>Sign up</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <script>
        function createAccount() {
            window.location.href="index.html"
        }
    </script>
</head>

<%--<body class="text-center" background="../assets/img/Sheffield-gb12161_uxga.jpg">--%>
<form class="form-signin">
    <!--<img class="mb-4" src="https://getbootstrap.com/assets/brand/bootstrap-solid.svg" alt="" width="72" height="72">-->
    <img class="mb-4" src="image/SheffieldLogo.png" class="img-responsive" width="250" height="111">
    <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
    <label for="inputEmail" class="sr-only">Email address</label>
    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    <label for="userName" class="sr-only">Username</label>
    <input type="text" id="userName" class="form-control" placeholder="Username" required>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="accept"> I agree to the Terms of Service and the Privacy Policy.
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" onclick="createAccount()">Creat an account</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>
</form>
</body>
</html>
