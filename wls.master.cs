using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class wls : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        userImg.Attributes["src"] = ResolveUrl("~/images/" + (String)Session["Username"]);
    }
}
