using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class applicant_edit_application : System.Web.UI.Page
{
    String Enti = "USERNAME";
    String PrimKey;
    String TP = "";

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                //UserID = (String)Session["Username"];
                Enti = "Users";
                PrimKey = "TAK";


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
            insert.CommandText = "Select * from USERS where USERNAME = @USERNAME;";
            insert.Parameters.AddWithValue("@USERNAME", PrimKey);

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    txtEmail.Text = volReader["EMAIL"].ToString();
                    lblName.Text = volReader["FIRSTNAME"].ToString();
                    lblName.Text += " ";
                    lblName.Text += volReader["LASTNAME"].ToString();
                }
            }



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
                    txtConditions.Text = volReader["CONDITIONS"].ToString();
                    TP = volReader["TP"].ToString();
                    lblStatus.Text = volReader["PROFSTATUS"].ToString();
                }
            }

            lblDepartment.Text = TP;

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
                    //lblEMCName.Text = volReader["TOURINTROPORTION"].ToString();
                    //lblEMCName.Text = volReader["TOURLEADALONE"].ToString();
                    //lblEMCName.Text = volReader["TOUROFFSITE"].ToString();
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

            //insert.CommandText = "";
            //insert.CommandText = "Select * from VETERINARY where USERNAME = @USERNAME;";

            //using (SqlDataReader volReader = insert.ExecuteReader())
            //{
            //    while (volReader.Read())
            //    {
            //        lblEMCName.Text = volReader["NAME"].ToString();
            //    }
            //}

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

            if (TP == "Outreach")
            {
                frmOutreach.Visible = true;
            }
            if (TP == "Transport")
            {
                frmTransport.Visible = true;
            }
            if (TP == "AnimalCare")
            {
                frmAnimalCare.Visible = true;
            }
            if (TP == "Veterinary")
            {
                frmVet.Visible = true;
            }
            if (TP == "FrontDesk")
            {
                frmFrontDesk.Visible = true;
            }

        }

        this.Page.DataBind();

    }

    protected void btnApplicationUpdate_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        sc.Open();
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        PrimKey = "TAK";

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
        //insert.Parameters.AddWithValue("@MILESWILLINGTOTRAVEL", Int32.Parse(txtTravel.Text));
        insert.Parameters.AddWithValue("@SPECIESLIMITATIONS", txtLimitation.Text);
        insert.Parameters.AddWithValue("@COMMENTS", txtTransportComments.Text);
        insert.Parameters.AddWithValue("@TRALASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@TRALASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        insert.CommandText = "";
        insert.CommandText = "UPDATE dbo.ANIMALCARE SET ReptileRoom = @ReptileRoom, ReptileRoomSoakDay = @ReptileRoomSoakDay, EducationSnakeFeedingDay = @EducationSnakeFeedingDay, ";
        insert.CommandText += "ICU = @ICU, Aviary = @Aviary, Mammals = @Mammals, [PU&E] = @PUE, [PU&EWeighDay] = @PUEWD, Fawns = @Fawns, Formula = @Formula, Meals = @Meals, RaptorFeed = @RaptorFeed, ISO = @ISO, ";
        insert.CommandText += "LASTUPDATEDBY = @VETLASTUPDATEDBY, LASTUPDATED = @VETLASTUPDATED WHERE USERNAME = @USERNAME";
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
        insert.Parameters.AddWithValue("@VETLASTUPDATEDBY", "Thomas Kelly");
        insert.Parameters.AddWithValue("@VETLASTUPDATED", System.DateTime.Now);
        insert.ExecuteNonQuery();

        lblSaveConfirmation.Text = "Your Profile Has Been Saved!";

    }
}