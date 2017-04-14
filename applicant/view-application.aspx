<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view-application.aspx.cs" Inherits="applicant_view_application" %>

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
               <span> <a href="application-index.html" class="logo">Va Wildlife Center</a></span>
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
                        <img alt="Sam Winchester" height="39px" width="39px" src="../images/sam-winchester--avatar.png">
                        </span>
                        <span class="username"><asp:Label ID="username" runat="server"></asp:Label></span>
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
                           <li><a class="" href="view-application.aspx">View Application</a></li>
                           <li><a class="" href="edit-application.aspx">Edit Application</a></li>
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
      <div class="row"><!--START PAGE TITLE-->
      <h3 class="page-header">
      	View Your Application
      </h3>
      </div> <!--END PAGE TITLE-->
      
  <div class="row"> <!--ROW SAVE-->
     	<div class="col-md-6">
     		<a href="edit-application.aspx">
				<div class="edit-button"><!--START DIV EDIT BUTTON-->
				<p>Edit</p>
				</div>  <!--END DIV EDIT BUTTON-->
			</a>
		</div> <!--END SAVE COL-->
    </div>  <!--END ROW SAVE BUTTON-->

<%--<form id="Form2" runat="server">--%>
   <div class="row" id="frmARButtons" runat="server"> <!--ROW ACCEPT REJECT-->
     	<div class="col-md-6">
             <table class="table">
                 <tbody>
                     <tr>
                         <asp:Label ID="lblARApplication" runat="server" CssClass="col-md-6" Text="Accept or Reject Application"></asp:Label>
     		            <td><asp:Button ID="btnAccept" CssClass="edit-button" runat="server" Text="Accept" BackColor="#387666" OnClick="btnAccept_Click" /></td>
                         <td><asp:Button ID="btnReject" CssClass="edit-button" runat="server" Text="Reject" BackColor="#990000" OnClick="btnReject_Click" /></td>
                         </tr>
                     </tbody>
                 </table>
		</div> <!--END SAVE COL-->
    </div>  <!--END ROW ACCEPTREJECT BUTTON-->
   <%-- </form>--%>
 <!--START VOLUNTEER PROFILE-->
 
 <div class="row"> <!--PROFILE-->
  	<div class="col-md-6"> <!--left row-->
  
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
                            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></td>
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
                        <td><asp:Label ID="lblEMCName" runat="server" Text=""></asp:Label></td>
                      </tr>
                      <tr>
                        <td>Relation:</td>
                        <td><asp:Label ID="lblEMCRelation" runat="server" Text=""></asp:Label></td>
                      </tr>
                    <tr>
                      <tr>
                        <td>Phone Number:</td>
                        <td><asp:Label ID="lblEMCPhone" runat="server" Text=""></asp:Label></td>
                      </tr>
                    </tr>
                    
              		
              		 <tr>
                    	<tr>
                    	<td>Home Address</td>
                    	<td><asp:Label ID="lblEMCAddress" runat="server" Text=""></asp:Label></td>
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
						  <td><asp:Label ID="lblTours" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                      <tr>
                      <tr>
                        <td>Offsite display</td>
						   <td>
                    		<asp:Label ID="lblOffsite" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                      </tr>
                       <tr>
                        <td>Reptile Handling</td>
						   <td>
                     			<asp:Label ID="lblReptileHandling" runat="server" Text=""></asp:Label>
                     		</td>
                      </tr>
                      <tr>
                        <td>Reptiles Handling notes</td>
						   <td>
                     			<asp:Label ID="lblReptileHandlingNotes" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                      
                     <tr>
                        <td>Falconers Knot</td>
						   <td>
                     			<asp:Label ID="lblFalconersKnot" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                      
                      <tr>
                        <td>Birds to handle:</td>
						   <td>
                     			<asp:Label ID="lblBirds" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                        
                      <tr>
                        <td>Birds to remove from enclosue:</td>
						   <td>
                     			<asp:Label ID="lblBirdsRemove" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                      <tr>
                       
                        <td>Birds to note:</td>
						   <td>
                     			<asp:Label ID="lblBirdsNotes" runat="server" Text=""></asp:Label>
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
						  <td><asp:Label ID="lblReptileRoom" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                    <tr>
                        <td>Reptile Room Soak Day:</td>
						  <td><asp:Label ID="lblReptileRoomSD" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Education Snake Feeding Day:</td>
						  <td><asp:Label ID="lblEducationSnake" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>ICU:</td>
						  <td><asp:Label ID="lblICU" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Aviary:</td>
						  <td><asp:Label ID="lblAviary" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Mammals:</td>
						  <td><asp:Label ID="lblMammals" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>PU&E:</td>
						  <td><asp:Label ID="lblPUE" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                    <tr>
                        <td>PU&E Weigh Day:</td>
						  <td><asp:Label ID="lblPUEWD" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Fawns:</td>
						  <td><asp:Label ID="lblFawns" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Formula:</td>
						  <td><asp:Label ID="lblFormula" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Meals:</td>
						  <td><asp:Label ID="lblMeals" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Raptor Feed:</td>
						  <td><asp:Label ID="lblRaptorFeed" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>ISO:</td>
						  <td><asp:Label ID="lblISO" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                        <tr>
                        <td>Comments:</td>
						  <td><asp:Label ID="lblACComments" runat="server" Text=""></asp:Label>
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
     
      
 <div class="col-md-6"> <!--RIGHT COL-->
  
  <!--START PERSONAL INFORMATION-->
        <div class="row" >
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
                        <td>Hire Date:</td>
                        <td>
                            <asp:Label ID="lblHireDate" runat="server" Text=""></asp:Label></td>
                      </tr>
                      <tr>
                        <td>Date of Birth:</td>
                        <td>
                            <asp:Label ID="lblDOB" runat="server" Text=""></asp:Label></td>
                      </tr>
                    <tr>
                      <tr>
                        <td>Gender</td>
                        <td>
                            <asp:Label ID="lblGender" runat="server" Text=""></asp:Label></td>
                      </tr>
                    </tr>
                    <tr>
                    	<tr>
                    	<td>Home Address</td>
                    	<td>
                            <asp:Label ID="lblHomeAddress" runat="server" Text=""></asp:Label>
                    	</td>
                    	</tr>
					 </tr>
              		<tr>
              			<tr>
              			<td>Phone Number:</td>
              			<td>
                              <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
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
                            <asp:Label ID="lblVaccine" runat="server" Text=""></asp:Label>
                        </td>
                      </tr>
                      <tr>
                        <td>Allergies:</td>
                        <td>
                            <asp:Label ID="lblAllergies" runat="server" Text=""></asp:Label>
                        
                        </td>
                      </tr>
                    <tr>
                      <tr>
                        <td>Pre-Existing Medical Conditions:</td>
                        <td>
                            <asp:Label ID="lblConditions" runat="server" Text=""></asp:Label>
                        </td>
                      </tr>
                    </tr>
                    <tr>
                    <tr>
                        <td>Physical Limitations:</td>
                        <td>
                            <asp:Label ID="lblPhysicalLimitations" runat="server" Text=""></asp:Label>
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
        <div class="row" id="frmTransport" runat="server" >
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
						  <td><asp:Label ID="lblAvailability" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                      <tr>
                      <tr>
                        <td>Distance Willing to Travel:</td>
						   <td>
                               <asp:Label ID="lblTravel" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                      </tr>
                       <%--<tr>
                        <td>Do you hold a valid permit <br> to rehabilitate wildlife <br> in the state of Virginia?</td>
						   <td>
                               <div class="form-group">
                               <select class="form-control m-bot15">
                                   <option>Yes</option>
                                   <option>No</option>
                                </select>
                         		</div>
                     		</td>
                      </tr>--%>
                      <tr>
                        <td>Species limitation:    
						   <td>
                               <asp:Label ID="lblLimitation" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                        <tr>
                        <td>Comments:    
						   <td>
                               <asp:Label ID="lblTransportComments" runat="server" Text=""></asp:Label>
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
						  <td>Small mammals: <br/>Large mammals: <br/>RVS: <br/>Eagles: <br/>Small Raptors: <br/>Large Raptors: <br/>Reptiles: 
                     </td>
                          <td><asp:Label ID="lblSmallMammals" runat="server" Text=""></asp:Label><br/>
                              <asp:Label ID="lblLargeMammals" runat="server" Text=""></asp:Label><br/>
                              <asp:Label ID="lblRVS" runat="server" Text=""></asp:Label><br/>
                              <asp:Label ID="lblEagles" runat="server" Text=""></asp:Label><br/>
                              <asp:Label ID="lblSmallRaptors" runat="server" Text=""></asp:Label><br/>
                              <asp:Label ID="lblLargeRaptors" runat="server" Text=""></asp:Label><br/>
                              <asp:Label ID="lblReptiles" runat="server" Text=""></asp:Label>
                     </td>
                      </tr>
                      <tr>
                      <tr>
                        <td>Vet Training:</td>
						   <td>
                    		<asp:Label ID="lblVetTraining" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                      </tr>
                       <tr>
                        <td>Patient Care Skills:</td>
                           <td>
							   Medicating: <br/>Bandaging: <br/>Wound care: <br/>Diagnostics: <br/>Anesthesia: 
                     		</td>
                           <td>
							   <asp:Label ID="lblMedicate" runat="server" Text=""></asp:Label><br/>
                               <asp:Label ID="lblBandage" runat="server" Text=""></asp:Label><br/>
                               <asp:Label ID="lblWound" runat="server" Text=""></asp:Label><br/>
                               <asp:Label ID="lblDiagnostics" runat="server" Text=""></asp:Label><br/>
                               <asp:Label ID="lblAnesthesia" runat="server" Text=""></asp:Label>
                     		</td>
                      </tr>
                      <tr>
                        <td>Special Interests/Hobbies:</td>
						   <td>
                     			<asp:Label ID="lblInterests" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>
                      
                     <%--<tr>
                        <td>Notes:</td>
						   <td>
                     			<asp:Label ID="lblVetNotes" runat="server" Text=""></asp:Label>
                     	</td>
                      </tr>--%>
                    
             
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
    
    </div><!---END MAIN CONTENT--->
            <div class="text-right">
            </div>
         </section>
         <!-- container section end -->
         <!-- javascripts -->
         <script src="../NiceAdmin/js/jquery.js"></script>
         <script src="../NiceAdmin/js/bootstrap.min.js"></script>
         <!-- nice scroll -->
         <script src="../NiceAdmin/js/jquery.scrollTo.min.js"></script>
         <script src="../NiceAdmin/js/jquery.nicescroll.js" type="text/javascript"></script><!--custome script for all page-->
         <script src="../NiceAdmin/js/scripts.js"></script>
      </form>
   </body>
</html>