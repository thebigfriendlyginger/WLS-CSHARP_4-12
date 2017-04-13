/*

Take into account that username is a foreign key from the users table. If you want to try this code, make sure there is a username in your users table that will match the username in this table.

Here is the DDL I created for the new table Applications.

CREATE TABLE APPLICATIONS ( APPLICATIONID INT IDENTITY(1,1) NOT NULL, USERNAME VARCHAR(25) NOT NULL, IS_STUDENT VARCHAR(20) NOT NULL, APPLICATIONTEAM VARCHAR(50) NOT NULL, PROFILEPICTURE IMAGE NULL, PRIMARY KEY(APPLICATIONID), FOREIGN KEY(USERNAME) REFERENCES USERS(USERNAME) )

*/

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data.SqlClient;
using System.Configuration;

public partial class applicant_create_department : System.Web.UI.Page
{
    String radSelected;
    String username = "diazceax";
    String TransportTeam = null;
    String AnimalCareTeam = null;
    String OutreachTeam = null;
    String VetTeam = null;
    String FrontDeskOther = null;
    int length;
    byte[] imgbyte = null;
    HttpPostedFile img;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateInsertStatement(String UserName, String Is_Student, String ApplicationTeam, byte[] imgbyte)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Data Source=LOCALHOST;Initial Catalog=WLS;Integrated Security=True;";
            sc.Open();

            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();

            insert.Connection = sc;

            insert.CommandText = "INSERT INTO [dbo].[APPLICATIONS]([USERNAME],[IS_STUDENT],[APPLICATIONTEAM],[PROFILEPICTURE])VALUES(";

            insert.CommandText += "@USERNAME, @IS_STUDENT, @APPLICATIONTEAM, @PROFILEPICTURE);";

            insert.Parameters.Add("@USERNAME", System.Data.SqlDbType.NVarChar, 25).Value = UserName;

            insert.Parameters.Add("@IS_STUDENT", System.Data.SqlDbType.NVarChar, 20).Value = Is_Student;

            insert.Parameters.Add("@APPLICATIONTEAM", System.Data.SqlDbType.NVarChar, 50).Value = ApplicationTeam;

            //insert.Parameters.AddWithValue("@PROFILEPICTURE", System.Data.SqlDbType.Image);

            if (imgbyte == null)
            {

                insert.Parameters.Add("@PROFILEPICTURE", System.Data.SqlDbType.Image).Value = DBNull.Value;

            }

            else
            {

                insert.Parameters.Add("@PROFILEPICTURE", System.Data.SqlDbType.Image).Value = imgbyte;

            }

            insert.ExecuteNonQuery();

        }

        catch (SqlException e)
        {

            e.ToString();

        }

    }

    protected void btnCreateAccount_Click(object sender, EventArgs e)
    {

        /*Get all fields and insert them into the Applicant Table on the WLS Database*/

        //Gets whether applicant is a student

        if (RadButtonListIsStudent.SelectedIndex == -1)
        {

            lblRadError.Visible = true;

            lblRadError.Text = "Please choose an option.";

        }

        else
        {

            radSelected = RadButtonListIsStudent.SelectedValue.ToString();

            lblRadError.Visible = false;

        }

        //Image upload part. Also check if there is a file to upload

        if (ProfilePicture.HasFile)
        {

            //to get length of uploaded file

            length = ProfilePicture.PostedFile.ContentLength;

            //create a byte array to store the binary image data

            imgbyte = new byte[length];

            //store currently selected file in memeory

            img = ProfilePicture.PostedFile;

            //set binary data

            img.InputStream.Read(imgbyte, 0, length);

        }

        if (!chkTransport.Checked && !chkAnimalCare.Checked && !chkOutreach.Checked && !chkVet.Checked && !chkFront.Checked)
        {

            lblCheckboxError.Visible = true;

            lblCheckboxError.Text = "Select a team.";

        }

        else
        {

            //Gets the department the person applied to and creates an application to each of them.

            if (chkTransport.Checked)
            {

                //We trim spaces we inserted for format purposes

                TransportTeam = chkTransport.Text.ToString().TrimStart();

                //Create an application for transport team

                CreateInsertStatement(username, radSelected, TransportTeam, imgbyte);

            }

            if (chkAnimalCare.Checked)
            {

                AnimalCareTeam = chkAnimalCare.Text.ToString().TrimStart();

                //Create an application for animal care team

                CreateInsertStatement(username, radSelected, AnimalCareTeam, imgbyte);

            }

            if (chkOutreach.Checked)
            {

                OutreachTeam = chkOutreach.Text.ToString().TrimStart();

                //Create an application for outreach team

                CreateInsertStatement(username, radSelected, OutreachTeam, imgbyte);

            }

            if (chkVet.Checked)
            {

                VetTeam = chkVet.Text.ToString().TrimStart();

                //Create an application for vet team

                CreateInsertStatement(username, radSelected, VetTeam, imgbyte);

            }

            if (chkFront.Checked)
            {

                FrontDeskOther = chkFront.Text.ToString().TrimStart();

                //Create an application for front desk/other team

                CreateInsertStatement(username, radSelected, FrontDeskOther, imgbyte);

            }

            lblCheckboxError.Visible = false;

        }

    }

}