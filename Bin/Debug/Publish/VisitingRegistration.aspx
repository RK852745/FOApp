<%@ page language="C#" autoeventwireup="true" inherits="VisitingRegistration, App_Web_ptk2nwqr" %>

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
       .trucksupcrm {
         color: #3E2089;
         font-weight: bold;
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
                    <li class="menu-item active">
                        <a href="VisitingRegistration.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-user"></i>
                            <div data-i18n="Boxicons">Add New Visit</div>
                        </a>
                    </li>
                    <li class="menu-item">
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

                <nav
                    class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
                    id="layout-navbar">
                    <div class="mobileview layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                            <i class="bx bx-menu bx-sm"></i>
                        </a>
                    </div>
                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                        <div class="trucksupcrm">TRUCKSUP CRM</div>
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
                                <h5 class="mb-0">Add New Visiting Details</h5>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="ownTypes">Type</label>
                                        <div class="input-group input-group-merge">
                                            <span id="ownType" class="input-group-text"><i class="bx bx-user"></i></span>
                                            <select type="text" class="form-control" id="ownTypes" placeholder="John Doe" aria-label="John Doe" aria-describedby=" ">
                                                <option selected value="">--Select Own type--</option>
                                                <option value="owner">Owner</option>
                                                <option value="broker">Broker</option>
                                                <option value="sme">SME</option>
                                                <option value="union">Union</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="FullName">Full Name</label>
                                        <div class="input-group input-group-merge">
                                            <span id="fullname2" class="input-group-text"><i class="bx bx-user"></i></span>
                                            <input type="text" class="form-control" name="name" minlength="2" id="FullName" placeholder="First & last Name" aria-label="John Doe" aria-describedby=" " autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="basic-icon-default-phone">Phone No</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-phone2" class="input-group-text"><i class="bx bx-phone"></i></span>
                                            <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="basic-icon-default-phone" maxlength="10" pattern="\d{10}" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2">
                                        </div>
                                        <span class="verifystatus notverified"><i class="fa fa-times-circle"></i>&nbsp;not verified</span>
                                        <div class="d-flex">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="verifiedbycall">
                                                <label class="form-check-label" for="verifiedbycall">
                                                    Verified by Call
                                                </label>
                                            </div>
                                            &nbsp;&nbsp;
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                                <label class="form-check-label" for="flexRadioDefault1">
                                                    Send OTP  
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="email">Email</label>
                                        <div class="input-group input-group-merge">
                                            <span class="input-group-text"><i class="bx bx-envelope"></i></span>
                                            <input type="text" id="email" class="form-control" placeholder="example@gmail.com" aria-label="example" aria-describedby="" autocomplete="off">
                                        </div>
                                        <div class="form-text">You can use letters, numbers &amp; periods </div>
                                    </div>
                                    <div class="mb-3 col-sm-5">
                                        <label class="form-label" for="Address">Address</label>
                                        <div class="input-group input-group-merge">
                                            <span id="basic-icon-default-company2" class="input-group-text"><i class="bx bx-map"></i></span>
                                            <input type="text" id="Address" class="form-control" placeholder="Full Address" aria-label="Full Address" aria-describedby="Full Address" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-3">
                                        <label class="form-label" for="Company">Company</label>
                                        <div class="input-group input-group-merge">
                                            <span id="" class="input-group-text"><i class="bx bx-buildings"></i></span>
                                            <input type="text" id="Company" class="form-control" placeholder="Company" aria-label="Company" aria-describedby="Company" autocomplete="off">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-3">
                                        <label class="form-label" for="VisitingDate">Visiting Date</label>
                                        <div class="input-group input-group-merge">
                                            <span id="" class="input-group-text"><i class="bx bx-calendar"></i></span>
                                            <input type="date" readonly id="VisitingDate" class="form-control" placeholder="Visiting Date" aria-label="Visiting Date" aria-describedby="Visiting Date">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-3">
                                        <label class="form-label" for="VisitingTime">Visiting Time</label>
                                        <div class="input-group input-group-merge">
                                            <span id="" class="input-group-text"><i class="fa fa-clock"></i></span>
                                            <input type="time" id="VisitingTime" readonly class="form-control" placeholder="Visiting Time" aria-label="Visiting Time" aria-describedby="Visiting Time">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-3">
                                        <label class="form-label" for="Latitude">Current Latitude</label>
                                        <div class="input-group input-group-merge">
                                            <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                            <input type="text" id="Latitude" readonly class="form-control" placeholder="" aria-label="Visiting Time" aria-describedby="Visiting Time">
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-3">
                                        <label class="form-label" for="Longitude">Current Longitude</label>
                                        <div class="input-group input-group-merge">
                                            <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                            <input type="text" id="Longitude" readonly class="form-control" placeholder="" aria-label="Visiting Time" aria-describedby="Visiting Time">
                                        </div>
                                    </div>
                                   <%-- <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="inputGroupFilevisitingcard">Upload visiting card</label>
                                        <div class="input-group">
                                            <input type="file" onchange="loadImageFile($(this));" class="form-control uploadimagefile" accept="image/png, image/gif, image/jpeg" typefor="3" id="inputGroupFilevisitingcard">
                                        </div> 
                                        <div id="imagePreview3" class="row">
                                        </div>
                                    </div>--%>
                                    <div class="mb-3 col-sm-4">
                                       <label class="form-label" for="inputGroupFilevisitingcard">Upload visiting card</label>
                                       <div class="input-group">
                                           <input type="file" onchange="uploadImage(this, 'imagePreview3');" class="form-control uploadimagefile" accept="image/png, image/gif, image/jpeg" typefor="3" id="inputGroupFilevisitingcard">
                                       </div>
                                       <div id="imagePreview3" class="row">
                                       </div>
                                   </div>
                                </div>
                            </div>
                            <%--OwnerAssetsInfo--%>
                            <%--<div class="card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Owner Assets Info</h5>
                            </div>--%>
                            <div class="card-body" style="display:none;">
                                <div class="row">
                                    <div class="col-sm-8">
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
                                                <label class="form-label" for="vehicleType">Vehicle Type</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="fa fa-truck" aria-hidden="true"></i></span>
                                                    <select type="text" class="form-control" id="vehicleType" placeholder="John Doe" aria-label="John Doe" aria-describedby="">
                                                        <option selected value="">--Select Vehicle Type--</option>
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
                                                <label class="form-label" for="vehicleSize">Vehicle Size</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="fa fa-truck"></i></span>
                                                    <select type="text" class="form-control" id="vehicleSize" placeholder="John Doe" aria-label="John Doe" aria-describedby="">
                                                        <option selected value="">--Select Vehicle Size--</option>
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
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="vehicleCapacity">Vehicle Capacity</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="fa fa-truck"></i></span>
                                                    <select type="text" class="form-control" id="vehicleCapacity" placeholder="John Doe" aria-label="John Doe" aria-describedby="">
                                                        <option selected value="">--Select Vehicle Capacity--</option>
                                                        <option value="0-6 MT">0-6 MT</option>
                                                        <option value="6-10 MT">6-10 MT</option>
                                                        <option value="10-15 MT">10-15 MT</option>
                                                        <option value="15-20 MT">15-20 MT</option>
                                                        <option value="20-25 MT">20-25 MT</option>
                                                        <option value="25-30 MT">25-30 MT</option>
                                                        <option value="30-35 MT">30-35 MT</option>
                                                        <option value="35-40 MT">35-40 MT</option>
                                                        <option value="Above 40 MT">Above 40 MT</option>
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
                                                    <input type="text" class="form-control" id="vehiclenumber" value="" placeholder="AB 00 CD 0000" aria-label="John Doe" aria-describedby="" oninput="formatVehicleNumber(this)" autocomplete="off" />
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-5">
                                                <label class="form-label" for="RcPicture">Upload RC </label>
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary" type="button" id="" data-bs-toggle="popover" data-bs-offset="0,14" data-bs-placement="right" data-bs-html="true" data-bs-content="<p>Please upload vehicle  RC image here.</p>"><i class="fa fa-info-circle" style="font-size: 15px;"></i></button>
                                                    <input type="file" onchange="loadImageFile($(this));" multiple="multiple" class="form-control uploadimagefile" accept="image/png, image/gif, image/jpeg" typefor="4" id="RcPicture">
                                                </div>
                                                <div id="imagePreview4" class="row">
                                                     
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="drivermobilenumbers">Driver Mobile</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="drivermobilenumber" class="input-group-text"><i class="bx bx-phone"></i></span>
                                                    <input type="number" oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);" id="drivermobilenumbers" maxlength="10" pattern="\d{10}" class="form-control phone-mask" placeholder="658 799 8941" aria-label="658 799 8941" aria-describedby="basic-icon-default-phone2" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-8">
                                                <label class="form-label" style="visibility:hidden;" for="basic-icon-default-phone">Driver Mobile</label>
                                                <div class="">
                                                    <button onclick="fnAddVehiclebtn($(this));" class="btn btn-info float-end">Add +</button>
                                                </div>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0">Added Vehicle</h5>
                                        </div>
                                        <div id="appendaddedvichle" class="addedvichle">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class=" card-header d-flex justify-content-between align-items-center">
                                <h5 class="mb-0">Preferred Loctaion</h5>
                            </div>
                            <%--PreferredLoctaion--%>
                            <div class="card-body ">
                                <div class="row">
                                    <div class="col-sm-8">
                                        <div class="row">
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="FromLoc">Location From </label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                                    <input type="text" class="form-control" id="FromLoc" placeholder="Location From" aria-label="" aria-describedby="" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="ToLoc">Location To</label>
                                                <div class="input-group input-group-merge">
                                                    <span id="" class="input-group-text"><i class="bx bx-map"></i></span>
                                                    <input type="text" id="ToLoc" class="form-control phone-mask" placeholder="Location To" aria-label="658 799 8941" aria-describedby="ToLoc" autocomplete="off">
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-2"></div>
                                            <div class="mb-3 col-sm-2">
                                                <label class="form-label" for="ToLoc" style="visibility: hidden;">addbtn</label>
                                                <div class="">
                                                    <button onclick="fnAddLocationbtn($(this));" class="btn btn-info float-end">Add +</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        <div class="card-header d-flex justify-content-between align-items-center">
                                            <h5 class="mb-0">Added Preferred Loctaion</h5>
                                        </div>
                                        <div id="appendlocation" class="preferredlocation">
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <%--StickeringStatus--%>
                            <div class="card-body " style="display:none;">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="">Stickering Status</label>
                                                <div class="d-flex w-100">
                                                    <div class="form-check mt-3 w-50">
                                                        <input name="default-radio-1" class="form-check-input" type="radio" value="" id="stickeryes">
                                                        <label class="form-check-label" for="stickeryes">
                                                            Yes
                                                        </label>
                                                    </div>
                                                    <div class="form-check mt-3 w-50">
                                                        <input name="default-radio-1" class="form-check-input" checked type="radio" value="" id="stickerno">
                                                        <label class="form-check-label" for="stickerno">
                                                            No
                                                        </label>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="inputGroupFileSticker">Upload image with sticker </label>
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary" type="button" id="" data-bs-toggle="popover" data-bs-offset="0,14" data-bs-placement="right" data-bs-html="true" data-bs-content="<p>Please upload truck owner info image here.</p><div><img src='assets/img/stickerimage.png' class='w-100' alt='owner info image' /></div>"><i class="fa fa-info-circle" style="font-size: 15px;"></i></button>
                                                    <input type="file" multiple="multiple" class="form-control uploadimagefile" accept="image/png, image/gif, image/jpeg" typefor="1" id="inputGroupFileSticker">
                                                </div>
                                                <div id="imagePreview1" class="row">
                                                </div>
                                            </div>
                                            <div class="mb-3 col-sm-4">
                                                <label class="form-label" for="inputGroupFileowner">Upload image with owner</label>
                                                <div class="input-group">
                                                    <button class="btn btn-outline-primary" type="button" id="" data-bs-toggle="popover" data-bs-offset="0,14" data-bs-placement="right" data-bs-html="true" data-bs-content="<p>Please upload truck owner info image here.</p><div><img src='assets/img/ownerinfoimage.png' class='w-100' alt='owner info image' /></div>"><i class="fa fa-info-circle" style="font-size: 15px;"></i></button>
                                                    <input type="file" multiple="multiple" class="form-control uploadimagefile" accept="image/png, image/gif, image/jpeg" typefor="2" id="inputGroupFileowner">
                                                </div>
                                                <div id="imagePreview2" class="row">
                                                </div>
                                            </div>

                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="Status">Status</label>
                                        <div class="input-group input-group-merge">
                                            <select id="Status" class="form-control">
                                                <option value="" selected>--Select Status--</option>
                                                <option value="Downloaded">Downloaded</option>
                                                <option value="FollowUp">Follow Up</option>
                                                <option value="NotInterested">Not Interested</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="mb-3 col-sm-4">
                                        <label class="form-label" for="Remarks">Remarks</label>
                                        <div class="input-group input-group-merge">
                                            <textarea style="height: 100px;" type="text" id="Remarks" class="form-control" placeholder="Remarks" aria-label="Remarks" aria-describedby="" autocomplete="off"></textarea>
                                        </div>
                                    </div>
                                </div>
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

    <img  id="original-Img"/>
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
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/VehicleRegistrationHelper.js?v=1.1"></script>
    <script src="js/internetspeedtest.js"></script>
    <script>
        function formatVehicleNumber(input) {
            input.value = input.value.replace(/[^a-zA-Z0-9]/g, '').toUpperCase().substring(0, 12);
        }
    </script>



</body>
</html>

