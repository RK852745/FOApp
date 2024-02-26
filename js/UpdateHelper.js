$(function () {
    var qstring = "";
    qstring = getUrlVars();
    GetDataForUpdate(qstring);
});




$(function () {
    //getDate();
    initGeolocation();
});

function getDate() {
    var today = new Date();
    document.getElementById("VisitingDate").value = today.getFullYear() + '-' + ('0' + (today.getMonth() + 1)).slice(-2) + '-' + ('0' + today.getDate()).slice(-2);
    document.getElementById("VisitingTime").value = today.getHours() + ":" + ('0' + today.getMinutes()).slice(-2);
}


function initGeolocation() {
    if (navigator.geolocation) {
        // Call getCurrentPosition with success and failure callbacks
        navigator.geolocation.getCurrentPosition(success, fail);
    }
    else {
        alert("Sorry, your browser does not support geolocation services.");
    }
}

function success(position) {
    document.getElementById('Longitude').value = position.coords.longitude;
    document.getElementById('Latitude').value = position.coords.latitude
}

function fail() {
    // Could not obtain location
}

function fnAddVehiclebtn(current) {
    var vehicletype = $.trim($("#vehicleType option:selected").val()),
        vehiclesize = $.trim($("#vehicleSize option:selected").val()),
        vehiclecapacity = $.trim($("#vehicleCapacity option:selected").val()),
        vehiclecount = $.trim($("#vehicleCount").val());

    if (vehicletype.length != 0 && vehiclesize.length != 0 && vehiclecapacity.length != 0 && vehiclecount.length != 0) {
        var card = '<div class="card newvehicleinsert p-2 mb-3"><a class="removeVehicle"><i class="fa fa-times"></i></a>\
            <div class="w-100 d-flex"><div class="w-50"><div><small>Vehicle Type</small></div>\
            <div><strong class="vtype">'+ vehicletype + '</strong></div></div><div class="w-50"><div><small>Vehicle Size</small></div>\
            <div><strong class="vsize">'+ vehiclesize + '</strong></div></div></div > <div class="w-100 d-flex"><div class="w-50">\
            <div><small>Vehicle Capacity</small></div><div><strong class="vcapacity">'+ vehiclecapacity + '</strong></div></div>\
            <div class="w-50"><div><small>Vehicle Count</small></div><div><strong class="vcount">'+ vehiclecount + '</strong></div></div></div></div>';
        $("#appendaddedvichle").prepend(card);

        $(".removeVehicle").click(function (e) {
            e.stopImmediatePropagation();
            $(this).parent().remove();
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Vehicle Removed Successfully',
                showConfirmButton: false,
                timer: 1500
            })
        });
        $("#vehicleType").prop("selectedIndex", 0);
        $("#vehicleSize").prop("selectedIndex", 0);
        $("#vehicleCapacity").prop("selectedIndex", 0);
        $("#vehicleCount").val('1');


    } else {
        alert('please select Vehicle');
    }

}

function fnAddLocationbtn(current) {
    var from = $.trim($("#FromLoc").val()),
        to = $.trim($("#ToLoc").val());
    if (from.length != 0 && from.length != 0) {
        var loccard = '<div class="card newloctaioninsert p-2 mb-2"><a class="removeVehicle"><i class="fa fa-times"></i>\
        </a><div class="d-flex" style="width: 100%"><div class="text-center" style="width: 45%">\
        <div><strong class="locationfrom">'+ from + '</strong></div></div>\
        <div class="text-center" style="width: 10%"><i class="fa fa-exchange" aria-hidden="true"></i></div>\
        <div class="text-center" style="width: 45%"><div><strong class="locationto">'+ to + '</strong></div></div></div></div>';
        $("#appendlocation").prepend(loccard);
        $(".removeVehicle").click(function (e) {
            e.stopImmediatePropagation();
            $(this).parent().remove();
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: 'Preferred location removed successfully',
                showConfirmButton: false,
                timer: 1500
            })
        });
        $("#FromLoc").val('');
        $("#ToLoc").val('');
    }
    else {
        alert('please add preferred location');
    }
}

 function readImage(file, type) {
    var reader = new FileReader();
    var image = new Image();

    reader.readAsDataURL(file);
    reader.onload = function (_file) {
        image.src = _file.target.result; 

        var imageUrl = "https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=" + this.src;
        //var imageUrl = 'https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + this.src + '&Position=2';

        image.onload = function () {
            if (type == 1) {
                $('#imagePreview1').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%" class="newSticker" src="' + imageUrl + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
                removeimg();
            }
            else if (type == 2) {
                $('#imagePreview2').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%" class="newOwnerInfo" src="' + imageUrl + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
                removeimg();
            }
            else if (type == 3) {
                $('#imagePreview3').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%" class="newVisitingCard" src="' + imageUrl + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
                removeimg();
            }
        };
    };

    image.onerror = function () {
        alert("Invalid file type: " + file.type);
    };
};

