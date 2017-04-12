<%@ Page Language="C#" AutoEventWireup="true" CodeFile="create-account.aspx.cs" Inherits="Create_Account" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
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
    <link href="NiceAdmin/css/font-awesome.min.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="custom-style.css" rel="stylesheet">
    <link href="NiceAdmin/css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

  <body class="login-img3-body">

    <div class="container">

      <form id="Form1" class="login-form" runat="server">        
        <div class="login-wrap">
            
            <div class="input-group"> <!--first name-->
              <span class="input-group-addon"></span>
              <input id="txtFirstName" type="text" class="form-control" placeholder="First Name" runat="server" autofocus>
            </div>
            
            <div class="input-group"> <!--last name -->
              <span class="input-group-addon"></span>
              <input id="txtLastName" type="text" class="form-control" placeholder="Last Name" runat="server">
            </div>
             
             <div class="input-group"> <!--email-->
              <span class="input-group-addon"></span>
              <input id="txtEmail" type="text" class="form-control" placeholder="Email" runat="server">
            </div>

            <div class="input-group"> <!--email-->
              <span class="input-group-addon"></span>
              <input id="txtUserName" type="text" class="form-control" placeholder="User Name" runat="server">
            </div>

            <div class="input-group"> <!--password-->
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input id="txtPassword" type="password" class="form-control" placeholder="Password" runat="server">
            </div>
            <div class="input-group"> <!--re enter password-->
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input id="txtRePassword" type="password" class="form-control" placeholder="Re-enter Password" runat="server">
            </div>
            
            <div>
            <asp:Button ID="btnCreateAccount" runat="server" Text="Create Account" CssClass="signup login-button" OnClick="btnCreateAccount_Click"  />
            </div>

            <%--<input id="btnCreateAccount" runat="server" type="submit" value="Create Account"  onclock="btnCreateAccount_Click" class="signup login-button" />--%>
           <%--<a onclick="btnCreateAccount_Click" href="account-confirmation.aspx"> <div class="signup login-button">
			   <p>Create Account</p>
			</div> </a>--%>
            
        </div>
      </form>
    <div class="text-right">
            
        </div>
    </div>


  </body>
</html>
