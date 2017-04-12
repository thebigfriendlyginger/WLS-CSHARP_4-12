using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class clock_in : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnClockInOut_Click(object sender, EventArgs e)
    {
        String userName = txtUsername.Text;
        String shiftID = "";
        // setting up SqlConnection and SqlCommand
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
        con.Open();
        SqlCommand select = new SqlCommand();
        select.Connection = con;

        // performing the query to get the person with the entered email address
        select.CommandText = "select * from PROFILE where USERNAME = @USERNAME";
        select.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
        SqlDataReader reader = select.ExecuteReader();
        bool isClockedIn = false;

        // if there is such a record, read it
        if (reader.HasRows)
        {
            reader.Read();
            isClockedIn = reader.GetBoolean(19);
            ViewState["profileID"] = reader["profileID"].ToString();
            // use the SimpleHash object to verify the user's entered password
        }

        con.Close();

        if (isClockedIn)
        {
            SqlConnection con2 = new SqlConnection();
            con2.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
            con2.Open();
            SqlCommand update = new SqlCommand();
            update.Connection = con2;
            update.CommandText = "UPDATE PROFILE SET ISCLOCKEDIN = 'FALSE' WHERE USERNAME=@USERNAME";
            update.Parameters.AddWithValue("@USERNAME", userName);
            update.ExecuteNonQuery();
            con2.Close();
            SqlConnection con3 = new SqlConnection();
            con3.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
            con3.Open();
            SqlCommand select2 = new SqlCommand();
            select2.Connection = con3;
            select2.CommandText = "SELECT TOP 1 SHIFTID FROM SHIFTS WHERE USERNAME=@USERNAME ORDER BY SHIFTID DESC";
            select2.Parameters.AddWithValue("@USERNAME", userName);
            SqlDataReader reader2 = select2.ExecuteReader();
            if (reader2.HasRows)
            {
                reader2.Read();
                shiftID = reader2["shiftID"].ToString();
            }

            con3.Close();

            SqlConnection con4 = new SqlConnection();
            con4.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
            con4.Open();
            SqlCommand update2 = new SqlCommand();
            update2.Connection = con4;
            update2.CommandText = "UPDATE SHIFTS SET CLOCKOUT='" + DateTime.Now + "', LASTUPDATED='" + DateTime.Today.Date + "', LASTUPDATEDBY='Zachary Torok' WHERE USERNAME=@USERNAME AND SHIFTID=" + shiftID;
            update2.Parameters.AddWithValue("@USERNAME", userName);
            update2.ExecuteNonQuery();
            con4.Close();
            Response.Redirect("clock-out-confirmation.aspx");

        }
        else
        {
            SqlConnection con5 = new SqlConnection();
            con5.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
            con5.Open();
            SqlCommand update3 = new SqlCommand();
            update3.Connection = con5;
            update3.CommandText = "UPDATE PROFILE SET ISCLOCKEDIN = 'TRUE' WHERE USERNAME=@USERNAME";
            update3.Parameters.AddWithValue("@USERNAME", userName);
            update3.ExecuteNonQuery();
            con5.Close();
            SqlConnection con6 = new SqlConnection();
            con6.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
            con6.Open();
            SqlCommand insert = new SqlCommand();
            insert.Connection = con6;
            insert.CommandText = "INSERT INTO dbo.SHIFTS (USERNAME, PROFILEID, SHIFTDATE, CLOCKIN, CLOCKOUT, TOTALHOURS, LASTUPDATED, LASTUPDATEDBY) VALUES (@USERNAME, @PROFILEID, @SHIFTDATE, @CLOCKIN, @CLOCKOUT, @TOTALHOURS, @LASTUPDATED, @LASTUPDATEDBY)";
            //command.Parameters.AddWithValue("@CONTRACTORID", getDBContractorID());
            insert.Parameters.AddWithValue("@USERNAME", userName);
            insert.Parameters.AddWithValue("@PROFILEID", (String)ViewState["profileID"]);
            insert.Parameters.AddWithValue("@SHIFTDATE", DateTime.Today.Date);
            insert.Parameters.AddWithValue("@CLOCKIN", DateTime.Now);
            insert.Parameters.AddWithValue("@CLOCKOUT", DBNull.Value);
            insert.Parameters.AddWithValue("@TOTALHOURS", DBNull.Value);
            insert.Parameters.AddWithValue("@LASTUPDATED", DateTime.Today);
            insert.Parameters.AddWithValue("@LASTUPDATEDBY", "Zachary Torok");
            insert.ExecuteNonQuery();
            con6.Close();
            Response.Redirect("clock-in-confirmation.aspx");
        }
    }
}