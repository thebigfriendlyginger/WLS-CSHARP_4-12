using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SQLisConnect
/// </summary>
public static class SQLisConnect
{
    static System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
    static System.Data.SqlClient.SqlDataReader DataReader = null;
    static System.Data.SqlClient.SqlCommand insert = new System.Data.SqlClient.SqlCommand();
    static string SQLStatement;


	public static void SQLConnection()
	{
		 try
        {
            sc.Close();
            sc.ConnectionString = @"Server=SILAS-PC\LOCALHOST; Database=WLS;Trusted_Connection=Yes;";
            sc.Open();
            System.Diagnostics.Debug.WriteLine("databse connection opened");
              
        }
        catch (System.Data.SqlClient.SqlException sqlException)
        {
            //TextOutput0.Text = "Error While Trying to Connect to Database";
            System.Diagnostics.Debug.WriteLine(sqlException.Message);
        }
	}

    public static void DatabaseSelectNR(String Statement)
    {
        try
        {
            System.Diagnostics.Debug.WriteLine("Statement as been passed to Select Method");
            insert.Connection = sc;
            insert.CommandText = Statement;
            insert.ExecuteNonQuery();
        }
        catch (System.Data.SqlClient.SqlException sqlException)
        {
            //TextOutput0.Text = "Error While Trying to Connect to Database";
            System.Diagnostics.Debug.WriteLine(sqlException.Message);

        }
    }

    public static String DatabaseSelect(String Statement)
    {
        String ReturnedSQLData = "N/A"; 
         
        try
        {
            System.Diagnostics.Debug.WriteLine("Statement as been passed to Select Method");
            insert.Connection = sc;
            insert.CommandText = Statement;
            insert.ExecuteNonQuery();
            ReturnedSQLData = insert.ExecuteScalar().ToString();
         }
        catch (System.Data.SqlClient.SqlException sqlException)
        {
            //TextOutput0.Text = "Error While Trying to Connect to Database";
            System.Diagnostics.Debug.WriteLine(sqlException.Message);

        }
        return ReturnedSQLData;
    }

}
	
