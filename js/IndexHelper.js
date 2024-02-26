$(function () {
    var date = $.trim($("#datepicker").val());
    $('#datepicker').daterangepicker();

    $(".daterangepicker .applyBtn").click(function () {
        date = $.trim($(".drp-selected").text());
        getDataAndCounts(date);
    });

    getDataAndCounts(date);
});

function getDataAndCounts(date) {
    var formattedDate = formatDate(date);
    if (formattedDate) {
        var url = "/Index.aspx/GetCounts";
        var data = JSON.stringify({ startdate: formattedDate.start, enddate: formattedDate.end });
        var JsonResult = doAjax(url, data);
        var ParseResult = JSON.parse(JsonResult).table;
        if (ParseResult && ParseResult.length > 0) {
            $("#dailyvisitcounts").text(ParseResult[0].dailyvisit);
            $("#H1").text(ParseResult[0].overalldownloads);
        }
    }
    getDataByCurrentDate(date);
}

function getDataByCurrentDate(date) {
    var formattedDate = formatDate(date);
    if (formattedDate) {
        var url = "/Index.aspx/MethodGetDataByCurrentDate";
        var data = JSON.stringify({ startdate: formattedDate.start, enddate: formattedDate.end });
        var JsonResult = doAjax(url, data);
        if (JsonResult) {
            var ParseResult = JSON.parse(JsonResult).table;
            if (ParseResult && ParseResult.length > 0) {
                var cardlist = "";
                for (var i = 0; i < ParseResult.length; i++) {
                    var veri = ParseResult[i].ismobileverified == "Y" ? "<i data-bs-toggle='tooltip' data-bs-placement='top' title='mobile number verified' class='fa fa-check-circle text-success'></i>" : "<i data-bs-toggle='tooltip' data-bs-placement='top' title='mobile number not verified' class='fa fa-times-circle text-danger'></i>";
                    var varis = ParseResult[i].downloadapp == "Y" ? "<sup class='download'><i class='fa fa-check'></i>&nbsp;Downloaded</sup>" : "<sup class='notdownload'><i class='fa fa-times'></i>&nbsp;Not Download</sup>";
                    cardlist += '<div class="col-sm-4 mb-4">\
                                    <div class="card">\
                                        <div class="card-body" style="background: #f7fbff;">\
                                            <div class="card-title d-flex align-items-start justify-content-between">\
                                                <div class="flex-shrink-0">\
                                                    <strong><i class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;' + ParseResult[i].name + '</strong>\
                                                </div>\
                                                <div class="dropdown">\
                                                    <button class="btn p-0" type="button" id="cardOpt'+ i + '" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">\
                                                        <i class="bx bx-dots-vertical-rounded"></i>\
                                                    </button>\
                                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="cardOpt'+ i + '">\
                                                        <a class="dropdown-item" onclick="fnsharedownloadlink($(this),'+ ParseResult[i].mobile + ');" href="javascript:void(0);">Share Link (SMS)</a>\
                                                        <a class="dropdown-item d-none" onclick="fnsharedownloadlink($(this),'+ ParseResult[i].mobile + ');" href="javascript:void(0);">Share Link (Whatsapp)</a>\
                                                        <a class="dropdown-item" onclick="fnViewAllImages($(this),' + ParseResult[i].fovmid + ')" href="javascript:void(0);">View Images</a>\
                                                        <a class="dropdown-item" href="Update.aspx?' + EncryptUrl(ParseResult[i].fovmid) + '">Edit</a>\
                                                    </div>\
                                                </div>\
                                            </div>\
                                            <div class="w-100 d-flex">\
                                                <div class="w-50">\
                                                    <span class="d-block mb-1" style="font-size: 13px;">\
                                                        <i class="fa fa-calendar" aria-hidden="true"></i>&nbsp;&nbsp;' + ParseResult[i].visitdate + '\
                                                    </span>\
                                                </div>\
                                                <div class="w-50">\
                                                    <span class=" d-block mb-1" style="font-size: 13px;">\
                                                        <i class="fa fa-clock" aria-hidden="true"></i>&nbsp;&nbsp;' + ParseResult[i].visittime + '\
                                                    </span>\
                                                </div>\
                                            </div>\
                                            <div class="w-100 d-flex">\
                                                <div class="w-50">\
                                                    <span class="d-block mb-1" style="font-size: 13px;">\
                                                        <i class="fa fa-phone" aria-hidden="true"></i>&nbsp;&nbsp;' + ParseResult[i].mobile + '&nbsp;' + veri + '\
                                                    </span>\
                                                </div>\
                                                <div class="w-50">\
                                                    <span class=" d-block mb-1" style="font-size: 13px;">\
                                                        <i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;' + ParseResult[i].owntype + '\
                                                    </span>\
                                                </div>\
                                            </div>\
                                            <span class="d-block mb-1" style="font-size: 13px;">\
                                                <i class="fa fa-map-marker" aria-hidden="true"></i>&nbsp;&nbsp;' + ParseResult[i].address + '\
                                            </span>\
                                            <div style="background: #f1f1f1;padding: 5px;border-radius: 10px;">\
                                                <sup>Status/Remarks</sup> ' + varis + '\
                                                <small class=" d-block mb-1" style="font-size: 13px;">' + ParseResult[i].status + '</small>\
                                                <small>' + ParseResult[i].remarks + '</small>\
                                            </div>\
                                            <div class="w-100 d-flex">\
                                                <div class="w-50 m-1 btnStyle">\
                                                    <a onclick="fnGetVehicledata($(this),'+ ParseResult[i].fovmid + ')" class="mb-1 btn btn-gray p-1 w-100" style="font-size: 12.5px;">\
                                                        <i class="fa fa-truck" aria-hidden="true"></i>&nbsp;&nbsp;Vehicle Info\
                                                    </a>\
                                                </div>\
                                                <div class="w-50 m-1 btnStyle">\
                                                    <a onclick="fnGetPreferredLocdata($(this),'+ ParseResult[i].fovmid + ')" class="mb-1 btn btn-gray p-1 w-100" style="font-size: 12.5px;">\
                                                        <i class="fa fa-map" aria-hidden="true"></i>&nbsp;&nbsp;Pref. Locations\
                                                    </a>\
                                                </div>\
                                            </div>\
                                        </div>\
                                    </div>\
                                </div>';
                }
                $("#appendcrads").empty().append(cardlist);
                $('[data-bs-toggle="tooltip"]').tooltip();
            } else {
                $("#appendcrads").empty().append("No data available");
            }
        }
    }
}