//$(".uploadimagefile").change(function (e) {
//    var typefor = $(this).attr('typefor');
//    if (this.disabled) {
//        return alert("File upload not supported!");
//    }
//    var F = this.files;
//    if (F && F[0]) {
//        for (var i = 0; i < F.length; i++) {
//            readImage(F[i], typefor);
//        }
//    }
//});


//$(".uploadimagefile").change(function () {
//    var typefor = $(this).attr('typefor');
//    readURL(this, typefor);
//});

function removeimg(forremove) {
    $(".imageremove").click(function (e) {
        e.stopImmediatePropagation();
        $(this).parent().parent().remove();
    });
    if (forremove == "1") {
        $("#inputGroupFileSticker").val('');
        return;
    }
    if (forremove == "2") {
        $("#inputGroupFileowner").val('');
        return;
    }
    if (forremove == "3") {
        $("#inputGroupFilevisitingcard").val('');
        return;
    }
}



function getUrlVars() {
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1);
    return hashes;
}

function GetDataForUpdate(qstring) {
    var url = "/Update.aspx/MethodGetDataForUpdate";
    var data = JSON.stringify({ fovmid: qstring });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        var visitdetails = JSON.parse(JsonResult).table;
        var OwnerInfo = JSON.parse(JsonResult).table1;
        var PreferredLocation = JSON.parse(JsonResult).table2;
        var Sticker = JSON.parse(JsonResult).table3;
        var VehicleInfo = JSON.parse(JsonResult).table4;
        var VisitingCard = JSON.parse(JsonResult).table5;
        if (visitdetails != "") {
            $("#ownTypes option[value=" + visitdetails[0].owntype + "]").prop("selected", true);
            if (visitdetails[0].owntype == "broker") {
                $(".OwnerAssetsInfo").removeClass('d-none');
                //$(".PreferredLoctaion").addClass('d-none');
                //$(".StickeringStatus").addClass('d-none');
                $(".PreferredLoctaion input").val('');
                $(".OwnerAssetsInfo select").prop("selectedIndex", 0);
                $(".StickeringStatus input").val('');
                $("#appendaddedvichle,#imagePreview1,#imagePreview2,#appendlocation").empty();

                if (VehicleInfo[0].vehicleowntype == "market") {
                    $("#inlineRadio2").prop('checked', true);
                    $("#inlineRadio1").prop('checked', false);
                } else if (VehicleInfo[0].vehicleowntype == "own") {
                    $("#inlineRadio1").prop('checked', true);
                    $("#inlineRadio2").prop('checked', false);
                }
                

            } else {
                $(".OwnerAssetsInfo").addClass('d-none');
                //$(".PreferredLoctaion").removeClass('d-none');
                //$(".StickeringStatus").removeClass('d-none');
            }

            if (visitdetails[0].status != "") {
                $("#Status option[value=" + visitdetails[0].status + "]").prop("selected", true);
            }

            $("#Remarks").val(visitdetails[0].remarks);
            $("#FullName").val(visitdetails[0].name);
            $("#phone").val(visitdetails[0].mobile);
            $("#email").val(visitdetails[0].emailid);
            $("#Address").val(visitdetails[0].address);
            $("#Company").val(visitdetails[0].company);
            $("#VisitingDate").val(visitdetails[0].visitdate);
            $("#VisitingTime").val(visitdetails[0].visittime);
            $("#Latitude").val(visitdetails[0].latitude);
            $("#Longitude").val(visitdetails[0].longitude);
            $("#updatebtn").attr('updateid', qstring)


            if (visitdetails[0].stickeringstatus == "Y") {
                $("#stickeryes").prop('checked', true);
                $("#stickerno").prop('checked', false);
            }
            else {
                $("#stickeryes").prop('checked', false);
                $("#stickerno").prop('checked', true);
            }
        }
        if (VisitingCard != "") {
            var vcard = "";
            for (var i = 0; i < VisitingCard.length; i++) {
               var imageUrl = "https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=" + VisitingCard[i].imageurl;
                //var imageUrl = 'https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + VisitingCard[i].imageurl + '&Position=2';

                vcard = vcard + '<div class="col-4 mb-2"><div style="padding: 5px;background: #858585;border-radius: 5px;"><div style="height: 90px;background:#fff;text-align: center;"><img style="width:100%;height:100%;" class="" src="' + imageUrl + '"></div><div onclick="deletevisitingcardfromdb($(this),' + VisitingCard[i].vcid + ')" class="imageremove2"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>';
            }

            $("#imagePreview3").empty();
            $("#imagePreview3").append(vcard);

        }
        if (VehicleInfo != "") {
            var vicard = "";
            for (var i = 0; VehicleInfo.length > i; i++) {
                vicard = vicard + '<div class="card p-2 mb-3" style="background: #d9d9d9;"><a onclick="fndeletevinfobyid($(this),' + VehicleInfo[i].viid + ')" class="removeVehicle2"><i class="fa fa-times"></i></a>\
            <div class="w-100 d-flex"><div class="w-50"><div><small>Vehicle Type</small></div>\
            <div><strong class="vtype">'+ VehicleInfo[i].vehicletype + '</strong></div></div><div class="w-50"><div><small>Vehicle Size</small></div>\
            <div><strong class="vsize">'+ VehicleInfo[i].vehiclesize + '</strong></div></div></div > <div class="w-100 d-flex"><div class="w-50">\
            <div><small>Vehicle Capacity</small></div><div><strong class="vcapacity">'+ VehicleInfo[i].vehiclecapacity + '</strong></div></div>\
            <div class="w-50"><div><small>Vehicle Count</small></div><div><strong class="vcount">'+ VehicleInfo[i].vehiclecount + '</strong></div></div></div></div>';;
            }
            $("#appendaddedvichle").empty();
            $("#appendaddedvichle").append(vicard);
        }
        if (PreferredLocation != "") {
            var plcard = "";
            for (var i = 0; PreferredLocation.length > i; i++) {
                plcard = plcard + '<div class="card p-2 mb-2" style="background: #d9d9d9;"><a onclick="fndeletepreflocdatabyid($(this),' + VehicleInfo[i].plmid + ')" class="removeVehicle2"><i class="fa fa-times"></i>\
                </a><div class="d-flex" style="width: 100%"><div class="text-center" style="width: 45%">\
                <div><strong class="locationfrom">'+ PreferredLocation[i].fromloction + '</strong></div></div>\
                <div class="text-center" style="width: 10%"><i class="fa fa-exchange" aria-hidden="true"></i></div>\
                <div class="text-center" style="width: 45%"><div><strong class="locationto">'+ PreferredLocation[i].tolocation + '</strong></div></div></div></div>';
                $("#appendlocation").empty();
                $("#appendlocation").append(plcard);
            }



        }

        if (Sticker != "") {
            var stcard = "";
            for (var i = 0; Sticker.length > i; i++) {
                stcard = stcard + '<div class="col-4 mb-2"><div style="padding: 5px;background: #858585;border-radius: 5px;"><div style="height: 90px;background:#fff;text-align: center;"><img style="width:100%;height:100%;" class="" src="uploadedimages/' + Sticker[i].imageurl + '"></div><div onclick="deletestickerimagefromdb($(this),' + Sticker[i].stid + ')" class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>';
            }
            $("#imagePreview1").empty();
            $("#imagePreview1").append(stcard);

        }

        if (OwnerInfo != "") {
            var oicard = "";
            for (var i = 0; OwnerInfo.length > i; i++) {
                oicard = oicard + '<div class="col-4 mb-2"><div style="padding: 5px;background: #858585;border-radius: 5px;"><div style="height: 90px;background:#fff;text-align: center; "><img style="width:100%;height:100%;" class="" src="uploadedimages/' + OwnerInfo[i].imageurl + '"></div><div onclick="deleteOwnerimagefromdb($(this),' + OwnerInfo[i].oiid + ')" class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>';
            }
            $("#imagePreview2").empty();
            $("#imagePreview2").append(oicard);

        }
    }
}
var qstring = "";
qstring = getUrlVars();
function deletevisitingcardfromdb(current, vcid) {
    updatedatabyid(vcid, 'vcard', qstring)
}

