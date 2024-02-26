$(function () {
    GetFieldOfficers();
});


$(function () {

    var start = moment().subtract(29, 'days');
    var end = moment();

    function cb(start, end) {
        $('#reportrange span').html(start.format('YYYY/MM/D') + ' - ' + end.format('YYYY/MM/D'));
        GetAdminDashboard(start.format('YYYY/MM/D') + ' - ' + end.format('YYYY/MM/D'), '', '', '', '');
        GetTotalCounts(start.format('YYYY/MM/D') + ' - ' + end.format('YYYY/MM/D'));
        $("#appendSelections").text("All Field Officers");

    }

    $('#reportrange').daterangepicker({
        startDate: start,
        endDate: end,
        ranges: {
            'Today': [moment(), moment()],
            'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
            'Last 7 Days': [moment().subtract(6, 'days'), moment()],
            'Last 30 Days': [moment().subtract(29, 'days'), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
        }
    }, cb);


    $(".ranges ul li").click(function () {
        $("#FoLists").prop("selectedIndex", 0);
        if ($(this).text() == 'Today') {
            cb(moment(), moment());
        }
        else if ($(this).text() == 'Yesterday') {
            cb(moment().subtract(1, 'days'), moment().subtract(1, 'days'));
        }
        else if ($(this).text() == 'Last 7 Days') {
            cb(moment().subtract(6, "days"), moment());
        }
        else if ($(this).text() == 'Last 30 Days') {
            cb(moment().subtract(29, "days"), moment());
        }
        else if ($(this).text() == 'This Month') {
            cb(moment().startOf("month"), moment().endOf("month"));
        }
        else if ($(this).text() == 'Last Month') {
            cb(moment().subtract(1, "month").startOf("month"), moment().subtract(1, "month").endOf("month"));
        }
    });

    cb(start, end);

});

function GetFieldOfficers() {
    var url = "/Dashboard.aspx/MethodGetFieldofficers";
    var data = {};
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        var ParseResult = JSON.parse(JsonResult).table;
        var options = ""; var list = "";
        for (var i = 0; ParseResult.length > i; i++) {
            options = options + '<option executiveid="' + ParseResult[i].executiveid + '" value="' + ParseResult[i].userid + '">' + ParseResult[i].name + '</option>';
            list = list + "<li><div executiveid='" + ParseResult[i].executiveid + "' value='" + ParseResult[i].userid + "' class='foclass'>" + ParseResult[i].name + "<i class='fa fa-check-circle tickcirlce d-none'></i></div></li>";
        }
        var selectlist = "<label>Filter by field officer</label><select class='form-control pull-right'' id='FoLists'><option selected value=''>--Select Field Officer--</option>" + options + "</select>"
        $("#appendfieldOfficerList").empty();
        $("#appendfieldOfficerList").append(selectlist);

        $("#multiselectmodalapppendlist").empty();
        $("#multiselectmodalapppendlist").append(list);

        $("#FoLists").change(function () {
            var date = $("#reportrange span").text();
            var fomid = $("#FoLists option:selected").val();
            GetAdminDashboard(date, fomid, '', '', '')
        });

        btnActions();
    }
}

