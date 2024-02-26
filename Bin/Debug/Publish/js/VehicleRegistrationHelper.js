
$(function () {
    getDate();
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
        vehiclecount = $.trim($("#vehicleCount").val()),
        vehiclenumber = $.trim($("#vehiclenumber").val()),
        dnumber = $.trim($("#drivermobilenumbers").val()),
        rcimage = $.trim($("#imagePreview4 img").attr("imgxrc"));

    if (vehicletype.length != 0 && vehiclesize.length != 0 && vehiclecapacity.length != 0 && vehiclecount.length != 0) {
        var card = '<div class="card p-2 mb-3"><a class="removeVehicle"><i class="fa fa-times"></i></a>\
            <div class="w-100 d-flex"><div class="w-50"><div><small>Vehicle Type</small></div>\
            <div><strong class="vtype">'+ vehicletype + '</strong></div></div><div class="w-50"><div><small>Vehicle Size</small></div>\
            <div><strong class="vsize">'+ vehiclesize + '</strong></div></div></div > <div class="w-100 d-flex"><div class="w-50">\
            <div><small>Vehicle Capacity</small></div><div><strong class="vcapacity">'+ vehiclecapacity + '</strong></div></div>\
            <div class="w-50"><div><small>Vehicle Count</small></div><div><strong class="vcount">'+ vehiclecount + '</strong></div></div>\
            </div><div class="w-100 d-flex"><div class="w-50"><div><small>Rc Image</small></div><div><strong class="vrc" rcimgsrc="'+ rcimage + '"><i class="fa fa-image"></i></strong></div></div>\
            <div class="w-50"><div><small>Vehicle Number</small></div><div><strong class="vnumber">'+ vehiclenumber + '</strong></div></div></div>\
            <div class="w-100 d-flex"><div class="w-50"><div><small>Driver Mobile</small></div><div><strong class="dnumber">'+ dnumber + '</strong></div></div>\
            <div class="w-50"><div><small></small></div><div><strong class=""> </strong></div></div></div></div>';

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
        $("#vehiclenumber").val(''),
            $("#imagePreview4").empty();

    } else {
        alert('please select Vehicle');
    }

}

function fnAddLocationbtn(current) {
    var from = $.trim($("#FromLoc").val()),
        to = $.trim($("#ToLoc").val());
    if (from.length != 0 && from.length != 0) {
        var loccard = '<div class="card p-2 mb-2"><a class="removeVehicle"><i class="fa fa-times"></i>\
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

function readImage(input, type) {
    if (input.files && input.files[0]) {
        if (Math.round(input.files[0].size / (1024 * 1024)) > 5) {
            alert('Image size is too big. Please select image size less than 2 MB');
            return false;
        }
        var reader = new FileReader();
        reader.onload = function (e) {
            var imgVaryurl = getuplodedfileforpreview(e.target.result, type);
            if (type == 1) {
                $('#imagePreview1').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + e.target.result + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
                removeimg(type);
            }
            else if (type == 2) {
                $('#imagePreview2').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + e.target.result + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
                removeimg(type);
            }
            else if (type == 3) {
                $('#imagePreview3').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + e.target.result + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
                removeimg(type);
            }
            else if (type == 4) {
                $('#imagePreview4').append('<div class="col-6 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 100%; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + e.target.result + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
                removeimg(type);
            }
        }
        reader.readAsDataURL(input.files[0]);
    }



    //var reader = new FileReader();
    //var image = new Image(); 
    //reader.readAsDataURL(file);
    //reader.onload = function (_file) {
    //    image.src = _file.target.result; // url.createObjectURL(file);
    //    image.onload = function () {
    //        if (type == 1) {
    //            $('#imagePreview1').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="" src="' + this.src + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
    //            removeimg(type);
    //        }
    //        else if (type == 2) {
    //            $('#imagePreview2').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="" src="' + this.src + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
    //            removeimg(type);
    //        }
    //        else if (type == 3) {
    //            $('#imagePreview3').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="" src="' + this.src + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
    //            removeimg(type);
    //        }
    //    };
    //};

    //image.onerror = function () {
    //    alert("Invalid file type: " + file.type);
    //};
};

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

  function fnSubmitBtn(current) {
    current.attr('disabled', 'disabled');
    var type = $.trim($("#ownTypes option:selected").val()),
        fullname = $.trim($("#FullName").val()),
        phoneno = $.trim($("#basic-icon-default-phone").val()),
        email = $.trim($("#email").val()),
        emaildomain = $.trim($("#basic-icon-default-email2").val()),
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
        vehiclenumber = $.trim($("#vehiclenumber").val()),
        DriverNum = $.trim($("#drivermobilenumbers").val()),
        rcimage = $.trim($("#imagePreview4 img").attr("imgxrc")),
        verifytype = $("#verifiedbycall").prop('checked') == true ? 'call' : 'otp';
    Company = $.trim($("#Company").val());

    var IsMobileVerified = "N";
    if ($(".verifystatus").hasClass('verified')) {
        IsMobileVerified = "Y";
    }

    var VehicleOwnType = '';
    if ($("input[type='radio'].inlineRadio").is(':checked')) {
        VehicleOwnType = $("input[type='radio'].inlineRadio:checked").val();
    }


    var visitingcardList = [];
    if ($('#imagePreview3 img').length > 0) {
        $("#imagePreview3 img").each(function () {
            visitingcardList.push({
                VisitingCardUrl: $(this).attr('imgxrc'),
            })
        })
    }
    else {
        visitingcardList.push({
            VisitingCardUrl: '',
        })
    }

    var ownerinfoList = [];
    if ($('#imagePreview2 img').length > 0) {
        $("#imagePreview2 img").each(function () {
            ownerinfoList.push({
                imagewithownerurl: $(this).attr('imgxrc'),
            })
        })
    }
    else {
        ownerinfoList.push({
            imagewithownerurl: '',
        })
    }

    var stickerList = [];
    if ($('#imagePreview1 img').length > 0) {
        $("#imagePreview1 img").each(function () {
            stickerList.push({
                imagewithstickerurl: $(this).attr('imgxrc'),
            })
        })
    }
    else {
        stickerList.push({
            imagewithstickerurl: '',
        })
    }

    var veiclelist = [];
    var locationList = [];
    if ($('#appendaddedvichle .card').length > 0) {
        $("#appendaddedvichle .card").each(function () {
            veiclelist.push({
                VehicleType: $(this).find('.vtype').text(),
                VehicleSize: $(this).find('.vsize').text(),
                Vehiclecapacity: $(this).find('.vcapacity').text(),
                VehicleCount: $(this).find('.vcount').text(),
                VehicleRC: $(this).find('.vrc').attr("rcimgsrc"),
                VehicleNum: $(this).find('.vnumber').text(),
                DriverNum: $(this).find('.dnumber').text()
            })
        })
    }
    else {
        veiclelist.push({
            VehicleType: vehicletype,
            VehicleSize: vehiclesize,
            Vehiclecapacity: vehiclecapacity,
            VehicleCount: vehiclecount,
            VehicleRC: vehiclenumber,
            VehicleNum: rcimage,
            DriverNum: DriverNum
        })
    }
    if ($('#appendlocation .card').length > 0) {
        $("#appendlocation .card").each(function () {
            locationList.push({
                FromLoction: $(this).find('.locationfrom').text(),
                ToLocation: $(this).find('.locationto').text(),
            })
        })
    }
    else {
        locationList.push({
            FromLoction: locationfrom,
            ToLocation: locationto
        })
    }

    var url = "/VisitingRegistration.aspx/MethodAddNewVisitData";
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
        status: status,
        remarks: remarks,
        VehicleOwnType: VehicleOwnType,
        IsMobileVerified: IsMobileVerified,
        verifytype: verifytype
    });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        JsonResult = JsonResult.split("|");
        current.removeAttr('disabled');
        if (JsonResult[1] == "success") {
            Swal.fire({
                position: 'top-end',
                icon: JsonResult[1],
                title: JsonResult[0],
                showConfirmButton: false,
                timer: 2500
            })
            if (status.toLowerCase() == "followup") {
                SendDownloadLinkbysms(phoneno, 'Y', 'Y');
            }
            else {
                location.href = "Index.aspx";
            }


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

//$(function () {
//    getLocation();
//})

//function getLocation() {
//    if (navigator.geolocation) {
//        navigator.geolocation.getCurrentPosition(showPosition);
//    }
//}

//function showPosition(position) {
//    getAddress(position.coords.latitude, position.coords.longitude);

//}

//function getAddress(lattitude, longitude) {
//    $("#Latitude").val(lattitude);
//    $("#Longitude").val(longitude);
//};



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
$(".uploadimagefile").change(function (e) {

    // type = $(this).attr('typefor');
    // readImage(this, type)

    //if (e.target.files.length) {
    //    // start file reader
    //    img_result.classList.add("hide");
    //    $("#CropPicPopupNew").modal('show');
    //    const reader = new FileReader();
    //    reader.onload = (e) => {
    //        if (e.target.result) {
    //            // create new image
    //            let img = document.createElement("img");
    //            img.id = "image";
    //            img.src = e.target.result;
    //            // clean result before
    //            result.innerHTML = "";
    //            // append new image
    //            result.appendChild(img);
    //            // show save btn and options
    //            save.classList.remove("hide");
    //            options.classList.remove("hide");
    //            // init cropper
    //            cropper = new Cropper(img);
    //        }
    //    };
    //    reader.readAsDataURL(e.target.files[0]);
    //}
});
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
    if (type == 1) {
        $('#imagePreview1').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="" src="' + imgSrc + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
        removeimg(type);
    }
    else if (type == 2) {
        $('#imagePreview2').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="" src="' + imgSrc + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
        removeimg(type);
    }
    else if (type == 3) {
        $('#imagePreview3').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" class="" src="' + imgSrc + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
        removeimg(type);
    }
    $("#CropPicPopupNew").modal('hide');
});


$("#ownTypes").change(function () {
    var itsVal = $.trim($("#ownTypes option:selected").val());
    if (itsVal == "broker") {
        $(".OwnerAssetsInfo").removeClass('d-none');
        $(".PreferredLoctaion").addClass('d-none');
        $(".StickeringStatus").addClass('d-none');
        $(".PreferredLoctaion input").val('');
        $(".OwnerAssetsInfo select").prop("selectedIndex", 0);
        $(".StickeringStatus input").val('');
        $("#appendaddedvichle,#imagePreview1,#imagePreview2,#appendlocation").empty();

    } else {
        $(".OwnerAssetsInfo").addClass('d-none');
        $(".PreferredLoctaion").removeClass('d-none');
        $(".StickeringStatus").removeClass('d-none');
    }
});



//$("#FromLoc").autocomplete(function () {
//    var searchtext = $(this).val();
//    if (searchtext.length > 3) {
//        var url = link + "/VisitingRegistration.aspx/Getapirequest";
//        var data = JSON.stringify({ SearchCity: searchtext });
//        var JsonResult = doAjax(url, data);
//        response()
//    }
//});

//$('#FromLoc').autocomplete({
//    source: function (request, response) {
//        var Search_Value = $.trim($('#FromLoc').val());
//        if (Search_Value.length >= 2) {
//            $('#searchResult').empty();
//            $.ajax({
//                type: "POST",
//                contentType: "application/json; charset=utf-8",
//                url: link + "/VisitingRegistration.aspx/Getapirequest",
//                data: '{SearchCity: "' + Search_Value + '"}',
//                dataType: "json",
//                success: function (data) {
//                    response(JSON.parse(data.d));
//                }
//            })
//        }
//        else {
//            $('#searchResult').css('height', '1px');
//            $('#searchResult').empty();
//        }

//    },

//    create: function (event, ui) {
//        $(this).data('ui-autocomplete')._renderItem = function (ul, item) {
//            return $('<li>').append(item.State + '' + item.HindiState).appendTo('#searchResult');
//        };
//    },
//    select: function (event, ui) {
//        event.preventDefault();
//    }

//});

$("#basic-icon-default-phone").keyup(function () {
    $(".verifystatus").fadeIn();
    $(".verifystatus").addClass('notverified').removeClass('verified');
    var number = $(this).val();
    var callverify = $("#verifiedbycall").prop('checked') == true ? 'Y' : 'N';
    var sendotpmsg = $("#flexRadioDefault1").prop('checked') == true ? 'Y' : 'N';
    if (number.length == 10) {
        if (callverify == "N") {
            $("#Mobilenumbertext").text(number);
            var url = "/VisitingRegistration.aspx/MethodVerifymobilenumber";
            var data = JSON.stringify({ mobilenumber: number, sendotp: sendotpmsg });
            var JsonResult = doAjax(url, data);
            if (JsonResult == "true") {
                $("#OTPVerification").modal('show');
                var timer2 = "01:00";
                btnTimer('#ResendOTPBtn', timer2);
            }
            else if (JsonResult == "Y") {
                $(".verifystatus").empty();
                $(".verifystatus").removeClass('notverified').addClass('verified');
                $(".verifystatus").append("<i class='fa fa-check-circle'></i> verified");
                //Swal.fire({
                //    position: 'top-end',
                //    icon: 'success',
                //    title: "This user already downloaded our app.",
                //    showConfirmButton: false,
                //    timer: 4000
                //})

                Swal.fire({
                    icon: 'warning',
                    title: 'Warning!',
                    text: 'This user already downloaded our app. You cannot add this contact please try with another number',
                    showDenyButton: false,
                    showCancelButton: false,
                    confirmButtonText: 'Ok',

                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.reload();
                    }
                })
            }
        }
        else {
            $(".verifystatus").empty();
            $(".verifystatus").removeClass('notverified').addClass('verified');
            $(".verifystatus").append("<i class='fa fa-check-circle'></i> verified");
            Swal.fire({
                position: 'top-end',
                icon: 'success',
                title: splitresult[1],
                showConfirmButton: false,
                timer: 1500
            })
        }
    }
    else {
        $(".verifystatus").empty();
        $(".verifystatus").append("<i class='fa fa-times-circle'></i> not verified");
    }
});

$('#mobileverifyotp').keyup(function () {
    var otpis = $(this).val();
    var Mobile = $("#Mobilenumbertext").text();
    if (otpis.length == 6) {
        var url = "/VisitingRegistration.aspx/VerifyOTP";
        var data = JSON.stringify({ OTP: otpis, Mobile: Mobile });
        var JsonResult = doAjax(url, data);
        if (JsonResult != "") {
            $("#mobileverifyotp").val('');
            $("#errorMsg").text('');
            var splitresult = JsonResult.split('|');
            if (splitresult[0] == "Y") {
                $(".verifystatus").empty();
                $(".verifystatus").removeClass('notverified').addClass('verified');
                $(".verifystatus").append("<i class='fa fa-check-circle'></i> verified");
                Swal.fire({
                    position: 'top-end',
                    icon: 'success',
                    title: splitresult[1],
                    showConfirmButton: false,
                    timer: 1500
                })
                $("#OTPVerification").modal('hide');
            }
            else {
                $("#errorMsg").text(splitresult[1]);
                Swal.fire({
                    position: 'top-end',
                    icon: 'error',
                    title: splitresult[1],
                    showConfirmButton: false,
                    timer: 1500
                })
                $(".verifystatus").empty();
                $(".verifystatus").addClass('notverified').removeClass('verified');
                $(".verifystatus").append("<i class='fa fa-times-circle'></i> not verified");
            }
        }

    }
});


function btnTimer(current, timer2) {
    var interval = setInterval(function () {
        var timer = timer2.split(':');
        //by parsing integer, I avoid all extra string processing
        var minutes = parseInt(timer[0], 10);
        var seconds = parseInt(timer[1], 10);
        --seconds;
        minutes = (seconds < 0) ? --minutes : minutes;
        seconds = (seconds < 0) ? 59 : seconds;
        seconds = (seconds < 10) ? '0' + seconds : seconds;
        //minutes = (minutes < 10) ?  minutes : minutes;
        $(current).html(minutes + ':' + seconds);
        timer2 = minutes + ':' + seconds;
        if (minutes == 0 && seconds == 00) {
            clearInterval(interval);
            $(current).html('Resend OTP');
            $(current).attr('disabled', false);
            $(current).attr('onclick', 'fnResendOtp($(this))');
        }
    }, 1000);
}


function fnResendOtp(current) {
    var number = $("#basic-icon-default-phone").val();
    if (number.length == 10) {

        $("#Mobilenumbertext").text(number);
        var url = "/VisitingRegistration.aspx/MethodVerifymobilenumber";
        var data = JSON.stringify({ mobilenumber: number });
        var JsonResult = doAjax(url, data);
        if (JsonResult == "true") {
            var timer2 = "01:00";
            btnTimer('#ResendOTPBtn', timer2);
        }


    }
}

function getuplodedfileforpreview(imageBase64, type) {
    var url = "/VisitingRegistration.aspx/reducefilesize";
    var data = JSON.stringify({ imageBase64: imageBase64, type: type });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        return JsonResult;
    }
}

