<%@ page language="C#" autoeventwireup="true" inherits="Stickers, App_Web_ptk2nwqr" %>

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

    <title>Sticker Visit | Field Officer</title>

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
    <link href="assets/css/dataTables.min.css" rel="stylesheet" />
    <style>
        .swal2-container {
            z-index: 9999 !important;
        }

        .verifystatus {
            position: absolute;
            right: 30px;
            margin-top: -27px;
            font-size: 12px;
            display: none;
            z-index: 999;
        }

        .notverified {
            background: red;
            color: white;
            padding: 2px 5px;
            border-radius: 5px;
        }

        .verified {
            background: #71dd37;
            color: white;
            padding: 2px 5px;
            border-radius: 5px;
        }

        #adminchildAdd {
            display: none;
        }

        .boxess {
            padding: 10px;
            border-radius: 10px;
            background: aliceblue;
            margin-bottom: 15px;
        }

        .editbtnofkids {
            float: right;
            margin-right: 20px;
            margin-top: 10px;
            font-size: 20px;
        }



        #CropPicPopupNew .page {
            max-width: 768px;
            align-items: flex-start;
            flex-wrap: wrap;
            height: 100%;
        }


        #CropPicPopupNew .box {
            padding: 0.5em;
            width: 100%;
            margin: 0.5em;
        }


        #CropPicPopupNew .box-2 {
            padding: 0.5em;
            /* width: calc(100% / 2 - 1em);*/
        }


        #CropPicPopupNew .options label,
        #CropPicPopupNew .options input {
            width: 4em;
            padding: 0.5em 1em;
        }

        #CropPicPopupNew .btn {
            background: white;
            color: black;
            border: 1px solid black;
            padding: 0.5em 1em;
            text-decoration: none;
            margin: 0.8em 0.3em;
            display: inline-block;
            cursor: pointer;
        }

        .cropper-bg {
            width: 100% !important;
        }

        #CropPicPopupNew .hide {
            display: none;
        }

        #CropPicPopupNew img {
            max-width: 100%;
        }
    </style>
    <style>
        .removeVehicle {
            position: absolute;
            right: 0;
            top: -10px;
            background: red;
            padding: 3px 9px;
            color: white !important;
            border-radius: 30px;
            cursor: pointer;
        }

        .imageremove {
            color: red;
            background: white;
            padding: 0px 4px;
            border-radius: 30px;
            cursor: pointer;
            font-size: 11px;
            text-align: center;
            margin-top: 5px;
        }

        #shortname, #shortname2 {
            text-align: center;
            background: #5f61e6;
            color: white;
            font-weight: bold;
            border-radius: 30px;
            padding-top: 8px;
        }

        /* Chrome, Safari, Edge, Opera */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        input[type=number] {
            -moz-appearance: textfield;
        }

        table.dataTable tbody th, table.dataTable tbody td {
            padding: 5px 5px;
            font-size: 12px;
        }

        table.dataTable thead th, table.dataTable thead td {
            padding: 5px 5px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.3);
        }

        #vehiclenumber {
            text-transform: uppercase;
        }
    </style>

    <style>
        .loader {
            width: 100px;
            height: 10px;
            background-color: #ccc;
            position: relative;
        }

        .progress-bar {
            width: 0;
            height: 100%;
            background-color: #007bff;
            position: absolute;
            transition: width 0.3s;
        }

        .percentage {
            margin-top: 10px;
            font-size: 15px;
            font-weight: bold;
        }
                .trucksupcrm {
                    font-weight: bold;
 color: #3E2089;
}
    </style>
    <link href="scss/styleVR.css" rel="stylesheet" />
</head>

