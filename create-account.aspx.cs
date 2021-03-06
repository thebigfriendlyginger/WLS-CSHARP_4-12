﻿﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Create_Account : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        sc.Open();
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
        insert.Connection = sc;

        String passwordHash = SimpleHash.ComputeHash(txtPassword.Value, "SHA256", null);

        insert.CommandText = "";
        insert.CommandText += "INSERT INTO dbo.USERS (USERNAME, FIRSTNAME, LASTNAME, EMAIL, PASSWDHASH, LASTUPDATED, LASTUPDATEDBY) VALUES (@USERNAME, @FIRSTNAME, @LASTNAME, @EMAIL, @PASSWDHASH, @LASTUPDATED, @LASTUPDATEDBY)";
        //insert.Parameters.AddWithValue("@CONTRACTORID", getDBContractorID());
        insert.Parameters.AddWithValue("@USERNAME", txtUserName.Value);
        insert.Parameters.AddWithValue("@FIRSTNAME", txtFirstName.Value);
        insert.Parameters.AddWithValue("@LASTNAME", txtLastName.Value);
        insert.Parameters.AddWithValue("@EMAIL", txtEmail.Value);
        insert.Parameters.AddWithValue("@PASSWDHASH", passwordHash);
        insert.Parameters.AddWithValue("@LASTUPDATED", DateTime.Today);
        insert.Parameters.AddWithValue("@LASTUPDATEDBY", "Zachary Torok");
        insert.ExecuteNonQuery();

        sc.Close();

        SendApplicantMessage("exchange.jmu.edu", txtEmail.Value);
        Response.Redirect("account-confirmation.aspx");


    }

    public void SendApplicantMessage(String server, String to)
    {
        String from = "wildlifesupp0rters@gmail.com";
        System.Net.Mail.MailMessage message = new System.Net.Mail.MailMessage(from, to);
        message.Subject = "Your New Wildlife Center of Virginia Account";
        message.Body = txtFirstName.Value + ",\n\nThank you for creating a Wildlife Center account!  Please click on the link below to complete out you application.\n\n\n"
        + "http://localhost:50085/applicant/create_application.aspx";
        SmtpClient client = new SmtpClient(server);
        // Credentials are necessary if the server requires the client 
        // to authenticate before it will send e-mail on the client's behalf.
        client.UseDefaultCredentials = true;

        try
        {
            client.Send(message);
        }
        catch (Exception ex)
        {
            Console.WriteLine("Exception caught in CreateTestMessage2(): {0}",
                        ex.ToString());
        }
    }

}