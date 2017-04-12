using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class confirmation_timesheet : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.Text = (String)Session["fullName"];
        lblTimesheetUser.Text = (String)Session["fullName"];

        String htmlHeader = @"<div class=""panel-body"">
       <!--TIMECHART-->
        
                      <section class=""panel"">
                          <table class=""table table-striped"">
                              <thead>
                              <tr>
                                  <th>Date</th>
                                  <th>Time in</th>
                                  <th>Time Out</th>
                                  <th>Total Hours</th>
                              </tr>
                              </thead>
                              <tbody>";

        collapseOne.InnerHtml += htmlHeader;
        getTimeSheetData(4);
        collapseTwo.InnerHtml += htmlHeader;
        getTimeSheetData(3);
        collapseThree.InnerHtml += htmlHeader;
        getTimeSheetData(2);

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        sc.Open();
        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand();
        command.Connection = sc;
        command.CommandText = "select sum(TotalHours) as TotalTotalHours from SHIFTS where USERNAME=@USERNAME";
        command.Parameters.AddWithValue("@USERNAME", "ztorok64");
        SqlDataReader reader = command.ExecuteReader();
        while (reader.Read())
            totalHours.Text = reader["TotalTotalHours"].ToString();

        sc.Close();
    }
    private void getTimeSheetData(int month)
    {
        String shiftDate = "";
        String clockIn = "";
        String clockOut = "";
        String totalHours = "";
        String htmlClosing = @"</tbody>
                        </table>
                    </section>
                  
                <!--END TIME CHART-->
            </div>";

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        sc.Open();
        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand();
        command.Connection = sc;
        command.CommandText = "select * from SHIFTS where USERNAME = @USERNAME AND MONTH(SHIFTDATE) = " + month + "AND YEAR(SHIFTDATE) = " + DateTime.Today.Year;
        command.Parameters.AddWithValue("@USERNAME", "ztorok64");
        SqlDataReader reader = command.ExecuteReader();

        while (reader.Read())
        {
            shiftDate = Convert.ToDateTime(reader["SHIFTDATE"]).ToString("MM-dd-yyyy");
            clockIn = Convert.ToDateTime(reader["CLOCKIN"]).ToString("hh:mm tt");
            clockOut = Convert.ToDateTime(reader["CLOCKOUT"]).ToString("hh:mm tt");
            totalHours = reader["TOTALHOURS"].ToString();

            String htmlFragment = @"<tr>
                                <td>" + shiftDate + @"</td>
                                <td>" + clockIn + @"</td>
                                <td>" + clockOut + @"</td>
                                <td>" + totalHours + @"</td>
                            </tr>";

            switch (month)
            {
                case 4:
                    collapseOne.InnerHtml += htmlFragment;
                    break;
                case 3:
                    collapseTwo.InnerHtml += htmlFragment;
                    break;
                case 2:
                    collapseThree.InnerHtml += htmlFragment;
                    break;
            }
        }

        switch (month)
        {
            case 4:
                collapseOne.InnerHtml += htmlClosing;
                break;
            case 3:
                collapseTwo.InnerHtml += htmlClosing;
                break;
            case 2:
                collapseThree.InnerHtml += htmlClosing;
                break;
        }


    }
}
