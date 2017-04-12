using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        String userName = txtUsername.Text;
        String password = txtUserPass.Text;
        String AppStatues = "";

        // setting up SqlConnection and SqlCommand
        SqlConnection con = new SqlConnection();
        con.ConnectionString = @"Server = SILAS-PC\LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        con.Open();
        SqlCommand command = new SqlCommand();
        command.Connection = con;

        // performing the query to get the person with the entered email address
        command.CommandText = "select * from USERS where USERNAME = @USERNAME";
        command.Parameters.AddWithValue("@USERNAME", txtUsername.Text);
        SqlDataReader reader = command.ExecuteReader();

        bool verify = false;
        // if there is such a record, read it
        if (reader.HasRows)
        {
            reader.Read();
            ViewState["Appstat"] = reader["usertype"].ToString(); //retieve the password hash
            String pwHash = reader["PASSWDHASH"].ToString();  //retrieve the password hash
            Session["fullName"] = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
            // use the SimpleHash object to verify the user's entered password
            verify = SimpleHash.VerifyHash(password, "SHA256", pwHash);
            AppStatues = (String)ViewState["Appstat"].ToString();
        }


        if (verify)
        {
            Session["Username"] = txtUsername.Text;
            if (AppStatues.Contains("APP"))
            {
                Response.Redirect("applicant/create_application.aspx");
            }
            else 
            //if  (AppStatues.Contains("App"))
            {
                Response.Redirect("view-timesheet.aspx");
            }
            
        }
        else
            lblInvalidUsernamePassword.ForeColor = System.Drawing.Color.Red;

        
    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {
        Response.Redirect("create-account.aspx");
    }
}