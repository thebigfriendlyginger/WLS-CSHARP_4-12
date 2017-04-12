using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class public_profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // setting up SqlConnection and SqlCommand
        SqlConnection con = new SqlConnection();
        con.ConnectionString = "Server=localhost;Database=WLS;Trusted_Connection=Yes;";
        con.Open();
        SqlCommand command = new SqlCommand();
        command.Connection = con;

        command.CommandText = "select * from USERS where FIRSTNAME + ' ' + LASTNAME LIKE '%" + (String)Session["searchTerm"] + "%'";
        SqlDataReader reader = command.ExecuteReader();

        int count = 0;
        searchterm2.Text = (String)Session["searchTerm"];
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