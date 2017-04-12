using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class applicant_view_application : System.Web.UI.Page
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
            insert.CommandText = "Select * from USERS where USERNAME = @USERNAME;";
            insert.Parameters.AddWithValue("@USERNAME", PrimKey);

            using (SqlDataReader volReader = insert.ExecuteReader())
            {
                while (volReader.Read())
                {
                    lblEmail.Text = volReader["EMAIL"].ToString();
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
                    lblPhone.Text = volReader["PHONE"].ToString();
                    lblDOB.Text = volReader["DOB"].ToString();
                    lblGender.Text = volReader["GENDER"].ToString();
                    lblAllergies.Text = volReader["ALLERGIESSPECIFY"].ToString();
                    lblLimitations.Text = volReader["LIMITATIONSSPECIFY"].ToString();
                    lblConditions.Text = volReader["CONDITIONS"].ToString();
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
                    //lblEMCName.Text = volReader["TOURINTROPORTION"].ToString();
                    //lblEMCName.Text = volReader["TOURLEADALONE"].ToString();
                    //lblEMCName.Text = volReader["TOUROFFSITE"].ToString();
                    lblReptileHandling.Text = volReader["REPTILESHANDLED"].ToString();
                    lblReptileHandlingNotes.Text = volReader["NOTESONREPTILES"].ToString();
                    lblFalconersKnot.Text = volReader["FALCONERKNOTFLAG"].ToString();
                    lblBirds.Text = volReader["BIRDSHANDLED"].ToString();
                    lblBirdsRemove.Text = volReader["REMOVEDFROMENCLOSURE"].ToString();
                    lblBirdsNotes.Text = volReader["NOTESONRAPTOR"].ToString();
                }
            }

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

            //insert.CommandText = "";
            //insert.CommandText = "Select * from VETERINARY where USERNAME = @USERNAME;";

            //using (SqlDataReader volReader = insert.ExecuteReader())
            //{
            //    while (volReader.Read())
            //    {

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
            //frmVet.Visible = false;
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

    protected void btnAccept_Click(object sender, EventArgs e)
    {
        lblStatus.Text = "Accepted";
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        sc.Open();
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        PrimKey = "TAK";

        insert.CommandText = "";
        insert.CommandText += "UPDATE PROFILE SET PROFSTATUS = 'Accepted' WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@USERNAME", PrimKey);
        insert.ExecuteNonQuery();

        this.Page.DataBind();
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        lblStatus.Text = "Rejected";
        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        sc.Open();
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        PrimKey = "TAK";

        insert.CommandText = "";
        insert.CommandText += "UPDATE PROFILE SET PROFSTATUS = 'Rejected' WHERE USERNAME = @USERNAME";
        insert.Parameters.AddWithValue("@USERNAME", PrimKey);
        insert.ExecuteNonQuery();

        this.Page.DataBind();
    }



}