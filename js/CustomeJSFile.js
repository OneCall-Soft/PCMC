
var time;
window.onload = resetTimer;
document.onkeypress = resetTimer;

function logout() {
    //Swal.fire("being redirected......");
    location.href = "Default.aspx";
}

function resetTimer() {

    clearTimeout(time);
    t = setTimeout(logout, 120000);
}


//MARK:- Checking if the amount is string or special 
function checkAmountValidation(amountToBeChecked) {
    if (/^[0-9]*$/.test(amountToBeChecked) == false) {
        return false;
    } else if (amountToBeChecked.length == 0 || amountToBeChecked == "0") { return false; } else { return true; }
}




// MARK:- Checking if Special Characters and Alphabets 
function checkSpecialCharacterandAlphabets(ToBecheckedString) {
    if (/^[0-9]*$/.test(ToBecheckedString) == false) {
        return false;
    } else { return true; }
}


// MARK:- Checking email format
function checkEmailFormat(ToBeCheckedEmailString) {
    if (ToBeCheckedEmailString.val().length > 0) {
        var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (regex.test(ToBeCheckedEmailString)) {
            return true;
        } else {
            return false;
        }
        return false;
    }



}
//function SetService() {
    
//    var ipaddress = "";
//    $.getJSON("https://api.ipify.org/?format=json", function (e) {
//        ipaddress = e.ip;

//        $.ajax({
//            type: "POST",
//            url: "Default.aspx/GetServiceList", //It calls our web method  
//            contentType: "application/json; charset=utf-8",
//            dataType: "json",
//            data: "{ip:'" + ipaddress + "'}",
//            success: function (data) {
//                for (var i = 0; i < data.d.length; i++) {
//                    var obj = data.d[i];
                   
//                    switch (obj.service) {
//                        case "propertytax":
//                            if (obj.status.trim() == 'disable') {
//                                $(".propertytaxstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightpink", "opacity": "0.6" }).attr('title', 'SERVICE IS DISABLED').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            } else if (obj.status == 'inpipeline') {
//                                $(".propertytaxstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightyellow", "opacity": "1" }).attr('title', 'SERVICE WILL BE AVAILABLE SOON').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            }

//                            break;
//                        case "watertax":
//                            if (obj.status.trim() == 'disable') {
//                                $(".watertaxstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightpink", "opacity": "0.6" }).attr('title', 'SERVICE IS DISABLED').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            } else if (obj.status == 'inpipeline') {
//                                $(".watertaxstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightyellow", "opacity": "1" }).attr('title', 'SERVICE WILL BE AVAILABLE SOON').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            }
//                            break;
//                        case "deathcertificate":
//                            if (obj.status.trim() == 'disable') {
//                                $(".deathcertificatestyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightpink", "opacity": "0.6" }).attr('title', 'SERVICE IS DISABLED').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            } else if (obj.status == 'inpipeline') {
//                                $(".deathcertificatestyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightyellow", "opacity": "1" }).attr('title', 'SERVICE WILL BE AVAILABLE SOON').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            }


//                            break;
//                        case "birthcertificate":

//                            if (obj.status.trim() == 'disable') {
//                                $(".birthcertificatestyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightpink", "opacity": "0.6" }).attr('title', 'SERVICE IS DISABLED').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            } else if (obj.status == 'inpipeline') {
//                                $(".birthcertificatestyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightyellow", "opacity": "1" }).attr('title', 'SERVICE WILL BE AVAILABLE SOON').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            }


//                            break;
//                        case "slumbilling":
//                            if (obj.status.trim() == 'disable') {
//                                $(".slumbillingstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightpink", "opacity": "0.6" }).attr('title', 'SERVICE IS DISABLED').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            } else if (obj.status == 'inpipeline') {
//                                $(".slumbillingstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightyellow", "opacity": "1" }).attr('title', 'SERVICE WILL BE AVAILABLE SOON').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            }
//                            break;

//                        case "grievancefeedback":

//                            if (obj.status.trim() == 'disable') {
//                                $(".gvfeedbackstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightpink", "opacity": "0.5" }).attr('title', 'SERVICE IS DISABLED').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            } else if (obj.status.trim() == 'inpipeline') {
//                                $(".gvfeedbackstyle").attr("disabled", "disabled").off("click").css({ "background-color": "lightyellow", "opacity": "1" }).attr('title', 'SERVICE WILL BE AVAILABLE SOON').children("a").addClass("disabled").click(function () {
//                                    return false;
//                                });
//                            }

//                            break;
//                        default:
//                            break;
//                    }
//                }

//            },
//            failure: function (error) {
//                alert(error);
//            }
//        });
//    });
  



//}


