using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.IO;
using System.Data;


public partial class create_application : System.Web.UI.Page
{
    String Enti;
    String UserID = "silasademola";
    String UserFirstN = "FIRSTNAME";
    String UserLastN = "LASTNAME";
    String UserEmail = "EMAIL";
    String PrimKey;
    String AppStatues = "";
    String TP = "";
    String Statement = "";
    String fileName = "";
    String contentType = "";
    int fileSize;
    String fileExtension = "";
    int uploaded = 0;
    bool saved = false;


    protected void Page_Load(object sender, EventArgs e)
    {

        Enti = (String)Session["username"];
        String HTMLField = "";

        if (!IsPostBack)
        {
            if (AppStatues.Equals("Started"))
            {
                try
                {

                    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
                    sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=Lab2;Trusted_Connection=Yes;";
                    sc.Open();
                    System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
                    insert.Connection = sc;

                    insert.CommandText = "";
                    insert.CommandText = "Select * from PROFILE where USERNAME = @USERNAME;";

                    using (SqlDataReader volReader = insert.ExecuteReader())
                    {
                        while (volReader.Read())
                        {
                            PhoneNumber.Text = volReader["PHONE"].ToString();
                            DOB.Text = volReader["DOB"].ToString();
                            Gender.Text = volReader["GENDER"].ToString();
                            Allergies.Text = volReader["ALLERGIESSPECIFY"].ToString();
                            limitations.Text = volReader["LIMITATIONSSPECIFY"].ToString();
                            MedicalConditions.Text = volReader["CONDITIONS"].ToString();
                            TP = volReader["TP"].ToString();
                        }
                    }

                    insert.CommandText = "";
                    insert.CommandText = "Select * from EMERGENCYCONTACT where USERNAME = @USERNAME;";

                    using (SqlDataReader volReader = insert.ExecuteReader())
                    {
                        while (volReader.Read())
                        {
                            EMName.Text = volReader["NAME"].ToString();
                            EMPhoneNumber.Text = volReader["PHONE"].ToString();
                            EMRelation.Text = volReader["RELATIONSHIP"].ToString();
                            EMAddress.Text = volReader["ADDRESSLINE1"].ToString();
                            EMAddress2.Text += volReader["ADDRESSLINE2"].ToString();
                            EMCity.Text += volReader["CITY"].ToString();
                            EMZipCode.Text += volReader["ZIPCODE"].ToString();
                        }
                    }

                    

                }
                catch (System.Data.SqlClient.SqlException sqlException)
                {
                    // Throws any DB errors in a Message Box for user
                    System.Diagnostics.Debug.WriteLine(sqlException.Message);
                    HTMLField = "Error Loading";
                }

                System.Diagnostics.Debug.WriteLine(UserID);

                try
                {
                    // Links application to database, opens SQL connection and establishs insert string
                    System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();

                    SQLisConnect.SQLConnection();

                    Statement = "SELECT filetype, filePath from dbo. datafiles WHERE LastUpdatedBy =" + UserID;
                    HTMLField = SQLisConnect.DatabaseSelect(Statement);
                }
                catch (System.Data.SqlClient.SqlException sqlException)
                {
                    // Throws any DB errors in a Message Box for user
                    System.Diagnostics.Debug.WriteLine(sqlException.Message);
                    HTMLField = "Error Loading";
                }

                try
                {

                    //UserID = (String)Session["Username"];
                    Enti = "Users";
                    PrimKey = "USERNAME";

                    UserFirstN = Repostdata(UserFirstN, Enti, PrimKey);
                    UserLastN = Repostdata(UserLastN, Enti, PrimKey);
                    UserEmail = Repostdata(UserEmail, Enti, PrimKey);

                    NavUsername.Text = UserFirstN + " " + UserLastN;
                    Position.Text = "IDK";
                    Email.Text = UserEmail;
                    ProfileImg.ImageUrl = "http:/localhost:58532/WLS-CSHARP/images/"
                        + "Default PP.jpg";
                }
                catch (System.Data.SqlClient.SqlException sqlException)
                {
                    // Throws database errors in a Message Box to alert the user
                    System.Diagnostics.Debug.WriteLine(sqlException.Message);
                }

            }
            if (TP.Contains("1"))
            {
                Departmentlist.Items.Add("Animal Care");
                frmAnimalCare.Visible = true;
            }
            if (TP.Contains("2"))
            {
                Departmentlist.Items.Add("Other");
                frmFrontDesk.Visible = true;
            }
            if (TP.Contains("3"))
            {
                Departmentlist.Items.Add("Outreach");
                frmOutreach.Visible = true;
            }
            if (TP.Contains("4"))
            {
                Departmentlist.Items.Add("Transport");
                frmTransport.Visible = true;
            }
            if (TP.Contains("5"))
            {
                Departmentlist.Items.Add("Vet");
                frmVet.Visible = true;
            }
            if (TP.Contains("None")||(TP == ""))
            {
                Departmentlist.Visible = false;
                Departmentlbl.Text = "None";
                Departmentlbl.Visible = true;
            }

            this.Page.DataBind();
        }
    }
    protected void saveForLater(object sender, EventArgs e)
    {
        
        System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();

        SQLisConnect.SQLConnection();

        String Stringdate = DOB.Text;
        DateTime? dOB = datestoNull(Stringdate);
        String gender = Gender.Text;
        String address1 = Address1.Text;
        String address2 = Address2.Text;
        String city = City.Text;
        String state = State.Text;
        String zipCode = ZipCode.Text;
        String phoneNumber = (PhoneNumber.Text);
        String eMName = EMName.Text;
        String eMRelation = EMRelation.Text;
        String eMAddress1 = EMAddress.Text;
        String eMAddress2 = EMAddress2.Text;

        String eMcity = EMCity.Text;
        String eMstate = EMState.Text;
        String eMzipCode = EMZipCode.Text;
        String eMPhoneNumber = (EMPhoneNumber.Text);
        String vacinationdoc = VaccinatedRadio.SelectedValue;
        String rehabpermit = RehabpermitRadio.SelectedValue;
        String allergies = Allergies.Text;
        String medicalCondition = MedicalConditions.Text;
        String limitation = limitations.Text;
        String distance = Distance.Text;
        String specieslimitation = Specieslimitation.Text;

        string[,] Aval ={ {"Monday", Day1St.Text.ToString(), Day1f.Text.ToString()}, 
                           {"Tuesday", Day2St.Text.ToString(), Day2f.Text.ToString()}, 
                           {"Wednesday", Day3St.Text.ToString(), Day3f.Text.ToString()}, 
                           {"Thursday", Day4St.Text.ToString(), Day4f.Text.ToString()}, 
                           {"Friday", Day5St.Text.ToString(), Day5f.Text.ToString()} };

        for (int i = 0; i < 5; i++)
        {
            String Dayofweek = Aval[i, 0];
            String StartTime = Aval[i, 1];
            String EndTime = Aval[i, 2];
            saved = SavingFiles.SaveAvailibility(Dayofweek, StartTime, EndTime, UserID);
        }

        


        /*Insert stamtement order for application
         * 
           APPLICANTID VARCHAR(25) NOT NULL,
            FIRSTNAME VARCHAR(50) NOT NULL, 
            LASTNAME VARCHAR(50) NOT NULL,
            EMAIL VARCHAR(50) NOT NULL,
            PHONE INT NOT NULL, 
            PASSWD VARCHAR(50) NOT NULL, 
            ADDRESSID INT NOT NULL,
            EMERGENCYID INT NOT NULL,
            APPSTATUS VARCHAR(50) NOT NULL,
            ALLERGIES VARCHAR(50) DEFAULT 'N/A',
            RABVACCINEFLAG BIT NOT NULL,
            VALIDPERMITFLAG BIT NOT NULL, 
            VALIDPERMITATTACH VARBINARY(MAX),
            PERMITCATEGORY INT DEFAULT '0', 
            AVAILABILITYID INT NOT NULL,
            RABATTACH VARBINARY(MAX),
            RESUMEATTACH VARBINARY(MAX),
            LETTEROFRECOM VARBINARY(MAX),
         * 
        */

        insert.CommandText = "insert into [dbo].[APPLICANT]"
        + "([USERID],[FIRSTNAME],[LASTNAME],[EMAIL],[PHONE],[PASSWD],[ADDRESSID],[EMERGENCYID],"
        +"[APPSTATUS],[ALLERGIES],[RABVACCINEFLAG],[VALIDPERMITFLAG],[VALIDPERMITATTACH],"
        + "[PERMITCATEGORY],[AVAILABILITYID],[RABATTACH],[RESUMEATTACH],[LETTEROFRECOM])";

        //insert.CommandText += " values (@userid,@fName,@lName,@email,@phone,@addressid,@emergID,@appstat,@allergie,"
        //+"@RabVac,@ValidPermit,@PermAttachment,@permCat,@AvalibilityID,@Rabattach,@resumeattach,@letterrecom";
        
        //insert.Parameters.AddWithValue("@userid", UserID);
        //insert.Parameters.AddWithValue("@fName", UserFirstN);
        //insert.Parameters.AddWithValue("@lName", UserLastN);
        //insert.Parameters.AddWithValue("@email", UserEmail);
        //insert.Parameters.AddWithValue("@phone", phoneNumber);
        //insert.Parameters.AddWithValue("@addressid", UserID);
        //insert.Parameters.AddWithValue("@emergID", UserID);
        //insert.Parameters.AddWithValue("@appstat", AppStatues);
        //insert.Parameters.AddWithValue("@allergie", allergies);
        //insert.Parameters.AddWithValue("@RabVac", YorN(vacinationdoc));
        //insert.Parameters.AddWithValue("@ValidPermit", YorN(rehabpermit));
        //insert.Parameters.AddWithValue("@PermAttachment", rehabFile);
        //insert.Parameters.AddWithValue("@permCat", UserID);
        //insert.Parameters.AddWithValue("@AvalibilityID", UserID);
        //insert.Parameters.AddWithValue("@Rabattach", UserID);
        //insert.Parameters.AddWithValue("@resumeattach", resumeFile);
        //insert.Parameters.AddWithValue("@letterrecom", resumeFile);
        //insert.Parameters.AddWithValue("@lastUpdatedBy", UserID);
        //System.Diagnostics.Debug.WriteLine(insert.CommandText);
        //insert.ExecuteNonQuery();
        if (saved)
        {
            AppStatues = "Started";
            saved = SavingFiles.ApplicationStatus(AppStatues, UserID);
        }

        if (saved) 
        { 
            
        }

    }


