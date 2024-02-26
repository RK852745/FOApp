<%@ page language="C#" autoeventwireup="true" inherits="Report, App_Web_ptk2nwqr" %>

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
    <title>Dashboard - Analytics | Field Officer</title>
    <meta name="description" content="" />
    <!-- Favicon -->
    <link rel="icon" type="image/x-icon" href="assets/img/logo.png" />
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
    <script src="js/internetspeedtest.js"></script>
    <link href="assets/css/all.min.css" rel="stylesheet" />
    <link href="assets/css/fontawesome.min.css" rel="stylesheet" />
    <link href="assets/css/daterangepicker.css" rel="stylesheet" />
    <link href="scss/styleVR.css" rel="stylesheet" />
    <link href="https://cdn.datatables.net/1.13.2/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.dataTables.min.css" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
    <style>
        #multiselectmodalapppendlist {
            max-height: 300px;
            overflow: auto;
        }

        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
        }

        #appendcrads .card-body {
            padding: .5rem .5rem;
        }

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

        table tr th {
            white-space: nowrap;
        }

        .buttons-html5 {
            padding: 2px 10px !important;
            border: none !important;
            background: #696cff !important;
            color: white !important;
        }

        .page-link {
            padding: 7px !important;
        }

        .zoom {
            transition: .5s;
        }

            .zoom:hover {
                transform: scale(1.1);
            }

        #appendModalBodyData thead tr {
            background: var(--bs-purple);
        }

            #appendModalBodyData thead tr th {
                color: #fff !important;
            }

        .galleryimg {
            width: 100%;
            padding: 10px;
            background: #dedede;
            margin: 5px;
            border-radius: 10px;
            cursor: pointer;
        }

        .foclass {
            padding: 5px;
            background: #f2f2f2;
            border-radius: 5px;
            margin-bottom: 5px;
            cursor: pointer;
        }

        .activefo {
            color: #5f61e6;
        }

        .tickcirlce {
            float: right;
            margin-top: 5px;
            margin-right: 5px;
            color: #5f61e6;
        }
    </style>

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
                            <img height="50" src="assets/img/logo.png" />
                        </span>
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
                    <li class="menu-item">
                        <a href="AddFieldOfficer.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-user"></i>
                            <div data-i18n="Boxicons">Add Field Officer</div>
                        </a>
                    </li>
                    <li class="menu-item active">
                        <a href="Report.aspx" class="menu-link">
                            <i class="menu-icon tf-icons bx bx-file"></i>
                            <div data-i18n="Boxicons">Reports</div>
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
                    <div class=" mobileview layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
                        <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                            <i class="bx bx-menu bx-sm"></i>
                        </a>
                    </div>
                    <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
                        <!-- Search -->
                        <div class="navbar-nav align-items-center d-none">
                            <div class="nav-item d-flex align-items-center">
                                <i class="bx bx-search fs-4 lh-0"></i>
                                <input
                                    type="text"
                                    class="form-control border-0 shadow-none"
                                    placeholder="Search..."
                                    aria-label="Search..." />
                            </div>
                        </div>
                        <!-- /Search -->

                        <ul class="navbar-nav flex-row align-items-center ms-auto">
                            <!-- Place this tag where you want the button to render. -->
                            <!-- User -->
                            <li class="nav-item navbar-dropdown dropdown-user dropdown">
                                <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                                    <div runat="server" id="shortname" class="avatar avatar-online">
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li>
                                        <a class="dropdown-item" href="#">
                                            <div class="d-flex">
                                                <div class="flex-shrink-0 me-3">
                                                    <div runat="server" id="shortname2" class="avatar avatar-online">
                                                    </div>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <span id="userName" runat="server" class="fw-semibold d-block"></span>
                                                    <small class="text-muted">Executive</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>

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
                            <div class="card-header d-flex justify-content-between align-items-center" style="padding: 1.5rem 1.5rem 0.5rem 1.5rem;">
                                <h5 class="mb-0">Reports</h5>
                            </div>
                            <div class="card-body my-2">
                                <div class="row">
                                    <div class="col-sm-5 mb-4">
                                        <label>Daterange</label>
                                        <div id="reportrange" style="background: #fff; cursor: pointer; padding: 7px 10px; border: 1px solid #d9dee3; width: 100%; border-radius: 5px;">
                                            <i class="fa fa-calendar"></i>&nbsp;
                                            <span></span><i class="fa fa-caret-down" style="float: right; margin-top: 5px; }"></i>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 mb-4">
                                        <label>Filter By Employee Type</label>
                                        <select class="form-control" name="name" minlength="2" id="EmployeeType">
                                            <option selected="" disabled="" value="">Select Type</option>
                                            <option value="1">Field Officer</option>
                                            <option value="2">Call Center</option>
                                            <option value="3">BMS</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table id="reportDatatable" class="table table-striped" style="width: 100%">
                                        <thead>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                        <tfoot>
                                        </tfoot>
                                    </table>
                                </div>
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
    <!-- Place this tag in your head or just before your close body tag. -->
    <script src="assets/js/buttons.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/daterangepicker.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.2/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="js/Main.js?v=0.1"></script>
    <script src="js/ReportHelper.js"></script>
</body>
</html>
