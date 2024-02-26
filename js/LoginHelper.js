debugger
$('#CheckCredentials').click(function (e) {
    e.stopImmediatePropagation();
    var current = $(this);
    current.attr('disabled', true);
    var UserName = $.trim($('#UserName').val());
    var Password = $.trim($('#Password').val());
    if (UserName.length != 10) {
        alert('Please enter your 10 digits mobile number');
        current.attr('disabled', false);
        return;
    }
    if (Password.length == 0) {
        alert('Please enter your login password');
        current.attr('disabled', false);
        return;
    }
     
    var url = '/Login.aspx/CheckCredentials';
    var data = JSON.stringify({ UserName: UserName, Password: Password });
    var JsonResult = doAjax(url, data);
    if (JsonResult != '') {
        var Result = JsonResult.split('|');
        if (Result[0] != 'Y') {
            alert(Result[1]);
            current.attr('disabled', false);
            return;
        }
        else {
            window.location.href = Result[1];
        }
    }
})