    protected void submit(object sender, EventArgs e)
    {
        /*
        insert.CommandText = "insert dbo.Applicant SET FIRSTNAME=@fName, LASTNAME=@lName," +
        "MiddleInitial=@MI, HOUSENUMBER=@HouseNumber, STREET=@Street, CITYCOUNTY=@City," +
        "STATEABB=@StateAbb, COUNTRYABB=@CountryAbb, ZIPCODE=@Zip, FEE=@Fee, LASTUPDATEDBY=@lastUpdatedBy" +
        " WHERE ContractorID=@ContractorID";
        insert.Parameters.AddWithValue("@UserID", contractorID);
        insert.Parameters.AddWithValue("@fName", cFirstName.Text);
        insert.Parameters.AddWithValue("@lName", cLastName.Text);
        insert.Parameters.AddWithValue("@MI", cMI.Text);
        insert.Parameters.AddWithValue("@HouseNumber", cHouseNumber.Text);
        insert.Parameters.AddWithValue("@Street", cStreet.Text);
        insert.Parameters.AddWithValue("@City", cCity.Text);
        insert.Parameters.AddWithValue("@StateAbb", state);
        insert.Parameters.AddWithValue("@CountryAbb", country);
        insert.Parameters.AddWithValue("@Zip", cZipCode.Text);
        insert.Parameters.AddWithValue("@Fee", cFee.Text);
        insert.Parameters.AddWithValue("@lastUpdatedBy", userName);
        System.Diagnostics.Debug.WriteLine(insert.CommandText);
        System.Diagnostics.Debug.WriteLine(lstContractor.SelectedValue);
        insert.ExecuteNonQuery();
          */
    }
    //returns the character Y or N;
    protected Char YorN(String Choice)
    { 
        char CharYorN = 'N';
        if (Choice.Contains("Yes")){CharYorN = 'Y';}
        return CharYorN;
    }