function deletestickerimagefromdb(current, stid) {
    updatedatabyid(stid, 'scard', qstring)
}
function deleteOwnerimagefromdb(current, oiid) {
    updatedatabyid(oiid, 'ocard', qstring)
}

function fndeletevinfobyid(current, viid) {
    updatedatabyid(viid, 'vinfo', qstring)
}
function fndeletepreflocdatabyid(current, plmid) {
    updatedatabyid(plmid, 'plinfo', qstring)
}

function updatedatabyid(updateid, updatefor, fovmid) {
    var url = "/Update.aspx/MethodUpdatedatabyid";
    var data = JSON.stringify({ fovmid: fovmid, updatefor: updatefor, updateid: updateid });
    var JsonResult = doAjax(url, data);
    if (JsonResult == "Y") {
        GetDataForUpdate(qstring);
        Swal.fire({
            position: 'top-end',
            icon: 'success',
            title: 'Image Deleted Successfully',
            showConfirmButton: false,
            timer: 1500
        })
    }

}


function fnUpdateBtn(current) {
    var updateid = current.attr('updateid');
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#696cff',
        cancelButtonColor: '#7c7c7c',
        confirmButtonText: 'Yes, update it!'
    }).then((result) => {
        if (result.isConfirmed) {
            updatealldata(updateid);

        }
    })
}


