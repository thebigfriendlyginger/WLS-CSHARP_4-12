<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit-timesheet.aspx.cs" Inherits="edit_timesheet" %>

<!DOCTYPE html>
<html lang="en" runat="server">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="NiceAdmin/img/favicon.png">

    <title>Edit Your Timesheet</title>

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
  <section id="container">
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
                            <<span class="username"><asp:Label ID="username" runat="server"></asp:Label></span>
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

      <!--MAIN CONTENT-->
      <section id="main-content">
          <section class="wrapper">            
              <!--overview start-->
			  <div class="row">
				<div class="col-md-12">
					<h3 class="page-header"> Timesheet for <asp:Label ID="lblTimesheetUser" runat="server"></asp:Label></h3>
					
				</div>
			</div>
             
     <div class="row"> <!--START ROW INSTRUCTIONS-->
   		<div class="col-md-9"> <!--START COL INSTRUCTION-->
			<p> Click on the line you wish to edit. Once finished, be sure to save.</p>
	   </div> <!--END COL INSYRUCTIONS-->
   
	</div> <!--END ROW INSTRUCTIONS-->
              
  
				  
<!--HOURS TIMESHEET-->				   
    <div class="row page-title"><!--START ROW TITLE-->
    <div class="col-md-6"><!--START COL TITLE-->
		<h3>Total Yearly Hours: <asp:Label ID="txtTotalHours" runat="server"></asp:Label></h3>
		</div> <!--END COL TITLE-->
		
	<div class="col-md-6"><!--START COL TITLE-->
		<div class="two-buttons">

            <asp:Button class="save-button" runat="server" ID="btnSave" Text="Save" OnClick="btnSave_Click" />
			
            <asp:Button class="save-button" runat="server" ID="btnAddTime" Text="Add Time" OnClick="btnAddTime_Click" />
		</div> <!--END TWO BUTTONS DIV -->
		</div> <!--END COL TITLE-->
  
	</div> <!--END ROW TITLE-->
   
   
    
    
  <div class="row"> <!--TIMESHEET ROW-->   
     <div class="col-sm-9"><!--START COL--> 
      <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          April 
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne" runat="server">
              <div class="panel-body">
        <!--TIMECHART-->
        
                      <section class="panel">
                          <table class="table table-striped">
                              <thead>
                              <tr>
                                  <th>Date</th>
                                  <th>Time in</th>
                                  <th>Time Out</th>
                                  <th>Total Hours</th>
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td><asp:TextBox class="form-control" ID="daterow1" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="timeinrow1" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="timeoutrow1" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="hoursrow1" runat="server" ReadOnly="True"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td><asp:TextBox class="form-control" ID="daterow2" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="timeinrow2" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="timeoutrow2" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="hoursrow2" runat="server" ReadOnly="True"></asp:TextBox></td>
                              </tr>
                              <tr>
                                  <td><asp:TextBox class="form-control" ID="daterow3" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="timeinrow3" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="timeoutrow3" runat="server"></asp:TextBox></td>
                                  <td><asp:TextBox class="form-control" ID="hoursrow3" runat="server" ReadOnly="True"></asp:TextBox></td>
                              </tr>
                              </tbody>
                          </table>
                      </section>
                  
                  <!--END TIME CHART-->
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          March 
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo" runat="server">
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          February
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree" runat="server">
    </div>
  </div>
</div>
	  </div><!--END COL-->	  
      </div> <!--END ROW TIMESHEET-->
      
<!--END TIMESHEET-->
 
 <hr>

  <!--MILES TIMESHEET-->				   
    <div class="row"><!--START ROW TITLE-->
    <div class="col-sm-9"><!--START COL TITLE-->
		<h3>Total Miles Driven: 225</h3>
		</div> <!--END COL TITLE-->
    
	</div> <!--END ROW TITLE-->
    
    
  <div class="row"> <!--MILES ROW-->   
     <div class="col-sm-9"><!--START COL--> 
      <div class="panel-group" id="accordion2" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingFive">
      <h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="true" aria-controls="collapseFive">
          March 
        </a>
      </h4>
    </div>
    <div id="collapseFive" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingFive">
      <div class="panel-body">
       <!--TIMECHART-->
        
                      <section class="panel">
                          <table class="table table-striped">
                              <thead>
                              <tr>
                                  <th>Date</th>
                                  <th>Miles Driven</th>
                                  <th>Notes</th>
                          
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td>03-03-2017</td>
                                  <td>25</td>
                                  <td>Drove deer from Staunton</td>
                                  
                              </tr>
                              <tr>
                                  <td>03-07-2017</td>
                                  <td>25</td>
                                  <td>To Charlottesville and back with squirrel</td>
                                  
                              </tr>
                              <tr>
                                  <td>03-13-2017</td>
                                  <td>25</td>
                                  <td>Drove another deer from Greene County</td>
                                 
                              </tr>
                              </tbody>
                          </table>
                      </section>
                  
                  <!--END TIME CHART-->
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingSix">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
          February 
        </a>
      </h4>
    </div>
    <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
      <div class="panel-body">
        <!--TIMECHART-->
        
                      <section class="panel">
                          <table class="table table-striped">
                              <thead>
                              <tr>
                                  <th>Date</th>
                                  <th>Miles Driven</th>
                                  <td>Notes</td>
                          
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td>02-03-2017</td>
                                  <td>25</td>
                                  <td>--</td>
                                  
                              </tr>
                              <tr>
                                  <td>02-07-2017</td>
                                  <td>25</td>
                                  <td>Drove from Staunton bird</td>
                                  
                              </tr>
                              <tr>
                                  <td>02-13-2017</td>
                                  <td>25</td>
                                  <td>Bird from C-ville</td>
                                 
                              </tr>
                              </tbody>
                          </table>
                      </section>
                  
                  <!--END TIME CHART-->
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingSeven">
      <h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">
          January 
        </a>
      </h4>
    </div>
    <div id="collapseSeven" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSeven">
      <div class="panel-body">
        <!--TIMECHART-->
        
                      <section class="panel">
                          <table class="table table-striped">
                              <thead>
                              <tr>
                                  <th>Date</th>
                                  <th>Miles Driven</th>
                                  <td>Notes</td>
                          
                              </tr>
                              </thead>
                              <tbody>
                              <tr>
                                  <td>01-03-2017</td>
                                  <td>25</td>
                                  <td>Drove deer from Staunton</td>
                                  
                              </tr>
                              <tr>
                                  <td>01-07-2017</td>
                                  <td>25</td>
                                  <td>--</td>
                                  
                              </tr>
                              <tr>
                                  <td>01-13-2017</td>
                                  <td>25</td>
                                  <td>--</td>
                                 
                              </tr>
                              </tbody>
                          </table>
                      </section>
                  
                  <!--END TIME CHART-->
      </div>
    </div>
  </div>
</div>
	  </div><!--END COL-->	  
      </div> <!--END ROW TIMESHEET-->
      
<!--END MILES-->
    
    	
    
    
     
      </section>
      <!--main content end-->
      
      
      
      
      
      
      
      
      
      
      <!--main content end-->
      <div class="text-right">
            
        </div>
  </section>
  <!-- container section end -->
    <!-- javascripts -->
    <script src="NiceAdmin/js/jquery.js"></script>
    <script src="NiceAdmin/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="NiceAdmin/js/jquery.scrollTo.min.js"></script>
    <script src="NiceAdmin/js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
    <script src="NiceAdmin/js/scripts.js"></script>
	  </section>

  </form>
  </body>
</html>

