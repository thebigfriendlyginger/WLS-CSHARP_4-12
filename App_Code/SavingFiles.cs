using System; 
using System.Collections.Generic; 
using System.Linq; 
using System.Web; 
using System.Web.UI; 
using System.Web.UI.WebControls; 
using System.IO; 
using System.Data.SqlClient; 
using System.Configuration; 
using System.Data.SqlClient;
using System.IO;
using System.Data;


/// Summary description for SavingFiles

public class SavingFiles
{

    public static int UploadStatement(String FileType, String Filepath, String UserID)
    {
        int upload = 0;
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=Lab2;Trusted_Connection=Yes;";
            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "INSERT INTO [dbo].[DataFiles]([FileType],[Filepath],[lastUpdatedBy],[lastupdated])";
            insert.CommandText += "VALUES(@FileType, @Filepath, @username, @date);";

            //insert.Parameters.AddWithValue("@PROFILEPICTURE", System.Data.SqlDbType.Image); 
            if (Filepath != "")
            {

                insert.Parameters.AddWithValue("@FileType", FileType);
                insert.Parameters.AddWithValue("@Filepath", Filepath);
                insert.Parameters.AddWithValue("@username", UserID);
                insert.Parameters.AddWithValue("@date", DateTime.Now);
                insert.ExecuteNonQuery();

                upload = 1;
            }
        }
        catch (SqlException e)
        {
            upload = 2;
            e.ToString();
        }
        return upload;
    }

    public class CreateFileOrFolder
    {
        static void Main()
        {
            // Specify a name for your top-level folder.
            string folderName = @"c:\Users\silas\Documents\WLS-CSHARP\Data\Userdata";

            // To create a string that specifies the path to a subfolder under your 
            // top-level folder, add a name for the subfolder to folderName.
            string pathString = System.IO.Path.Combine(folderName, "Userdata");

            // You can write out the path name directly instead of using the Combine
            // method. Combine just makes the process easier.
            string pathString2 = @"c:\Users\silas\Documents\WLS-CSHARP\Data\Userdata";

            // You can extend the depth of your path if you want to.
            //pathString = System.IO.Path.Combine(pathString, "SubSubFolder");

            // Create the subfolder. You can verify in File Explorer that you have this
            // structure in the C: drive.
            //    Local Disk (C:)
            //        Top-Level Folder
            //            SubFolder
            System.IO.Directory.CreateDirectory(pathString);

            // Create a file name for the file you want to create. 
            string fileName = System.IO.Path.GetRandomFileName();

            // This example uses a random string for the name, but you also can specify
            // a particular name.
            //string fileName = "MyNewFile.txt";

            // Use Combine again to add the file name to the path.
            pathString = System.IO.Path.Combine(pathString, fileName);

            // Verify the path that you have constructed.
            Console.WriteLine("Path to my file: {0}\n", pathString);

            // Check that the file doesn't already exist. If it doesn't exist, create
            // the file and write integers 0 - 99 to it.
            // DANGER: System.IO.File.Create will overwrite the file if it already exists.
            // This could happen even with random file names, although it is unlikely.
            if (!System.IO.File.Exists(pathString))
            {
                using (System.IO.FileStream fs = System.IO.File.Create(pathString))
                {
                    for (byte i = 0; i < 100; i++)
                    {
                        fs.WriteByte(i);
                    }
                }
            }
            else
            {
                Console.WriteLine("File \"{0}\" already exists.", fileName);
                return;
            }

            // Read and display the data from your file.
            try
            {
                byte[] readBuffer = System.IO.File.ReadAllBytes(pathString);
                foreach (byte b in readBuffer)
                {
                    Console.Write(b + " ");
                }
                Console.WriteLine();
            }
            catch (System.IO.IOException e)
            {
                Console.WriteLine(e.Message);
            }

            // Keep the console window open in debug mode.
            System.Console.WriteLine("Press any key to exit.");
            System.Console.ReadKey();
        }
        // Sample output:

        // Path to my file: c:\Top-Level Folder\SubFolder\ttxvauxe.vv0

        //0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29
        //30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56
        // 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 8
        //3 84 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99
    }

    public static bool SaveAvailibility(String day, String St, String Ed, String UserID)
    {
        Boolean saved = false;
        try 
        { 
        
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=Lab2;Trusted_Connection=Yes;";
            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;

            insert.CommandText = "insert into [dbo].[Availability]"
                + "([Username],[Day],[StartTime],[EndTime],[LastUpdatedBy],[LastUpdated])";
            insert.CommandText += " values (@username,@Day,@StartTime,@EndTime,@LastUpdatedBy,@LastUpdated)";
            insert.Parameters.AddWithValue("@username", UserID);
            insert.Parameters.AddWithValue("@Day", day);
            insert.Parameters.AddWithValue("@StartTime", St);
            insert.Parameters.AddWithValue("@EndTime", Ed);
            insert.Parameters.AddWithValue("@LastUpdatedBy", UserID);
            insert.Parameters.AddWithValue("@LastUpdated", DateTime.Now);

            insert.ExecuteNonQuery();
            saved = true;
            

        } 
        catch (SqlException e) 
        {          
            e.ToString();
        }
        return saved; 
    }

    public static bool ApplicationStatus(String Statues, String UserID)
    {
        Boolean saved = false;
        try
        {
            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=Lab2;Trusted_Connection=Yes;";
            sc.Open();
            System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
            insert.Connection = sc;
            insert.CommandText = "update [dbo].[Users] set AppStat = @Statues where Username = @Userid";
            insert.CommandText += " values (@Statues,@Userid)";
            insert.Parameters.AddWithValue("@Statues", Statues);
            insert.Parameters.AddWithValue("@Userid", UserID);

            insert.ExecuteNonQuery();
            saved = true;
        }
        catch (SqlException e)
        {
            e.ToString();
        }
        return saved;
    }
}