<body>
   <%-- <div id="loaders" class="body d-none">
        <div class="loader"></div>
    </div>--%>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
        <div class="layout-container">
            <!-- Menu -->
            <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
                <div class="app-brand demo">
                    <a href="Index" class="app-brand-link">
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
                        <a href="Index.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-home-circle"></i>
                            <div data-i18n="Analytics">Dashboard</div>
                        </a>
                    </li>
                    <li class="menu-item">
                        <a href="VisitingRegistration.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-user"></i>
                            <div data-i18n="Boxicons">Add New Visit</div>
                        </a>
                    </li>
                    <li class="menu-item active">
                        <a href="Stickers.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-map"></i>
                            <div data-i18n="Boxicons">Add Sticker Visit</div>
                        </a>
                    </li>
                </ul>
            </aside>
            <!-- / Menu -->

            <!-- Layout container -->
            <div class="layout-page">
                <!-- Navbar -->

                <nav class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme" id="layout-navbar">
                   
                    <div class="mobileview layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">

                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                            <i class="bx bx-menu bx-sm"></i>
                        </a>
                    </div>
                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                       <div class="trucksupcrm"> <span>TRUCKSUP CRM STICKERING </span> </div> 
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
                        <div id="networkalert" runat="server" class="card mb-4">
                            <div class="p-3" style="color: #0584ff !important; background: bisque;">
                                <img width="20" src="assets/img/no-wifi.png" />&nbsp;No Internet Connection. Data will save on local storage but please don't forget to push the data on database whenever you come in network area
                            </div>
                        </div>
                       <div class="card mb-2">
                            <div class="card-body" style="padding: 1rem 1.5rem;">
                                <div class="row">
                                    <div class="col-md-3 col-sm-6 mb-3">
                                        <div class="tab">
    <button class="tablinks btn-default btn btn-primary" onclick="openTab(event, 'vehicleContent')" id="defaultTab">Vehicle</button>
    <button class="tablinks btn btn-primary" onclick="openTab(event, 'dhabaContent')">Dhaba</button>
