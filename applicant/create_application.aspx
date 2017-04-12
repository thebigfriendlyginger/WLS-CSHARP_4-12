<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create_application.aspx.cs" Inherits="create_application" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="../NiceAdmin/img/favicon.png">

    <title>Create Application Navigation</title>

    <!-- Bootstrap CSS -->
    <link href="../NiceAdmin/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="../NiceAdmin/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="../NiceAdmin/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="../NiceAdmin/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="../custom-style.css" rel="stylesheet">
    <link href="../NiceAdmin/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <script src="js/respond.min.js"></script>
      <script src="js/lte-ie7.js"></script>
    <![endif]-->

    <style type="text/css">
        .auto-style1 {
            height: 80px;
        }
    </style>

</head>

<body>
    <form id="Form1" runat="server" enctype="multipart/form-data">
        <!-- container section start -->
        <section id="container" class="">
            <!--header start-->

            <!--NAV START-->
            <header class="header dark-bg">
                <div class="toggle-nav">
                    <div class="icon-reorder tooltips" data-placement="bottom"><i class="icon_menu"></i></div>
                </div>

                <!--logo start-->
                <span><a href="view-application.html" class="logo">Va Wildlife Center</a></span>
                <!--logo end-->

                <!--SEARCH-->
                <div class="nav search-row" id="top_menu">
                    <!--  search form start -->
                    <ul class="nav top-menu">
                    </ul>
                    <!--  search form end -->
                </div>
                <!--END SEARCH-->

                <div class="top-nav notification-row">
                    <!-- notificatoin dropdown start-->
                    <ul class="nav pull-right top-menu">

                        <li class="dropdown">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <span class="profile-ava">
                                    <asp:Image ID="ProfilePIC" alt="Profile Picture" runat="server" Height="39" Width="39" src="../images/Default PP.jpg" />
                                </span>
                                <span class="username">
                                    <asp:Label ID="NavUsername" runat="server" Text="username"></asp:Label>
                                </span>
                                <b class="caret"></b>
                            </a>
                            <asp:ImageMap ID="ImageMap1" runat="server"></asp:ImageMap>
                            <!--LOGOUT-->
                            <ul class="dropdown-menu extended logout">
                                <li class="change-password-dropdown">
                                    <a href="../change-password.html">Change Password</a>
                                </li>
                                <li class="log-out-dropdown">
                                    <a href="../index.html">Log Out</a>
                                </li>
                            </ul>
                            <!--END LOGOUT-->
                        </li>
                        <!-- user login dropdown end -->
                    </ul>
                    <!-- notificatoin dropdown end-->
                </div>
            </header>
            <!--header end-->

            <!--sidebar start-->
            <aside>
                <div id="sidebar" class="nav-collapse">
                    <!-- SIDEBAR MENU-->
                    <ul class="sidebar-menu">

                        <li class="sub-menu">
                            <!--TIMESHEET-->
                            <a href="javascript:;" class="">
                                <span>Application</span>
                                <span class="menu-arrow arrow_carrot-right"></span>
                            </a>
                            <ul class="sub">
                                <li><a class="" href="view-application.html">View Application</a></li>
                            </ul>
                        </li>
                        <!--END TIMESHEET-->

                    </ul>
                    <!-- END SIDEBAR MENU-->
                </div>
            </aside>
            <!--sidebar end-->
            <!--NAV END-->

            <!--main content start-->
            <section id="main-content">
                <section class="wrapper" style="padding-right: 30px;">
                    <div class="container">
                        <div class="row">
                            <!--START PAGE TITLE-->
                            <h3 class="page-header">Create your application
                            </h3>
                        </div>
                        <!--END PAGE TITLE-->

                        <div class="row">
                            <!--START ROW INSTRUCTIONS-->
                            <div class="col-md-9">
                                <!--START COL INSTRUCTION-->
                                <p>We're happy you're interested in a volunteer position at the Va Wildlife center! Please fill out the application below.</p>
                            </div>
                            <!--END COL INSYRUCTIONS-->

                        </div>
                        <!--END ROW INSTRUCTIONS-->


                        <div class="row">
                            <!--ROW SAVE-->
                            <div>
                                <a href="save-confirmation.html">
                                    <div class="save-app">
                                        <!--START DIV EDIT BUTTON-->
                                        <asp:Button ID="Later" class="save-app" runat="server" Text="Save for later" OnClick="saveForLater" />
                                    </div>
                                    <!--END DIV EDIT BUTTON-->
                                </a>
                            </div>
                            <!--END SAVE COL-->
                        </div>
                        <!--END ROW SAVE BUTTON-->
                    </div>

                    <!--END ROW Container..............-->
                    <div class="row">
                        <!--PROFILE-->
                        <div class="col-md-6" style="padding-left: 40px;">
                            <div class="row">
                                <!--START row public profile-->
                                <!--FIRST RESULT-->
                                <div class="col-md-12 toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">
                                                <asp:Label ID="UserName" runat="server" Text="Username"></asp:Label>
                                            </h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->

                                            <div class="col-md-12 col-md-toppad">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3" align="center">
                                                    <div>
                                                        <asp:Image ID="ProfileImg" alt="Profile Picture" runat="server" src="../data/sample/Default PP.jpg" class="img-circle img-responsive profile-image" />
                                                    </div>
                                                    <div class ="form">
                                                    <div class="col-md-1">
                                                        <asp:FileUpload ID="FileUploadpic" runat="server" />
                                                    </div>