function fnGetVehicledata(current, fid) {
    var url = "/Index.aspx/MethodGetVehicleData";
    var data = JSON.stringify({ fovmid: fid });
    var JsonResult = doAjax(url, data);
    if (JsonResult) {
        var ParseResult = JSON.parse(JsonResult).table;
        var vehicledata = '';
        for (var i = 0; i < ParseResult.length; i++) {
            vehicledata += '<div class="card p-3 mb-4" style="background:antiquewhite;text-transform: capitalize;">\
                                <div class="row">\
                                    <div class="col-3">\
                                        <img style="width:100%" src="assets/img/semi.png" />\
                                    </div>\
                                    <div class="col-9">\
                                        <div class="w-100 d-flex">\
                                            <div class="w-50">Own type: &nbsp<strong>' + ParseResult[i].owntype + '</strong></div>\
                                            <div class="w-50">Vehicle own type: &nbsp<strong>' + ParseResult[i].vehicleowntype + '</strong></div>\
                                        </div>\
                                        <div class="w-100 d-flex" style="background: aliceblue;padding: 5px;border-top-left-radius: 10px;border-top-right-radius: 10px;">\
                                            <div class="w-50">\
                                                <label>Vehicle Type</label><br />\
                                                <strong>'+ ParseResult[i].vehicletype + '</strong>\
                                            </div>\
                                            <div class="w-50">\
                                                <label>Vehicle Size</label><br />\
                                                <strong>'+ ParseResult[i].vehiclesize + '</strong>\
                                            </div>\
                                        </div>\
                                        <div class="w-100 d-flex" style="background: aliceblue;padding: 5px; border-bottom-left-radius: 10px;border-bottom-right-radius: 10px;">\
                                            <div class="w-50">\
                                                <label>Vehicle Capacity</label><br />\
                                                <strong>'+ ParseResult[i].vehiclecapacity + '</strong>\
                                            </div>\
                                            <div class="w-50">\
                                                <label>Vehicle Count</label><br />\
                                                <strong>' + ParseResult[i].vehiclecount + '</strong>\
                                            </div>\
                                        </div>\
                                    </div>\
                                </div>\
                            </div>';
        }
        $("#appendModalBodyData").empty().append(vehicledata);
        $("#DynamicModalTitle").text('Owner Assets Info');
        $("#DynamicModal").modal('show');
    }
}

