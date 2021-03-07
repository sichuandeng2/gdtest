using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Users_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void londoing_Click(object sender, EventArgs e)
    {
        //获取用户信息
        T_Users User = new T_Users();
        User.user = lduser.Value;
        User.pwd = ldpwd.Value;

        User=User.EnterUser(User);
        if (User!=null)
        {
            if (User.pwd == ldpwd.Value)
            {
                Session["user"] = User;
                if (Session["url"] != null)
                {
                    Response.Redirect(Session["url"].ToString());
                    Session.Remove("url");
                }

                Response.Redirect("../Users/StrarderdFilesManage.aspx");
            }
            else
            {
                l_err.Visible = true;
            }

        }

    }
    /// <summary>
    /// 创建新用户
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_newuser_enter_Click(object sender, EventArgs e)
    {
        //实例化对象
        T_Users newuser = new T_Users();
        newuser.name = txt_newuser_name.Text;
        newuser.user = txt_newuser_user.Text;
        newuser.pwd = txt_newuser_pwd.Text;
        newuser.lastdate= newuser.newdate = DateTime.Today;
        newuser.admin = newuser.admin;
        newuser.lockuser = true;
        string sqlstr = "insert into T_users([user],[name],[pwd],[newdate],[lastdate],[lockuser],[admin],[order],[delete])values('"+
                                     newuser.user+"','"+newuser.name+"','"+newuser.pwd+"','"+newuser.newdate+"','"+newuser.lastdate+"',1,2,9999,0)";
       newuser.update(sqlstr);

    }
}