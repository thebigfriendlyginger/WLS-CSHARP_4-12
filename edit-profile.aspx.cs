using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class edit_profile : System.Web.UI.Page
{
    //User Strings
    String FullName = "";
    String PrimKey;

    //Profile strings
    String UserType = "";

    //TeamEngagement Strings
    String Department = "";

    //Outreach Strings
    String Offsite = "";

    //Vet Strings
    String SmallMammals = "";
    String LargeMammals = "";
    String RVS = "";
    String Eagles = "";
    String Reptiles = "";
    String SmallRaptor = "";
    String LargeRaptor = "";
    String VetTraining = "";
    String TechTraining = "";
    String VetStudent = "";
    String TechStudent = "";
    String VetAssitant = "";
    String MedicateSkills = "";
    String BandageSkills = "";
    String WoundCareSkills = "";
    String DiagnosticSkills = "";
    String AnesthesiaSkills = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {

                PrimKey = (String)Session["Username"];

            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                // Throws database errors in a Message Box to alert the user
                System.Diagnostics.Debug.WriteLine(sqlException.Message);
            }



            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;

            insert.CommandText = "";
            insert.CommandText = "Select * from USERS where USERNAME = @USERNAME";
            insert.Parameters.AddWithValue("@USERNAME", PrimKey);

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtEmail.Text = volReader["EMAIL"].ToString();
                    FullName = volReader["FIRSTNAME"].ToString();
                    FullName += " ";
                    FullName += volReader["LASTNAME"].ToString();
                }
            }

            lblName.Text = FullName;
            username.Text = FullName;

            insert.CommandText = "";
            insert.CommandText = "Select * from PROFILE where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtPhone.Text = volReader["PHONE"].ToString();
                    txtDOB.Text = volReader["DOB"].ToString();
                    txtGender.Text = volReader["GENDER"].ToString();
                    txtAllergies.Text = volReader["ALLERGIESSPECIFY"].ToString();
                    txtPhysicalLimitations.Text = volReader["LIMITATIONSSPECIFY"].ToString();
                    txtConditions.Text = volReader["MEDICALCONDITIONS"].ToString();
                    UserType = volReader["USERTYPE"].ToString();
                }
            }

            lblPosition.Text = UserType;

            insert.CommandText = "";
            insert.CommandText = "Select * from ADDRESS where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtAddressLine1.Text = volReader["ADDRESSLINE1"].ToString();
                    txtAddressLine2.Text += volReader["ADDRESSLINE2"].ToString();
                    txtCity.Text += volReader["CITY"].ToString();
                    txtZip.Text += volReader["ZIPCODE"].ToString();
                }
            }

            insert.CommandText = "";
            insert.CommandText = "Select * from USERTEAMENGAGEMENT where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    Department = volReader["TP"].ToString();
                }
            }

            insert.CommandText = "";
            insert.CommandText = "Select * from EMERGENCYCONTACT where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtEMCName.Text = volReader["NAME"].ToString();
                    txtEMCPhone.Text = volReader["PHONE"].ToString();
                    txtEMCRelation.Text = volReader["RELATIONSHIP"].ToString();
                    txtEMCAddress1.Text = volReader["ADDRESSLINE1"].ToString();
                    txtEMCAddress2.Text += volReader["ADDRESSLINE2"].ToString();
                    txtEMCCity.Text += volReader["CITY"].ToString();
                    txtEMCZip.Text += volReader["ZIPCODE"].ToString();
                }
            }

            insert.CommandText = "";
            insert.CommandText = "Select * from OUTREACH where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtTours.Text = volReader["TOURSSHADOW"].ToString();
                    txtOffsite.Text = volReader["TOUROFFSITE"].ToString();
                    txtReptileHandling.Text = volReader["REPTILESHANDLED"].ToString();
                    txtReptileHandlingNotes.Text = volReader["NOTESONREPTILES"].ToString();
                    txtFalconersKnot.Text = volReader["FALCONERKNOTFLAG"].ToString();
                    txtBirds.Text = volReader["BIRDSHANDLED"].ToString();
                    txtBirdsRemove.Text = volReader["REMOVEDFROMENCLOSURE"].ToString();
                    txtBirdsNotes.Text = volReader["NOTESONRAPTOR"].ToString();
                }
            }

            insert.CommandText = "";
            insert.CommandText = "Select * from TRANSPORT where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtTravel.Text = volReader["MILESWILLINGTOTRAVEL"].ToString();
                    txtLimitation.Text = volReader["SPECIESLIMITATIONS"].ToString();
                    txtTransportComments.Text = volReader["COMMENTS"].ToString();
                }
            }

            insert.CommandText = "";
            insert.CommandText = "Select * from ANIMALCARE where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtReptileRoom.Text = volReader["ReptileRoom"].ToString();
                    txtReptileRoomSD.Text = volReader["ReptileRoomSoakDay"].ToString();
                    txtEducationSnake.Text = volReader["EducationSnakeFeedingDay"].ToString();
                    txtICU.Text = volReader["ICU"].ToString();
                    txtAviary.Text = volReader["Aviary"].ToString();
                    txtMammals.Text = volReader["Mammals"].ToString();
                    txtPUE.Text = volReader["[PU&E]"].ToString();
                    txtPUEWD.Text = volReader["[PU&EWeighDay]"].ToString();
                    txtFawns.Text = volReader["Fawns"].ToString();
                    txtFormula.Text = volReader["Formula"].ToString();
                    txtMeals.Text = volReader["Meals"].ToString();
                    txtRaptorFeed.Text = volReader["RaptorFeed"].ToString();
                    txtISO.Text = volReader["ISO"].ToString();
                }
            }

            populateDropDowns();

            insert.CommandText = "";
            insert.CommandText = "Select * from VETERINARY where USERNAME = @USERNAME;";

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    SmallMammals = volReader["HANDLESMALLMAMMALFLAG"].ToString();
                    LargeMammals = volReader["HANDLELARGEMAMMALFLAG"].ToString();
                    RVS = volReader["RVSFLAG"].ToString();
                    Eagles = volReader["HANDLEEAGLESFLAG"].ToString();
                    Reptiles = volReader["HANDLEREPTILESFLAG"].ToString();
                    SmallRaptor = volReader["HANDLESMALLRAPTOR"].ToString();
                    LargeRaptor = volReader["HANDLELARGERAPTOR"].ToString();
                    VetTraining = volReader["VETTRAININGFLAG"].ToString();
                    TechTraining = volReader["TECHTRAININGFLAG"].ToString();
                    VetStudent = volReader["VETSTUDENTFLAG"].ToString();
                    TechStudent = volReader["TECHSTUDENTFLAG"].ToString();
                    VetAssitant = volReader["VETASSISTANTFLAG"].ToString();
                    MedicateSkills = volReader["MEDICATESKILLSFLAG"].ToString();
                    BandageSkills = volReader["BANDAGESKILLSFLAG"].ToString();
                    WoundCareSkills = volReader["WOUNDCARESKILLSFLAG"].ToString();
                    DiagnosticSkills = volReader["DIAGNOSTICSKILLSFLAG"].ToString();
                    AnesthesiaSkills = volReader["ANESTHESIASKILLSFLAG"].ToString();
                    txtInterests.Text = volReader["SPECIALINTERESTS"].ToString();
                }
            }

            //ddlSmallMammals.SelectedIndex = int.Parse(SmallMammals);
            //ddlLargeMammals.SelectedIndex = int.Parse(LargeMammals);
            //ddlRVS.SelectedIndex = int.Parse(RVS);
            //ddlEagles.SelectedIndex = int.Parse(Eagles);
            //ddlReptiles.SelectedIndex = int.Parse(Reptiles);
            //ddlSmallRaptors.SelectedIndex = int.Parse(SmallRaptor);
            //ddlLargeRaptors.SelectedIndex = int.Parse(LargeRaptor);
            //ddlVetTraining.SelectedIndex = int.Parse(VetTraining);
            //ddlMedicate.SelectedIndex = int.Parse(MedicateSkills);
            //ddlBandage.SelectedIndex = int.Parse(BandageSkills);
            //ddlWound.SelectedIndex = int.Parse(WoundCareSkills);
            //ddlDiagnostics.SelectedIndex = int.Parse(DiagnosticSkills);
            //ddlAnesthesia.SelectedIndex = int.Parse(AnesthesiaSkills);

            //insert.CommandText = "";
            //insert.CommandText = "Select * from FRONTDESK where USERNAME = @USERNAME;";

            //using (SqlDataReader volReader = insert.ExecuteReader())
            //{
            //    while (volReader.Read())
            //    {

            //    }
            //}

            frmTransport.Visible = false;
            frmOutreach.Visible = false;
            frmAnimalCare.Visible = false;
            frmVet.Visible = false;
            frmFrontDesk.Visible = false;

            if (Department == "3")
            {
                frmOutreach.Visible = true;
                lblDepartment.Text += "Outreach";
            }
            if (Department == "4")
            {
                frmTransport.Visible = true;
                lblDepartment.Text += "Transport";
            }
            if (Department == "1")
            {
                frmAnimalCare.Visible = true;
                lblDepartment.Text += "Animal Care";
            }
            if (Department == "5")
            {
                frmVet.Visible = true;
                lblDepartment.Text += "Veterinary";
            }
            if (Department == "2")
            {
                frmFrontDesk.Visible = true;
                lblDepartment.Text = "Other";
            }

        }

        this.Page.DataBind();
    }

    public void populateDropDowns()
    {
        ddlSmallMammals.Items.Add(new ListItem("No", "0"));
        ddlSmallMammals.Items.Add(new ListItem("Yes", "1"));
        ddlLargeMammals.Items.Add(new ListItem("No", "0"));
        ddlLargeMammals.Items.Add(new ListItem("Yes", "1"));
        ddlRVS.Items.Add(new ListItem("No", "0"));
        ddlRVS.Items.Add(new ListItem("Yes", "1"));
        ddlEagles.Items.Add(new ListItem("No", "0"));
        ddlEagles.Items.Add(new ListItem("Yes", "1"));
        ddlSmallRaptors.Items.Add(new ListItem("No", "0"));
        ddlSmallRaptors.Items.Add(new ListItem("Yes", "1"));
        ddlLargeRaptors.Items.Add(new ListItem("No", "0"));
        ddlLargeRaptors.Items.Add(new ListItem("Yes", "1"));
        ddlReptiles.Items.Add(new ListItem("No", "0"));
        ddlReptiles.Items.Add(new ListItem("Yes", "1"));
        ddlVetTraining.Items.Add(new ListItem("No", "0"));
        ddlVetTraining.Items.Add(new ListItem("Yes", "1"));
        ddlMedicate.Items.Add(new ListItem("No", "0"));
        ddlMedicate.Items.Add(new ListItem("Yes", "1"));
        ddlBandage.Items.Add(new ListItem("No", "0"));
        ddlBandage.Items.Add(new ListItem("Yes", "1"));
        ddlWound.Items.Add(new ListItem("No", "0"));
        ddlWound.Items.Add(new ListItem("Yes", "1"));
        ddlDiagnostics.Items.Add(new ListItem("No", "0"));
        ddlDiagnostics.Items.Add(new ListItem("Yes", "1"));
        ddlAnesthesia.Items.Add(new ListItem("No", "0"));
        ddlAnesthesia.Items.Add(new ListItem("Yes", "1"));
    }


    protected void btnProfileUpdate_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        sc.Open();
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        PrimKey = (String)Session["Username"];

        insert.CommandText = "";
        insert.CommandText = "UPDATE dbo.USERS SET EMAIL = @EMAIL, LASTUPDATEDBY = @LASTUPDATEDBY, LASTUPDATED = @LASTUPDATED WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@USERNAME", PrimKey);
        insert.Parameters.AddWithValue("@EMAIL", txtEmail.Text);
        insert.Parameters.AddWithValue("@LASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@LASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        insert.CommandText = "";
        insert.CommandText += "UPDATE dbo.PROFILE SET PHONE = @PHONE, DOB = @DOB, GENDER = @GENDER, ALLERGIESSPECIFY = @ALLERGIESSPECIFY, LIMITATIONSSPECIFY = @LIMITATIONSSPECIFY, MEDICALCONDITIONS = @CONDITIONS, LASTUPDATEDBY = @PROLASTUPDATEDBY, LASTUPDATED = @PROLASTUPDATED WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@PHONE", txtPhone.Text);
        insert.Parameters.AddWithValue("@DOB", txtDOB.Text);
        insert.Parameters.AddWithValue("@GENDER", txtGender.Text);
        insert.Parameters.AddWithValue("@ALLERGIESSPECIFY", txtAllergies.Text);
        insert.Parameters.AddWithValue("@LIMITATIONSSPECIFY", txtPhysicalLimitations.Text);
        insert.Parameters.AddWithValue("@CONDITIONS", txtConditions.Text);
        insert.Parameters.AddWithValue("@PROLASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@PROLASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();


        insert.CommandText = "";
        insert.CommandText += "UPDATE dbo.EMERGENCYCONTACT SET NAME = @NAME, PHONE = @EMCPHONE, ADDRESSLINE1 = @EMCADDRESSLINE1, ADDRESSLINE2 = @EMCADDRESSLINE2, CITY = @EMCCITY, ZIPCODE = @EMCZIP, LASTUPDATEDBY = @EMCLASTUPDATEDBY, LASTUPDATED = @EMCLASTUPDATED WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@NAME", txtEMCName.Text);
        insert.Parameters.AddWithValue("@EMCPHONE", txtEMCPhone.Text);
        insert.Parameters.AddWithValue("@EMCADDRESSLINE1", txtEMCPhone.Text);
        insert.Parameters.AddWithValue("@EMCADDRESSLINE2", txtEMCPhone.Text);
        insert.Parameters.AddWithValue("@EMCCITY", txtEMCPhone.Text);
        insert.Parameters.AddWithValue("@EMCZIP", txtEMCPhone.Text);
        insert.Parameters.AddWithValue("@EMCLASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@EMCLASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        insert.CommandText = "";
        insert.CommandText = "UPDATE dbo.OUTREACH SET TOURSSHADOW = @TOURSSHADOW, REPTILESHANDLED = @REPTILESHANDLED, NOTESONREPTILES = @NOTESONREPTILES, FALCONERKNOTFLAG = @FALCONERKNOTFLAG, BIRDSHANDLED = @BIRDSHANDLED, REMOVEDFROMENCLOSURE = @REMOVEDFROMENCLOSURE, NOTESONRAPTOR = @NOTESONRAPTOR, LASTUPDATEDBY = @OUTLASTUPDATEDBY, LASTUPDATED = @OUTLASTUPDATED WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@TOURSSHADOW", txtTours.Text);
        insert.Parameters.AddWithValue("@REPTILESHANDLED", txtReptileHandling.Text);
        insert.Parameters.AddWithValue("@NOTESONREPTILES", txtReptileHandlingNotes.Text);
        insert.Parameters.AddWithValue("@FALCONERKNOTFLAG", txtFalconersKnot.Text);
        insert.Parameters.AddWithValue("@BIRDSHANDLED", txtBirds.Text);
        insert.Parameters.AddWithValue("@REMOVEDFROMENCLOSURE", txtBirdsRemove.Text);
        insert.Parameters.AddWithValue("@NOTESONRAPTOR", txtBirdsNotes.Text);
        insert.Parameters.AddWithValue("@OUTLASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@OUTLASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        insert.CommandText = "";
        insert.CommandText = "UPDATE dbo.TRANSPORT SET SPECIESLIMITATIONS = @SPECIESLIMITATIONS, COMMENTS = @COMMENTS, LASTUPDATEDBY = @TRALASTUPDATEDBY, LASTUPDATED = @TRALASTUPDATED WHERE USERNAME = @USERNAME";
        //insert.Parameters.AddWithValue("@MILESWILLINGTOTRAVEL", txtTravel.Text);
        insert.Parameters.AddWithValue("@SPECIESLIMITATIONS", txtLimitation.Text);
        insert.Parameters.AddWithValue("@COMMENTS", txtTransportComments.Text);
        insert.Parameters.AddWithValue("@TRALASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@TRALASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        insert.CommandText = "";
        insert.CommandText = "UPDATE dbo.ANIMALCARE SET ReptileRoom = @ReptileRoom, ReptileRoomSoakDay = @ReptileRoomSoakDay, EducationSnakeFeedingDay = @EducationSnakeFeedingDay, ";
        insert.CommandText += "ICU = @ICU, Aviary = @Aviary, Mammals = @Mammals, [PU&E] = @PUE, [PU&EWeighDay] = @PUEWD, Fawns = @Fawns, Formula = @Formula, Meals = @Meals, RaptorFeed = @RaptorFeed, ISO = @ISO, ";
        insert.CommandText += "LASTUPDATEDBY = @ANCLASTUPDATEDBY, LASTUPDATED = @ANCLASTUPDATED WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@ReptileRoom", txtReptileRoom.Text);
        insert.Parameters.AddWithValue("@ReptileRoomSoakDay", txtReptileRoomSD.Text);
        insert.Parameters.AddWithValue("@EducationSnakeFeedingDay", txtEducationSnake.Text);
        insert.Parameters.AddWithValue("@ICU", txtICU.Text);
        insert.Parameters.AddWithValue("@Aviary", txtAviary.Text);
        insert.Parameters.AddWithValue("@Mammals", txtMammals.Text);
        insert.Parameters.AddWithValue("@PUE", txtPUE.Text);
        insert.Parameters.AddWithValue("@PUEWD", txtPUEWD.Text);
        insert.Parameters.AddWithValue("@Fawns", txtFawns.Text);
        insert.Parameters.AddWithValue("@Formula", txtFormula.Text);
        insert.Parameters.AddWithValue("@Meals", txtMeals.Text);
        insert.Parameters.AddWithValue("@RaptorFeed", txtRaptorFeed.Text);
        insert.Parameters.AddWithValue("@ISO", txtISO.Text);
        insert.Parameters.AddWithValue("@ANCLASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@ANCLASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        insert.CommandText = "";
        insert.CommandText = "UPDATE dbo.ADDRESS SET ADDRESSLINE1 = @ADDRESSLINE1, ADDRESSLINE2 = @ADDRESSLINE2, CITY = @CITY, ZIPCODE = @ZIPCODE, LASTUPDATEDBY = @ADDLASTUPDATEDBY, LASTUPDATED = @ADDLASTUPDATED WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@ADDRESSLINE1", txtAddressLine1.Text);
        insert.Parameters.AddWithValue("@ADDRESSLINE2", txtAddressLine2.Text);
        insert.Parameters.AddWithValue("@CITY", txtCity.Text);
        insert.Parameters.AddWithValue("@ZIPCODE", txtZip.Text);
        insert.Parameters.AddWithValue("@ADDLASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@ADDLASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        insert.CommandText = "";
        insert.CommandText = "UPDATE dbo.VETERINARY SET HANDLESMALLMAMMALFLAG = @HANDLESMALLMAMMALFLAG, HANDLELARGEMAMMALFLAG = @HANDLELARGEMAMMALFLAG, RVSFLAG = @RVSFLAG, HANDLEEAGLESFLAG = @HANDLEEAGLESFLAG, HANDLEREPTILESFLAG = @HANDLEREPTILESFLAG, ";
        insert.CommandText += "HANDLESMALLRAPTOR = @HANDLESMALLRAPTOR, HANDLELARGERAPTOR = @HANDLELARGERAPTOR, VETTRAININGFLAG = @VETTRAININGFLAG, MEDICATESKILLSFLAG = @MEDICATESKILLSFLAG, BANDAGESKILLSFLAG = @BANDAGESKILLSFLAG, ";
        insert.CommandText += "WOUNDCARESKILLSFLAG = @WOUNDCARESKILLSFLAG, DIAGNOSTICSKILLSFLAG = @DIAGNOSTICSKILLSFLAG, ANESTHESIASKILLSFLAG = @ANESTHESIASKILLSFLAG, SPECIALINTERESTS = @SPECIALINTERESTS, ";
        insert.CommandText += "LASTUPDATEDBY = @VETLASTUPDATEDBY, LASTUPDATED = @VETLASTUPDATED WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@HANDLESMALLMAMMALFLAG", txtAddressLine1.Text);
        insert.Parameters.AddWithValue("@HANDLELARGEMAMMALFLAG", txtAddressLine2.Text);
        insert.Parameters.AddWithValue("@RVSFLAG", txtCity.Text);
        insert.Parameters.AddWithValue("@HANDLEEAGLESFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@HANDLEREPTILESFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@HANDLESMALLRAPTOR", txtZip.Text);
        insert.Parameters.AddWithValue("@HANDLELARGERAPTOR", txtZip.Text);
        insert.Parameters.AddWithValue("@VETTRAININGFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@MEDICATESKILLSFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@BANDAGESKILLSFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@WOUNDCARESKILLSFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@DIAGNOSTICSKILLSFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@ANESTHESIASKILLSFLAG", txtZip.Text);
        insert.Parameters.AddWithValue("@SPECIALINTERESTS", txtZip.Text);
        insert.Parameters.AddWithValue("@VETLASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@VETLASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        lblSaveConfirmation.Text = "Your Profile Has Been Saved!";

    }
}