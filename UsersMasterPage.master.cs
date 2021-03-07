using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UsersMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "~" + Request.CurrentExecutionFilePath;
        Session["url"] = url;
        if (Session["user"] == null)
        {
            Response.Redirect("../Users/userDefault.aspx");
        }
    }
}
