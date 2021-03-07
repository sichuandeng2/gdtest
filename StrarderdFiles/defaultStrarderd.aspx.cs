using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StrarderdFiles_defaultStrarderd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BulletedList blss = new BulletedList();

            BulletedList bl= ldddl2(blss, "url_class");
            bl.DisplayMode = BulletedListDisplayMode.HyperLink;

            link.Controls.Add(bl);
        }
    }
    private BulletedList ldddl2(BulletedList ddl, string app)
    {
       
        ListItem li;
        if (Application[app] != null)
        {
            BulletedList bl = (BulletedList)Application[app];
            for (int i = 1; i < bl.Items.Count; i++)
            {
                li = new ListItem();
                li.Text = bl.Items[i].Text;
                li.Value = bl.Items[i].Value;
                ddl.Items.Add(li);
            }
        
        }
        return ddl;
    }


    protected void Button_seatch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\StrarderdFiles\\searchStrarderdFile.aspx?url=" + Text_Search.Value);
    }

    protected void Button_load_Click(object sender, EventArgs e)
    {
        Response.Redirect("~\\StrarderdFiles\\newStrarderdFile.aspx?url=" + Text_Search.Value);
    }

    protected void Button_new_Click(object sender, EventArgs e)
    {
        Response.Write("<script>window.open('http://www.csres.com/','_blank')</script>");
    }
}