function GetAdminDashboard(date, foid, tvisit, owntype, Status) {
    date = date.split("-");
    var startdate = date[0];
    var enddate = date[1];
    var url = "/Dashboard.aspx/MethodGetDataforAdmin";
    var data = JSON.stringify({
        startdate: startdate,
        enddate: enddate,
        foid: foid,
        tvisit: tvisit,
        owntype: owntype,
        Status: Status
    });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        var i = 1;
        var ParseResult = JSON.parse(JsonResult).table;
        $("#example").DataTable().clear().destroy();
        $("#example").DataTable(
            {
                bLengthChange: true,
                lengthMenu: [[10, 15, -1], [10, 15, "All"]],
                bFilter: true,
                bSort: true,
                bPaginate: true,
                dom: 'Bfrtip',
                data: ParseResult,
                columns: [
                    {
                        render: function (data, type, row) {
                            return "<div>" + i++ + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div>" + row.stickeringstatus + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div>" + row.status + " </div><div>(<small>" + row.remarks + "</small>)</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            var downloadstatus = '<div class="downsts"><i class="fa fa-times text-danger" aria-hidden="true"></i>&nbsp;No</div>';
                            if (row.downloadapp == "Y") {
                                downloadstatus = '<div class="downsts"><i class="fa fa-check text-success" aria-hidden="true"></i>&nbsp;Yes</div>';
                            }
                            return "<div>" + downloadstatus + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div><strong>" + row.name + "</strong></div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            var verified = "<i class='fa fa-times-circle text-danger'></i>";
                            if (row.ismobileverified == "Y") {
                                verified = "<i class='fa fa-check-circle text-success'></i>"
                            }
                            return "<div><strong>" + row.mobile + "&nbsp;" + verified + "</strong></div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div>" + row.emailid + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div>" + row.address + "</div>";
                        }
                    },

                    {
                        render: function (data, type, row) {
                            return "<div style='text-transform:capitalize;'>" + row.owntype + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div>" + row.company + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div>" + row.visitdate + "&nbsp;&nbsp;" + row.visittime + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div>" + row.createdbyname + "</div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div onclick='fnGetVehicleData($(this)," + row.fovmid + ")' class='tablebtns btn btn-sm btn-primary'><a><i class='fas fa-truck'></i>&nbsp;&nbsp;View&nbsp;&nbsp;" + row.vehiclecount + "</a></div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            return "<div onclick='fnGetpreflocationData($(this)," + row.fovmid + ")' class='tablebtns btn btn-sm btn-primary'><a><i class='fa fa-map-marker'></i>&nbsp;&nbsp;View</a></div>";
                        }
                    },
                    {
                        render: function (data, type, row) {
                            var btn = "";
                            if (row.imagecounts > 0) {
                                btn = "<div onclick='fnGetImagesData($(this)," + row.fovmid + ")' class='tablebtns btn btn-sm btn-primary'><a><i class='fa fa-folder-open'></i>&nbsp;&nbsp;View</a></div>";
                            } else {
                                btn = "<div class='tablebtns btn btn-sm btn-primary' style='background-color: #b7b7b7;border-color: #afafaf;'><a><i class='fa fa-folder-open'></i>&nbsp;&nbsp;View</a></div>";
                            }
                            return btn;
                        }
                    }

                ],
                buttons: [
                    'copyHtml5',
                    'excelHtml5',
                    'csvHtml5',
                    'pdfHtml5'
                ]
            });
    } else {
        $("#example").DataTable().clear().destroy();
        $("#example").DataTable();
    }
}

function GetTotalCounts(date) {
    date = date.split("-");
    var startdate = date[0];
    var enddate = date[1];
    var url = "/Dashboard.aspx/MethodGetcounts";
    var data = JSON.stringify({ startdate: startdate, enddate: enddate });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        var Parseresult = JSON.parse(JsonResult).table;
        $('#Totalvisit').text(Parseresult[0].totalvisit);
        $('#Stickeredvisit').text(Parseresult[0].stickeredvisit);
        $('#TotalOwner').text(Parseresult[0].totalowner);
        $('#TotalSME').text(Parseresult[0].totalsme);
        $('#TotalBroker').text(Parseresult[0].totalbroker);
        $('#TotalUNION').text(Parseresult[0].totalunion);

        $('#TotalFollowUp').text(Parseresult[0].followup);
        $('#TotalDownload').text(Parseresult[0].downloaded);
        $('#TotalNotIntrested').text(Parseresult[0].notinterested);
        $('#TotalActualDownloads').text(Parseresult[0].actualdownloads);
        $("#TotalOverallDownload").text(Parseresult[0].overalldownloads);

    }
}

function fnGetdatabycard(current) {
    var cardtype = current.attr('cardtype');
    var date = $("#reportrange span").text();
    if (cardtype == "tvisit") {
        GetAdminDashboard(date, '', '', '', '')
        return;
    }
    else if (cardtype == "svisit") {
        GetAdminDashboard(date, '', '', 'svisit', '');
        return;
    }
    else if (cardtype == "FollowUp" || cardtype == "Downloaded " || cardtype == "NotIntrested") {
        GetAdminDashboard(date, '', '', '', cardtype);
        return;
    }
    else {
        GetAdminDashboard(date, '', '', cardtype, '');
        return;
    }

}

