
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