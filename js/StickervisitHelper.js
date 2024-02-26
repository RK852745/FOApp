 $(function () {
     GetJsondata();    
})

 function SaveStickerVisits(current) {
     var DataList = [];
     var stickerList = imgxrcValues.join(','); 
    // var stickerList = '';
    //if ($('#imagePreview3 img').length > 0) {
    //    $("#imagePreview3 img").each(function () {
    //        stickerList = stickerList + $("#imagePreview3 img").attr('imgxrc') + ","
    //    });
    //}
    //else {
    //    stickerList = $("#imagePreview3 img").attr('imgxrc');
    //}
     
    var stickerdim = ''; 
    var s = 0, m = 0, l = 0;

    if ($('.Sstickerdim').prop('checked') == true) {
        s = $(".Smallcount").val() == "" ? "0" : $(".Smallcount").val();
        s = s + "-" + $('.Sstickerdim').attr('sattr') + "|";
    } else {
        $(".Smallcount").val('0');
    }
    if ($('.Mstickerdim').prop('checked') == true) {
        m = $(".Mediumcount").val() == "" ? "0" : $(".Mediumcount").val();
        m = m + "-" + $('.Mstickerdim').attr('sattr') + "|";
    } else {
        $(".Smallcount").val('0');
    }
    if ($('.Lstickerdim').prop('checked') == true) {
        l = $(".Largecount").val() == "" ? "0" : $(".Largecount").val();
        l = l + "-" + $('.Lstickerdim').attr('sattr') + "|";
    } else {
        $(".Smallcount").val('0');
    }
    stickerdim = s + m + l;  
    if (stickerdim != "") {
        stickerdim = stickerdim.slice(0, -1);
    }


    DataList.push({
        userid: $.trim(readCookie('userid')),
        FullName: $.trim($("#FullName").val()),
        UserMobile: $.trim(readCookie('username')),
        DriverNo: $.trim($("#basic-icon-default-phone").val()),
        OperatorNo: $.trim($("#phone").val()),
        Downloads: $.trim($("#Downloads option:selected").val()),
        stickerimg: $.trim(stickerList),
        StickerSize: $.trim($("#StickerSize").val()),
        LaneFrom: $.trim($("#FromLoc").val()),
        LaneTo: $.trim($("#ToLoc").val()) == "" ? "Anywhere" : $.trim($("#ToLoc").val()),
        vehicleType: $.trim($("#vehicleType option:selected").val()),
        vehicleSize: $.trim($("#vehicleSize option:selected").val()),
        vehicleCapacity: $.trim($("#vehicleCapacity option:selected").val()),
        vehicleCount: $.trim($("#vehicleCount").val()),
        vehiclenumber: $.trim($("#vehiclenumber").val()),
        StickerDimension: $.trim(stickerdim)
    });
    var url = "/Stickers.aspx/MethodAddNewStickerVisitData";
    var data = JSON.stringify({ DataList: DataList });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        JsonResult = JsonResult.split("|");
        Swal.fire({
            title: JsonResult[0] + "!",
            text: JsonResult[1],
            icon: JsonResult[0],
        }).then(function () {
            if (JsonResult[0] === 'success') {
                window.location.reload();
            }
            //window.location.reload();
        });
    }

}

 function SaveDhabaSticker(current) {
    var DataList = [];
     var stickerList = imgxrcValues.join(','); 
     //if ($('#imagePreview4 img').length > 0) {
     //    $("#imagePreview4 img").each(function () {
     //        stickerList = stickerList + $("#imagePreview4 img").attr('imgxrc') + ","
     //    });
     //}
     //else {
     //    stickerList = $("#imagePreview4 img").attr('imgxrc');
     //}

    // Assuming you have the latitude and longitude values already collected.
    var latitude = $.trim($("#Latitude").val());
    var longitude = $.trim($("#Longitude").val());

    DataList.push({
        userid: $.trim(readCookie('userid')),
        DhabaName: $.trim($("#DhabaName").val()),
        DhabaOwnerNumber: $.trim($("#DhabaOwnerNumber").val()),
        Address: $.trim($("#Address").val()),
        OwnerName: $.trim($("#OwnerName").val()),
        stickerimg: $.trim(stickerList),
        Latitude: latitude,
        Longitude: longitude,
    });

    var url = '/Stickers.aspx/MethodDhabaVisitData';

    $.ajax({
        type: 'POST',
        url: url,
        data: JSON.stringify({ DataList: DataList }),
        contentType: 'application/json; charset=utf-8',
        dataType: 'json',
        success: function (response) {
            if (response.d) {
                var result = response.d.split('|');
                if (result[0] === 'success') {
                    Swal.fire({
                        title: result[0] + '!',
                        text: result[1],
                        icon: result[0],
                    }).then(function () {
                        window.location.reload();
                    });
                } else {
                    Swal.fire({
                        title: result[0] + '!',
                        text: result[1],
                        icon: result[0],
                    });
                }
            }
        },

    });
}

  //function readImage(input) {