function SendDownloadLinkbysms(mobilenumber, sms, wapp) {
    var url = "/VisitingRegistration.aspx/SendDownloadLinkviasmswhatsapp";
    var data = JSON.stringify({ mobilenumber: mobilenumber, sms: sms, wapp: wapp });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        Swal.fire({
            title: "Success!",
            text: "Download link shared successfull",
            icon: "success",
        }).then(function () { 
            window.location.href = "Index.aspx";
        });
    }
}


$('#verifiedbycall').click(function () {
    if ($(this).is(':checked')) {
        $(".verifystatus").empty();
        $(".verifystatus").removeClass('notverified').addClass('verified');
        $(".verifystatus").append("<i class='fa fa-check-circle'></i> verified");
    } else {
        $(".verifystatus").empty();
        $(".verifystatus").addClass('notverified').removeClass('verified');
        $(".verifystatus").append("<i class='fa fa-times-circle'></i> not verified");
    }
});





var fileReader = new FileReader();
var filterType = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

fileReader.onload = function (event, type) {
    var image = new Image();

    image.onload = function () {
        document.getElementById('original-Img').src = image.src;
        var canvas = document.createElement('canvas');
        var context = canvas.getContext('2d');
        canvas.width = image.width / 4;
        canvas.height = image.height / 4;
        context.drawImage(
            image,
            0,
            0,
            image.width,
            image.height,
            0,
            0,
            canvas.width,
            canvas.height
        );

        var imgVaryurl = getuplodedfileforpreview(canvas.toDataURL(), "");
        if (type == 1) {
            $('#imagePreview1').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + canvas.toDataURL() + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
            removeimg(type);
        }
        else if (type == 2) {
            $('#imagePreview2').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + canvas.toDataURL() + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
            removeimg(type);
        }
        else if (type == 3) {
            $('#imagePreview3').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + canvas.toDataURL() + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
            removeimg(type);
        }
        else if (type == 4) {
            $('#imagePreview4').append('<div class="col-6 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 100%; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + canvas.toDataURL() + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
            removeimg(type);
        }
        // document.getElementById('upload-Preview').src = canvas.toDataURL();
    };
    image.src = event.target.result;
};


var loadImageFile = function (current) {
    debugger;
    var idname = current.attr("id");
    var uploadImage = document.getElementById(idname);
    var type = current.attr('typefor');
    //check and retuns the length of uploded file.
    if (uploadImage.files.length === 0) {
        return;
    }

    //Is Used for validate a valid file.
    var uploadFile = document.getElementById(idname).files[0];
    if (!filterType.test(uploadFile.type)) {
        alert('Please select a valid image.');
        return;
    }

    var imgsrc = fileReader.readAsDataURL(uploadFile);
    if (imgsrc != "") {

    }

};


var userId = '<%= Session["UserId"] %>';
var imgxrcValues = [];

function uploadImage(inputElement, targetDivId) {
    var file = inputElement.files[0];

    if (file) {
        var formData = new FormData();
        //var userId = $.trim(readCookie('userid'));
        if (userId) {
            formData.append('Id', userId);
            formData.append('file', file);
            formData.append('bucketName', 'trucksup');
            formData.append('RequestId', userId);
            //formData.append('Position', '2');
        }
        var xhr = new XMLHttpRequest();
        var firstApiUrl = 'https://sslapi.trucksups.in/S3ImageAPI/upload-imagefile';
        xhr.open('POST', firstApiUrl, true);
        xhr.onload = function () {
            if (xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);
                console.log('Response from First API:', response);
                var imageKey = response.imagekey;
                fetchAndDisplayImage(imageKey, targetDivId);
            } else {
                console.error('Error from First API:', xhr.status, xhr.statusText);
            }
        };

        xhr.send(formData);
    } else {
        console.log('Please select an image to upload.');
    }
}

