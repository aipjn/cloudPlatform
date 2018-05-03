var picReader = new FileReader();
function change() {
    var picture = document.getElementById("preview");
    var picFile = document.getElementById("picFile");
    var fileType = picFile.value.split(".")[picFile.value.split(".").length - 1];
    if(fileType!='png' && fileType!='jpeg'  && fileType!='jpg' ){
        alert("please select a picture！");
        return;
    }
    var myFile = picFile.files[0];
    if(myFile.size > 1024*1024){
        alert("picture size can not be bigger than 1M！");
        return;
    }
    $("#picFileVal").val(picFile.value);
    picReader.readAsDataURL(myFile);
    picReader.onload = function(){
        picture.src=this.result;
    }
}

function check() {
    if (picReader.result == null){
        alert("Please select a picture！");
        return;
    }
    var warFile = document.getElementById("warFile");
    var fileType = warFile.value.split(".")[warFile.value.split(".").length - 1];
    if(fileType!='war'){
        alert("Please select a war file！");
        return;
    }
    var myFile = warFile.files[0];
    if(!myFile){
        alert("Please select a war file！");
        return;
    }
    var name =$("#appName").val();
    $("#loading").show();
    $.ajax({
        url: 'checkAppName',
        method: 'post',
        data: "name=" + name,
        success: function (data) {
            $("#loading").hide();
            if(data.state == "success"){
                upload();
            }else{
                alert("The name is taken, please try another one")
            }
        },
        error: function () {
            $("#loading").hide();
            alert("Error");
        }
    });
}

function upload() {
    var warFile = document.getElementById("warFile");
    var myFile = warFile.files[0];
    var description = $("#description").val();
    var name = $("#appName").val();
    var price = $("#price").val();
    var location = $("#location").val();
    var formData = new FormData();
    formData.append("warFile", myFile);
    formData.append("name", name);
    formData.append("price", price);
    formData.append("description", description);
    formData.append("icon", picReader.result);
    formData.append("location", location);
    $.ajax({
        url: 'addApp',
        method: 'post',
        processData : false,
        contentType : false,
        data: formData,
        success: function (data) {
            var confirm = window.confirm("You have uploaded your app, please wait for the administrator check");
            if ( confirm == true){
                window.location.href = "home";
                return true;
            }
        },
        error: function () {
            alert("Upload Error");
        }
    });
}