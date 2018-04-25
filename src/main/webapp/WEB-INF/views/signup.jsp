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
            window.location.href = "index.html"
        }
    </script>
</head>

<body class="text-center" background="https://static1.squarespace.com/static/54733839e4b02590326819da/t/548877d5e4b07e036546f5d6/1418229719304/Sheffield+Cathedral-014.jpg?format=1500w">
<form class="form-signin" style="background-color: white">
    <img class="mb-4" src="image/SheffieldLogo.png" class="img-responsive" width="250" height="111">
    <%--<h1 class="h3 mb-3 font-weight-normal">Please sign up</h1>--%>
    <label for="inputEmail" class="sr-only">Email address</label>
    <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
    <label for="userName" class="sr-only">Username</label>
    <input type="text" id="userName" class="form-control" placeholder="Username" required>
    <label for="inputPassword" class="sr-only">Password</label>
    <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="accept">
            <span>I agree to the Terms of Service and the Privacy Policy.</span>
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" onclick="createAccount()">Creat an account</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2018-2019</p>
</form>
</body>
</html>