//    if (input.files && input.files[0]) {
//        if (Math.round(input.files[0].size / (1024 * 1024)) > 3) {
//            alert('Image size is too big. Please select image size less than 3 MB');
//            return false;
//        }
//        var reader = new FileReader();
//        reader.onload = function (e) {
//            var imgVaryurl = getuplodedfileforpreview(e.target.result, "Sticker");

//            $('#imagePreview3').append('<div class="col-4 mb-2"><div style="padding: 5px;background: #e0e0e0;border-radius: 5px;"><div style="height: 90px; background:#fff;"><img style="width:100%;height:100%;" imgxrc="' + imgVaryurl + '" class="" src="' + e.target.result + '"></div><div class="imageremove"><i class="fa fa-trash"></i>&nbsp;&nbsp;Remove</div></div></div>');
//            removeimg();

//        }
//        reader.readAsDataURL(input.files[0]);
//    }
//};

//$(".uploadimagefile").change(function (e) {
//    readImage(this)
//});

//function removeimg() {
//    $(".imageremove").click(function (e) {
//        e.stopImmediatePropagation();
//        $(this).parent().parent().remove();
//    });
//    $("#inputGroupFilevisitingcard").val('');
//} 

 function GetJsondata() {
    const citystateJSON = "DataFileOfflline.json";
    $.getJSON(citystateJSON, function (json) {
        const request = json.filter(function (response) {
            return response.userid == readCookie('userid');
        });
        $.each(request, function (i) {
            $("#tabledata tbody").append(
                '<tr><td>' + request[i].FullName + '</td>\
                <td>'+ request[i].DriverNo + '</td>\
                <td>'+ request[i].OperatorNo + '</td>\
                <td>'+ request[i].Downloads + '</td>\
                <td>'+ request[i].stickerimg + '</td>\
                <td>'+ request[i].StickerSize + '</td>\
                <td>'+ request[i].LaneFrom + '</td>\
                <td>'+ request[i].LaneTo + '</td>\
                <td>'+ request[i].vehicleType + '</td>\
                <td>'+ request[i].vehicleSize + '</td>\
                <td>'+ request[i].vehicleCapacity + '</td>\
                <td>'+ request[i].vehicleCount + '</td>\
                <td>'+ request[i].vehiclenumber + '</td>\
        </tr>'
            );
        });
        $('#tabledata').DataTable({

        });
    });

}