function updatealldata(updateid) {
    var type = $.trim($("#ownTypes option:selected").val()),
        fullname = $.trim($("#FullName").val()),
        phoneno = $.trim($("#phone").val()),
        email = $.trim($("#email").val()),
        emaildomain = $.trim($("#email").val()),
        address = $.trim($("#Address").val()),
        stickeringstatus = $("#stickeryes").prop('checked') == true ? 'Y' : 'N',
        vehicletype = $.trim($("#vehicleType option:selected").val()),
        vehiclesize = $.trim($("#vehicleSize option:selected").val()),
        vehiclecapacity = $.trim($("#vehicleCapacity option:selected").val()),
        vehiclecount = $.trim($("#vehicleCount").val()),
        locationfrom = $.trim($("#FromLoc").val()),
        locationto = $.trim($("#ToLoc").val()),
        uploadimagewithsticker = $.trim($("#imagePreview1").attr('src')),
        uploadimagewithowner = $.trim($("#imagePreview2").attr('src')),
        Latitude = $.trim($("#Latitude").val()),
        Longitude = $.trim($("#Longitude").val()),
        VisitDate = $.trim($("#VisitingDate").val()),
        VisitTime = $.trim($("#VisitingTime").val()),
        status = $.trim($("#Status option:selected").val()),
        remarks = $.trim($("#Remarks").val()),
        Company = $.trim($("#Company").val());
    var VehicleOwnType = '';
    if ($("input[type='radio'].inlineRadio").is(':checked')) {
        VehicleOwnType = $("input[type='radio'].inlineRadio:checked").val();
    }

    var visitingcardList = [];
    if ($('#imagePreview3 .newVisitingCard').length > 0) {
        $("#imagePreview3 .newVisitingCard").each(function () {
            visitingcardList.push({
                VisitingCardUrl: $(this).attr('src').replace(/^data:image\/(png|jpg|jpeg);base64,/, ""),
            })
        })
    }
  

// Now, visitingcardList contains objects with VisitingCardUrl and ImageKey

    var ownerinfoList = [];
    if ($('#imagePreview2 .newOwnerInfo').length > 0) {
        $("#imagePreview2 .newOwnerInfo").each(function () {
            ownerinfoList.push({
                imagewithownerurl: $(this).attr('src').replace(/^data:image\/(png|jpg|jpeg);base64,/, ""),
            })
        })
    }


    var stickerList = [];
    if ($('#imagePreview1 .newSticker').length > 0) {
        $("#imagePreview1 .newSticker").each(function () {
            stickerList.push({
                imagewithstickerurl: $(this).attr('src').replace(/^data:image\/(png|jpg|jpeg);base64,/, ""),
            })
        })
    }
    var veiclelist = [];
    var locationList = [];
    if ($('#appendaddedvichle .newvehicleinsert').length > 0) {
        $("#appendaddedvichle .newvehicleinsert").each(function () {
            veiclelist.push({
                VehicleType: $(this).find('.vtype').text(),
                VehicleSize: $(this).find('.vsize').text(),
                Vehiclecapacity: $(this).find('.vcapacity').text(),
                VehicleCount: $(this).find('.vcount').text()
            })
        })
    }
    else {
        if (vehicletype != "" && vehiclesize != "" && vehiclecapacity != "" && vehiclecount != "") {
            veiclelist.push({
                VehicleType: vehicletype,
                VehicleSize: vehiclesize,
                Vehiclecapacity: vehiclecapacity,
                VehicleCount: vehiclecount
            })
        }

    }
    if ($('#appendlocation .newloctaioninsert').length > 0) {
        $("#appendlocation .newloctaioninsert").each(function () {
            locationList.push({
                FromLoction: $(this).find('.locationfrom').text(),
                ToLocation: $(this).find('.locationto').text(),

            })
        })
    }
    else {
        if (locationfrom != "" && locationto != "") {
            locationList.push({
                FromLoction: locationfrom,
                ToLocation: locationto
            })
        }
    }
    var url = "/Update.aspx/MethodUpdateVisitData";
    var data = JSON.stringify({
        type: type,
        fullname: fullname,
        phoneno: phoneno,
        email: email,
        emaildomain: emaildomain,
        address: address,
        stickeringstatus: stickeringstatus,
        stickerList: stickerList,
        ownerinfoList: ownerinfoList,
        Latitude: Latitude,
        Longitude: Longitude,
        VisitDate: VisitDate,
        VisitTime: VisitTime,
        visitingcardList: visitingcardList,
        veiclelist: veiclelist,
        locationList: locationList,
        Company: Company,
        updateid: updateid,
        status: status,
        remarks: remarks,
        VehicleOwnType: VehicleOwnType
    });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        JsonResult = JsonResult.split("|");
        if (JsonResult[1] == "success") {
            Swal.fire({
                position: 'top-end',
                icon: JsonResult[1],
                title: JsonResult[0],
                showConfirmButton: false,
                timer: 2500
            })
            GetDataForUpdate(qstring);
        }
        else {
            Swal.fire({
                position: 'top-end',
                icon: JsonResult[1],
                title: JsonResult[0],
                showConfirmButton: false,
                timer: 2500
            })
        }
    }


}






