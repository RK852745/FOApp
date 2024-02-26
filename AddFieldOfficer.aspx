<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddFieldOfficer.aspx.cs" Inherits="AddFieldOfficer" %>


<!DOCTYPE html>

<html
lang="en"
class="light-style layout-menu-fixed"
dir="ltr"
data-theme="theme-default"
data-assets-path="assets/"
data-template="vertical-menu-template-free">
<head>
    <meta charset="utf-8" />
    <meta
        name="viewport"
        content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0" />

    <title>New Visit Registration | Field Officer</title>

    <meta name="description" content="" />
    <!-- Favicon -->
     <link rel="icon" type="image/x-icon" href="assets/img/New%20Logo.jpg" />

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
        href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet" />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <link rel="stylesheet" href="assets/vendor/libs/apex-charts/apex-charts.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="assets/js/config.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/fontawesome.min.css" integrity="sha512-giQeaPns4lQTBMRpOOHsYnGw1tGVzbAIHUyHRgn7+6FmiEgGGjaG0T2LZJmAPMzRCl+Cug0ItQ2xDZpTmEc+CQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href=" https://cdnjs.cloudflare.com/ajax/libs/cropper/2.3.4/cropper.min.css" />
    <link href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <style>
        #shortname, #shortname2 {
            text-align: center;
            background: #5f61e6;
            color: white;
            font-weight: bold;
            border-radius: 30px;
            padding-top: 8px;
        }

        table tr td {
            padding: 5px 20px !important;
            font-size: 13px;
            white-space: nowrap;
        }

        .actionbtns {
            background: #696cff;
            color: white !important;
            padding: 4px 10px;
            border-radius: 5px;
            margin-right: 10px;
            cursor: pointer;
        }

        .checkbtn, .cancelbtn {
            display: none;
        }

        .inputs {
            border: 1px solid lightgrey;
            border-radius: 5px;
            width: 100%;
            display: none;
            font-size: 13px;
        }

        .password {
            color: transparent;
            text-shadow: 0 0 8px #000;
            cursor: pointer;
        }

            .password:hover {
                color: black;
                text-shadow: 0;
            }
    </style>

    <link href="scss/styleVR.css" rel="stylesheet" />
</head>

<body>
    <div id="loaders" class="body d-none">
        <div class="loader"></div>
    </div>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->

            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                <div class="app-brand demo">
                    <a href="javascript:void(0)" class="app-brand-link">
                        <span class="app-brand-logo demo">
                            <img height="100" src="assets/img/Message_Logo1.png" />
                        </span>
                        <%-- <span class="app-brand-text demo menu-text fw-bolder ms-2">Field Officer</span>--%>
                    </a>

                    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
                        <i class="bx bx-chevron-left bx-sm align-middle"></i>
                    </a>
                </div>

                <div class="menu-inner-shadow"></div>

                <ul class="menu-inner py-1">
                    <li class="menu-header small text-uppercase"><span class="menu-header-text">Menu</span></li>

                    <!-- Dashboard -->
                    <li class="menu-item ">
                        <a href="Dashboard.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-home-circle"></i>
                            <div data-i18n="Analytics">Dashboard</div>
                        </a>
                    </li>
                    <li class="menu-item active">
                        <a href="VisitingRegistration.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-user"></i>
                            <div data-i18n="Boxicons">Add Field Officer</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="Report.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-file"></i>
                            <div data-i18n="Boxicons">Reports</div>
                        </a>
                    </li>
                                          <li class="menu-item">
  <a href="GPSandFastTag.aspx" class="menu-link">
  <i class="menu-icon tf-icons bx bx-map"></i>
 <div data-i18n="Boxicons">GPS FastTag</div>
 </a>
