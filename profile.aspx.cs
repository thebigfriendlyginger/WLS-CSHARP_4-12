using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class profile : System.Web.UI.Page
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
                lblEmail.Text = volReader["EMAIL"].ToString();
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
                lblPhone.Text = volReader["PHONE"].ToString();
                lblDOB.Text = volReader["DOB"].ToString();
                lblGender.Text = volReader["GENDER"].ToString();
                lblAllergies.Text = volReader["ALLERGIESSPECIFY"].ToString();
                lblPhysicalLimitations.Text = volReader["LIMITATIONSSPECIFY"].ToString();
                lblConditions.Text = volReader["MEDICALCONDITIONS"].ToString();
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
                lblHomeAddress.Text = volReader["ADDRESSLINE1"].ToString();
                lblHomeAddress.Text += " ";
                lblHomeAddress.Text += volReader["ADDRESSLINE2"].ToString();
                lblHomeAddress.Text += " ";
                lblHomeAddress.Text += volReader["CITY"].ToString();
                lblHomeAddress.Text += " ";
                lblHomeAddress.Text += volReader["ZIPCODE"].ToString();
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
                lblEMCName.Text = volReader["NAME"].ToString();
                lblEMCPhone.Text = volReader["PHONE"].ToString();
                lblEMCRelation.Text = volReader["RELATIONSHIP"].ToString();
                lblEMCAddress.Text = volReader["ADDRESSLINE1"].ToString();
                lblEMCAddress.Text += " ";
                lblEMCAddress.Text += volReader["ADDRESSLINE2"].ToString();
                lblEMCAddress.Text += " ";
                lblEMCAddress.Text += volReader["CITY"].ToString();
                lblEMCAddress.Text += " ";
                lblEMCAddress.Text += volReader["ZIPCODE"].ToString();
            }
        }

        insert.CommandText = "";
        insert.CommandText = "Select * from OUTREACH where USERNAME = @USERNAME;";

        using (SqlDataReader volReader = insert.ExecuteReader())
        {
            while (volReader.Read())
            {
                lblTours.Text = volReader["TOURSSHADOW"].ToString();
                Offsite = volReader["TOUROFFSITE"].ToString();
                lblReptileHandling.Text = volReader["REPTILESHANDLED"].ToString();
                lblReptileHandlingNotes.Text = volReader["NOTESONREPTILES"].ToString();
                lblFalconersKnot.Text = volReader["FALCONERKNOTFLAG"].ToString();
                lblBirds.Text = volReader["BIRDSHANDLED"].ToString();
                lblBirdsRemove.Text = volReader["REMOVEDFROMENCLOSURE"].ToString();
                lblBirdsNotes.Text = volReader["NOTESONRAPTOR"].ToString();
            }
        }

        lblOffsite.Text = BitToYN(Offsite);

        insert.CommandText = "";
        insert.CommandText = "Select * from TRANSPORT where USERNAME = @USERNAME;";

        using (SqlDataReader volReader = insert.ExecuteReader())
        {
            while (volReader.Read())
            {
                lblTravel.Text = volReader["MILESWILLINGTOTRAVEL"].ToString();
                lblLimitation.Text = volReader["SPECIESLIMITATIONS"].ToString();
                lblTransportComments.Text = volReader["COMMENTS"].ToString();
            }
        }

        insert.CommandText = "";
        insert.CommandText = "Select * from ANIMALCARE where USERNAME = @USERNAME;";

        using (SqlDataReader volReader = insert.ExecuteReader())
        {
            while (volReader.Read())
            {
                lblReptileRoom.Text = volReader["ReptileRoom"].ToString();
                lblReptileRoomSD.Text = volReader["ReptileRoomSoakDay"].ToString();
                lblEducationSnake.Text = volReader["EducationSnakeFeedingDay"].ToString();
                lblICU.Text = volReader["ICU"].ToString();
                lblAviary.Text = volReader["Aviary"].ToString();
                lblMammals.Text = volReader["Mammals"].ToString();
                lblPUE.Text = volReader["[PU&E]"].ToString();
                lblPUEWD.Text = volReader["[PU&EWeighDay]"].ToString();
                lblFawns.Text = volReader["Fawns"].ToString();
                lblFormula.Text = volReader["Formula"].ToString();
                lblMeals.Text = volReader["Meals"].ToString();
                lblRaptorFeed.Text = volReader["RaptorFeed"].ToString();
                lblISO.Text = volReader["ISO"].ToString();
            }
        }

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
                lblInterests.Text = volReader["SPECIALINTERESTS"].ToString();
            }
        }

        lblSmallMammals.Text = BitToYN(SmallMammals);
        lblLargeMammals.Text = BitToYN(LargeMammals);
        lblRVS.Text = BitToYN(RVS);
        lblEagles.Text = BitToYN(Eagles);
        lblReptiles.Text = BitToYN(Reptiles);
        lblSmallRaptors.Text = BitToYN(SmallRaptor);
        lblLargeRaptors.Text = BitToYN(LargeRaptor);
        lblVetTraining.Text = BitToYN(Eagles);
        lblMedicate.Text = BitToYN(MedicateSkills);
        lblBandage.Text = BitToYN(BandageSkills);
        lblWound.Text = BitToYN(WoundCareSkills);
        lblDiagnostics.Text = BitToYN(DiagnosticSkills);
        lblAnesthesia.Text = BitToYN(AnesthesiaSkills);

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


        this.Page.DataBind();

    }

    public String BitToYN(String bit)
    {
        if (bit == "0")
            return "No";
        else
            return "yes";
    }

}