function fnGetPreferredLocdata(current, fid) {
    var url = "/Index.aspx/MethodGetPreferredLocData";
    var data = JSON.stringify({ fovmid: fid });
    var JsonResult = doAjax(url, data);
    if (JsonResult) {
        var ParseResult = JSON.parse(JsonResult).table;
        var Innerfromtodata = "";
        for (var i = 0; i < ParseResult.length; i++) {
            Innerfromtodata += '<div class="" style="width:100%;display:flex;padding: 5px;">\
                                    <div class="" style="width:45%;">'+ ParseResult[i].fromloction + '</div>\
                                    <div class="" style="width:10%;"><i class="fa fa-exchange" aria-hidden="true"></i></div>\
                                    <div class="" style="width:45%;">'+ ParseResult[i].tolocation + '</div>\
                                </div>';
        }
        var fromtodata = '<div class="card p-2">\
                            <div class="" style="width:100%;display:flex;padding: 5px;background: var(--bs-indigo);color: white;border-radius: 5px;">\
                                <div class="" style="width:45%;">From</div>\
                                <div class="" style="width:10%;"><i class="fa fa-exchange" aria-hidden="true"></i></div>\
                                <div class="" style="width:45%;">To</div>\
                            </div>'+ Innerfromtodata + '</div>';
        $("#appendModalBodyData").empty().append(fromtodata);
        $("#DynamicModalTitle").text('Preferred Location(s)');
        $("#DynamicModal").modal('show');
    }
}

function fnViewAllImages(current, fid) {
    var url = "/Index.aspx/MethodGetAllImagesData";
    var data = JSON.stringify({ fovmid: fid });
    var JsonResult = doAjax(url, data);
    if (JsonResult) {
        var ParseResult = JSON.parse(JsonResult).table;
        var ParseResult1 = JSON.parse(JsonResult).table1;
        var ParseResult2 = JSON.parse(JsonResult).table2;
        var visitingCrad = "", StickersData = "", OwnerInfoData = "";
        for (var i = 0; i < ParseResult.length; i++) {
            visitingCrad += '<div class="col-4"><img style="width:100%" src="https://sslapi.trucksups.in/S3ImageAPI/get-imagefile?fileName=' + ParseResult[i].imageurl + '"/></div>';
        }
        for (var i = 0; i < ParseResult1.length; i++) {
            StickersData += '<div class="col-4"><img style="width:100%" src="uploadedimages/' + ParseResult1[i].imageurl + '"/></div>';
        }
        for (var i = 0; i < ParseResult2.length; i++) {
            OwnerInfoData += '<div class="col-4"><img style="width:100%" src="uploadedimages/' + ParseResult2[i].imageurl + '"/></div>';
        }
        var appenddata = '<div class="card p-2"><h5>Visiting Card(s)</h5><div class="row">' + visitingCrad + '</div></div><br>\
                          <div class="card p-2"><h5>With Sticker(s)</h5><div class="row">'+ StickersData + '</div></div><br>\
                          <div class="card p-2"><h5>With Owner Info</h5><div class="row">'+ OwnerInfoData + '</div></div><br>';
        $("#appendModalBodyData").empty().append(appenddata);
        $("#DynamicModalTitle").text('Image Gallery');
        $("#DynamicModal").modal('show');
    }
}

function formatDate(date) {
    if (!date) return null;
    var parts = date.split(' - ');
    if (parts.length !== 2) return null;
    var startdate = parts[0].split('/');
    var enddate = parts[1].split('/');
    var formattedStart = startdate[2] + '-' + startdate[0] + '-' + startdate[1];
    var formattedEnd = enddate[2] + '-' + enddate[0] + '-' + enddate[1];
    return { start: formattedStart, end: formattedEnd };
}

function EncryptUrl(str) {
    var url = "/Index.aspx/MethodEncryptData";
    var data = JSON.stringify({ str: str });
    return doAjax(url, data);
}

function fnsharedownloadlink(current, mobile) {
    var url = "/VisitingRegistration.aspx/SendDownloadLinkviasmswhatsapp";
    var data = JSON.stringify({ mobilenumber: mobile, sms: 'Y', wapp: 'Y' });
    var JsonResult = doAjax(url, data);
    if (JsonResult === "true") {
        Swal.fire({
            title: "Success!",
            text: "Download link shared successfully",
            icon: "success",
        });
    } else {
        Swal.fire({
            title: "Failed!",
            text: "Download link sharing failed",
            icon: "error",
        });
    }
}
