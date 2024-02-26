<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GPSandFastTag.aspx.cs" Inherits="GPSandFastTag" %>

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
                    <li class="menu-item">
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
                    <li class="menu-item active">
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
                          <h5 class="mb-0">Product Details</h5>
                    </div>
                             <div class="card-body">
            <div class="row">
                <!-- First Row with 4 dropdowns -->
                <div class="col-md-3">
                    <label for="productCategory">Product Category</label>
                    <select class="form-select" id="productCategory">
                        <option value="">--Select Product Category--</option>
                        <!-- Add options for product categories here -->
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="productName">Product Name</label>
                    <select class="form-select" id="productName">
                        <option value="">--Select Product Name--</option>
                        <!-- Add options for product names here -->
                    </select>
                </div>
                <div class="col-md-3">
                    <label for="servicesProvider">Services Provider</label>
                    <select class="form-select" id="servicesProvider">
                        <option value="">--Select Services Provider--</option>
                        <!-- Add options for services providers here -->
                    </select>
                </div>
            </div>

            <div class="row mt-3">
                <!-- Second Row with input boxes -->
                <div class="col-md-3">
                    <label for="mrp">MRP</label>
                    <input type="text" class="form-control" id="mrp">
                </div>
                <div class="col-md-3">
                    <label for="quantity">Quantity</label>
                    <input type="text" class="form-control" id="quantity">
                </div>
                <div class="col-md-3 ">
                    <label for="discount">Discount</label>
                    <input type="text" class="form-control" id="discount">
                </div>
                <div class="col-md-3">
                    <label for="netAmount">Net Amount</label>
                    <input type="text" class="form-control" id="netAmount">
                </div>
            </div>
        </div>
          </div>
                             
      <div class="card mb-4">
    <div class="card-header">
        <h5 class="mb-0">Delivery Address</h5>
    </div>
    <div class="card-body">
        <div class="row">
          <div class="col-md-4 mb-3">
    <label for="mobileNumber">Mobile Number</label>
    <input type="text" class="form-control" id="mobileNumber" placeholder="Mobile Number" oninput="validateMobileNumber(this)">
    <div id="mobileNumberError" style="color: red;"></div>
</div>

            <div class="col-md-4 mb-3">
                <label for="fullName">Name</label>
                <input type="text" class="form-control" id="fullName" placeholder="Full Name">
            </div>
            <div class="col-md-4 mb-3">
                <label for="addressLine1">Address Line </label>
                <input type="text" class="form-control" id="addressLine" placeholder="Address Line">
            </div>
            <div class="col-md-4 mb-3">
                <label for="city">City</label>
                <input type="text" class="form-control" id="city" placeholder="City">
            </div>
            <div class="col-md-4 mb-3">
                <label for="state">State</label>
                <input type="text" class="form-control" id="state" placeholder="State">
            </div>
            <div class="col-md-4 mb-3">
    <label for="pincode">Pincode</label>
    <input type="text" class="form-control" id="pincode" placeholder="Pincode" oninput="validatePincode(this)">
    <div id="pincodeError" style="color: red;"></div>
</div>
        </div>
    </div>
