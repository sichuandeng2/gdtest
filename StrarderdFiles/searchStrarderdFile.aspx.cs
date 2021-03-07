using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StrarderdFiles_searchStrarderdFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["url"]!=null&&!IsPostBack)
        {
            string geturl = Request.QueryString["url"];
            Session["url"] = geturl;
            Text_Search.Value = geturl;
        }

    }

    protected void Button_Search_Click(object sender, EventArgs e)
    {
        Session["url"] = Text_Search.Value;

    }
}