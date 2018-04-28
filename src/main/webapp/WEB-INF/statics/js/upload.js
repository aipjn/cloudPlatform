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
        alert("please select a picture！");
        return;
    }
    var warFile = document.getElementById("warFile");
    var fileType = warFile.value.split(".")[warFile.value.split(".").length - 1];
    if(fileType!='war'){
        alert("please select a war file！");
        return;
    }
    var myFile = warFile.files[0];
    if(!myFile){
        alert("please select a war file！");
        return;
    }
    var name =$("#appName").val();
    $.ajax({
        url: 'checkAppName',
        method: 'post',
        data: "name=" + name,
        success: function (data) {
            if(data.state == "success"){
                upload();
            }else{
                alert("The name is taken, please try another one")
            }
        },
        error: function () {
            alert("error");
        }
    });
}

function upload() {
    var warFile = document.getElementById("warFile");
    var myFile = warFile.files[0];
    var description = $("#description").val();
    var name = $("#appName").val();
    var price = $("#price").val();
    var formData = new FormData();
    formData.append("warFile", myFile);
    formData.append("name", name);
    formData.append("price", price);
    formData.append("description", description);
    formData.append("icon", picReader.result);
    $.ajax({
        url: 'addApp',
        method: 'post',
        processData : false,
        contentType : false,
        data: formData,
        success: function (data) {
            alert("suc");
            // window.location.href = "home?name=" + data.name;
            return true;
        },
        error: function () {
            alert("error");
        }
    });
}