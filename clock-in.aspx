<%@ Page Language="C#" AutoEventWireup="true" CodeFile="clock-in.aspx.cs" Inherits="clock_in" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="NiceAdmin/img/favicon.png">

    <title>Wildlife Center of VA Volunteer Login</title>

    <!-- Bootstrap CSS -->    
    <link href="NiceAdmin/css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="NiceAdmin/css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="NiceAdmin/css/elegant-icons-style.css" rel="stylesheet" />
    <link href="NiceAdmin/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    
    <link href="NiceAdmin/css/style-responsive.css" rel="stylesheet" />
    
    <!--OUR STYLEGUIDE -->
    <link href="custom-style.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

  <body class="login-img3-body">

    <div class="container">

      <form class="login-form" runat="server">        
        <div class="login-wrap">
            <!--BUTTON FOR CLOCKING IN-->
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <asp:Textbox ID="txtUsername" runat="server" type="text" class="form-control" placeholder="Username" autofocus="true"></asp:Textbox>
            </div>
            <div><asp:Button ID="btnClockInOut" runat="server" class="clock-in clock-button" Text="Clock-In/Out" onclick="btnClockInOut_Click"/></div>
        </div>
        
      </form>
    <div class="text-right">
            
        </div>
    </div>


  </body>
</html>