function fnGetVehicleData(current, fovmid) {
    var url = "/Dashboard.aspx/MethodGetVehicleInfo";
    var data = JSON.stringify({ fovmid: fovmid });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        $("#DynamicModal .modal-dialog").addClass('modal-lg');
        $("#DynamicModalTitle").text('Vehicle Information');
        var ParseResult = JSON.parse(JsonResult).table;
        var tr = "";
        for (var i = 0; ParseResult.length > i; i++) {
            tr = tr + '<tr>\
                       <td style="text-transform: capitalize;">'+ ParseResult[i].owntype + '</td>\
                       <td style="text-transform: capitalize;">'+ ParseResult[i].vehicletype + '</td>\
                       <td style="text-transform: capitalize;">'+ ParseResult[i].vehiclecapacity + '</td>\
                       <td style="text-transform: capitalize;">'+ ParseResult[i].vehiclesize + '</td>\
                       <td style="text-transform: capitalize;">'+ ParseResult[i].vehiclecount + '</td>\
                       </tr>';
        }
        var table = '<table  class="table table-striped" style="width: 100%"><thead>\
        <tr><th>Own Type</th><th>Vehicle Type</th><th>Vehicle Capacity</th><th>Vehicle Size</th><th>Vehicle Count</th></tr></thead><tbody>'+ tr + '</tbody>\
        </table>';

        $("#appendModalBodyData").empty();
        $("#appendModalBodyData").append(table);
        $("#DynamicModal").modal('show');
    }
}

function fnGetpreflocationData(current, fovmid) {
    var url = "/Dashboard.aspx/MethodGetPrefLocationData";
    var data = JSON.stringify({ fovmid: fovmid });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        $("#DynamicModal .modal-dialog").removeClass('modal-lg');
        $("#DynamicModalTitle").text('Preferred Locations');
        var ParseResult = JSON.parse(JsonResult).table;
        var tr = "";
        for (var i = 0; ParseResult.length > i; i++) {
            tr = tr + '<tr>\
                       <td style="text-transform: capitalize;">'+ ParseResult[i].fromloction + '</td>\
                       <td style="text-transform: capitalize;">'+ ParseResult[i].tolocation + '</td></tr>';
        }
        var table = '<table  class="table table-striped" style="width: 100%"><thead>\
        <tr><th>From City</th><th>To City</th></tr></thead><tbody>'+ tr + '</tbody>\
        </table>';

        $("#appendModalBodyData").empty();
        $("#appendModalBodyData").append(table);
        $("#DynamicModal").modal('show');
    }
}

function fnGetImagesData(current, fovmid) {
    var url = "/Dashboard.aspx/MethodGetAllimages";
    var data = JSON.stringify({ fovmid: fovmid });
    var JsonResult = doAjax(url, data);
    if (JsonResult != "") {
        var ParseResult = JSON.parse(JsonResult).table;
        var image = "";
        for (var i = 0; ParseResult.length > i; i++) {
            image = image + '<div class="col-sm-4"><img onclick="fnviewImage($(this))" class="galleryimg" style="width: 100%" src="uploadedimages/' + ParseResult[i].imageurl + '" /></div>';
        }
        $(".ViewLargeImage").empty();
        $("#appendGallery").empty();
        $("#appendGallery").append(image);
        $("#ImageGalleryModal").modal('show');
    }

}



function fnviewImage(Current) {
    $(".ViewLargeImage").empty();
    var imguri = '<img src="' + Current.attr('src') + '" style="width:100%;"/>';
    $(".ViewLargeImage").append(imguri);
}

function btnActions() {
    $('.foclass').click(function (e) {
        e.stopImmediatePropagation();
        e.preventDefault();
        $(this).toggleClass('activefo');
        $(this).find('.tickcirlce').toggleClass('d-none');
    });
}