let result = document.querySelector(".result"),
    img_result = document.querySelector(".img-result"),
    img_w = document.querySelector(".img-w"),
    img_h = document.querySelector(".img-h"),
    options = document.querySelector(".options"),
    save = document.querySelector(".save"),
    cropped = document.querySelector(".cropped"),
    dwn = document.querySelector(".download"),
    upload = document.querySelector("#inputGroupFileSticker"),
    type = "";
cropper = "";


//$(".uploadimagefile").change(function (e) {

//    type = $(this).attr('typefor');

//    if (e.target.files.length) {
//        // start file reader
//        img_result.classList.add("hide");
//        $("#CropPicPopupNew").modal('show');
//        const reader = new FileReader();
//        reader.onload = (e) => {
//            if (e.target.result) {
//                // create new image
//                let img = document.createElement("img");
//                img.id = "image";
//                img.src = e.target.result;
//                // clean result before
//                result.innerHTML = "";
//                // append new image
//                result.appendChild(img);
//                // show save btn and options
//                save.classList.remove("hide");
//                options.classList.remove("hide");
//                // init cropper
//                cropper = new Cropper(img);
//            }
//        };
//        reader.readAsDataURL(e.target.files[0]);
//    }
//});
$(".save").click(function (e) {
    e.preventDefault();
    // get result to data uri
    let imgSrc = cropper
        .getCroppedCanvas({
            width: img_w.value // input value
        })
        .toDataURL();
    // remove hide class of img
    cropped.classList.remove("hide");
    img_result.classList.remove("hide");
    // show image cropped
    cropped.src = imgSrc;
   var imageUrl = "https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=" + this.src;
    //var apiUrl = 'https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + imageKey + '&Position=2';

    if (type == 1) {
        $('#imagePreview1').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="newSticker" src="' + imageUrl + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
        removeimg(type);
    }
    else if (type == 2) {
        $('#imagePreview2').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="newOwnerInfo" src="' + imageUrl + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
        removeimg(type);
    }
    else if (type == 3) {
        $('#imagePreview3').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="newVisitingCard" src="' + imageUrl + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
        removeimg(type);
    }
    $("#CropPicPopupNew").modal('hide');
});


