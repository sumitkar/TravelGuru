function isNumberKey(evt){
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    return true;
}

function validateForm() {
    var x = document.forms["RegForm"]["name"].value;
    if (x == null || x == "") {
        alert("Please fill the name");
        return false;
    }
    var y = document.forms["RegForm"]["email"].value;
    if (y == null || y == "") {
        alert("Please enter your email");
        return false;
    }
    
    var z = document.forms["RegForm"]["mobile"].value;
    if (z == null || z == "") {
        alert("Please enter your Mobile Number");
        return false;
    }
    
    var a = document.forms["RegForm"]["address"].value;
    if (a == null || a == "") {
        alert("Please enter your Address");
        return false;
    }
    
    
    var p1 = document.forms["RegForm"]["password"].value;
    var p2 = document.forms["RegForm"]["password_confirmation"].value;
    if (p1 == null || p1 == "") {
        alert("Password should not be Blank.");
        return false;
    }
    if (p1 != p2) {
        alert("Please repeat same Password");
        return false;
    }
}


function validateBookingForm() {
    var x = document.forms["book"]["b_date"].value;
    if (x == null || x == "dd-mm-yyyy" || x=="dd-mm-2015") {
        alert("Please select a Date");
        return false;
    }
}
