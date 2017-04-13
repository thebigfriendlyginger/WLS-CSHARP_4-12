﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create-department.aspx.cs" Inherits="applicant_create_department" %>
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
   </head>
   <body>
      <form id="Form1" runat="server">
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
                  <!-- search form start -->
                  <ul class="nav top-menu">
                  </ul>
                  <!-- search form end -->
               </div>
               <!--END SEARCH-->
               <div class="top-nav notification-row">
                  <!-- notificatoin dropdown start-->
                  <ul class="nav pull-right top-menu">
                     <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                        <span class="profile-ava">
                        <img alt="Sam Winchester" height="39" width="39" src="../images/sam-winchester--avatar.png">
                        </span>
                        <span class="username">Sam Winchester</span>
                        <b class="caret"></b>
                        </a>
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
                           <li><a class="" href="edit-application.html">Edit Application</a></li>
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
               <section class="wrapper">
                  <div class="container">
                     <div class="row">
                        <!--START PAGE TITLE-->
                        <h3 class="page-header">Create new application
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
                     <!--START PERSONAL INFORMATION-->
                     <div class="row">
                        <div class="col-md-6 col-md-toppad col-md-offset-3">
                           <!--START COL 6-->
                           <div class="panel panel-info">
                              <!--START PANEL INFO-->
                              <div class="panel-heading">
                                 <!--START PANEL HEADING-->
                                 <h3 class="panel-title">Basic Info</h3>
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
                                             <td>
                                                Are you a student?<br />
                                                <asp:Label ID="lblRadError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                             </td>
                                             <td>
                                                <div class="form-group">
                                                   <asp:RadioButtonList ID="RadButtonListIsStudent" runat="server" CssClass="radio">
                                                      <asp:ListItem> Yes</asp:ListItem>
                                                      <asp:ListItem> No</asp:ListItem>
                                                   </asp:RadioButtonList>
                                                </div>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td>
                                                Which department are
                                                <br>
                                                you interested in?
                                                <br>
                                                <asp:Label ID="lblCheckboxError" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                                             </td>
                                             <td>
                                                <div class="form-group">
                                                   <asp:CheckBox ID="chkTransport" Text=" Transport Team" runat="server" CssClass="checkbox-inline" ToolTip="These volunteers are on-call 24/7 to retrieve animals in need in their area and transport them to the Wildlife Center." />
                                                   <br>
                                                   <asp:CheckBox ID="chkAnimalCare" Text="Animal Care Team" runat="server" CssClass="checkbox-inline" ToolTip="These volunteers work closely with our rehabilitation staff to provide care to animals in the Wildlife Center." />
                                                   <br>
                                                   <asp:CheckBox ID="chkOutreach" Text="Outreach Team" runat="server" CssClass="checkbox-inline" ToolTip="These volunteers assist the staff with educating the public about the Center’s mission and the importance of protecting wildlife and the environment." />
                                                   <br>
                                                   <asp:CheckBox ID="chkVet" Text="Vet Team" runat="server" CssClass="checkbox-inline" ToolTip="These volunteers work hands-on with the patients at the Wildlife Center by assisting the veterinary staff with daily medical and diagnostic procedures." />
                                                   <br>
                                                   <asp:CheckBox ID="chkFront" Text="Front Desk and Other" runat="server" CssClass="checkbox-inline" ToolTip="These volunteers assist with office work and miscelaneous activities in the Wildlife Center." />
                                                   <br>
                                                </div>
                                             </td>
                                          </tr>
                                          <tr>
                                             <td>Upload profile picture</td>
                                             <td>
                                                <div class="form-group">
                                                   <label for="exampleInputFile">Choose a .jpg, .png or .gif file</label>
                                                   <asp:FileUpload ID="ProfilePicture" runat="server" />
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
                        <div class="col-md-6 col-md-offset-3">
                           <a href="create-application.html">
                              <div class="save-profile">
                                 <!--START DIV EDIT BUTTON-->
                                 <asp:Button ID="btnCreateAccount" runat="server" class="save-profile" Text="Next" Height="30px" Width="75px" OnClick="btnCreateAccount_Click" />
                              </div>
                              <!--END DIV EDIT BUTTON-->
                           </a>
                        </div>
                        <!--END SAVE COL-->
                     </div>
                     <!---END Second row--->
                     <!--END PERSONAL INFORMATION-->
                  </div>
                  <!--END DIV CONTAINER-->
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
