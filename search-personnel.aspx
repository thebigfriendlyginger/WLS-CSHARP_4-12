<%@ Page Language="C#" AutoEventWireup="true" CodeFile="search-personnel.aspx.cs" Inherits="search_personnel" %>

<!DOCTYPE html>
<html lang="en">
  <head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="NiceAdmin/img/favicon.png">

    <title>Search Personnel</title>

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
		  <span> <a href="view-timesheet.aspx" class="logo">Wildlife Center of VA</a></span>
            <!--logo end-->
            
			<!--SEARCH-->
            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <ul class="nav top-menu">                    
                    <li>
                        <div class="navbar-form">
                            <input class="form-control" placeholder="Search Personnel" type="text">
                        </div>
                    </li>                    
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
          <div id="sidebar"  class="nav-collapse">
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
                  </li>  <!--END TIMESHEET-->
                  
                  <li class="sub-menu"> <!--PROFILE-->
                      <a href="javascript:;" class="">
                          <span>Profile</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="profile.aspx">View Profile</a></li>                          
                          <li><a class="" href="edit-profile.aspx">Edit Profile</a></li>
                      </ul>
                  </li>  <!--END PROFILE-->
                      
                  <li class="sub-menu"> <!--PERSONNEL-->
                      <a href="search-personnel.aspx" class="">
                          <span>Personnel</span>
                      </a>
                      
                  </li>  <!--END TIMESHEET-->
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
      	Search Personnel
      </h3>
      </div> <!--END PAGE TITLE-->
      
    <div class="row"> <!--ROW TEXT-->
     	<div class="col-md-9"> <!--COL START-->
			<p>Search for Wildlife staff or volunteers. </p>
		</div> <!--COL END-->
      
	</div> <!--END ROW TEXT-->
      
      <div class="row"> <!--START SEARCH ROW-->
     		<div class="search-bar-main"> <!--DIV CLASS SEARCH BAR MAIN-->
      		<div class="col-md-7"> <!--START COL MD 3 (search)-->
      			<div class="navbar-form">
                     <asp:Textbox id="searchterm" class="form-control" autofocus="true" placeholder="Search personnel" type="text" runat="server"></asp:Textbox>
                 </div>
		  </div> <!--END COL MD 3-->
		  
		  <div class="col-md-3"> <!--START COL MD 3 (search)-->
<asp:Button ID="btnSearch" runat="server" class="search-button" Text="Search" onclick="btnSearch_Click" /> 
                 
		  </div> <!--END COL MD 6-->
		  </div> <!--END DIV CLASS-->
		  
		  
		</div> <!--END SEARCH ROW-->
     
     
     <div class="row filter"> <!--START FILTER ROW-->
      <!--collapse start-->
                      <div class="panel-group m-bot20" id="accordion">
                          <div class="panel panel-default">
                              <div class="panel-heading">
                                  <h4 class="panel-title">
                                      <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">
                                          Filter search results <b class="caret"></b>
                                      </a>
                                  </h4>
                              </div>
                              <div id="collapseOne" class="panel-collapse collapse in">
                                  <div class="panel-body">
                                     <div class="form-horizontal " method="get">
                                     
                                     
                                  <div class="form-group"> <!--START DEPARTMENT-->
                                     
                                     
                                      <label class="control-label col-md-2" for="inputSuccess">Department</label>
                                      <div class="col-md-2">
                                          <div class="checkbox">
                                             <asp:CheckBox runat="server" ID="chkAnimalCare" Text="Animal Care" />
                                          </div>

                                          <div class="checkbox">
                                              <asp:CheckBox runat="server" ID="chkOutreach" Text="Outreach" />
                                          </div>
                                          
                                          <div class="checkbox">
                                              <asp:CheckBox runat="server" ID="chkTransport" Text="Transport" />
                                          </div>
                                          
                                          <div class="checkbox">
                                              <asp:CheckBox runat="server" ID="chkStudent" Text="Student" />
                                          </div>                                          
                                          
                                          <div class="checkbox">
                                              <asp:CheckBox runat="server" ID="chkOther" Text="Other" />
                                          </div>
                                      </div>
                                      
                                      <!--AVAILIABILITY-->
                                      <label class="control-label col-md-2" for="inputSuccess">Availability</label>
                                      <div class="col-md-3">
                                          <div class="checkbox">
                                              <asp:CheckBox runat="server" ID="chkMonday" Text="Monday" />
                                          </div>

                                          <div class="checkbox">
                                                <asp:CheckBox runat="server" ID="chkTuesday" Text="Tuesday" />
                                          </div>
                                          
                                          <div class="checkbox">
                                                <asp:CheckBox runat="server" ID="chkWednesday" Text="Wednesday" />
                                          </div>
                                          
                                          <div class="checkbox">
                                                <asp:CheckBox runat="server" ID="chkThursday" Text="Thursday" />
                                          </div>
                                          
                                          <div class="checkbox">
                                                <asp:CheckBox runat="server" ID="chkFriday" Text="Friday" />
                                          </div>
                                          
                                          <div class="checkbox">
                                                <asp:CheckBox runat="server" ID="chkSaturday" Text="Saturday" />
                                          </div>
                                          
                                          <div class="checkbox">
                                                <asp:CheckBox runat="server" ID="chkSunday" Text="Sunday" />
                                          </div>
                                      </div>
                                      
                                      <!--START TIME-->
                                       <div class="col-md-3">
                                          <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="">
                                                  Mornings
                                              </label>
                                          </div>

                                          <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="">
                                                  Afternoons
                                              </label>
                                          </div>
                                          
                                          <div class="checkbox">
                                              <label>
                                                  <input type="checkbox" value="">
                                                  Evenings
                                              </label>
                                          </div>
                                        
                                      </div>
                                      <!--END TIME-->
                                      
                                      
                                  </div> <!--END DEPARTMENT-->
                            

                              </div>
                                    
                                  </div>
                              </div>
                          </div>
                         
                          
                      </div>
                      <!--collapse end-->
		  </div> <!--END ROW FILER-->
     
     
     <div id="profiles" runat="server"></div>
      
      
      
      
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