$("#ownTypes").change(function () {
    var itsVal = $.trim($("#ownTypes option:selected").val());
    if (itsVal == "broker") {
        $(".OwnerAssetsInfo").addClass('d-none');
        $(".PreferredLoctaion").addClass('d-none');
        $(".StickeringStatus").addClass('d-none');
        $(".PreferredLoctaion input").val('');
        $(".OwnerAssetsInfo select").prop("selectedIndex", 0);
        $(".StickeringStatus input").val('');
        $("#appendaddedvichle,#imagePreview1,#imagePreview2,#appendlocation").empty();

    } else {
        $(".OwnerAssetsInfo").removeClass('d-none');
        $(".PreferredLoctaion").removeClass('d-none');
        $(".StickeringStatus").removeClass('d-none');
    }
});



var userId = '<%= Session["UserId"] %>'; 
var imgxrcValues = [];


function uploadImage(inputElement, targetDivId) {
    var file = inputElement.files[0];

    if (file) {
        var formData = new FormData();
        formData.append('file', file);
        formData.append('bucketName', 'trucksup'); 
        formData.append('Id', userId);
        formData.append('RequestId', userId);
        //formData.append('Position', '2');

        var xhr = new XMLHttpRequest();
        var apiUrl = 'https://sslapi.trucksups.in/S3ImageAPI/upload-imagefile'; 

        xhr.open('POST', apiUrl, true);

        xhr.onload = function () {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                console.log('Response from API:', response);
                var imageKey = response.imagekey;
                fetchAndDisplayImage(imageKey, targetDivId);
            } else {
                console.error('Error from API:', xhr.status, xhr.statusText);
            }
        };

        xhr.send(formData);
    } else {
        console.log('Please select an image to upload.');
    }
}

function fetchAndDisplayImage(imageKey, targetDivId) {
    var apiUrl = 'https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + imageKey;
    //var apiUrl = 'https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + imageKey + '&Position=2';
    $.ajax({
        url: apiUrl,
        type: 'GET',
        xhrFields: {
            responseType: 'blob'
        },
        success: function (data) {
            if (data) {
                var imageUrl = URL.createObjectURL(data);

                var imageContainer = $('<div class="col-4 mb-2"></div>');
                var innerContentDiv = $('<div style="padding: 5px; background: #e0e0e0; border-radius: 5px;"></div>');
                var imageDiv = $('<div style="height: 90px; background: #fff;"></div>');
                var imgElement = $('<img style="width: 100%; height: 100%;" />');
                imgElement.attr('src', imageUrl);
                imgElement.attr('imgxrc', imageKey);
                imgxrcValues.push(imageKey);

                var removeButtonDiv = $('<div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div>');

                removeButtonDiv.click(function () {
                    imageContainer.remove();
                });

                imageDiv.append(imgElement);
                innerContentDiv.append(imageDiv);
                innerContentDiv.append(removeButtonDiv);
                imageContainer.append(innerContentDiv);

                $('#' + targetDivId).append(imageContainer);
            } else {
                console.error('Empty response from Second API.');
            }
        },
        error: function (xhr, textStatus, errorThrown) {
            console.error('Error from Second API:', textStatus, errorThrown);
        }
    });
}
