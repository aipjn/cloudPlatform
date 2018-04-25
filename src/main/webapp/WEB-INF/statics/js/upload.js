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
    picReader.readAsDataURL(myFile);
    picReader.onload = function(){
        picture.src=this.result;
    }
}

function upload() {
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
    var description = $("#description").val();
    var name = $("#appName").val();
    var formData = new FormData();
    formData.append("warFile", myFile);
    formData.append("name", name);
    formData.append("description", description);
    formData.append("icon", picReader.result);
    formData.append("description", description);
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