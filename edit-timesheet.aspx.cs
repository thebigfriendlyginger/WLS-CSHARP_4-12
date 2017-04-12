using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit_timesheet : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        username.Text = (String)Session["fullName"];
        lblTimesheetUser.Text = (String)Session["fullName"];

        if (!IsPostBack)
        {
            String clockIn = "";
            String clockOut = "";
            String totalHours = "";

            System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
            sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
            sc.Open();
            System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand();
            command.Connection = sc;
            command.CommandText = "select * from SHIFTS where USERNAME = @USERNAME AND MONTH(SHIFTDATE) = '" + DateTime.Today.Month + "' order by shiftid desc";
            command.Parameters.AddWithValue("@USERNAME", "ztorok64");
            SqlDataReader reader = command.ExecuteReader();

            int count = 1;
            while (reader.Read() && count < 4)
            {
                ViewState["shiftDate"] = Convert.ToDateTime(reader["SHIFTDATE"]).ToString("MM-dd-yyyy");
                clockIn = Convert.ToDateTime(reader["CLOCKIN"]).ToString("hh:mm tt");
                clockOut = Convert.ToDateTime(reader["CLOCKOUT"]).ToString("hh:mm tt");
                totalHours = reader["TOTALHOURS"].ToString();

                switch (count)
                {
                    case 1:
                        daterow1.Text = (String)ViewState["shiftDate"];
                        timeinrow1.Text = clockIn;
                        timeoutrow1.Text = clockOut;
                        hoursrow1.Text = totalHours;
                        ViewState["row1ShiftID"] = Int32.Parse(reader["SHIFTID"].ToString());
                        break;
                    case 2:
                        daterow2.Text = (String)ViewState["shiftDate"];
                        timeinrow2.Text = clockIn;
                        timeoutrow2.Text = clockOut;
                        hoursrow2.Text = totalHours;
                        ViewState["row2ShiftID"] = Int32.Parse(reader["SHIFTID"].ToString());
                        break;
                    case 3:
                        daterow3.Text = (String)ViewState["shiftDate"];
                        timeinrow3.Text = clockIn;
                        timeoutrow3.Text = clockOut;
                        hoursrow3.Text = totalHours;
                        ViewState["row3ShiftID"] = Int32.Parse(reader["SHIFTID"].ToString());
                        break;
                }

                count++;
            }
            sc.Close();

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

            collapseTwo.InnerHtml += htmlHeader;
            getTimeSheetData(3);
            collapseThree.InnerHtml += htmlHeader;
            getTimeSheetData(2);

            sc.Open();
            command.CommandText = "select sum(TotalHours) as TotalTotalHours from SHIFTS where USERNAME=@USERNAME";
            SqlDataReader reader2 = command.ExecuteReader();
            while (reader2.Read())
                txtTotalHours.Text = reader2["TotalTotalHours"].ToString();
            sc.Close();
        }
    }
    private void getTimeSheetData(int month)
    {
        
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
            ViewState["shiftDate"] = Convert.ToDateTime(reader["SHIFTDATE"]).ToString("MM-dd-yyyy");
            clockIn = Convert.ToDateTime(reader["CLOCKIN"]).ToString("hh:mm tt");
            clockOut = Convert.ToDateTime(reader["CLOCKOUT"]).ToString("hh:mm tt");
            totalHours = reader["TOTALHOURS"].ToString();

            String htmlFragment = @"<tr>
                                <td>" + (String)ViewState["shiftDate"] + @"</td>
                                <td>" + clockIn + @"</td>
                                <td>" + clockOut + @"</td>
                                <td>" + totalHours + @"</td>
                            </tr>";

            switch (month)
            {
                case 3:
                    collapseTwo.InnerHtml += htmlFragment;
                    break;
                case 2:
                    collapseThree.InnerHtml += htmlFragment;
                    break;
            }
        }
        sc.Close();

        switch (month)
        {
            case 3:
                collapseTwo.InnerHtml += htmlClosing;
                break;
            case 2:
                collapseThree.InnerHtml += htmlClosing;
                break;
        }

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int row1ShiftID = (int)ViewState["row1ShiftID"];
        int row2ShiftID = 0;
        int row3ShiftID = 0;

        if (ViewState["row2ShiftID"] != null)
            row2ShiftID = (int)ViewState["row2ShiftID"];
        if (ViewState["row2ShiftID"] != null)
            row3ShiftID = (int)ViewState["row3ShiftID"];

        String shiftDate;
        String shiftEndDate;

        System.Data.SqlClient.SqlConnection sc = new System.Data.SqlClient.SqlConnection();
        sc.ConnectionString = @"Server = LOCALHOST; Database = WLS; Trusted_Connection = Yes;";
        System.Data.SqlClient.SqlCommand command = new System.Data.SqlClient.SqlCommand();
        command.Connection = sc;
        command.Parameters.AddWithValue("@USERNAME", "ztorok64");

        for (int i = 1; i < 4; i++)
        {
            sc.Open();
            
            switch (i)
            {
                case 1:
                    ViewState["shiftDate"] = daterow1.Text;
                    shiftDate = (String)ViewState["shiftDate"];
                    getClockOutDate(timeinrow1.Text, timeoutrow1.Text);
                    shiftEndDate = (String)ViewState["shiftEndDate"];
                    command.CommandText = "Update SHIFTS Set SHIFTDATE = '" + daterow1.Text + "', CLOCKIN = '" + shiftDate + " " + timeinrow1.Text + "', CLOCKOUT = '" + shiftEndDate + " " + timeoutrow1.Text + "' WHERE SHIFTID = " + row1ShiftID;
                    break;
                case 2:
                    ViewState["shiftDate"] = daterow2.Text;
                    shiftDate = (String)ViewState["shiftDate"];
                    getClockOutDate(timeinrow2.Text, timeoutrow2.Text);
                    shiftEndDate = (String)ViewState["shiftEndDate"];
                    command.CommandText = "Update SHIFTS Set SHIFTDATE = '" + daterow2.Text + "', CLOCKIN = '" + shiftDate + " " + timeinrow2.Text + "', CLOCKOUT = '" + shiftEndDate + " " + timeoutrow2.Text + "' WHERE SHIFTID = " + row2ShiftID;
                    break;
                case 3:
                    ViewState["shiftDate"] = daterow3.Text;
                    shiftDate = (String)ViewState["shiftDate"];
                    getClockOutDate(timeinrow2.Text, timeoutrow2.Text);
                    shiftEndDate = (String)ViewState["shiftEndDate"];
                    command.CommandText = "Update SHIFTS Set SHIFTDATE = '" + daterow3.Text + "', CLOCKIN = '" + shiftDate + " " + timeinrow3.Text + "', CLOCKOUT = '" + shiftEndDate + " " + timeoutrow3.Text + "' WHERE SHIFTID = " + row3ShiftID;
                    break;
            }
            SqlDataReader reader = command.ExecuteReader();
            sc.Close();
        }

        Response.Redirect("confirmation-timesheet.aspx");
    }

    public void getClockOutDate(String clockIn, String clockOut)
    {
        //if ((clockIn[6] == 'P' || clockIn[6] == 'p') && (clockOut[6] == 'A' || clockOut[6] == 'a'))
        //{
        //    String shiftDate = (String)ViewState["shiftDate"];
        //    DateTime shiftDateTime = new DateTime(Int32.Parse(shiftDate.Substring(6, 4)), Int32.Parse(shiftDate.Substring(0, 2)), Int32.Parse(shiftDate.Substring(3, 2)));
        //    shiftDateTime.AddDays(1);
        //    ViewState["shiftEndDate"] = shiftDateTime.ToString();
        //}
        //else
            ViewState["shiftEndDate"] = (String)ViewState["shiftDate"]; ;
    }
    protected void btnAddTime_Click(object sender, EventArgs e)
    {
        Response.Redirect("add-time.aspx");
    }
}