<%--                                                    <div class="col-md-7">
                                                        <asp:Button ID="PictureUpload" runat="server" Text="Upload" OnClick="UploadClick" />
                                                    </div>--%>
                                                        </div>
                                                    <!---our public profile image--->
                                                </div>
                                                <!---END COL-MD-3--->
                                            </div>
                                            <br />
                                            <div class="col-md-12 col-md-toppad">
                                                <!--START COL MAIN TEXT-->
                                                <table class="table table-user-information">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>
                                                        <tr>
                                                            <td>Username:</td>
                                                            <td>
                                                                <asp:Label ID="ProUsername" runat="server" Text="Username"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Position:</td>
                                                            <td>
                                                                <asp:Label ID="Position" runat="server" Text="Not Chosen"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Departments:</td>
                                                            <td>
                                                                <asp:ListBox ID="Departmentlist" runat="server"></asp:ListBox>
                                                                <asp:Label ID="Departmentlbl" runat="server" Text="" Visible="false"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td>Email:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---email field--->
                                                                    <asp:Label ID="Email" runat="server" Text="Email"></asp:Label>
                                                                    <%--<input class="form-control" id="focusedInput" type="text" value="enter email">--%>
                                                                </div>
                                                                <!---end email field--->
                                                            </td>

                                                        </tr>

                                                    </tbody>
                                                </table>
                                                <!---END COL-MD-9--->
                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->
                            </div>
                            <!---end first row--->
                            <!--END PUBLIC PROFILE-->

                            <!--START PERSONAL INFORMATION-->
                            <div class="row">
                                <div class="col-md-12 col-md-toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">Personal Information</h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->
                                            <div class="row">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3">
                                                </div>
                                                <!---END COL-MD-3--->


                                                <table class="table table-user-information">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>

                                                        <tr>
                                                            <td>DOB:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---dob field--->
                                                                    <asp:TextBox ID="DOB" runat="server" class="form-control" type="date" value="MM/DD/YR" autofocus="autofocus"></asp:TextBox>
                                                                    <%--<input class="form-control" id="DOB1" type="text" value="MM/DD/YR">--%>
                                                                </div>
                                                            </td>
                                                            <!---end dob field--->
                                                        </tr>
                                                        <tr>

                                                            <td>Gender</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---gender field--->
                                                                    <asp:DropDownList ID="Gender" runat="server" class="form-control">
                                                                        <asp:ListItem>Select</asp:ListItem>
                                                                        <asp:ListItem>Male</asp:ListItem>
                                                                        <asp:ListItem>Female</asp:ListItem>
                                                                        <asp:ListItem>Other</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                            </td>
                                                            <!---end gender field--->

                                                        </tr>
                                                        <tr>

                                                            <td>Home Address</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="Address1" runat="server" type="text" class="form-control" value=""></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>Home Address</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="Address2" runat="server" type="text" class="form-control" value=""></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>City:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="City" runat="server" type="text" class="form-control" value=""></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>State:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="State" runat="server" type="text" class="form-control" value=""></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>ZipCode:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="ZipCode" runat="server" type="number" MinValue="9999" MaxLenght="5" class="form-control" value=""></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>Phone Number:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---phone number field--->
                                                                    <asp:TextBox ID="PhoneNumber" runat="server" type="number" MaxLenght="10" class="form-control" value="000-000-0000"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---phone number field--->

                                                        </tr>


                                                    </tbody>
                                                </table>

                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->

                            </div>
                            <!---END Second row--->

                            <!--END PERSONAL INFORMATION-->


                            <!--START EM CONTACT-->
                            <div class="row">
                                <div class="col-md-12 col-md-toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">Emergency Contact</h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->
                                            <div class="row">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3">
                                                </div>
                                                <!---END COL-MD-3--->


                                                <table class="table table-user-information">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>
                                                        <tr>
                                                            <td>Name:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="EMName" runat="server" class="form-control" value="enter name"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Relation:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="EMRelation" runat="server" class="form-control" value="enter relation"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Home Address:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="EMAddress" runat="server" class="form-control" MaxLenght="50" value="enter address"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Home Address:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="EMAddress2" runat="server" class="form-control" MaxLenght="50" value="enter address"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td>City:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="EMCity" runat="server" type="text" class="form-control" value="city"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>State:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="EMState" runat="server" type="text" class="form-control" value="state"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>ZipCode:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---address field--->
                                                                    <asp:TextBox ID="EMZipCode" runat="server" type="number" MinValue="9999" MaxLenght="5" class="form-control"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end address field--->

                                                        </tr>
                                                        <tr>

                                                            <td>Phone Number:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="EMPhoneNumber" runat="server" class="form-control" type="tel" MaxLenght="10" TextMode="number"></asp:TextBox>
                                                                </div>
                                                            </td>

                                                        </tr>

                                                    </tbody>
                                                </table>

                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->

                            </div>
                            <!---END Second row--->
                            <!---END EM CONTACT-->

                            <!--START MED INFO-->
                            <div class="row">
                                <div class="col-md-12 col-md-toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">Medical Information</h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->
                                            <div class="row">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3">
                                                </div>
                                                <!---END COL-MD-3--->


                                                <table class="table table-user-information">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>
                                                        <tr>
                                                            <td>Rabies Vaccinated within past 2 years:</td>
                                                            <td>
                                                                <div class="form-group ">
                                                                    <asp:RadioButtonList ID="VaccinatedRadio" runat="server" CssClass="radio">
                                                                        <asp:ListItem>  Yes</asp:ListItem>
                                                                        <asp:ListItem>  No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>

                                                                <!---end no checkbox--->
                                                            </td>
                                                            <!--end rabies vac field--->
                                                        </tr>
                                                        <tr>
                                                            <td>Allergies:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---allergies field--->
                                                                    <asp:TextBox ID="Allergies" runat="server" class="form-control" MaxLenght="500" TextMode="MultiLine" value="enter allergies." type="text"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end alleriges field--->
                                                        </tr>
                                                        <tr>

                                                            <td>Pre-Existing Medical Conditions:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---med condition field--->
                                                                    <asp:TextBox ID="MedicalConditions" runat="server" class="form-control" MaxLenght="500" TextMode="MultiLine" value="enter/explain contiion." type="text"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end allergies field--->

                                                        </tr>
                                                        <tr>

                                                            <td>Physical Limitations:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <!---limitations field--->
                                                                    <asp:TextBox ID="limitations" runat="server" class="form-control" MaxLenght="500" TextMode="MultiLine" value="enter/explain limitations." type="text"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end limitations field--->

                                                        </tr>

                                                    </tbody>
                                                </table>

                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->

                            </div>
                            <!---END Second row--->
                            <!---END MED INFO--->
                        </div>

                        <div class="col-md-6" style="padding-left: 40px;">
                            <!--START AVAILABILITY INFO-->
                            <div class="row">
                                <div class="col-md-12 col-md-toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">Wildlife Center Information</h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->
                                            <div class="row">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3">
                                                </div>
                                                <!---END COL-MD-3--->


                                                <table class="table table-user-information form-group">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>
                                                        <tr>
                                                            <td rowspan="9" class="form-group">Availability:
                                                         <br>
                                                                <div class="form-group">
                                                                </div>
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td>
                                                                <br />
                                                                <br />
                                                                <asp:Label ID="DayTitle" runat="server" Text="Days of the Week"></asp:Label>
                                                            </td>
                                                            <td colspan="2">
                                                                <br />
                                                                <br />
                                                                <asp:Label ID="DayStart" runat="server" Text="Start Time:"></asp:Label></td>
                                                            <td>
                                                                <br />
                                                                <br />
                                                                <asp:Label ID="DayEnd" runat="server" Text="End Time:"></asp:Label>
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:Label ID="Day1" runat="server" Text="Monday:"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day1St" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day1f" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:Label ID="Day2" runat="server" Text="Tuesday:"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day2St" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day2f" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:Label ID="Day3" runat="server" Text="Wednesday:"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day3St" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day3f" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:Label ID="Day4" runat="server" Text="Thursday:"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day4St" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day4f" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="form">
                                                                    <asp:Label ID="Day5" runat="server" Text="Friday"></asp:Label>
                                                                </div>
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day5St" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="Day5f" runat="server" TextMode="Time"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">
                                                                <!---end seasonal checkbox--->
                                                            </td>
                                                            <td colspan="2">
                                                                <div class="form-group">
                                                                    <asp:RadioButtonList ID="AvailabilityRadio" runat="server" CssClass="radio" BorderColor="White" BorderStyle="None">
                                                                        <asp:ListItem>  Year Round</asp:ListItem>
                                                                        <asp:ListItem>  Seasonal</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="4">
                                                                <div class="form-group">
                                                                    Notes:<br />
                                                                    <asp:TextBox ID="Availability" runat="server" class="form-control" MaxLenght="50" TextMode="MultiLine" value="ex. Monday 9:00am-12:00pm" type="text"></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" class="auto-style1">Distance willing to travel:
                            <br>
                                                                (Miles)
                                                            </td>
                                                            <td colspan="3" class="auto-style1">
                                                                <div class="form-group">
                                                                    <!---distance field--->
                                                                    <asp:TextBox ID="Distance" class="form-control" runat="server" type="number" value="enter distance in miles."></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end distance field--->
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">Do you hold a valid permit to rehabilitate
                                                            <br>
                                                                wildlife in the state of Virginia?

                                                            </td>
                                                            <td colspan="2">&nbsp;</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:RadioButtonList ID="RehabpermitRadio" runat="server" CssClass="radio">
                                                                        <asp:ListItem>  Yes</asp:ListItem>
                                                                        <asp:ListItem>  No</asp:ListItem>
                                                                    </asp:RadioButtonList>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">Species limitation:</td>
                                                            <td colspan="3">
                                                                <div class="form-group">
                                                                    <!---species limit field--->
                                                                    Notes:<br />
                                                                    <asp:TextBox ID="Specieslimitation" class="form-control" runat="server" type="text" value="ex. No bears."></asp:TextBox>
                                                                </div>
                                                            </td>
                                                            <!---end species field--->
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->

                            </div>
                                                            <div class="row">
                                    <div class="col-md-12 col-md-toppad">
                                        <!--START COL 6-->
                                        <div class="panel panel-info">
                                            <!--START PANEL INFO-->
                                            <div class="panel-heading">
                                                <!--START PANEL HEADING-->
                                                <h3 class="panel-title">Attach Documents</h3>
                                                <!--NAME-->
                                            </div>
                                            <!---END PANEL PANEL-HEADING--->
                                            <div class="panel-body">
                                                <!--START DIVE BODY-->
                                                <div class="row">
                                                    <!--START RWO PANEL BODY-->
                                                    <div class="col-md-3 col-lg-3">
                                                    </div>
                                                    <!---END COL-MD-3--->


                                                    <table class="table table-user-information">
                                                        <!--TABLE USER INFO-->
                                                        <tbody>
                                                            <tr>
                                                                <td colspan="3">
                                                                    <label for="FileUpload">Choose a file ending in .doc, .docx, or .pdf</label></td>
                                                            </tr>

                                                            <tr>
                                                                <td>
                                                                    <div class="form-group">
                                                                        <br />
                                                                        <asp:DropDownList ID="Filetype" runat="server" class="form-group">
                                                                            <asp:ListItem Selected="True" Value="&quot;&quot;">Select File Type</asp:ListItem>
                                                                            <asp:ListItem>Rabies Vaccination</asp:ListItem>
                                                                            <asp:ListItem>Rehab Permit</asp:ListItem>
                                                                            <asp:ListItem>Resume</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-group">
                                                                        &nbsp;<br />
                                                                        <asp:FileUpload ID="FileUploaded" runat="server" />

                                                                        <asp:Label ID="UploadLabel" runat="server" Text="........ Files hove been Uploaded. " ForeColor="#009933" Visible="False" CssClass="form-group"></asp:Label>
                                                                        <br />
                                                                    </div>
                                                                </td>
                                                                <td>
                                                                    <div class="form-group">
                                                                        &nbsp;<br />
                                                                        <asp:Button ID="Uploadbutton" runat="server" Text="Upload" OnClick="UploadClick" />
                                                                        <br />
                                                                    </div>
                                                                </td>
                                                            </tr>

                                                        </tbody>
                                                    </table>

                                                </div>
                                                <!---END ROW--->
                                            </div>
                                            <!---END PANEL-BODY--->
                                        </div>
                                        <!---END PANEL-PANEL INFO--->
                                    </div>
                                    <!---END COL-MD-6--->

                                </div>
                                <!---END Second row--->
                                <!--END ATTACH DOCS-->
                                <!--END PROFILE-->


                                <!--END ROW SAVE BUTTON-->
                            </div>
                        </div>
                        <!--PROFILE-->
                        </div>
                            <!---END Second row--->
                            <!-------------------------------------------------------------------------------------------------->

                            <!--START OUTREACH TEAM INFO-->
                            <div class="row" runat="server" id="frmOutreach" visible="false">
                                <div class="col-md-12 col-md-toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">Outreach Team Information</h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->
                                            <div class="row">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3 " align="center">
                                                </div>
                                                <!---END COL-MD-3--->


                                                <table class="table table-user-information">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>
                                                        <tr>
                                                            <td>Tours:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtTours" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <tr>
                                                                <td>Offsite display</td>
                                                                <td>
                                                                    <asp:TextBox ID="txtOffsite" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                        </tr>
                                                        <tr>
                                                            <td>Reptile Handling</td>
                                                            <td>
                                                                <asp:TextBox ID="txtReptileHandling" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Reptiles Handling notes</td>
                                                            <td>
                                                                <asp:TextBox ID="txtReptileHandlingNotes" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Falconers Knot</td>
                                                            <td>
                                                                <asp:TextBox ID="txtFalconersKnot" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Birds to handle:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtBirds" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td>Birds to remove from enclosue:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtBirdsRemove" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>

                                                            <td>Birds to note:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtBirdsNotes" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                    </tbody>
                                                </table>

                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->

                            </div>
                            <!---END Second row--->

                            <!--END OUTREAC-->

                            <!--START ANIMAL CARE TEAM INFO-->
                            <div class="row" runat="server" id="frmAnimalCare" visible="false">
                                <div class="col-md-12 col-md-toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">Animal Care Team Information</h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->
                                            <div class="row">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3 " align="center">
                                                </div>
                                                <!---END COL-MD-3--->


                                                <table class="table table-user-information">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>
                                                        <tr>
                                                            <td>Reptile Room:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtReptileRoom" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Reptile Room Soak Day:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtReptileRoomSD" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Education Snake Feeding Day:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtEducationSnake" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>ICU:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtICU" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Aviary:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtAviary" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Mammals:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtMammals" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>PU&E:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtPUE" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>PU&E Weigh Day:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtPUEWD" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Fawns:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtFawns" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Formula:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtFormula" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Meals:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtMeals" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Raptor Feed:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtRaptorFeed" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>ISO:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtISO" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Comments:</td>
                                                            <td>
                                                                <asp:TextBox ID="txtACComments" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>



                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->

                            </div>
                            <!---END Second row--->

                            <!--END ANIMAL CARE TEAM-->



                            <!--START TRANSPORT TEAM INFO-->
                            <div class="row" runat="server" id="frmTransport" visible="false">
                                <div class="col-md-12 col-md-toppad">
                                    <!--START COL 6-->
                                    <div class="panel panel-info">
                                        <!--START PANEL INFO-->
                                        <div class="panel-heading">
                                            <!--START PANEL HEADING-->
                                            <h3 class="panel-title">Transport Team Information</h3>
                                            <!--NAME-->
                                        </div>
                                        <!---END PANEL PANEL-HEADING--->
                                        <div class="panel-body">
                                            <!--START DIVE BODY-->
                                            <div class="row">
                                                <!--START RWO PANEL BODY-->
                                                <div class="col-md-3 col-lg-3 " align="center">
                                                </div>
                                                <!---END COL-MD-3--->


                                                <table class="table table-user-information">
                                                    <!--TABLE USER INFO-->
                                                    <tbody>
                                                        <tr>
                                                            <td>Availability:</td>
                                                            <td>
                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="">
                                                                        Monday
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="">
                                                                        Tuesday
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="">
                                                                        Wednesday
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="">
                                                                        Thursday
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="">
                                                                        Friday
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="">
                                                                        Saturday
                                                                    </label>
                                                                </div>

                                                                <div class="checkbox">
                                                                    <label>
                                                                        <input type="checkbox" value="">
                                                                        Sunday
                                                                    </label>
                                                                </div>
                                                            </td>

                                                            <td>
                                                                <input class="form-control" id="focusedInput10" type="text" value="00:00AM-00:00AM">
                                                                <input class="form-control" id="Text1" type="text" value="00:00AM-00:00AM">
                                                                <input class="form-control" id="Text2" type="text" value="00:00AM-00:00AM">
                                                                <input class="form-control" id="Text3" type="text" value="00:00AM-00:00AM">
                                                                <input class="form-control" id="Text4" type="text" value="00:00AM-00:00AM">
                                                                <input class="form-control" id="Text5" type="text" value="00:00AM-00:00AM">
                                                                <input class="form-control" id="Text6" type="text" value="00:00AM-00:00AM">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <tr>
                                                                <td>Distance willing to travel:</td>
                                                                <td>
                                                                    <div class="form-group">
                                                                        <input class="form-control" id="txtTravel" type="text" value="100 miles">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tr>
                                                        <tr>
                                                            <td>Do you hold a valid permit
                                                                <br>
                                                                to rehabilitate wildlife
                                                                <br>
                                                                in the state of Virginia?</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <select class="form-control m-bot15">
                                                                        <option>Yes</option>
                                                                        <option>No</option>
                                                                    </select>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Species limitation:</td>
                                                            <td>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtLimitations" runat="server" Text=""></asp:TextBox>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>

                                            </div>
                                            <!---END ROW--->
                                        </div>
                                        <!---END PANEL-BODY--->
                                    </div>
                                    <!---END PANEL-PANEL INFO--->
                                </div>
                                <!---END COL-MD-6--->

                            </div>
                            <!---END Second row--->

                            <!--END availabilityINFO-->

                            <!--START VET TEAM INFO-->
                            <div class="row" runat="server" id="Div1" visible="false">
                                <div class="row" runat="server" id="frmVet">
                                    <div class="col-md-12 col-md-toppad">
                                        <!--START COL 6-->
                                        <div class="panel panel-info">
                                            <!--START PANEL INFO-->
                                            <div class="panel-heading">
                                                <!--START PANEL HEADING-->
                                                <h3 class="panel-title">Vet Team Information</h3>
                                                <!--NAME-->
                                            </div>
                                            <!---END PANEL PANEL-HEADING--->
                                            <div class="panel-body">
                                                <!--START DIVE BODY-->
                                                <div class="row">
                                                    <!--START RWO PANEL BODY-->
                                                    <div class="col-md-3 col-lg-3 " align="center">
                                                    </div>
                                                    <!---END COL-MD-3--->


                                                    <table class="table table-user-information">
                                                        <!--TABLE USER INFO-->
                                                        <tbody>
                                                            <tr>
                                                                <td>Handling skills:</td>
                                                                <td>Small mammals
                                                                    <br />
                                                                    Large mammals
                                                                    <br />
                                                                    RVS
                                                                    <br />
                                                                    Eagles
                                                                    <br />
                                                                    Small raptors
                                                                    <br />
                                                                    Large raptors
                                                                    <br />
                                                                    Reptiles
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <tr>
                                                                    <td>Vet training</td>
                                                                    <td>Vet
                                                                    </td>
                                                                </tr>
                                                            </tr>
                                                            <tr>
                                                                <td>Patient Care skills</td>
                                                                <td>Medicating
                                                                    <br />
                                                                    Bandaging
                                                                    <br />
                                                                    Wound care
                                                                    <br />
                                                                    Diagnostics
                                                                    <br />
                                                                    anesthesia
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Special interests/ hobbies</td>
                                                                <td>N/A
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td>Notes</td>
                                                                <td>Good with bears
                                                                </td>
                                                            </tr>


                                                        </tbody>
                                                    </table>

                                                </div>
                                                <!---END ROW--->
                                            </div>
                                            <!---END PANEL-BODY--->
                                        </div>
                                        <!---END PANEL-PANEL INFO--->
                                    </div>
                                    <!---END COL-MD-6--->

                                </div>
                                <!---END Second row--->

                                <!--END VET TEAM-->

                                <!--START FRONT DESK TEAM INFO-->
                                <div class="row" runat="server" id="frmFrontDesk" visible="false">
                                    <div class="col-md-12 col-md-toppad">
                                        <!--START COL 6-->
                                        <div class="panel panel-info">
                                            <!--START PANEL INFO-->
                                            <div class="panel-heading">
                                                <!--START PANEL HEADING-->
                                                <h3 class="panel-title">Front desk Team Information</h3>
                                                <!--NAME-->
                                            </div>
                                            <!---END PANEL PANEL-HEADING--->
                                            <div class="panel-body">
                                                <!--START DIVE BODY-->
                                                <div class="row">
                                                    <!--START RWO PANEL BODY-->
                                                    <div class="col-md-3 col-lg-3 " align="center">
                                                    </div>
                                                    <!---END COL-MD-3--->


                                                    <table class="table table-user-information">
                                                        <!--TABLE USER INFO-->
                                                        <tbody>
                                                            <tr>
                                                                <td>Front desk</td>
                                                                <td></td>
                                                            </tr>



                                                        </tbody>
                                                    </table>



                                                </div>
                                                <!---END ROW--->
                                            </div>
                                            <!---END PANEL-BODY--->
                                        </div>
                                        <!---END PANEL-PANEL INFO--->
                                    </div>
                                    <!---END COL-MD-6--->

                                </div>
                                <!---END Second row--->
                                </div>
                                <!--END FRONT DESK TEAM-->




                                <!--______________________________________________________________________________________________________-->
                                <!---END availabilityINFO--->
                                <!--START ATTACH DOCS-->

                        <!--END DIV CONTAINER-->
                        <div class="row" style="padding-right: 30px;">
                            <div class="row">
                                <!--ROW SAVE-->
                                <div>
                                    <a href="save-confirmation.html">
                                        <div class="save-app">
                                            <!--START DIV EDIT BUTTON-->
                                            <asp:Button ID="Later2" class="save-app" runat="server" Text="Save" OnClick="saveForLater" />
                                        </div>
                                        <!--END DIV EDIT BUTTON-->
                                    </a>
                                </div>
                                <!--END SAVE COL-->
                            </div>
                            <div class="row">
                                <!--ROW SAVE-->
                                <div>
                                    <a href="submit-app.html">
                                        <div class="submit-app">
                                            <!--START DIV EDIT BUTTON-->
                                            <asp:Button ID="Submit" class="submit-app" runat="server" Text="Submit" OnClick="submit" />
                                        </div>
                                        <!--END DIV EDIT BUTTON-->
                                    </a>
                                </div>
                                <!--END SAVE COL-->
                            </div>
                            <!--END ROW SAVE BUTTON-->
                        </div>
                </section>
                <!--END SECTION WRAPPER-->
            </section>
            <!--END SECTION MAIN CONENT-->

            <!--main content end-->
            <div class="text-right">
            </div>
        </section>
        <!-- container section end -->
        <!-- javascripts -->
        <script src="../NiceAdmin/js/jquery.js"></script>
        <script src="../NiceAdmin/js/bootstrap.min.js"></script>
        <!-- nice scroll -->
        <script src="../NiceAdmin/js/jquery.scrollTo.min.js"></script>
        <script src="../NiceAdmin/js/jquery.nicescroll.js" type="text/javascript"></script>
        <!--custome script for all page-->
        <script src="../NiceAdmin/js/scripts.js"></script>
    </form>
</body>
</html>