// function getuplodedfileforpreview(imageBase64, type) {
//    var url = "/VisitingRegistration.aspx/reducefilesize";
//    var data = JSON.stringify({ imageBase64: imageBase64, type: type });
//    var JsonResult = doAjax(url, data);
//    if (JsonResult != "") {
//        return JsonResult;
//    }
//}
// Cookies
 function createCookie(name, value, days) {
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
        var expires = "; expires=" + date.toGMTString();
    }
    else var expires = "";
    document.cookie = name + "=" + value + expires + "; path=/";
}

 function readCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1, c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
}

 function eraseCookie(name) {
    createCookie(name, "", -1);
}

 function fnpushdatatodatabase(current) {
    var DataPushList = [];
    const citystateJSON = "DataFileOfflline.json";
    $.getJSON(citystateJSON, function (json) {
        const request = json.filter(function (response) {
            return response.userid == readCookie('userid');
        });
        $.each(request, function (i) {
                DataPushList.push({
                userid: readCookie('userid'),
                UserMobile: readCookie('username'),
                FullName: request[i].FullName,
                DriverNo: request[i].DriverNo,
                OperatorNo: request[i].OperatorNo,
                Downloads: request[i].Downloads,
                stickerimg: request[i].stickerimg,
                StickerSize: request[i].StickerSize,
                LaneFrom: request[i].LaneFrom,
                LaneTo: request[i].LaneTo,
                vehicleType: request[i].vehicleType,
                vehicleSize: request[i].vehicleSize,
                vehicleCapacity: request[i].vehicleCapacity,
                vehicleCount: request[i].vehicleCount,
                vehiclenumber: request[i].vehiclenumber
            });
            delete request;
        });

        var url = "/Stickers.aspx/MethodAddLocalVisitDataintodatabase";
        var data = JSON.stringify({ DataPushList: DataPushList });
        var JsonResult = doAjax(url, data);
    });

}

   $("#basic-icon-default-phone").keyup(function () {
    if ($(this).val().length == 10) {
        var status = CheckMobileNumberExists($(this).val());
        createCookie('driver', status, '1');
        if (status == true) {
            if ($("#phone").val().length == 10 && readCookie('operator') == "true") {
                $("#Downloads option[value='Both']").prop("selected", true);
            } else {
                $("#Downloads option[value='Driver']").prop("selected", true);
            }
        }
        else {
            $("#Downloads option[value='No']").prop("selected", true);

        }
    }
    else {
        if ($("#phone").val().length == 10) {
            $("#Downloads option[value='Operator']").prop("selected", true);
        } else {
            $("#Downloads option[value='']").prop("selected", true);
        }


    }
 });

   $("#phone").keyup(function () {
    if ($(this).val().length == 10) {
        var status = CheckMobileNumberExists($(this).val());
        createCookie('operator', status, '1');
        if (status == true) {
            if ($("#basic-icon-default-phone").val().length == 10 && readCookie('driver') == "true") {
                $("#Downloads option[value='Both']").prop("selected", true);
            } else {
                $("#Downloads option[value='Operator']").prop("selected", true);
            }
        }
        else {
            $("#Downloads option[value='No']").prop("selected", true);

        }

    }
    else {
        if ($("#basic-icon-default-phone").val().length == 10) {
            $("#Downloads option[value='Driver']").prop("selected", true);
        } else {
            $("#Downloads option[value='']").prop("selected", true);
        }


    }
});

   function CheckMobileNumberExists(Mobile) {
    var url = "/Stickers.aspx/MethodCheckMobileNumber";
    var data = JSON.stringify({ Mobile: Mobile });
    var JsonResult = doAjax(url, data);
    return JsonResult;
}

   $(".Largecount,.Mediumcount,.Smallcount").keyup(function () {
    var s = 0, m = 0, l = 0;
    if ($('.Sstickerdim').prop('checked') == true) {
        s = $(".Smallcount").val() == "" ? "0" : $(".Smallcount").val();
    }
    if ($('.Mstickerdim').prop('checked') == true) {
        m = $(".Mediumcount").val() == "" ? "0" : $(".Mediumcount").val();
    }
    if ($('.Lstickerdim').prop('checked') == true) {
        l = $(".Largecount").val() == "" ? "0" : $(".Largecount").val();
    }
    var counts = parseInt(parseInt(s) + parseInt(m) + parseInt(l));
    $("#StickerSize").val(counts);
});

   $('.Sstickerdim,.Mstickerdim,.Lstickerdim').change(function () {
    var s = 0, m = 0, l = 0;
    if ($('.Sstickerdim').prop('checked') == true) {
        s = $(".Smallcount").val() == "" ? "0" : $(".Smallcount").val();
    }
    else {
        $(".Smallcount").val('0');
    }

    if ($('.Mstickerdim').prop('checked') == true) {
        m = $(".Mediumcount").val() == "" ? "0" : $(".Mediumcount").val();
    }
    else {
        $(".Mediumcount").val('0');
    }

    if ($('.Lstickerdim').prop('checked') == true) {
        l = $(".Largecount").val() == "" ? "0" : $(".Largecount").val();
    }
    else {
        $(".Largecount").val('0');
    }
    var counts = parseInt(parseInt(s) + parseInt(m) + parseInt(l));
    $("#StickerSize").val(counts);
    $(this).val('0');
 });



  function uploadImage(inputElement, targetDivId) {
    var file = inputElement.files[0];

    if (file) {
        var formData = new FormData();
        var userId = $.trim(readCookie('userid'));

        if (userId) {
            formData.append('Id', userId);
            formData.append('file', file);
            formData.append('bucketName', 'trucksup');
            formData.append('RequestId', userId);
            //formData.append('Position', '2');
        }
        else {
            console.error('User ID is missing or empty.');
            return; 
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
        console.error('Please select an image to upload.');
    }
}


   var imgxrcValues = [];
   function fetchAndDisplayImage(imageKey, targetDivId) { 

    var secondApiUrl = 'https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + imageKey ; 
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



