using System;
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

        // setting up SqlConnection and SqlCommand
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
        con.Open();
        SqlCommand command = new SqlCommand();
        command.Connection = con;

        command.CommandText = @"SELECT u.FIRSTNAME
            , u.LASTNAME
	        , u.USERTYPE
	        , tt.tpName
        FROM USERS u
        INNER JOIN AVAIL a
            on u.USERNAME = a.USERNAME
        INNER JOIN USERTEAMENGAGEMENT ut
            on a.USERNAME = ut.USERNAME
        INNER JOIN TEAMTYPE tt
	        on ut.TP = tt.tp
        WHERE SEARCHTERM=@SEARCHTERM";
        command.Parameters.AddWithValue("@SEARCHTERM", "%" + searchTerm + "%");
        SqlDataReader reader = command.ExecuteReader();

        if (chkAnimalCare.Checked)
            command.CommandText += "AND 

        int count = 0;
        username.Text = (String)Session["fullName"];

        while (reader.Read())
        {
            String fullName = reader["FIRSTNAME"].ToString() + " " + reader["LASTNAME"].ToString();  // retrieve the password hash
            String email = reader["EMAIL"].ToString();
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
                                <td>Volunteer</td>
                              </tr>
                              <tr>
                                <td>Department:</td>
                                <td>Transport</td>
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
                                <td>Volunteer</td>
                              </tr>
                              <tr>
                                <td>Department:</td>
                                <td>Transport</td>
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