// ...

function fetchAndDisplayImage(imageKey, targetDivId) {

    var secondApiUrl = 'https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + imageKey  ;
    var secondXhr = new XMLHttpRequest();
    secondXhr.open('GET', secondApiUrl, true);
    secondXhr.responseType = 'blob';
    secondXhr.onload = function () {
        if (secondXhr.status === 200) {

            var imageUrl = URL.createObjectURL(secondXhr.response);


            var imageContainer = document.createElement('div');
            imageContainer.classList.add('col-4', 'mb-2');

            var innerContentDiv = document.createElement('div');
            innerContentDiv.style.padding = '5px';
            innerContentDiv.style.background = '#e0e0e0';
            innerContentDiv.style.borderRadius = '5px';

            var imageDiv = document.createElement('div');
            imageDiv.style.height = '90px';
            imageDiv.style.background = '#fff';

            var imgElement = document.createElement('img');
            imgElement.style.width = '100%';
            imgElement.style.height = '100%';
            imgElement.src = imageUrl;
            imgElement.setAttribute('imgxrc', imageKey);
            imgxrcValues.push(imageKey);


            var overlayDiv = document.createElement('div');
            overlayDiv.classList.add('overlay-text');
            overlayDiv.innerText = imageKey;

            var removeButtonDiv = document.createElement('div');
            removeButtonDiv.classList.add('imageremove');
            var trashIcon = document.createElement('i');
            trashIcon.classList.add('fa', 'fa-trash');


            removeButtonDiv.addEventListener('click', function () {
                imageContainer.remove();
            });

            removeButtonDiv.appendChild(trashIcon);
            removeButtonDiv.innerHTML += '&nbsp;&nbsp;Remove';

            imageDiv.appendChild(imgElement);
            //imageDiv.appendChild(overlayDiv);
            innerContentDiv.appendChild(imageDiv);
            innerContentDiv.appendChild(removeButtonDiv);
            imageContainer.appendChild(innerContentDiv);

            var imagePreviewContainer = document.getElementById(targetDivId);
            imagePreviewContainer.appendChild(imageContainer);
        } else {
            console.error('Error from Second API:', secondXhr.status, secondXhr.statusText);
        }
    };

    secondXhr.send();
}