<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // 在应用程序启动时运行的代码
        To_Server server = new To_Server();
        Application["ddl_class"]=server.GetBulletedList("T_stdfile_class");
        Application["ddl_range"] = server.GetBulletedList("T_stdfile_range");
        Application["ddl_force"] = server.GetBulletedList("T_stdfile_force");
        Application["ddl_user"] = server.GetBulletedList("T_Users",1,0);
        Application["url_class"] = server.GetBulletedList("T_stdfile_class", 2, 3);
        //string str = "select * from T_stdfile_range";
        //System.Data.SqlClient.SqlDataReader reader = server.getreader(str);
        //if(reader != null) {
        //    while (reader.Read())
        //    {
        //        item = new ListItem();
        //        item.Text = reader["range"].ToString();
        //        item.Value = reader["rag_id"].ToString();
        //        bul.Items.Add(item);
        //    }
        //    server.CloseCon();

        //}
    }

    void Application_End(object sender, EventArgs e)
    {
        //  在应用程序关闭时运行的代码

    }

    void Application_Error(object sender, EventArgs e)
    {
        // 在出现未处理的错误时运行的代码

    }

    void Session_Start(object sender, EventArgs e)
    {
        // 在新会话启动时运行的代码

    }

    void Session_End(object sender, EventArgs e)
    {
        // 在会话结束时运行的代码。 
        // 注意: 只有在 Web.config 文件中的 sessionstate 模式设置为
        // InProc 时，才会引发 Session_End 事件。如果会话模式设置为 StateServer
        // 或 SQLServer，则不引发该事件。

    }

</script>