function fngetdatabyfoid(current) {
    if ($(".foclass").hasClass('activefo')) { 
    var ids = [];
    $(".activefo").each(function () {
        ids.push({
            userid: $(this).attr('value'),
        })
    });
    var counts = ids.length;
    if (counts == 0) {
        $("#appendSelections").text("All Field Officers");
        GetAdminDashboard($("#reportrange span").text(), '', '', '')
    } else {
        $("#appendSelections").text(counts + " Selected");
        var date = $("#reportrange span").text();
        date = date.split("-");
        var startdate = date[0];
        var enddate = date[1];
        var url = "/Dashboard.aspx/MethodGetDataforAdminbyuserid";
        var data = JSON.stringify({
            startdate: startdate,
            enddate: enddate,
            Useridlist: ids
        });
        var JsonResult = doAjax(url, data);
        if (JsonResult != "") {
            var i = 1;
            var ParseResult = JSON.parse(JsonResult).table;
            $("#example").DataTable().clear().destroy();
            $("#example").DataTable(
                {
                    bLengthChange: true,
                    lengthMenu: [[10, 15, -1], [10, 15, "All"]],
                    bFilter: true,
                    bSort: true,
                    bPaginate: true,
                    dom: 'Bfrtip',
                    data: ParseResult,
                    columns: [
                        {
                            render: function (data, type, row) {
                                return "<div>" + i++ + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div>" + row.stickeringstatus + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div>" + row.status + "</div><div>(<small>" + row.remarks + "</small>)</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                var downloadstatus = '<div class="downsts"><i class="fa fa-times text-danger" aria-hidden="true"></i>&nbsp;No</div>';
                                if (row.downloadapp == "Y") {
                                    downloadstatus = '<div class="downsts"><i class="fa fa-check text-success" aria-hidden="true"></i>&nbsp;Yes</div>';
                                }
                                return "<div>" + downloadstatus + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div><strong>" + row.name + "</strong></div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                var verified = "<i class='fa fa-times-circle text-danger'></i>";
                                if (row.ismobileverified == "Y") {
                                    verified = "<i class='fa fa-check-circle text-success'></i>"
                                }
                                return "<div><strong>" + row.mobile + "&nbsp;" + verified + "</strong></div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div>" + row.emailid + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div>" + row.address + "</div>";
                            }
                        },

                        {
                            render: function (data, type, row) {
                                return "<div style='text-transform:capitalize;'>" + row.owntype + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div>" + row.company + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div>" + row.visitdate + "&nbsp;&nbsp;" + row.visittime + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div>" + row.createdbyname + "</div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div onclick='fnGetVehicleData($(this)," + row.fovmid + ")' class='tablebtns btn btn-sm btn-primary'><a><i class='fas fa-truck'></i>&nbsp;&nbsp;View&nbsp;&nbsp;" + row.vehiclecount + "</a></div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                return "<div onclick='fnGetpreflocationData($(this)," + row.fovmid + ")' class='tablebtns btn btn-sm btn-primary'><a><i class='fa fa-map-marker'></i>&nbsp;&nbsp;View</a></div>";
                            }
                        },
                        {
                            render: function (data, type, row) {
                                var btn = "";
                                if (row.imagecounts > 0) {
                                    btn = "<div onclick='fnGetImagesData($(this)," + row.fovmid + ")' class='tablebtns btn btn-sm btn-primary'><a><i class='fa fa-folder-open'></i>&nbsp;&nbsp;View</a></div>";
                                } else {
                                    btn = "<div class='tablebtns btn btn-sm btn-primary' style='background-color: #b7b7b7;border-color: #afafaf;'><a><i class='fa fa-folder-open'></i>&nbsp;&nbsp;View</a></div>";
                                }
                                return btn;
                            }
                        }

                    ],
                    buttons: [
                        'copyHtml5',
                        'excelHtml5',
                        'csvHtml5',
                        'pdfHtml5'
                    ]
                });
        } else {
            $("#example").DataTable().clear().destroy();
            $("#example").DataTable();
        }

    }
    } 
}


function fnclearfilters(current) {
    $("#appendSelections").text("All Field Officers"); 
    $('.foclass').removeClass('activefo');
    $('.foclass').find('.tickcirlce').addClass('d-none');    
    //GetAdminDashboard($("#reportrange span").text(), '', '', '', '');
}


var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
})