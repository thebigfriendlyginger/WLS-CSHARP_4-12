using System;

using System.Collections.Generic;

using System.Linq;

using System.Web;

using System.Web.UI;

using System.Web.UI.WebControls;

using System.Globalization;

using System.Threading;

using System.Data.SqlClient;

using System.Data;

using System.Data.Common;

public partial class change_password : System.Web.UI.Page
{

    String OldPassword, NewPassword, ConfirmNewPassword;

    String ContractedLastUpdatedBy = "Toma Matveeva";

    DateTime ContractorLastUpdated = DateTime.Today;

    String PasswordInDB, userName;

    Boolean CorrectOldPassword, CorrectPassword, verify;

    protected void Page_Load(object sender, EventArgs e)
    {
        username.Text = (String)Session["fullName"];
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {

        userName = (String)Session["Username"];

        OldPassword = txtOldPassword.Text;

        NewPassword = txtNewPassword.Text;

        ConfirmNewPassword = txtConfirmNewPassword.Text;

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();

        sc.ConnectionString = @"Server =Localhost; Database = WLS; Trusted_Connection = Yes ; ";

        sc.Open();

        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();

        insert.Connection = sc;

        insert.CommandText = "select PASSWDHASH from USERS where USERNAME = '" + userName + "' ";

        SqlDataReader reader = insert.ExecuteReader();

        // if there is such a record, read it

        if (reader.HasRows)
        {

            reader.Read();

            String pwHash = reader["PASSWDHASH"].ToString(); // retrieve the password hash

            // use the SimpleHash object to verify the user's entered password

            verify = SimpleHash.VerifyHash(OldPassword, "SHA256", pwHash);

        }

        reader.Close();

        if (verify)
        {

            OldPasswordError.Text = "";

            CorrectOldPassword = true;

        }

        else
        {

            OldPasswordError.Text = "Error, Old Password does not match ";

        }

        if (NewPassword == ConfirmNewPassword)
        {

            NewPasswordError.Text = "";

            CorrectPassword = true;

        }

        else
        {

            NewPasswordError.Text = "Error, New Password does not match ";

        }

        if (CorrectOldPassword && CorrectPassword)
        {

            String passwordHash = SimpleHash.ComputeHash(txtNewPassword.Text, "SHA256", null);

            insert.CommandText = "update USERS SET PASSWDHASH = @Passwdhash where USERNAME = @USERNAME";

            insert.Parameters.AddWithValue("@PASSWDHASH", SqlDbType.VarChar); insert.Parameters["@PASSWDHASH"].Value = passwordHash;

            insert.Parameters.AddWithValue("@USERNAME", SqlDbType.VarChar); insert.Parameters["@USERNAME"].Value = userName;

            insert.ExecuteNonQuery();

            Response.Redirect("confirmation-password.aspx");

        }

    }

}