</div>
</div>
                                </div>
                            </div>
                        </div>


                        <div id="vehicleContent" style="display: none" class="tabcontent">

                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">Add New Visiting Details For Vehicle</h5>
                                </div>
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <div class="col-md-3 col-sm-6 mb-3">
                                        <div class="card" style="background: #5f61e6; border-radius: 5px; color: white;">
                                            <div class="card-body p-2">
                                                <span>Today sticker visit</span>
                                                <h3 id="dailyvisitcounts" runat="server" class="card-title text-nowrap mb-1" style="color: white!important;">0</h3>
                                            </div>
                                        </div>
                                        &nbsp;
                                      <div class="card" style="background: #5f61e6; border-radius: 5px; color: white;">
                                          <div class="card-body p-2">
                                              <span>Today sticker's counts</span>
                                              <h3 id="H1" runat="server" class="card-title text-nowrap mb-1" style="color: white!important;">0</h3>
                                          </div>
                                      </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="row">
                                            <%--<div id="offlineUserNum" runat="server" class="mb-3 col-sm-4">
                                            <label class="form-label" for="basic-icon-default-phone">User Mobile</label>
                                            <div class="input-group input-group-merge">
                                                <span id="UserMobile" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="UserMobileNo" maxlength="10" pattern="d{10}" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2">
                                            </div> 
                                        </div> --%>
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="FullName">Full Name</label>
                                            <div class="input-group input-group-merge">
                                                <span id="fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
                                                <input type="text" class="form-control" name="name" minlength="2" id="FullName" placeholder="First & last Name" aria-label="John Doe" aria-describedby=" " autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="basic-icon-default-phone">Driver Number</label>
                                            <div class="input-group input-group-merge">
                                                <span id="basic-icon-default-phone2" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="basic-icon-default-phone" maxlength="10" pattern="d{10}" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2" autocomplete="off">
                                            </div>
                                        </div>
                                        <%--<div class="mb-3 col-sm-4">
                                            <label class="form-label" for="phone">Operator Number</label>
                                            <div class="input-group input-group-merge">
                                                <span id="phones" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="phone" maxlength="10" pattern="d{10}" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="phone" autocomplete="off">
                                            </div>
                                        </div>--%>
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="phone">Operator Number</label>
                                            <div class="input-group input-group-merge">
                                                <span id="phones" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                 <input type="text" id="phone" class="form-control phone-mask" placeholder="6587998941" aria-label="6587998941" aria-describedby="phone" autocomplete="off" oninput="formatPhoneNumber(this)">
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="vehiclenumber">Vehicle Number</label>
                                            <div class="input-group input-group-merge">
                                                <span id="" class="input-group-text"><i class="fa fa-truck"></i></span>
                                                <input type="text" class="form-control" id="vehiclenumber" value="" placeholder="AB 00 CD 0000" aria-label="John Doe" aria-describedby="" oninput="formatVehicleNumber(this)" autocomplete="off" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="inputGroupFilevisitingcard">Upload Sticker Image</label>
                                            <div class="input-group">
                                                <input type="file" class="form-control uploadimagefile" accept="image/png, image/gif, image/jpeg" typefor="3" id="inputGroupFilevisitingcard" onchange="uploadImage(this, 'imagePreview3')">
                                            </div>
                                            <div id="imagePreview3" class="row">
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="FullName">Sticker Count</label>
                                            <div class="input-group input-group-merge">
                                                <input type="text" class="form-control" readonly name="name" minlength="2" id="StickerSize" placeholder="" value="0" aria-label="John Doe" aria-describedby=" ">
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-2">
                                            <label class="form-label" for="FullName">Sticker Small</label>

                                            <div class="input-group mb-3">
                                                <div class="input-group-text">
                                                    <input class="form-check-input mt-0 Sstickerdim" name="stickers" sattr="Small" type="checkbox" value="Small" />
                                                </div>
                                                <input type="number" class="form-control Smallcount" placeholder="0" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-2">
                                            <label class="form-label" for="FullName">Sticker Medium</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-text">
                                                    <input class="form-check-input mt-0 Mstickerdim" name="stickers" sattr="Medium" type="checkbox" value="Medium" />
                                                </div>
                                                <input type="number" class="form-control Mediumcount" placeholder="0" />
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-2">
                                            <label class="form-label" for="FullName">Sticker Large</label>
                                            <div class="input-group mb-3">
                                                <div class="input-group-text">
                                                    <input class="form-check-input mt-0 Lstickerdim" name="stickers" sattr="Large" type="checkbox" value="Large" />
                                                </div>
                                                <input type="number" class="form-control Largecount" placeholder="0" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <%--    <div class=" card-header d-flex justify-content-between align-items-center">
                                   <h5 class="mb-0">preferred lane</h5>
                              </div>--%>
                                <%--PreferredLoctaion--%>
                                <div class="card-body" style="display: none">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <div class="row">
                                                <div class="mb-3 col-sm-6">
                                                    <label class="form-label" for="FromLoc">Location From </label>
                                                    <div class="input-group input-group-merge">
                                                        <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                                        <input type="text" class="form-control" id="FromLoc" placeholder="Location From" aria-label="" aria-describedby="">
                                                    </div>
                                                </div>
                                                <div class="mb-3 col-sm-6">
                                                    <label class="form-label" for="ToLoc">Location To</label>
                                                    <div class="input-group input-group-merge">
                                                        <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                                        <input type="text" id="ToLoc" class="form-control phone-mask" placeholder="Location To" aria-label="658 799 8941" aria-describedby="ToLoc">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <%--StickeringStatus--%>
                                <%--OwnerAssetsInfo--%>
                                 <%--  <div class="card-header d-flex justify-content-between align-items-center" style="">
                                          <h5 class="mb-0">Assets Info</h5>
                                      </div>--%>
                                      <div class="card-body" style="display: none">
                                    <div class="row">

                                        <div class="row">
                                            <div class="col-sm-12 mb-3 OwnerAssetsInfo d-none">
                                                <lable>Business Associate Assets info</lable>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input inlineRadio" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="own">
                                                    <label class="form-check-label" for="inlineRadio1">Own Vehicle</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input inlineRadio" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="market">
                                                    <label class="form-check-label" for="inlineRadio2">Market Vehicle</label>
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="vehicleType">Body Type</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="fa fa-truck" aria-hidden="true"></i></span>
                                                    <select type="text" class="form-control" id="vehicleType" placeholder="John Doe" aria-label="John Doe" aria-describedby="">
                                                        <option selected value="">--Select Body Type--</option>
                                                        <option value="Open">Open</option>
                                                        <option value="Container">Container</option>
                                                        <option value="Open_Container">Open/Container</option>
                                                        <option value="Trailer">Trailer</option>
                                                        <option value="Platform">Platform</option>
                                                        <option value="ODC">O.D.C</option>
                                                        <option value="Tanker">Tanker</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="vehicleSize">Vehicle Type</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="fa fa-truck"></i></span>
                                                    <select type="text" class="form-control" id="vehicleSize" placeholder="John Doe" aria-label="John Doe" aria-describedby="">
                                                        <option selected value="">--Select Vehicle Type--</option>
                                                        <option value="MXL-24-16ton">MXL24-16Ton</option>
                                                        <option value="MXL25-20Ton">MXL25-20Ton</option>
                                                        <option value="MXL25-16Ton">MXL25-16Ton</option>
                                                        <option value="MXL28-25Ton">MXL28-25Ton</option>
                                                        <option value="MXL28-29Ton">MXL28-29Ton</option>
                                                        <option value="MXL32-14.5Ton">MXL32-14.5Ton</option>
                                                        <option value="MXL32-18Ton">MXL32-18Ton</option>
                                                        <option value="MXL32-15Ton">MXL32-15Ton</option>
                                                        <option value="MXL32-16Ton">MXL32-16Ton</option>
                                                        <option value="MXL40-35Ton">MXL40-35Ton</option>
                                                        <option value="MXL19-7Ton">MXL19-7Ton</option>
                                                        <option value="MXL20-9Ton">MXL20-9Ton</option>
                                                        <option value="MXL32-7Ton">MXL32-7Ton</option>
                                                        <option value="MXL32-9Ton">MXL32-9Ton</option>
                                                    </select>
                                                </div>
                                            </div>

                                            <div class="mb-3 col-sm-3">
                                                <label class="form-label" for="vehicleCount">Vehicle Count</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="fa fa-truck"></i></span>
                                                    <input type="number" class="form-control" id="vehicleCount" value="1" placeholder="" aria-label="John Doe" aria-describedby="" />
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="vehiclenumber">Vehicle Number</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="fa fa-truck"></i></span>
                                                    <input type="text" class="form-control" id="vehiclenumber" value="" placeholder="AB 00 CD 0000" aria-label="John Doe" aria-describedby="" />
                                                </div>
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
                                            <button onclick="SaveStickerVisits($(this));" class="btn btn-primary w-100">Submit</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>


                        <div id="dhabaContent" style="display: none" class="tabcontent">

                            <div class="card mb-4">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="mb-0">Add New Visiting Details For Dhaba</h5>
                                </div>
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <div class="col-md-3 col-sm-6 mb-3">
                                        <div class="card" style="background: #5f61e6; border-radius: 5px; color: white;">
                                            <div class="card-body p-2">
                                                <span>Today sticker Count Dhaba</span>
                                                <h3 id="dailyvisitcountsDhaba" runat="server" class="card-title text-nowrap mb-1" style="color: white!important;"></h3>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card-body">
                                    <div class="row">
                                        <!-- Dhaba Name -->
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="DhabaName">Dhaba Name</label>
                                            <div class="input-group input-group-merge">
                                                <span id="dhabaNameIcon" class="input-group-text"><i class="bx bx-building"></i></span>
                                                <input type="text" class="form-control" id="DhabaName" placeholder="Dhaba Name" aria-label="Dhaba Name" aria-describedby=" ">
                                            </div>
                                        </div>

                                        <!-- Dhaba Owner Number -->
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="DhabaOwnerNumber">Dhaba Owner Number</label>
                                            <div class="input-group input-group-merge">
                                                <span id="dhabaOwnerNumberIcon" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="DhabaOwnerNumber" maxlength="10" pattern="\d{10}" class="form-control phone-mask" placeholder="Dhaba Owner Number" aria-label="Dhaba Owner Number" aria-describedby="dhabaOwnerNumberIcon">
                                            </div>
                                        </div>

                                        <!-- Address -->
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="Address">Address</label>
                                            <div class="input-group input-group-merge">
                                                <span id="addressIcon" class="input-group-text"><i class="bx bx-map"></i></span>
                                                <input type="text" class="form-control" id="Address" placeholder="Address" aria-label="Address" aria-describedby="addressIcon">
                                            </div>
                                        </div>

                                        <!-- Owner Name -->
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="OwnerName">Owner Name</label>
                                            <div class="input-group input-group-merge">
                                                <span id="ownerNameIcon" class="input-group-text"><i class="bx bx-user"></i></span>
                                                <input type="text" class="form-control" id="OwnerName" placeholder="Owner Name" aria-label="Owner Name" aria-describedby="ownerNameIcon">
                                            </div>
                                        </div>

                                        <!-- Hotel Image -->

                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="inputGroupFilevisitingcard">Upload Sticker Image</label>
                                            <div class="input-group">
                                                <input type="file" class="form-control uploadimagefile" accept="image/png, image/gif, image/jpeg" typefor="3" id="inputGroupFilevisitingcard1" onchange="uploadImage(this, 'imagePreview4')">
                                            </div>
                                            <div id="imagePreview4" class="row">
                                            </div>
                                        </div>
                                        <!-- Button to request and upload live location -->
                                        <div class="mb-3 col-sm-3">
                                            <label class="form-label" for="Latitude">Current Latitude</label>
                                            <div class="input-group input-group-merge">
                                                <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                                <input type="text" id="Latitude" readonly="" class="form-control" placeholder="" aria-label="Visiting Time" aria-describedby="Visiting Time">
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-3">
                                            <label class="form-label" for="Longitude">Current Longitude</label>
                                            <div class="input-group input-group-merge">
                                                <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                                <input type="text" id="Longitude" readonly="" class="form-control" placeholder="" aria-label="Visiting Time" aria-describedby="Visiting Time">
                                            </div>
                                        </div>
                                        <div class="mb-3 col-sm-4">
                                            <label class="form-label" for="getLocationBtn">Share Live Location</label>
                                            <div class="input-group">
                                                <button id="getLocationBtn" class="btn btn-primary">Share Live Location</button>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-4"></div>
                                                <div class="col-sm-4"></div>
                                                <div class="col-sm-4">
                                                    <button onclick="SaveDhabaSticker(this)" class="btn btn-primary w-100">Submit</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="card d-none">
                            <div class="card-header">
                                <h6>offline Data(s)</h6>
                                <button onclick="fnpushdatatodatabase($(this));" class="btn btn-sm btn-primary float-end">Push All Data to Database</button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="tabledata" class="table">
                                        <thead>
                                            <tr>
                                                <th>FullName</th>
                                                <th>DriverNo</th>
                                                <th>OperatorNo</th>
                                                <th>Downloads</th>
                                                <th>stickerimg</th>
                                                <th>StickerSize</th>
                                                <th>LaneFrom</th>
                                                <th>LaneTo</th>
                                                <th>vehicleType</th>
                                                <th>vehicleSize</th>
                                                <th>vehicleCapacity</th>
                                                <th>vehicleCount</th>
                                                <th>vehiclenumber</th>
                                            </tr>

                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- / Content -->


                    <!-- Footer -->
                    <footer class="content-footer footer bg-footer-theme">

                        <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                            <span id="progress">JavaScript is turned off, or your browser is realllllly slow</span>
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
    <div class="modal fade" id="CropPicPopupNew" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="CropPicPopupNewLabel">Crop and preview image</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"><i class="fa-solid fa-times"></i></button>
                </div>
                <div class="modal-body">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12">
                                <main class="page">

                                    <!-- leftbox -->
                                    <div class="box-2">
                                        <div class="result"></div>
                                    </div>
                                    <br />
                                    <!--rightbox-->
                                    <div class="box-2 img-result hide">
                                        <!-- result of crop -->
                                        <img class="cropped" src="" alt="">
                                    </div>
                                    <!-- input file -->
                                    <div class="box">
                                        <div class="options hide d-none">
                                            <label>Width</label>
                                            <input type="number" class="img-w" value="300" min="100" max="1200" />
                                        </div>
                                        <!-- save btn -->

                                        <!-- download btn -->
                                        <a href="javascript:void(0);" class="btn download hide d-none">Download</a>
                                    </div>
                                </main>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" id="Cancelbtn" aria-label="Close" class="btn btn-primary">Cancel</button>
                    <button class="btn btn-primary save hide">Crop</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="OTPVerification" data-bs-backdrop="static" tabindex="-1">
        <div class="modal-dialog modal-sm">
            <form class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="DynamicModalTitle">Mobile number verification</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="text-center">
                                <img width="150" src="assets/otpverification.jpg" />
                            </div>
                            <div class="text-center">
                                <h6>Enter the Verification Code</h6>
                            </div>
                            <div class="text-center">
                                <p>Enter the 6 digit number that we send to <strong id="Mobilenumbertext">9876543210</strong></p>
                            </div>
                            <div class="inputs d-flex flex-row justify-content-center mt-2">
                                <input style="width: 150px; text-align: center; letter-spacing: 0.5em; padding-left: 18px;"
                                    type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" maxlength="6" id="mobileverifyotp" placeholder="******" class="form-control">
                            </div>
                            <span id="errorMsg"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" id="ResendOTPBtn" class="btn btn-outline-primary">0:00</button>
                </div>
            </form>
        </div>
    </div>
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
    <%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB8KEha4w6awdeV8g4rEOMoLvSO1CrUkXg&libraries=places&v=3&sensor=false" type="text/javascript"></script>--%>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/geocomplete/1.7.0/jquery.geocomplete.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/cropperjs/0.8.1/cropper.min.js"></script>
    <script src="js/Main.js?v=0.1"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.js"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.js"></script>
    <script async defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/additional-methods.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="js/dataTables.min.js"></script>
    <script src="js/sweetalert2@11.js"></script>
    <script src="js/StickervisitHelper.js"></script>
    <script src="js/internetspeedtest.js"></script>
    <script>
        $(document).ready(function () {
            $('input[type="checkbox"]').change(function () {
                if ($(this).prop('checked')) {
                    $('input[type="checkbox"]').not(this).prop('checked', false);
                }
            });
        });
         
    </script>
    <script>      
        document.addEventListener("DOMContentLoaded", function () {
                      openTab(event, 'vehicleContent');
        });
        function formatVehicleNumber(input) {
            input.value = input.value.replace(/[^a-zA-Z0-9]/g, '').toUpperCase().substring(0, 15);           
        }
        function formatPhoneNumber(input) {           
            const numericValue = input.value.replace(/\D/g, '');          
            const formattedValue = numericValue.substring(0, 10);
            input.value = formattedValue;
        }        
        function shareLiveLocation() {
            if ("geolocation" in navigator) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var latitude = position.coords.latitude;
                    var longitude = position.coords.longitude;

                    document.getElementById("Latitude").value = latitude;
                    document.getElementById("Longitude").value = longitude;
                }, function (error) {
                    console.error("Error getting location: " + error.message);
                });
            } else {
                console.error("Geolocation is not supported by your browser.");
            }
        }            
        var getLocationBtn = document.getElementById("getLocationBtn");
        getLocationBtn.addEventListener("click", shareLiveLocation);
    </script>     

   <script>
       document.addEventListener("DOMContentLoaded", function () {
         
           const smallInput = document.querySelector('.Smallcount');
           const mediumInput = document.querySelector('.Mediumcount');
           const largeInput = document.querySelector('.Largecount');

           const smallCheckbox = document.querySelector('.Sstickerdim');
           const mediumCheckbox = document.querySelector('.Mstickerdim');
           const largeCheckbox = document.querySelector('.Lstickerdim');

           const stickerSizeInput = document.getElementById('StickerSize');
         
           smallInput.addEventListener('input', limitInput);
           mediumInput.addEventListener('input', limitInput);
           largeInput.addEventListener('input', limitInput);

         
           smallCheckbox.addEventListener('change', updateStickerSize);
           mediumCheckbox.addEventListener('change', updateStickerSize);
           largeCheckbox.addEventListener('change', updateStickerSize);

           function limitInput(event) {
               const inputValue = event.target.value;
               const minValue = 0;
               const maxValue = 2;

               
               if (inputValue < minValue || inputValue > maxValue) {                   
                   alert('Please enter a value 1 or 2');                  
                   event.target.value = minValue;
               }
           }

           function updateStickerSize() {
               const inputField = this.parentNode.nextElementSibling.querySelector('input');

               
               if (inputField) {
                   const selectedCount = this.checked ? inputField.value : 0;

                  
                   smallCheckbox.disabled = smallCheckbox !== this && this.checked;
                   mediumCheckbox.disabled = mediumCheckbox !== this && this.checked;
                   largeCheckbox.disabled = largeCheckbox !== this && this.checked;

                   smallInput.disabled = smallCheckbox.disabled;
                   mediumInput.disabled = mediumCheckbox.disabled;
                   largeInput.disabled = largeCheckbox.disabled;

                   
                   stickerSizeInput.value = selectedCount;
               }
           }
       });
   </script>
   <%-- <script>
        function openTab(evt, tabName) {
            // Hide all tab contents
            var tabContents = document.getElementsByClassName("tabcontent");
            for (var i = 0; i < tabContents.length; i++) {
                tabContents[i].style.display = "none";
            }

            // Deactivate all tabs
            var tabLinks = document.getElementsByClassName("tablinks");
            for (var i = 0; i < tabLinks.length; i++) {
                tabLinks[i].style.backgroundColor = "";
                tabLinks[i].style.border = "";
            }

            // Show the selected tab content
            document.getElementById(tabName).style.display = "block";

            // Highlight the selected tab
            evt.currentTarget.style.backgroundColor = "#4CAF50"; // Green color
            evt.currentTarget.style.border = "1px solid #4CAF50"; // Green border
        }
    </script>--%>
    <script>
        document.addEventListener("DOMContentLoaded", function () {          
            document.getElementById("defaultTab").click();
        });

        function openTab(evt, tabName) {
           
            if (!evt || !evt.currentTarget) {
                console.error("Event or event target is undefined.");
                return;
            }

          
            var tabContents = document.getElementsByClassName("tabcontent");
            for (var i = 0; i < tabContents.length; i++) {
                tabContents[i].style.display = "none";
            }

            var tabLinks = document.getElementsByClassName("tablinks");
            for (var i = 0; i < tabLinks.length; i++) {
                tabLinks[i].style.backgroundColor = "";
                tabLinks[i].style.border = "";
            }
        
            document.getElementById(tabName).style.display = "block";

            // Highlight the selected tab
            evt.currentTarget.style.backgroundColor = "#4CAF50"; // Green color
            evt.currentTarget.style.border = "1px solid #4CAF50"; // Green border
        }
    </script>

</body>
</html>
