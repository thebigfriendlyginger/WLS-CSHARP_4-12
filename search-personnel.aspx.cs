using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class search_personnel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        username.Text = (String)Session["fullName"];
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        String searchTerm = searchterm.Text;
        ArrayList matchedProfileIDs = new ArrayList();
        bool somethingTeamChecked = false;
        bool somethingDayChecked = false;

        profiles.InnerHtml = "";

        // setting up SqlConnection and SqlCommand
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
        con.Open();
        SqlCommand command = new SqlCommand();
        command.Connection = con;

        command.CommandText = @"SELECT distinct u.USERNAME
            , u.PROFILEID
            , u.FIRSTNAME
            , u.LASTNAME
	        , u.USERTYPE
            , u.EMAIL
	        , tt.tpName
        FROM USERS u
        INNER JOIN AVAILABILITY a
            on u.USERNAME = a.USERNAME
        INNER JOIN USERTEAMENGAGEMENT ut
            on a.USERNAME = ut.USERNAME
        INNER JOIN TEAMTYPE tt
	        on ut.TP = tt.tp
        WHERE u.FIRSTNAME + ' ' + u.LASTNAME LIKE @SEARCHTERM";
        command.Parameters.AddWithValue("@SEARCHTERM", "%" + searchTerm + "%");

        // filter by teams
        if (chkAnimalCare.Checked || chkOutreach.Checked || chkTransport.Checked || chkOther.Checked)
            command.CommandText += " AND (";

        if (chkAnimalCare.Checked)
        {
            command.CommandText += "tt.TPNAME = 'Animal Care' ";
            somethingTeamChecked = true;
        }

        if (somethingTeamChecked && chkOutreach.Checked)
            command.CommandText += "OR tt.TPNAME = 'Outreach' ";
        else if (chkOutreach.Checked)
        {
            command.CommandText += "tt.TPNAME = 'Outreach' ";
            somethingTeamChecked = true;
        }

        if (somethingTeamChecked && chkTransport.Checked)
            command.CommandText += "OR tt.TPNAME = 'Transport' ";
        else if (chkTransport.Checked)
        {
            command.CommandText += "tt.TPNAME = 'Transport' ";
            somethingTeamChecked = true;
        }

        if (somethingTeamChecked && chkOther.Checked)
            command.CommandText += "OR tt.TPNAME = 'Other'";
        else if (chkOther.Checked)
        {
            command.CommandText += "tt.TPNAME = 'Other'";
            somethingTeamChecked = true;
        }

        if (somethingTeamChecked)
            command.CommandText += ")";

        // filter by availability
        if (chkMonday.Checked || chkTuesday.Checked || chkWednesday.Checked || chkThursday.Checked || 
            chkFriday.Checked || chkSaturday.Checked || chkSunday.Checked)
            command.CommandText += " AND (";

        if (chkMonday.Checked)
        {
            command.CommandText += "a.DAY = 'Monday' ";
            somethingDayChecked = true;
        }

        if (somethingDayChecked && chkTuesday.Checked)
            command.CommandText += "OR a.DAY = 'Tuesday' ";
        else if (chkTuesday.Checked)
        {
            command.CommandText += "a.DAY = 'Tuesday' ";
            somethingDayChecked = true;
        }

        if (somethingDayChecked && chkWednesday.Checked)
            command.CommandText += "OR a.DAY = 'Wednesday' ";
        else if (chkWednesday.Checked)
        {
            command.CommandText += "a.DAY = 'Wednesday' ";
            somethingDayChecked = true;
        }

        if (somethingDayChecked && chkThursday.Checked)
            command.CommandText += "OR a.DAY = 'Thursday' ";
        else if (chkThursday.Checked)
        {
            command.CommandText += "a.DAY = 'Thursday' ";
            somethingDayChecked = true;
        }

        if (somethingDayChecked && chkFriday.Checked)
            command.CommandText += "OR a.DAY = 'Friday' ";
        else if (chkFriday.Checked)
        {
            command.CommandText += "a.DAY = 'Friday' ";
            somethingDayChecked = true;
        }

        if (somethingDayChecked && chkSaturday.Checked)
            command.CommandText += "OR a.DAY = 'Saturday' ";
        else if (chkSaturday.Checked)
        {
            command.CommandText += "a.DAY = 'Saturday' ";
            somethingDayChecked = true;
        }

        if (somethingDayChecked && chkSunday.Checked)
            command.CommandText += "OR a.DAY = 'Sunday'";
        else if (chkSunday.Checked)
        {
            command.CommandText += "a.DAY = 'Sunday'";
            somethingDayChecked = true;
        }

        if (somethingDayChecked)
            command.CommandText += ")";

        SqlDataReader reader = command.ExecuteReader();

        
        username.Text = (String)Session["fullName"];

        while (reader.Read())
        {
            if (!matchedProfileIDs.Contains(reader["PROFILEID"].ToString()))
                matchedProfileIDs.Add(reader["PROFILEID"].ToString());
        }

        reader.Close();
        con.Close();

        int count = 0;
        foreach (String profileID in matchedProfileIDs)
        {
            String teams = "";
            String fullName = "";
            String userType = "";
            String email = "";
            int teamsLength = 0;

            command.CommandText = @"SELECT u.FIRSTNAME
                    , u.LASTNAME
	                , u.USERTYPE
                    , u.EMAIL
	                , tt.tpName
                FROM USERS u
                INNER JOIN USERTEAMENGAGEMENT ut
                    on u.USERNAME = ut.USERNAME
                INNER JOIN TEAMTYPE tt
	                on ut.TP = tt.tp
                WHERE u.PROFILEID = " + profileID;

            con.Open();
            reader = command.ExecuteReader();

            while (reader.Read())
            {
                teams += reader["tpName"].ToString() + ", ";
                fullName = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();
                email = reader["email"].ToString();
                userType = reader["USERTYPE"].ToString();
            }

            con.Close();

            teams = teams.Trim();
            teamsLength = teams.Length;
            teams = teams.Remove(teamsLength - 1);

            count++;
            if (count % 2 == 0)
            {
                profiles.InnerHtml += @"<div class=""col-md-6 toppad"" >
                  <div class=""panel panel-info"">
                    <div class=""panel-heading"">
                      <h3 class=""panel-title"">" + fullName + @"</h3>
                    </div>
                    <div class=""panel-body"">
                      <div class=""row"">
                        <div class=""col-md-3 col-lg-3""> <img alt=""User Pic"" src=""images/head-shot.jpg"" class=""img-circle img-responsive profile-image"">
                        </div>
                
                         <div class=""col-md-9 col-lg-9"">
                          <table class=""table table-user-information"">
                            <tbody>
                              <tr>
                                <td>Position:</td>
                                <td>" + userType + @"</td>
                              </tr>
                              <tr>
                                <td>Department:</td>
                                <td>" + teams + @"</td>
                              </tr>
                            <tr>
                      
                                <td>Email</td>
                                <td><a href=""mailto:" + email + @""">" + email + @"</a></td>

                            </tr>
                     
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>";
            }
            else
            {
                profiles.InnerHtml += @"<div class=""row"">
                <div class=""col-md-6 toppad"" >
                  <div class=""panel panel-info"">
                    <div class=""panel-heading"">
                      <h3 class=""panel-title"">" + fullName + @"</h3>
                    </div>
                    <div class=""panel-body"">
                      <div class=""row"">
                        <div class=""col-md-3 col-lg-3""> <img alt=""User Pic"" src=""images/head-shot.jpg"" class=""img-circle img-responsive profile-image"">
                        </div>
                
                         <div class=""col-md-9 col-lg-9"">
                          <table class=""table table-user-information"">
                            <tbody>
                              <tr>
                                <td>Position:</td>
                                <td>" + userType + @"</td>
                              </tr>
                              <tr>
                                <td>Department:</td>
                                <td>" + teams + @"</td>
                              </tr>
                            <tr>
                      
                                <td>Email</td>
                                <td><a href=""mailto:" + email + @""">" + email + @"</a></td>
                      
                            </tr>
                     
                            </tbody>
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>";
            }

        }
    }
}