</li>
                </ul>
            </aside>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar">
                    <div class="mobileview layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                            <i class="bx bx-menu bx-sm"></i>
                        </a>
                    </div>
                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                        <ul class="navbar-nav flex-row align-items-center ms-auto">
                            <!-- Place this tag where you want the button to render. -->
                            <!-- User -->
                            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                    <div id="shortname" runat="server" class="avatar avatar-online">
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li>
                                        <a class="dropdown-item" href="#">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div id="shortname2" runat="server" class="avatar avatar-online">
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span id="userName" runat="server" class="fw-semibold d-block"></span>
                                                    <small class="text-muted">Executive</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <%-- <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="#">
                                            <i class="bx bx-user me-2"></i>
                                            <span class="align-middle">My Profile</span>
                                        </a>
                                    </li>--%>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                    </li>
                                    <li class="mobileview">
                                        <a onclick="Logout();" class="dropdown-item" href="javascript:void(0);">
                                            <i class="bx bx-power-off me-2"></i>
                                            <span class="align-middle">Log Out</span>
                                        </a>
                                    </li>
                                </ul>
                            </li>
                            <!--/ User -->
                        </ul>
                    </div>
                </nav>

                <!-- / Navbar -->

                <!-- Content wrapper -->
                <div class="content-wrapper">
                    <!-- Content -->
                    <div class="container-xxl flex-grow-1 container-p-y">
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Add New FO</h5>

                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="FullName">Type</label>
                                        <div class="input-group input-group-merge">
                                            <span id="Usertype" class="input-group-text"><i class="bx bx-user"></i></span>
                                            <select class="form-control" name="name" minlength="2" id="Usertypeis">
                                                <option selected disabled value="">Select Type</option>
                                                <option value="1">Field Officer</option>
                                                <option value="2">Call Center</option>
                                                <option value="3">BMS</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-3">
                                        <label class="form-label" for="Company">Employee ID</label>
                                        <div class="input-group input-group-merge">
                                            <span id="" class="input-group-text"><i class="bx bx-buildings"></i></span>
                                            <input type="text" id="EmployeeID" class="form-control" placeholder="Employee ID" aria-label="Employee ID" aria-describedby="Employee ID">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="FullName">Name</label>
                                        <div class="input-group input-group-merge">
                                            <span id="Name2" class="input-group-text"><i class="bx bx-user"></i></span>
                                            <input type="text" class="form-control" name="name" minlength="2" id="Name" placeholder="First & last Name" aria-label="" aria-describedby=" ">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="basic-icon-default-phone">Mobile</label>
                                        <div class="input-group input-group-merge">
                                            <span id="Mobile2" class="input-group-text"><i class="bx bx-phone"></i></span>
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="Mobile" maxlength="10" pattern="\d{10}" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="basic-icon-default-phone">Alternate Mobile</label>
                                        <div class="input-group input-group-merge">
                                            <span id="AlternateMobile2" class="input-group-text"><i class="bx bx-phone"></i></span>
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="AlternateMobile" maxlength="10" pattern="\d{10}" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="email">Email</label>
                                        <div class="input-group input-group-merge">
                                            <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                                            <input type="text" id="email" class="form-control" placeholder="example" aria-label="example" aria-describedby="">
                                        </div>
                                        <div class="form-text">You can use letters, numbers &amp; periods </div>
                                    </div>
                                    <div class="mb-3 col-sm-6">
                                        <label class="form-label" for="Address">Address</label>
                                        <div class="input-group input-group-merge">
                                            <span id="Address2" class="input-group-text"><i class="bx bx-map"></i></span>
                                            <input type="text" id="Address" class="form-control" placeholder="Full Address" aria-label="Full Address" aria-describedby="Full Address">
                                        </div>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-sm-4">
                                    </div>
                                    <div class="col-sm-4">
                                    </div>
                                    <div class="col-sm-4">
                                        <button onclick="fnSubmitBtn($(this));" class="btn btn-primary w-100">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">All field officers details</h5>
                            </div>
                            <div class="card-body table-responsive">
                                <table id="FODetails" class="table table-striped" style="width: 100%">
                                    <thead>
                                        <tr>
                                            <th>EmpID</th>
                                            <th>Name</th>
                                            <th>Mobile</th>
                                            <th>Alt Mobile</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Edit</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                    <tfoot>
                                        <tr>
                                            <th>EmpID</th>
                                            <th>Name</th>
                                            <th>Mobile</th>
                                            <th>Alt Mobile</th>
                                            <th>Email</th>
                                            <th>Address</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <th>Edit</th>
                                            <th></th>
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <!-- / Content -->

                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">
                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <div class="mb-2 mb-md-0">
                                ©
                 
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                , made with ❤️ by
                 
                                <a href="javascript:void(0);" target="_blank" class="footer-link fw-bolder">TrucksUp.com</a>
                            </div>
                        </div>
                    </footer>
                    <!-- / Footer -->

                    <div class="content-backdrop fade"></div>
                </div>
                <!-- Content wrapper -->
            </div>
            <!-- / Layout page -->
        </div>

        <!-- Overlay -->
        <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->



    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="assets/vendor/libs/jquery/jquery.js"></script>
    <script src="assets/vendor/libs/popper/popper.js"></script>
    <script src="assets/vendor/js/bootstrap.js"></script>
    <script src="assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->
    <script src="assets/vendor/libs/apex-charts/apexcharts.js"></script>

    <!-- Main JS -->
    <script src="assets/js/main.js"></script>

    <!-- Page JS -->
    <script src="assets/js/dashboards-analytics.js"></script>
    <script src="assets/js/ui-popover.js"></script>
    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/geocomplete/1.7.0/jquery.geocomplete.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/0.8.1/cropper.min.js"></script>
    <script src="js/Main.js?v=0.1"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.js"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap5.min.js"></script>
    <script>
        $(function () {
            GetFieldOffiecersdata();
        });

        function fnSubmitBtn(current) {
            current.attr('disabled', 'disabled');

            var name = $.trim($("#Name").val());
            var mobile = $.trim($("#Mobile").val());
            var altmob = $.trim($("#AlternateMobile").val());
            var email = $.trim($("#email").val());
            var address = $.trim($("#Address").val());
            var empid = $.trim($("#EmployeeID").val());
            var usertype = $.trim($("#Usertypeis option:selected").val());
            if (name.length == 0) {
                alert('Please enter Name');
                return;
            }
            else if (mobile.length < 10) {
                alert('Please enter 10 digit mobile number');
                return;
            } else {

                var Data = JSON.stringify({
                    name: name,
                    mobile: mobile,
                    altmob: altmob,
                    email: email,
                    address: address,
                    empid: empid,
                    usertype: usertype
                })
                var url = "/AddFieldOfficer.aspx/MethodAddNewFieldOfficer";
                var data = Data;
                var JsonResult = doAjax(url, data);
                if (JsonResult == "Y") {
                    alert('Field Officer added successfull');
                    GetFieldOffiecersdata();
                }
            }
        }

        function GetFieldOffiecersdata() {
            var url = "/AddFieldOfficer.aspx/MethodgetFieldOfficerdata";
            var data = {};
            var JsonResult = doAjax(url, data);
            if (JsonResult != "") {
                var ParseResult = JSON.parse(JsonResult).table;
                $("#FODetails").DataTable().clear().destroy();
                $("#FODetails").DataTable(
                    {
                        bLengthChange: true,
                        //lengthMenu: [[10, 15, -1], [10, 15, "All"]],
                        // bFilter: true,
                        // bSort: true,
                        //  bPaginate: true,
                        // dom: 'Bfrtip',
                        data: ParseResult,
                        columns: [
                            {
                                render: function (data, type, row) {
                                    return "<div class='labels'>" + row.employeeid + "</div><input class='inputs empid' type='text' value='" + row.employeeid + "'/>";
                                }
                            },
                            {
                                render: function (data, type, row) {
                                    return "<div class='labels'>" + row.name + "</div><input class='inputs foname' type='text' value='" + row.name + "'/>";
                                }
                            },
                            {
                                render: function (data, type, row) {
                                    return "<div class='labels'>" + row.mobile + "</div><input class='inputs mobile' type='text' value='" + row.mobile + "'/>";
                                }
                            },
                            {
                                render: function (data, type, row) {
                                    return "<div class='labels'>" + row.altmobile + "</div><input class='inputs altmob' type='text' value='" + row.altmobile + "'/>";
                                }
                            },

                            {
                                render: function (data, type, row) {
                                    return "<div class='labels'>" + row.email + "</div><input class='inputs mailid' type='text' value='" + row.email + "'/>";
                                }
                            },
                            {
                                render: function (data, type, row) {
                                    return "<div class='labels'>" + row.fulladdress + "</div><input class='inputs address' type='text' value='" + row.fulladdress + "'/>";
                                }
                            },

                            {
                                render: function (data, type, row) {
                                    return "<div class='labels'>" + row.username + "</div><input class='inputs uname' type='text' value='" + row.username + "'/>";
                                }
                            },
                            {
                                render: function (data, type, row) {
                                    return "<div class='labels password'>" + row.password + "</div><input class='inputs pass' type='text' value='" + row.password + "'/>";
                                }
                            },
                            {
                                render: function (data, type, row) {
                                    return "<div><a class='actionbtns editbtn' onclick='fnEditrow($(this))'><i class='fa fa-edit'></i></a>\
                                    <a class='actionbtns checkbtn' onclick='fnUpdaterow($(this)," + row.executiveid + ")'><i class='fa fa-check'></i></a>\
                                    <a class='actionbtns cancelbtn' onclick='fnCancelrow($(this))'><i class='fa fa-times'></i></a></div>";
                                }
                            },
                            {
                                render: function (data, type, row) {
                                    return "<div><a class='actionbtns deletebtn' onclick='fndeleterow($(this)," + row.executiveid + ")'><i class='fa fa-trash'></i></a></div>";
                                }
                            }
                        ]
                    });
            } else {
                $("#FODetails").DataTable().clear().destroy();
                $("#FODetails").DataTable();
            }
        }


        function fnEditrow(current) {
            var tr = current.closest("tr");
            var checkbtn = tr.find('.checkbtn'),
                cancelbtn = tr.find('.cancelbtn'),
                inputs = tr.find('.inputs'),
                labels = tr.find('.labels'),
                editbtn = tr.find('.editbtn');
            checkbtn.show();
            cancelbtn.show();
            editbtn.hide();
            inputs.show();
            labels.hide();
        }

        function fnCancelrow(current) {
            var tr = current.closest("tr");
            var checkbtn = tr.find('.checkbtn'),
                cancelbtn = tr.find('.cancelbtn'),
                inputs = tr.find('.inputs'),
                labels = tr.find('.labels'),
                editbtn = tr.find('.editbtn');
            checkbtn.hide();
            cancelbtn.hide();
            editbtn.show();
            inputs.hide();
            labels.show();
        }

        function fnUpdaterow(current, updateid) {
            var tr = current.closest("tr");
            var checkbtn = tr.find('.checkbtn'),
                cancelbtn = tr.find('.cancelbtn'),
                inputs = tr.find('.inputs'),
                labels = tr.find('.labels'),
                editbtn = tr.find('.editbtn');

            var employeeid = tr.find('.empid').val(),
                fullname = tr.find('.foname').val(),
                mobile = tr.find('.mobile').val(),
                altmobile = tr.find('.altmob').val(),
                emailid = tr.find('.mailid').val(),
                address = tr.find('.address').val(),
                username = tr.find('.uname').val(),
                password = tr.find('.pass').val();

            var Data = JSON.stringify({
                employeeid: employeeid,
                fullname: fullname,
                mobile: mobile,
                altmobile: altmobile,
                emailid: emailid,
                address: address,
                username: username,
                password: password,
                updateid: updateid
            })
            var url = "/AddFieldOfficer.aspx/MethodUpdateOfficerdata";
            var data = Data;
            var JsonResult = doAjax(url, data);
            if (JsonResult == "Y") {
                alert('FO Updated successfully');
                checkbtn.hide();
                cancelbtn.hide();
                editbtn.show();
                inputs.hide();
                labels.show();
                GetFieldOffiecersdata();
            }

        }

        function fndeleterow(current, deleteid) {
            var url = "/AddFieldOfficer.aspx/MethodDeleteOfficerdata";
            var data = JSON.stringify({ deleteid: deleteid });
            var JsonResult = doAjax(url, data);
            if (JsonResult == "Y") {
                alert('FO Deleted successfully');
                GetFieldOffiecersdata();
            }
        }

    </script>
</body>
</html>

