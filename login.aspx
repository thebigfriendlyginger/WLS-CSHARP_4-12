<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html lang="en" >
<head runat="server">
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
            
            <asp:Label ID="lblInvalidUsernamePassword" runat="server" ForeColor="#d5d7de">Invalid Username or Password</asp:Label>

            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <asp:Textbox ID="txtUsername" runat="server" type="text" class="form-control" placeholder="Username" autofocus="true"></asp:Textbox>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <asp:Textbox ID="txtUserPass" runat="server" type="password" class="form-control" placeholder="Password"></asp:Textbox>
            </div>
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right"> <a href="#"> Forgot Password?</a></span>
            </label>
            
            <div><asp:Button ID="btnLogin" runat="server" class="login login-button" Text="Login" onclick="btnLogin_Click"/></div>
            

            <div><asp:Button ID="btnCreateAccount" runat="server" class="signup login-button" Text="Create Account" onclick="btnCreateAccount_Click"/></div>
            
        </div>
      </form>
    </div>


  </body>
</html>