<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/bootstrap.css" rel="stylesheet">
    <title>demo</title>

</head>

<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript" >
//    $(function(){
//        alert("hello")
//    });

    function ajax(){
        var d={
            ID:"11",
            name:"peng",
            password:"123456"
        };
        debugger;
        $.ajax({
            url: '/updateAttr',
            method: 'post',
            contentType:"application/json",
            data: JSON.stringify(d),
            success: function (data) {
                alert(data.status);
                return true;
            },
            error: function () {
                alert("error");
            }
        });
    }
</script>
<body>

<ul class="nav nav-justified" style="background:  blanchedalmond;height: 6rem;">

    <li class="nav-item">

        <a class="nav-link active" href="#">Active</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="#">Link</a>
    </li>
    <li class="nav-item">
        <p>Name</p>
    </li>
</ul>
<div class="container">
    <div class="row" >
        <div class="col-sm-4" style=" padding-top:1rem;">
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="image/demo.jpeg" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>
        </div>
        <div class="col-sm-4" style=" padding-top:1rem;">
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="image/demo.jpeg" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>
    </div>
            <div class="col-sm-4" style=" padding-top:1rem;">
    <div class="card" style="width: 18rem;">
        <img class="card-img-top" src="image/demo.jpeg" alt="Card image cap">
        <div class="card-body">
            <h5 class="card-title">Card title</h5>
            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
            <a href="#" class="btn btn-primary">Go somewhere</a>
        </div>
    </div>
            </div>

        <div class="col-sm-4" style=" padding-top:1rem;">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="image/demo.jpeg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-sm-4" style=" padding-top:1rem;">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="image/demo.jpeg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
        <div class="col-sm-4" style=" padding-top:1rem;">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="image/demo.jpeg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Card title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <a href="#" class="btn btn-primary">Go somewhere</a>
                </div>
            </div>
        </div>
    </div>


    <input type="button" onclick="ajax();" value="ajaxsubmit">
</div>
</body>
</html>
