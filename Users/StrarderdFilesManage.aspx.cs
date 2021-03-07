using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_StrarderdFilesManage : System.Web.UI.Page
{

    T_stdFile stdfile = new T_stdFile();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ldddl(ddl_class, "ddl_class");
            ldddl(ddl_force, "ddl_force");
            ldddl(ddl_range, "ddl_range");
            ldddl2(ddl_edite_sclass, "ddl_class");
            ldddl2(ddl_edite_range, "ddl_range");
            ldddl2(ddl_edite_force, "ddl_force");
            ldddl(ddl_edite_user, "ddl_user");
        }
        //std_proup.Visible = visibles;
    }
    /// <summary>
    /// 规范编辑方法体
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void stdFile_edit(object sender, CommandEventArgs e)
    {
        
        stdfile.id =Int32.Parse( e.CommandArgument.ToString());
        Session["strid"] = stdfile.id;
        stdfile = stdfile.GetStdFile(stdfile);
        

        txt__edite_sname.Text = stdfile.s_name;
        txt__edite_sindex.Text = stdfile.s_index;
        txt_edites_release.Text = stdfile.s_releasedate.ToString("yyyy-MM-dd");
        txt_edites_fname.Text = stdfile.f_name;
        txt_edite_fsize.Text = stdfile.f_size.ToString("n1")+"M";
        txt_edites_fupdate.Text = stdfile.f_update.ToString("yyyy-MM-dd");
        txt_edite_effcetdate.Text = stdfile.s_effcetdate.ToString("yyyy-MM-dd");
        txt_edite_about.Text = stdfile.s_about;
        txt_edite_order.Text = stdfile.f_order.ToString();

        ddl_edite_user.SelectedValue = stdfile.f_upuser_id.ToString();
        ccb_edite_enable.Checked= stdfile.f_enable;
        ccb_edite_delete.Checked = stdfile.f_delete;
        ddl_edite_range.SelectedValue =stdfile.s_range_id.ToString();
        ddl_edite_force.SelectedValue = stdfile.s_force_id.ToString();
        ddl_edite_sclass.SelectedValue = stdfile.s_class_id.ToString();
        std_proup.Visible = true;
    }

    /// <summary>
    /// 规范保存方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_edite_save_Click(object sender, EventArgs e)
    {
        string s = txt_edite_fsize.Text;
        s=  s.Replace('M',' ');
        string sql = "update T_stdFile set "+
            "[s_name]='"+ txt__edite_sname.Text + "',"+
            "[s_index]='"+ txt__edite_sindex.Text + "',"+
            "[s_releasedate]='"+ txt_edites_release.Text + "',"+
            "[f_name]='"+ txt_edites_fname.Text + "',"+
            "[f_size]='"+ s + "',"+
            "[f_update]='"+ txt_edites_fupdate.Text + "',"+
            "[s_effcetdate]='"+ txt_edite_effcetdate.Text + "',"+
            "[f_order]='"+ txt_edite_order.Text + "'," +
            "[f_upuser_id]='"+ ddl_edite_user.SelectedValue + "'," +
            "[f_enable]='"+ ccb_edite_enable.Checked + "'," +
            "[f_delete]='"+ ccb_edite_delete.Checked + "'," +
            "[s_range_id]='"+ ddl_edite_range.SelectedValue + "'," +
            "[s_force_id]='"+ ddl_edite_force.SelectedValue + "'," +
            "[s_class_id]='"+ ddl_edite_sclass.SelectedValue + "'," +
            "[s_about]='"+ txt_edite_about.Text + "'" +
            " where [id]='"+ Session["strid"].ToString()+ "'";
       Int32 iserr= stdfile.UpData(sql);
        //std_proup.Visible = false;



        std_proup.Visible = false;
        ListView1.DataBind();
        if (iserr > 0)
        {
            Response.Write("<script>alert('规范更新完成')</script>");
        }
        else
        {
            Response.Write("<script>alert('写入数据错误')</script>");
        }
    }

    protected void btn_edite_cancel_Click(object sender, EventArgs e)
    {
        std_proup.Visible = false;
    }


    #region
    /// <summary>
    /// 加载表格的下拉列表
    /// </summary>
    /// <param name="ddl"></param>
    /// <param name="app"></param>
    private void ldddl(DropDownList ddl, string app)
    {
        ListItem li;
        if (Application[app] != null)
        {
            BulletedList bl = (BulletedList)Application[app];
            for (int i = 0; i < bl.Items.Count; i++)
            {
                li = new ListItem();
                li.Text = bl.Items[i].Text;
                li.Value = bl.Items[i].Value;
                ddl.Items.Add(li);
            }
        }

    }

    /// <summary>
    /// 加载编辑裂变的下拉列表
    /// </summary>
    /// <param name="ddl"></param>
    /// <param name="app"></param>
    private void ldddl2(DropDownList ddl, string app)
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

    }
    #endregion

}