using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_UsersManage : System.Web.UI.Page
{
    T_Users myuser = new T_Users();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    /// <summary>
    /// 用户编辑方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_uer_edit_Click(object sender, EventArgs e)
    {
        int t = ListView_UsersManage.SelectedIndex;
        ListView_UsersManage.SelectedIndex = t;
    }
    /// <summary>
    /// 编辑命令行方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void cmd_user_edit(object sender, CommandEventArgs e)
    {     
        myuser.id =int.Parse( e.CommandName);
        myuser = myuser.longding(myuser);

        txt_user_user.Enabled = false;
        txt_user_user.Text =myuser.user;
        txt_user_name.Text = myuser.name;
        chk_user_lock.Checked = myuser.lockuser;
        txt_user_pwd.Text = myuser.pwd;
        DropDownList2.SelectedValue =((Int32)myuser.admin).ToString();
        pl_popup.Visible = true;
    }
    /// <summary>
    /// 标记删除命令行方法
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void cmd_user_del(object sender, CommandEventArgs e)
    {
        string sqlstr = "update T_Users set [delete]='true' where([user]='"+e.CommandArgument+"')";
        myuser.update(sqlstr);
        ListView_UsersManage.DataBind();
    }

    /// <summary>
    /// 用户保存
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_user_change_Click(object sender, EventArgs e)
    {
        pl_popup.Visible = false;
        string sqlstr = "update T_users set [name]='" + 
            txt_user_name.Text + 
            "', [pwd]='"+txt_user_pwd.Text+
            "', [lockuser]='"+chk_user_lock.Checked+
            "', [admin]='"+DropDownList2.SelectedIndex+1+
            "' where [user]='"+txt_user_user.Text+"'";
        myuser.update(sqlstr);
        txt_user_user.Text = txt_user_pwd.Text = txt_user_name.Text = "";
        ListView_UsersManage.DataBind();
    }

    protected void ListView_UsersManage_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 用户取消
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_user_cancel_Click(object sender, EventArgs e)
    {
        pl_popup.Visible = false;
    }
}