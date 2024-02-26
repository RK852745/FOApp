$(function () {
    SearchLocation("");
});

function SearchLocation(searchText) {
    var isHindiSearch = "false";
    searchText = "Delhi"; 
    var username = "DevUser",
        password = "Dev@123"; 
    blogData = {};
    $.ajax({
        url: 'https://sslapi.ritcologistics.com/Apigateway/Gateway/GetLocations?searchText=' + searchText + '&isHindiSearch=' + isHindiSearch +'',
        type: "POST",
        contentType: "application/json",
        data:  blogData,
        dataType: "json",
        headers: { 'Authorization': 'Basic ' + btoa(username + ':' + password) },
        success: function (result) {
            // On success, 'data' contains a list of products.  
            var data = JSON.parse(result);
        },
        error: function (err) {
            alert(err.statusText);
        }
    });
}