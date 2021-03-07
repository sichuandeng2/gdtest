using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class StrarderdFiles_newStrarderdFile : System.Web.UI.Page
{
    //string emage { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsCallback)
        {
            //检测用户是否登录
            if (Session["user"] == null)
            {
                string url = "~" + Request.CurrentExecutionFilePath;
                Session["url"] = url;
                Response.Redirect("~/Users/userDefault.aspx");
            }
        }
    }

    /// <summary>
    /// 发布规范
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_stdfile_release_Click(object sender, EventArgs e)
    {

        T_Users thisuser = new T_Users();
        Int32 pat;
        string name = txt_stdfile_name.Text + DateTime.Now.ToString("yyyyMMddHHmmss") + Path.GetExtension(fileupl_stdfile_file.FileName);
        string path = MapPath("~/test/");
        string sqlstr = null;

        if (Session["user"] != null)
        {
            thisuser = (T_Users)Session["user"];
            if (fileupl_stdfile_file.HasFile)
            {
                To_Server server = new To_Server();
                pat = (int)server.GetValue("T_stdfile_path", "pat_class", "规范文件", 0);
                path = (string)server.GetValue("T_stdfile_path", "pat_class", "规范文件", 1);
                try
                {
                   string[]newpath= Directory.GetFiles(@"F:\");
                    Directory.CreateDirectory(MapPath(path));
                    fileupl_stdfile_file.SaveAs(MapPath(path) + name);
                }
                catch (Exception E)
                {
                    string D = E.ToString();
                }

                bool dd = File.Exists(MapPath(path) + name);
                if (dd)
                {
                    T_stdFile newstd = new T_stdFile();
                    HttpPostedFile newfile = fileupl_stdfile_file.PostedFile;
                    newstd.f_name = name;
                    newstd.f_update = DateTime.Now.Date;
                    newstd.s_about = txt_stdfile_about.Text;
                    newstd.s_effcetdate = DateTime.Parse(txt_stdfile_effect.Text);
                    newstd.s_releasedate = DateTime.Parse(txt_stdfile_release.Text);
                    newstd.s_index = txt_stdfile_index.Text;
                    newstd.s_name = txt_stdfile_name.Text;
                    newstd.f_path_id = pat;
                    float size = newfile.ContentLength / (float)1024.0 / 1024;
                    newstd.f_size =float.Parse( size.ToString("0.0"));
                    newstd.s_range_id = drl_stdfile_range.SelectedValue;
                    newstd.s_class_id = drl_stdfile_class.SelectedValue;
                    newstd.s_force_id = drl_stdfile_force.SelectedValue;
                    sqlstr = "insert into T_stdFile (" +
                        "[s_name],[s_index],[s_releasedate],[s_effcetdate],[s_about],[s_range_id],[s_force_id],[s_class_id],[f_name],[f_size],[f_upuser_id],[f_update],[f_order],[f_downnum],[f_enable],[f_delete],[f_path_id])values('" +
                        newstd.s_name + "','" + newstd.s_index + "','" + newstd.s_releasedate + "','" + newstd.s_effcetdate + "','" + newstd.s_about + "','" + int.Parse(drl_stdfile_range.SelectedValue) + "','" +
                        int.Parse(drl_stdfile_force.SelectedValue) + "','" + int.Parse(drl_stdfile_class.SelectedValue) + "','" + newstd.f_name + "','" + newstd.f_size + "','" + thisuser.id + "','" + newstd.f_update + "','1','0','false','false','" + pat + "')";
                    int i = server.UpDate(sqlstr);
                    if (i > 0)
                    {
                        Response.Redirect(Request.RawUrl);
                    }
                    else
                    {
                        
                        Response.Write("<script>alert('文件写入数据失败')</script>");
                    }
                }
            }
            Response.Write("<script>alert('文件上传完成')</script>");
            
        }
        else
        {
            if (Session["user"] == null)
            {
                string url = "~" + Request.CurrentExecutionFilePath;
                Session["url"] = url;
                Response.Redirect("~/Users/userDefault.aspx");
            }

        }
    }
}