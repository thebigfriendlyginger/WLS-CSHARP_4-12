<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change-password.aspx.cs" Inherits="change_password" %>

<!DOCTYPE html>

<html lang="en">

<head id="Head1" runat="server">

<meta charset="utf-8" >

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">

<meta name="author" content="GeeksLabs">

<meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">

<link rel="shortcut icon" href="NiceAdmin/img/favicon.png">

<title>Change Password</title>

<!-- Bootstrap CSS -->

<link href="NiceAdmin/css/bootstrap.min.css" rel="stylesheet">

<!-- bootstrap theme -->

<link href="NiceAdmin/css/bootstrap-theme.css" rel="stylesheet">

<!--external css-->

<!-- font icon -->

<link href="NiceAdmin/css/elegant-icons-style.css" rel="stylesheet" />

<link href="NiceAdmin/css/font-awesome.min.css" rel="stylesheet" />

<!-- Custom styles -->

<link href="custom-style.css" rel="stylesheet">

<link href="NiceAdmin/css/style-responsive.css" rel="stylesheet" />

<!-- HTML5 shim and Respond.js IE8 support of HTML5 -->

<!--[if lt IE 9]>

<script src="js/html5shiv.js"></script>

<script src="js/respond.min.js"></script>

<script src="js/lte-ie7.js"></script>

<![endif]-->

</head>

<body>

<form runat="server">

<!-- container section start -->

<section id="container" class="">

<!--header start-->

<!--NAV START-->

<header class="header dark-bg">

<div class="toggle-nav">

<div class="icon-reorder tooltips" data-placement="bottom"><i class="icon_menu"></i></div>

</div>

<!--logo start-->

<span> <a href="view-timesheet.aspx" class="logo">Wildlife Center of VA</a></span>

<!--logo end-->

<!--SEARCH-->

<div class="nav search-row" id="top_menu">

<!-- search form start -->

<ul class="nav top-menu">

<li>

<div class="navbar-form">

<input class="form-control" placeholder="Search Personnel" type="text">

</div>

</li>

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

<img alt="Sam Winchester" height="39" width="39" src="images/sam-winchester--avatar.png">

</span>

<span class="username"><asp:Label ID="username" runat="server"></asp:Label></span>

<b class="caret"></b>

</a>

<!--LOGOUT-->

<ul class="dropdown-menu extended logout">

<li class="change-password-dropdown">

<a href="change-password.aspx">Change Password</a>

</li>

<li class="log-out-dropdown">

<a href="index.aspx">Log Out</a>

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

<li class="sub-menu"> <!--TIMESHEET-->

<a href="javascript:;" class="">

<span>Timesheet</span>

<span class="menu-arrow arrow_carrot-right"></span>

</a>

<ul class="sub">

<li><a class="" href="view-timesheet.aspx">View Timesheet</a></li>

<li><a class="" href="edit-timesheet.aspx">Edit Timesheet</a></li>

</ul>

</li> <!--END TIMESHEET-->

<li class="sub-menu"> <!--PROFILE-->

<a href="javascript:;" class="">

<span>Profile</span>

<span class="menu-arrow arrow_carrot-right"></span>

</a>

<ul class="sub">

<li><a class="" href="profile.aspx">View Profile</a></li>

<li><a class="" href="edit-profile.aspx">Edit Profile</a></li>

</ul>

</li> <!--END PROFILE-->

<li class="sub-menu"> <!--PERSONNEL-->

<a href="search-personnel.aspx" class="">

<span>Personnel</span>

</a>

</li> <!--END TIMESHEET-->

</ul>

<!-- END SIDEBAR MENU-->

</div>

</aside>

<!--sidebar end-->

<!--NAV END-->

<!--MAIN CONTENT START-->

<section id="main-content">

<section class="wrapper">

<div class="container">

<div class="row"><!--START PAGE TITLE-->

<h3 class="page-header">

Change your password

</h3>

</div> <!--END PAGE TITLE-->

<div class="row"> <!--ROW TEXT-->

<div class="col-md-9"> <!--COL START-->

<p>Change your password below. </p>

</div> <!--COL END-->

</div> <!--END ROW TEXT-->

<div class="navbar-form">
<div class="row"> <!--START OLD PASSWORD ROW-->

<asp:TextBox ID="txtOldPassword" runat="server" class="form-control" placeholder="Old Password" type="password" required></asp:TextBox>

<asp:Label ID="OldPasswordError" runat="server" Text=""></asp:Label>

</div> <!--END OLD PASSWORD ROW-->

<div class="row"> <!--START NEW PASSWORD ROW-->

<asp:TextBox ID="txtNewPassword" runat="server" class="form-control" placeholder="New Password" type="password" minLength="8" required></asp:TextBox>

</div> <!--END NEW PASSWORD ROW-->

<div class="row"> <!--START CONFIRM NEW PASSWORD ROW-->

<asp:TextBox ID="txtConfirmNewPassword" runat="server" class="form-control" placeholder="Confirm New Password" type="password" minLength = "8" requied></asp:TextBox>

<asp:Label ID="NewPasswordError" runat="server" Text=""></asp:Label>

</div> <!--END CONFIRM NEW PASSWORD ROW-->

<div class="row">

<asp:Button ID="btnChangePassword" runat="server" class="change-password-button" Text="Change Password" OnClick="btnChangePassword_Click"/>

<a href="confirmation-password.aspx">

</div>
</div>
</div><!---END MAIN CONTENT--->

<div class="text-right">

</div><!---END TEXT-RIGHT--->

</section> <!--End wrapper-->

</section><!--end main content-->

</section>

<!-- container section end -->

<!-- javascripts -->

<script src="NiceAdmin/js/jquery.js"></script>

<script src="NiceAdmin/js/bootstrap.min.js"></script>

<!-- nice scroll -->

<script src="NiceAdmin/js/jquery.scrollTo.min.js"></script>

<script src="NiceAdmin/js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->

<script src="NiceAdmin/js/scripts.js"></script>

</form>

</body>

</html>