</div>

                             
          <div class="card mb-4">
          <div class="card-header">
          <h5 class="mb-0">Vehicle Details</h5>
          </div>
          <div class="card-body">
             <div class="row">
            <div class="col-md-4 mb-3">
                <label for="vehicleNumber">Vehicle Number</label>
                <input type="text" class="form-control" id="vehicleNumber" placeholder="Vehicle Number">
            </div>
            <div class="col-md-4 mb-3">
                <label for="chassisNumber">Chassis Number</label>
                <input type="text" class="form-control" id="chassisNumber" placeholder="Chassis Number">
            </div>
             
            <div class="col-md-4 mb-3">
                <label for="tag">Tag ID/Code</label>
                <input type="text" class="form-control" id="tag" placeholder="Tag ID/Code">
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button class="btn btn-primary" onclick="submitForm()">Submit</button>
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
         </div>
     
    

   <%-- <img  id="original-Img"/>--%>
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
    <script src="https//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
   <%-- <script src="js/VehicleRegistrationHelper.js?v=1.1"></script>--%>
    <script src="js/internetspeedtest.js"></script> 
    
   <script>

       $(document).ready(function () {
           // Call the GetProductDetails function when the document is ready
           GetProductDetails(); 
            
       });

       function validateMobileNumber(input) {
           var mobileNumber = input.value.replace(/\D/g, ''); // Remove all non-numeric characters
           var mobileNumberError = document.getElementById("mobileNumberError");

           if (mobileNumber.length === 0) {
               mobileNumberError.textContent = "Please enter a mobile number.";
           } else if (mobileNumber.length < 10) {
               mobileNumberError.textContent = "Mobile number must be at least 10 digits.";
           } else if (mobileNumber.length > 10) {
               mobileNumberError.textContent = "Mobile number must not exceed 10 digits.";
               input.value = mobileNumber.slice(0, 10); // Truncate to 10 digits if longer
           }
           else if (mobileNumber.length === 10) {
               mobileNumberError.textContent = "";
               input.value = mobileNumber.slice(0, 10); // Truncate to 10 digits if longer
           } else {
               mobileNumberError.textContent = ""; // Clear error message for successful input
           }
       }

       function validatePincode(input) {
           var pincode = input.value.replace(/\D/g, ''); // Remove all non-numeric characters
           var pincodeError = document.getElementById("pincodeError");

           if (pincode.length === 0) {
               pincodeError.textContent = "Please enter a PIN code.";
           } else if (pincode.length > 6) {
               pincodeError.textContent = "PIN code must not exceed 6 digits.";
               input.value = pincode.slice(0, 6); // Truncate to 6 digits if longer
           } else if (pincode.length === 6) {
               pincodeError.textContent = "";
               input.value = pincode.slice(0, 6); // Truncate to 6 digits if longer
           } else {
               pincodeError.textContent = "";
           }
       }

       function GetProductDetails() {
           var url = "/GPSandFastTag.aspx/GetProductDetails";
           var data = {};
           $.ajax({
               type: "POST",
               url: url,
               data: JSON.stringify(data),
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (response) {
                   // Parse the 'd' property to extract the actual response object
                   var responseData = JSON.parse(response.d);

                   console.table(responseData.table);

                   // Clear existing options
                   $('#productCategory').empty();

                   // Append the default option
                   $('#productCategory').append($('<option>', {
                       value: "",
                       text: "--Select Product Category--"
                   }));

                   // Add new options based on the response
                   $.each(responseData.table, function (index, category) {
                       $('#productCategory').append($('<option>', {
                           value: category.categoryid,
                           text: category.categoryname
                       }));
                   });
                    
                   // Trigger change event to ensure any associated event handlers are executed
                   $('#productCategory').trigger('change');
               },
               error: function (xhr, status, error) {
                   console.error(error);
               }
           });
       }

       $('#productCategory').change(function () {
           var selectedCategory = $(this).val();

           if (selectedCategory !== "") {
               GetCategoryName(selectedCategory);
           } else {
               $('#productName').empty();
               $('#productName').append($('<option>', {
                   value: "",
                   text: "--Select Product Name--"
               }));
           }
       });

       function GetCategoryName(categoryname) {
           var data = { CategoryName: categoryname }; 
           $.ajax({
               type: "POST",
               url: "/GPSandFastTag.aspx/GetProductName",
               data: JSON.stringify(data),
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (response) {
                    
                   // Parse the 'd' property to extract the actual response object
                   var responseData = JSON.parse(response.d);
                   console.log(responseData.table); 

                   // Clear existing options
                   $('#productName').empty();

                   // Append the default option
                   $('#productName').append($('<option>', {
                       value: "",
                       text: "--Select Product Name--"
                   }));

                   // Add new options based on the response
                   $.each(responseData.table, function (index, category) {
                       $('#productName').append($('<option>', {
                           value: category.categoryid,
                           text: category.tags
                       }));
                   });

                   // Trigger change event to ensure any associated event handlers are executed
                   $('#productName').trigger('change');


                   $('#servicesProvider').empty();

                   // Append the default option
                   $('#servicesProvider').append($('<option>', {
                       value: "",
                       text: "--Select Services Provider--"
                   }));

                   // Add new options based on the response
                   $.each(responseData.table, function (index, provider) {
                       $('#servicesProvider').append($('<option>', {
                           value: provider.serviceprovider,
                           text: provider.serviceprovider
                       }));
                   });

                   // Trigger change event to ensure any associated event handlers are executed
                   $('#servicesProvider').trigger('change');

               },
               error: function (xhr, status, error) {
                   console.error(error);
               }
           });
       }

       function submitForm() {
           var productCategory = $('#productCategory').val();
           var productName = $('#productName').val();
           var servicesProvider = $('#servicesProvider').val();

           var mrp = $('#mrp').val();
           var quantity = $('#quantity').val();
           var discount = $('#discount').val();  
           var netAmount = $('#netAmount').val();

           var mobileNumber = $('#mobileNumber').val();
           var fullName = $('#fullName').val();
           var addressLine = $('#addressLine').val();
           var city = $('#city').val();
           var state = $('#state').val();
           var pincode = $('#pincode').val();

           var vehicleNumber = $('#vehicleNumber').val();
           var chassisNumber = $('#chassisNumber').val(); 
           var tag = $('#tag').val();

           $.ajax({
               type: "POST",
               url: "/GPSandFastTag.aspx/MethodAddData",
               data: JSON.stringify({
                   productCategory: productCategory,
                   productName: productName,
                   servicesProvider: servicesProvider,
                   mrp: mrp,
                   quantity: quantity,
                   discount: discount, // Uncomment this line if discount field is present
                   netAmount: netAmount,
                   mobileNumber: mobileNumber,
                   fullName: fullName,
                   addressLine: addressLine,
                   city: city,
                   state: state,
                   pincode: pincode,
                   vehicleNumber: vehicleNumber,
                   chassisNumber: chassisNumber,
                   ownerNumber: ownerNumber,
                   ownerName: ownerName,
                   tag: tag
               }),
               contentType: "application/json; charset=utf-8",
               dataType: "json",
               success: function (response) {
                   // Handle success response
                   console.log('Form submitted successfully:', response);
                   Swal.fire({
                       position: 'top-end',
                       icon: 'success', // Show success icon
                       title: response.d, // Success message from server response
                       showConfirmButton: false,
                       timer: 2500
                   }).then(function () {
                       location.href = "GPSandFastTag.aspx"; // Redirect to the specified page
                   });
               },
               error: function (xhr, status, error) {
                   // Handle error response
                   console.error('Error submitting form:', error);
                   // You can show an error message to the user or perform any other error handling logic
               }
           });
       }

   </script>


</body>
</html>

