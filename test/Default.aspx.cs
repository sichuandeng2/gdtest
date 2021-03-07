using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class test_Default : System.Web.UI.Page
{

    string[] dte = { "s", "d" };
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string path = "~/test1/";
            //string path = "c:\\";
            string[] names = Directory.GetFiles(MapPath(path),"*.jpg");

            for (int i = 0; i < names.Length; i++)
            {
                string url = "~/test1/" + Path.GetFileName(names[i]);
                Image picture = new Image();
                picture.Width = 400;
                picture.Height = 800;
                picture.ImageUrl = url;
                form1.Controls.Add(picture);

            }




            //for (int i = 1; i < 4; i++)
            //{
            //    Image img = new Image();
            //    img.ImageUrl = "~/test/" + i + ".jpg";
            //    img.Width = 300;
            //    img.Height = 300;
            //    imgs.Controls.Add(img);
            //}
            //string js = "var count=" + 3;
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "", js, true);

        }

    }

    

}