    protected String Repostdata(String Attri, String Enti,
    String PrimKey)
    {
        String HTMLField = "";
        System.Diagnostics.Debug.WriteLine(UserID);

        try
        {
            // Links application to database, opens SQL connection and establishs insert string
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();

            SQLisConnect.SQLConnection();

            Statement = "SELECT " + Attri + " from dbo." + Enti + " WHERE " + PrimKey + "=" + UserID;
            HTMLField = SQLisConnect.DatabaseSelect(Statement);
            return HTMLField;
        }
        catch (System.Data.SqlClient.SqlException sqlException)
        {
            // Throws any DB errors in a Message Box for user
            System.Diagnostics.Debug.WriteLine(sqlException.Message);
        }
        return HTMLField = "Error Loading";
    }
    public DateTime? datestoNull(string  date)
    {
        DateTime? thedate;
        if (string.IsNullOrEmpty(date))
        {
            thedate = null;
            return thedate;
        }else
            thedate = Convert.ToDateTime(date);
            return thedate;
    }
    public void SqlConnection(String Statement)
    {
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            System.Data.SqlClient.SqlDataReader DataReader = null;
            sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=Lab2;Trusted_Connection=Yes;";
            sc.Open();
            System.Diagnostics.Debug.WriteLine("databse connection opened");
            System.Data.SqlClient.SqlCommand sendComm = new System.Data.SqlClient.SqlCommand();
            sendComm.Connection = sc;
            sendComm.CommandText = Statement;
            if (Statement.Contains("Delete") || (Statement.Contains("Insert")))
            {
                sendComm.ExecuteNonQuery();
            }
            if ((Statement.Contains("Select")))
            {
               String  totSalary = sendComm.ExecuteScalar().ToString();
                
            }
            if (Statement.Contains("Equip") && (Statement.Contains("Select")))
            {
            }
            sc.Close();

        }
        catch (System.Data.SqlClient.SqlException sqlException)
        {
            System.Diagnostics.Debug.WriteLine(sqlException.Message);
        }
    }

    //Read data from DataBase.

    protected void DisplayRecord_Click(object sender, EventArgs e)
    {
        System.Diagnostics.Debug.WriteLine("Display Driver/Equipment Record Button Pressed");
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=LOCALHOST; Database=WLS;Trusted_Connection=Yes;";
            sc.Open();
            System.Data.SqlClient.SqlCommand gridPopulate = new System.Data.SqlClient.SqlCommand();


        }
        catch (System.Data.SqlClient.SqlException sqlException)
        {
            // Throws database errors in a Message Box to alert the user
            System.Diagnostics.Debug.WriteLine(sqlException.Message);
        }

    }


    public void UploadClick(object sender, EventArgs e)
    {
        String filePath;
        String filetype = Filetype.SelectedValue;

        HttpPostedFile incomingFile = FileUploaded.PostedFile;

        if (Filetype.SelectedIndex.Equals(0)||Filetype.SelectedIndex.Equals(null))
        {
            
            incomingFile = FileUploadpic.PostedFile;
            filetype = "Profile Picture";
        }

        /*Get all fields and insert them into the Applicant Table on the WLS Database*/ 
        //Image upload part. Also check if there is a file to upload 
        
        
        if (incomingFile.FileName != "")
        {
            

            //file name 
            fileName = incomingFile.FileName;
            //type of content
            contentType = incomingFile.ContentType;
            //size of file
            fileSize = incomingFile.ContentLength;
            //File extension
            fileExtension = Path.GetExtension(incomingFile.FileName);
            //create a byte array to store the binary image data

            filePath = "~/Data/UserData/" + filetype + "/" + UserID + "_" + fileName + "_" + fileSize;

            incomingFile.SaveAs(Server.MapPath("~/Data/UserData/" + filetype + "/") + UserID + "_" + fileName + "_" + fileSize);
            
            uploaded = SavingFiles.UploadStatement(filetype, filePath, UserID);
            
            switch (uploaded)
            {
                case 0:
                    UploadLabel.Text.Equals("Please Select a File.");
                    UploadLabel.ForeColor = System.Drawing.Color.Red;
                    UploadLabel.Visible = true;
                    break;
                case 1:
                    UploadLabel.Visible = true;
                    break;
                case 3:
                    UploadLabel.Text = "ERROR While uploding Please Try Again.";
                    UploadLabel.ForeColor = System.Drawing.Color.Red;
                    UploadLabel.Visible = true;
                    break;
            }
        }
    }
}


