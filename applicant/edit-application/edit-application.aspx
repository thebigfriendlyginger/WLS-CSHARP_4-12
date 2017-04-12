<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit-application.aspx.cs" Inherits="applicant_edit_application" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="../NiceAdmin/img/favicon.png">

    <title>View Application</title>

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
     <form id="Form1" runat="server">
  <body>
  <!-- container section start -->
  <section id="container" class="">
      <!--header start-->
      
      <!--NAV START-->    
      <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-placement="bottom"><i class="icon_menu"></i></div>
            </div>

            <!--logo start-->
		  <span> <a href="application-index.html" class="logo">Va Wildlife Center</a></span>
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
                                <img alt="Sam Winchester" height="39px" width="39px" src="../images/sam-winchester--avatar.png">
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
          <div id="sidebar"  class="nav-collapse">
              <!-- SIDEBAR MENU-->
              <ul class="sidebar-menu">                
                  
				  <li class="sub-menu"> <!--TIMESHEET-->
                      <a href="javascript:;" class="">
                          <span>Application</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li><a class="" href="view-application.html">View Application</a></li>                          
                          <li><a class="" href="edit-application.html">Edit Application</a></li>
                      </ul>
                  </li>  <!--END TIMESHEET-->
              
                 
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
      	<div class="row"><!--START PAGE TITLE-->
      			<h3 class="page-header">
      				Edit Your Application
      			</h3>
      </div> <!--END PAGE TITLE-->
      
      <div class="row"> <!--START ROW INSTRUCTIONS-->
   		<div class="col-md-9"> <!--START COL INSTRUCTION-->
			<p> Click on the line you wish to edit. Once finished, be sure to save.</p>
	   </div> <!--END COL INSYRUCTIONS-->
   
	</div> <!--END ROW INSTRUCTIONS-->
     
   
    <div class="row"> <!--ROW SAVE-->
     	<div class="col-md-6" style="padding-bottom:20px;">
             <a href="view-application.aspx">
                <asp:Button ID="btnApplicationUpdate" runat="server" CssClass="edit-button" Text="Save" OnClick="btnApplicationUpdate_Click"/>
                  <br />
                     <asp:Label ID="lblSaveConfirmation" runat="server" Text="" ForeColor="#009900"></asp:Label>
                 </a>
				    </div>  <!--END DIV EDIT BUTTON-->
		</div> <!--END SAVE COL-->
    </div>  <!--END ROW SAVE BUTTON-->

 <div class="row"> <!--PROFILE-->
  	<div class="col-md-6" style="padding-left:285px;"> <!--left row-->
  
    <div class="row"> <!--START row public profile-->
       <!--FIRST RESULT-->
        <div class="col-md-12 toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title"> <asp:Label ID="lblName" runat="server" Text=""></asp:Label> </h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> <img alt="User Pic" src="images/sam winchester.jpg" class="img-circle img-responsive profile-image"> <!---our public profile image--->
                </div><!---END COL-MD-3--->
                
                 <div class=" col-md-9 col-lg-9 ">  <!--START COL MAIN TEXT-->
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Status:</td>
                        	<td><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></td>
                      </tr>
                      <tr>
                        <td>Department(s):</td>
                        	<td><asp:Label ID="lblDepartment" runat="server" Text=""></asp:Label></td>
                      </tr>
                                                                 
                    <tr>
                        <td>Email:</td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Text=""></asp:TextBox></td>
                    </tr>
                     
                    </tbody>
                  </table>
                </div><!---END COL-MD-9--->
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
	</div><!---end first row--->
   <!--END PUBLIC PROFILE-->
   
  <!--START EM CONTACT-->
        <div class="row">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading emergency"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Emergency Contact</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Name:</td>
                        <td><asp:TextBox ID="txtEMCName" runat="server" Text=""></asp:TextBox></td>
                      </tr>
                      <tr>
                        <td>Relation:</td>
                        <td><asp:TextBox ID="txtEMCRelation" runat="server" Text=""></asp:TextBox></td>
                      </tr>
                    <tr>
                      <tr>
                        <td>Phone Number:</td>
                        <td><asp:TextBox ID="txtEMCPhone" runat="server" Text=""></asp:TextBox></td>
                      </tr>
                    </tr>
                    
              		
              		 <tr>
                    	<tr>
                    	<td>Address Line 1:</td>
                    	<td> <asp:TextBox ID="txtEMCAddress1" runat="server" Text=""></asp:TextBox></td>
                    	</tr>
					 </tr>
                        <tr>
                    	<tr>
                    	<td>Address Line 2:</td>
                    	<td> <asp:TextBox ID="txtEMCAddress2" runat="server" Text=""></asp:TextBox></td>
                    	</tr>
					 </tr>
                        <tr>
                    	<tr>
                    	<td>City:</td>
                    	<td> <asp:TextBox ID="txtEMCCity" runat="server" Text=""></asp:TextBox></td>
                    	</tr>
					 </tr>
                        <tr>
                    	<tr>
                    	<td>Zip Code:</td>
                    	<td> <asp:TextBox ID="txtEMCZip" runat="server" Text=""></asp:TextBox></td>
                    	</tr>
					 </tr>
             
                    </tbody>
                  </table>
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
    <!---END EM CONTACT-->
  
  <!--START ATTACH DOCS-->
        <div class="row">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Documents</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Rabies Vaccine:</td>
						<td> <a href="rabies.PDF">rabies.PDF</a>
                     	</td>
                      </tr>
                      <tr>
                      	<td>Resume:</td>
                      	<td> <a href="resume.DOCX">resume.DOCX</a>
                      	</td>
                      	
                      </tr>
                      <tr>
                      	<td>VA Animal rehab permit:</td>
                      	<td> <a href="rehabpermit.DOCX">rehab.PDF</a>
                      	</td>
                      </tr>
                      
             
             
                    </tbody>
                  </table>
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
     <!--END ATTACH DOCS-->
   
          <!--START OUTREACH TEAM INFO-->
        <div class="row" runat="server" id="frmOutreach">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Outreach Team Information</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Tours:</td>
						  <td><asp:TextBox ID="txtTours" runat="server"></asp:TextBox>
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
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
      
   <!--END OUTREAC-->

          <!--START ANIMAL CARE TEAM INFO-->
        <div class="row" runat="server" id="frmAnimalCare">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Animal Care Team Information</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Reptile Room:</td>
						  <td><asp:TextBox ID="txtReptileRoom" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                    <tr>
                        <td>Reptile Room Soak Day:</td>
						  <td><asp:TextBox ID="txtReptileRoomSD" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Education Snake Feeding Day:</td>
						  <td><asp:TextBox ID="txtEducationSnake" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>ICU:</td>
						  <td><asp:TextBox ID="txtICU" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Aviary:</td>
						  <td><asp:TextBox ID="txtAviary" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Mammals:</td>
						  <td><asp:TextBox ID="txtMammals" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>PU&E:</td>
						  <td><asp:TextBox ID="txtPUE" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                    <tr>
                        <td>PU&E Weigh Day:</td>
						  <td><asp:TextBox ID="txtPUEWD" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Fawns:</td>
						  <td><asp:TextBox ID="txtFawns" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Formula:</td>
						  <td><asp:TextBox ID="txtFormula" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Meals:</td>
						  <td><asp:TextBox ID="txtMeals" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Raptor Feed:</td>
						  <td><asp:TextBox ID="txtRaptorFeed" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>ISO:</td>
						  <td><asp:TextBox ID="txtISO" runat="server"></asp:TextBox>
                     </td>
                      </tr>
                        <tr>
                        <td>Comments:</td>
						  <td><asp:TextBox ID="txtACComments" runat="server"></asp:TextBox>
                     </td>
                      </tr>

                    </tbody>
                  </table>
                  
                  
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
      
   <!--END ANIMAL CARE TEAM--> 
    
	 </div>   <!--END LEFT col-->
     
      
 <div class="col-md-6" style="padding-right:285px;"> <!--RIGHT COL-->
  
  <!--START PERSONAL INFORMATION-->
        <div class="row">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Personal Information</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Start Date:</td>
                        <td>
                            <asp:Label ID="lblStartDate" runat="server" Text=""></asp:Label></td>
                      </tr>
                      <tr>
                        <td>Date of Birth:</td>
                        <td>
                            <asp:TextBox ID="txtDOB" runat="server" Text=""></asp:TextBox></td>
                      </tr>
                    <tr>
                      <tr>
                        <td>Gender</td>
                        <td>
                            <asp:TextBox ID="txtGender" runat="server" Text=""></asp:TextBox></td>
                      </tr>
                    </tr>
                    <tr>
                    	<tr>
                    	<td>Home Address</td>
                    	<td>
                            <asp:TextBox ID="txtAddress" runat="server" Text=""></asp:TextBox>
                    	</td>
                    	</tr>
					 </tr>
              		<tr>
              			<tr>
              			<td>Phone Number:</td>
              			<td>
                              <asp:TextBox ID="txtPhone" runat="server" Text=""></asp:TextBox>
                         </td>
						</tr>
              		</tr>
              		
             
                    </tbody>
                  </table>
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
      
  <!--END PERSONAL INFORMATION-->
    
    <!--START MED INFO-->
        <div class="row">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Medical Information</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Rabies Vaccinated w/in past 2 years:</td>
                        <td>
                            <asp:TextBox ID="txtVaccine" runat="server" Text=""></asp:TextBox>
                        </td>
                      </tr>
                      <tr>
                        <td>Allergies:</td>
                        <td>
                            <asp:TextBox ID="txtAllergies" runat="server" Text=""></asp:TextBox>
                        </td>
                      </tr>
                    <tr>
                      <tr>
                        <td>Pre-Existing Medical Conditions:</td>
                        <td>
                            <asp:TextBox ID="txtConditions" runat="server" Text=""></asp:TextBox>
                        </td>
                      </tr>
                    </tr>
                    <tr>
                    <tr>
                        <td>Physical Limitations:</td>
                        <td>
                            <asp:TextBox ID="txtPhysicalLimitations" runat="server" Text=""></asp:TextBox>
                        </td>
                      </tr>
                    </tr>
               
                    </tbody>
                  </table>
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
   <!---END MED INFO--->

     <!--START TRANSPORT TEAM INFO-->
        <div class="row" runat="server" id="frmTransport">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Transport Team Information</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
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
                                <asp:Label ID="txtTravel" runat="server" Text="Label"></asp:Label>
   							</div>
                     	</td>
                      </tr>
                      </tr>
                       <tr>
                        <td>Do you hold a valid permit <br> to rehabilitate wildlife <br> in the state of Virginia?</td>
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
   									 <asp:TextBox ID="txtLimitation" runat="server" Text=""></asp:TextBox>
   							</div>
                     </td>
                      </tr>
                        <tr>
                        <td>Comments:</td>
						   <td>
                     			<div class="form-group">
   									 <asp:TextBox ID="txtTransportComments" runat="server" Text=""></asp:TextBox>
   							</div>
                     </td>
                      </tr>
                    </tbody>
                  </table>
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
      
   <!--END availabilityINFO-->

     <!--START VET TEAM INFO-->
        <div class="row" runat="server" id="frmVet">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Vet Team Information</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Handling skills:</td>
						  <td>Small mammals <br/>Large mammals <br/> RVS <br/> Eagles <br/> Small raptors <br/> Large raptors <br/> Reptiles
                     </td>
                      </tr>
                      <tr>
                      <tr>
                        <td>Vet training</td>
						   <td>
                    		Vet
                     	</td>
                      </tr>
                      </tr>
                       <tr>
                        <td>Patient Care skills</td>
						   <td>
							   Medicating <br/>Bandaging <br/>Wound care <br/>Diagnostics <br/>anesthesia
                     		</td>
                      </tr>
                      <tr>
                        <td>Special interests/ hobbies</td>
						   <td>
                     			N/A
                     	</td>
                      </tr>
                      
                     <tr>
                        <td>Notes</td>
						   <td>
                     			Good with bears
                     	</td>
                      </tr>
                    
             
                    </tbody>
                  </table>
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
      
   <!--END VET TEAM--> 

     <!--START FRONT DESK TEAM INFO-->
        <div class="row" runat="server" id="frmFrontDesk">
        <div class="col-md-12 col-md-toppad" ><!--START COL 6-->
          <div class="panel panel-info"> <!--START PANEL INFO-->
            <div class="panel-heading"> <!--START PANEL HEADING-->
              <h3 class="panel-title">Front desk Team Information</h3> <!--NAME-->
            </div><!---END PANEL PANEL-HEADING--->
            <div class="panel-body"> <!--START DIVE BODY-->
              <div class="row"> <!--START RWO PANEL BODY-->
                <div class="col-md-3 col-lg-3 " align="center"> 
                </div><!---END COL-MD-3--->
                
                 
                  <table class="table table-user-information"> <!--TABLE USER INFO-->
                    <tbody>
                      <tr>
                        <td>Front desk</td>
						  <td>
                     </td>
                      </tr>
                    
                    
             
                    </tbody>
                  </table>
                  
                  
               
              </div><!---END ROW--->
            </div><!---END PANEL-BODY--->
          </div><!---END PANEL-PANEL INFO--->
        </div><!---END COL-MD-6--->
        
      </div><!---END Second row--->
      
   <!--END FRONT DESK TEAM-->  
   
	 </div> <!--END RIGHT ROW-->
	
</div> <!--END PROFILE-->     
    

      <div class="text-right">
            
        </div><!---END TEXT-RIGHT--->
	  </section> <!--End wrapper-->
	  </section><!--end main content-->
  </section>
      </form>
      <div class="text-right">
            
        </div>
  
  <!-- container section end -->
    <!-- javascripts -->
    <script src="../NiceAdmin/js/jquery.js"></script>
    <script src="../NiceAdmin/js/bootstrap.min.js"></script>
    <!-- nice scroll -->
    <script src="../NiceAdmin/js/jquery.scrollTo.min.js"></script>
    <script src="../NiceAdmin/js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
    <script src="../NiceAdmin/js/scripts.js"></script>


  
</html>
