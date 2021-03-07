using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StrarderdFiles_StdFilesInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void down_click(object sender, CommandEventArgs e)
    {
        string name = e.CommandName;
        string path = Server.MapPath( e.CommandArgument.ToString()) + e.CommandName.ToString();

        if (System.IO.File.Exists(path))
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/unknow";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + name);
            Response.TransmitFile(path);
            Response.End();
        }
    }
}