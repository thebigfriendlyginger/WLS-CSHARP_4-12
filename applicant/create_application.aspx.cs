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
    String UserID = "";
    String UserFirstN = "FIRSTNAME";
    String UserLastN = "LASTNAME";
    String UserEmail = "EMAIL";
    String PrimKey;
    String AppStatues = "";
    String TeamType = "";
    String Statement = "";
    String fileName = ""; 
    String filetype = "";
    String contentType = "";
    int fileSize;
    String fileExtension = "";
    int uploaded = 0;
    String AlldepartLable = "";
    bool saved = false;


    protected void Page_Load(object sender, EventArgs e)
    {

        UserID = (String)Session["username"];
        UserID = "Steve";

        String HTMLField = "";
        
        //populateUserInfo(UserID);

        if (!IsPostBack)
        {

            try
            {

                //UserID = (String)Session["Username"];
                Enti = "Users";
                PrimKey = "UserName";

                UserFirstN = Repostdata(UserFirstN, Enti, PrimKey);
                UserLastN = Repostdata(UserLastN, Enti, PrimKey);
                UserEmail = Repostdata(UserEmail, Enti, PrimKey);

                NavUsername.Text = UserFirstN + " " + UserLastN;
                ProUsername.Text = UserFirstN + " " + UserLastN;
                Position.Text = "IDK";
                Email.Text = UserEmail;

            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                // Throws database errors in a Message Box to alert the user
                System.Diagnostics.Debug.WriteLine(sqlException.Message);
            }

            if (ProfileImg.ImageUrl == "")
            {
                ProfileImg.ImageUrl = "../WLS-CSHARP/Data/"
                + "Sample/Default PP.jpg";
            }

            if (AppStatues.Contains("Saved"))
            {
                         

            try
            {
                // Links application to database, opens SQL connection and establishs insert string
                System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();

                SQLisConnect.SQLConnection();

                Statement = "SELECT usertype from dbo.user WHERE username =" + UserID;
                AppStatues = SQLisConnect.DatabaseSelect(Statement);

            }
            catch (System.Data.SqlClient.SqlException sqlException)
            {
                // Throws any DB errors in a Message Box for user
                System.Diagnostics.Debug.WriteLine(sqlException.Message);
                HTMLField = "Error Loading";
            }


            if (AppStatues.Equals("Started"))
            {
                try
                {

                    System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
                    sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=WLS;Trusted_Connection=Yes;";
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
                            TeamType = volReader["TeamType"].ToString();
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

                    insert.CommandText = "";
                    insert.CommandText = "Select filepath from datafiles where lastupdated = @USERNAME and Filetype = profile pic;";
                    using (SqlDataReader volReader = insert.ExecuteReader())
                    {
                        while (volReader.Read())
                        {
                            ProfileImg.ImageUrl = volReader["filepath"].ToString();

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

                
            }
            }

            //if (TeamType.Contains("1"))
            //{
            //    Departmentlist.Text.Concat(" Animal Care");
            //    frmAnimalCare.Visible = true;
            //}
            //if (TeamType.Contains("2"))
            //{
            //    Departmentlist.Items.Add("Other");
            //    frmFrontDesk.Visible = true;
            //}
            //if (TeamType.Contains("3"))
            //{
            //    Departmentlist.Items.Add("Outreach");
            //    frmOutreach.Visible = true;
            //}
            //if (TeamType.Contains("4"))
            //{
            //    Departmentlist.Items.Add("Transport");
            //    frmTransport.Visible = true;
            //}
            //if (TeamType.Contains("5"))
            //{
            //    Departmentlist.Items.Add("Vet");
            //    frmVet.Visible = true;
            //}
            //if (TeamType.Contains("None")||(TeamType == ""))
            //{
            //    Departmentlist.Visible = false;
            //}

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
           [PROFILEID] [int] NOT NULL,
           [USERNAME] [varchar](50) NOT NULL,
           [PHONE] [varchar](25) NOT NULL,
           [DOB] [date] NOT NULL,
           [GENDER] [varchar](25) NOT NULL,
           [PROFSTATUS] [varchar](50) NOT NULL,
           [USERTYPE] [varchar](50) NOT NULL,
           [ALLERGIES] [bit] NOT NULL,
           [ALLERGIESSPECIFY] [varchar](50) NULL,
           [LIMITATIONS] [bit] NOT NULL,
           [LIMITATIONSSPECIFY] [varchar](50) NULL,
           [MEDICALCONDITIONS] [varchar](50) NULL,
           [RABVACCINEFLAG] [bit] NOT NULL,
           [RABATTACH] [varbinary](max) NULL,
           [VALIDPERMITFLAG] [bit] NOT NULL,
           [VALIDPERMITATTACH] [varbinary](max) NULL,
           [PERMITCATEGORY] [int] NULL,
           [RESUMEATTACH] [varbinary](max) NULL,
           [LETTEROFRECOM] [varbinary](max) NULL,
           [LASTUPDATED] [datetime] NOT NULL,
           [LASTUPDATEDBY] [varchar](50) NOT NULL,
         * 
        */

        insert.CommandText = "insert into [dbo].[APPLICANT]"
        + "([PROFILEID],[USERID],[PHONE],[DOB],[GENDER],[PROFSTATUS],[USERTYPE],[ALLERGIES],[ALLERGIESSPECIFY],"
        + "[LIMITATIONS],[LIMITATIONSSPECIFY],[MEDICALCONDITIONS],[RABVACCINEFLAG],[RABATTACH],[VALIDPERMITFLAG],[VALIDPERMITATTACH],"
        + "[PERMITCATEGORY],[RESUMEATTACH],[LETTEROFRECOM],[LASTUPDATED],[LASTUPDATEDBY])";

        insert.CommandText += " values (@PROFILEID,@USERID,@PHONE,@DOB,@GENDER,@PROFSTATUS,@USERTYPE,@ALLERGIES,@ALLERGIESSPECIFY,"
        +"@LIMITATIONS,@LIMITATIONSSPECIFY,@MEDICALCONDITIONS,@RABVACCINEFLAG,@RABATTACH,@VALIDPERMITFLAG,@VALIDPERMITATTACH,"
        + " @PERMITCATEGORY,@RESUMEATTACH,@LETTEROFRECOM,@LASTUPDATED,@LASTUPDATEDBY";

        insert.Parameters.AddWithValue("@USERID", UserID);
        insert.Parameters.AddWithValue("@PHONE", phoneNumber);
        insert.Parameters.AddWithValue("@DOB", dOB);
        insert.Parameters.AddWithValue("@GENDER", gender);
        insert.Parameters.AddWithValue("@PROFSTATUS", AppStatues);
        insert.Parameters.AddWithValue("@USERTYPE", UserID);
        insert.Parameters.AddWithValue("@ALLERGIES", 1);
        insert.Parameters.AddWithValue("@ALLERGIESSPECIFY", allergies);
        insert.Parameters.AddWithValue("@LIMITATIONS", 1);
        insert.Parameters.AddWithValue("@LIMITATIONSSPECIFY", limitation);
        insert.Parameters.AddWithValue("@MEDICALCONDITIONS", medicalCondition);
        insert.Parameters.AddWithValue("@RABVACCINEFLAG", 1);
        insert.Parameters.AddWithValue("@RABATTACH", "");
        insert.Parameters.AddWithValue("@VALIDPERMITFLAG", 1);
        insert.Parameters.AddWithValue("@VALIDPERMITATTACH", "");
        insert.Parameters.AddWithValue("@PERMITCATEGORY", "");
        insert.Parameters.AddWithValue("@RESUMEATTACH", "");
        insert.Parameters.AddWithValue("@LETTEROFRECOM", "");
        insert.Parameters.AddWithValue("@LASTUPDATED", UserID);
        insert.Parameters.AddWithValue("@LASTUPDATEDBY", DateTime.Now);

        insert.ExecuteNonQuery();
        
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

            Statement = "SELECT " + Attri + " from dbo." + Enti + " WHERE " + PrimKey + "='" + UserID+"'";
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
            sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=WLS;Trusted_Connection=Yes;";
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

            filePath = "../Data/UserData/" + filetype + "/" + UserID + "_" + fileName + "_" + fileSize;

            incomingFile.SaveAs(Server.MapPath("~/Data/UserData/" + filetype + "/") + UserID + "_" + fileName + "_" + fileSize);
            
            uploaded = SavingFiles.UploadStatement(filetype, filePath, UserID);
            
            if (!(Filetype.SelectedIndex.Equals(0)||Filetype.SelectedIndex.Equals(null)))
            {
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
    public void AddTeam(object sender, EventArgs e)
    {
        
        if (!(Department.SelectedIndex.Equals(0)))
        {
            AlldepartLable = AlldepartLable + " " + Department.SelectedValue.ToString();
            Departmentlist.Text = AlldepartLable.ToString();
            Departmentlist.DataBind();
            Departmentlist.Visible = true;
                  
            if (Department.SelectedValue.Contains("Animal")){
                frmAnimalCare.Visible = true;
            }
            if (Department.SelectedValue.Contains("Other")){
                frmFrontDesk.Visible = true;
            }
            if (Department.SelectedValue.Contains("Outreach")){
                frmOutreach.Visible = true;
            }
            if (Department.SelectedValue.Contains("Transport")){
                frmTransport.Visible = true;
            }
            if (Department.SelectedValue.Contains("Vet")){
                frmVet.Visible = true;
            }
            Department.SelectedIndex = 0;
            Department.DataBind();
        }
    }
    protected void DayCheckedChanged(object sender, EventArgs e)
    {
        if(Day1.Equals(true))
        { Day1St.Visible = true; Day1f.Visible = true; }
        if (Day2.Equals(true))
        { Day2St.Visible = true; Day2f.Visible = true; }
        if (Day2.Equals(true))
        { Day3St.Visible = true; Day3f.Visible = true; }
        if (Day4.Equals(true))
        { Day4St.Visible = true; Day4f.Visible = true; }
        if (Day5.Equals(true))
        { Day5St.Visible = true; Day5f.Visible = true; }

    }
}


