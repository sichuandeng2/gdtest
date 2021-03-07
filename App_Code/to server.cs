using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Reflection;

/// <summary>
/// 连接数据库类
/// </summary>
public class To_Server
{
    private SqlConnection con { get; set; }
    private SqlCommand com { get; set; }
    private SqlDataReader toreader { get; set; }
    private SqlDataAdapter dataAdaper { get; set; }
    private string constr = ConfigurationManager.ConnectionStrings["toconnectionstring"].ConnectionString;
    private string comstr;

    /// <summary>
    /// 打开数据库
    /// </summary>
    public To_Server()
    {
        con = new SqlConnection(constr);
    }

    /// <summary>
    /// 连接数据库
    /// </summary>
    /// <param name="Server">服务器名称</param>
    /// <param name="DataBase">数据库名称</param>
    public To_Server(string Server, string DataBase)
    {
        string Datastr = "Data Source=" + Server + ";Initial Catalog=" + DataBase + ";User ID=sa;Password=jerry";
        con = new SqlConnection(Datastr);
    }

    /// <summary>
    /// 数据更新
    /// </summary>
    /// <param name="sqlstr">sql语句</param>
    public Int32 UpDate(string sqlstr)
    {
        int i=0;
        try
        {
            con.Open();
            com = new SqlCommand(sqlstr, con);
            i= com.ExecuteNonQuery();
        }
        catch (Exception d)
        {
            string t = d.Message;
        }
        finally
        {
            con.Close();
        }
        return i;
    }

    /// <summary>
    /// 登录方法
    /// </summary>
    /// <param name="lduser">登录用户</param>
    /// <returns>返回用户结果</returns>
    public T_Users Server(T_Users lduser)
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
        comstr = "select * from T_Users where [user]='" + lduser.user + "'";
        try
        {
            con.Open();
            com = new SqlCommand(comstr, con);
            SqlDataReader toreader = com.ExecuteReader();
            if (toreader.Read())
            {
                lduser.pwd = (string)toreader["pwd"];
                lduser.name = (string)toreader["name"];
                lduser.lockuser = (Boolean)toreader["lockuser"];
                int dd = (int)toreader["admin"];
                lduser.admin = (int)toreader["admin"];
                //lduser.img_name = (string)toreader["img_name"];
                //lduser.img_path = (string)toreader["img_path"];
                //lduser.index = (Int32)toreader["index"];

            }
            else {
                lduser = null;
            }
            con.Close();
        }
        catch (Exception d)
        {
            string t = d.Message;
            lduser = null;
        }
        finally
        {
            con.Close();
        }
        return lduser;
    }

    /// <summary>
    /// 用于获取规范文件
    /// </summary>
    /// <param name="stdfile"></param>
    /// <returns></returns>
    public T_stdFile Server(T_stdFile stdfile)
    {
        comstr = "select * from T_stdFile where [id]='" + stdfile.id + "'";
        try
        {
            con.Open();
            com = new SqlCommand(comstr, con);
            SqlDataReader toreader = com.ExecuteReader();
            if (toreader.Read())
            {
                //Type t = stdfile.GetType();
                //PropertyInfo[] Oinfo = t.GetProperties();
                //foreach (var itme in t.GetProperties().)
                //{

                //}
               Object d= toreader["f_size"];
                stdfile.f_downnum = (int)toreader["f_downnum"];
                stdfile.f_enable = (Boolean)toreader["f_enable"];
                stdfile.f_name = (String)toreader["f_name"];
                stdfile.f_order = (Int32)toreader["f_order"];
                //stdfile.f_path = (String)toreader["f_path"];
                stdfile.f_size =float.Parse( toreader["f_size"].ToString());
                stdfile.f_update = (DateTime)toreader["f_update"];
                stdfile.f_upuser_id = (Int32)toreader["f_upuser_id"];
                stdfile.s_about = (String)toreader["s_about"];
                stdfile.s_class_id = toreader["s_class_id"].ToString();
                stdfile.s_effcetdate = (DateTime)toreader["s_effcetdate"];
                stdfile.s_force_id = toreader["s_force_id"].ToString();
                stdfile.s_index = (String)toreader["s_index"];
                stdfile.s_name = (String)toreader["s_name"];
                stdfile.s_range_id = toreader["s_range_id"].ToString();
                stdfile.s_releasedate = (DateTime)toreader["s_releasedate"];
                stdfile.s_index = (String)toreader["s_index"];
                stdfile.f_path_id = (Int32)toreader["f_path_id"];
                stdfile.id= (Int32)toreader["id"];
                stdfile.f_delete = (Boolean)toreader["f_delete"];
            }
            else
            {
                stdfile = null;
            }
        }
        catch (Exception d)
        {
            string t = d.Message;
            stdfile = null;
        }
        finally
        {
            //toreader.Close();
            con.Close();
        }
       
        return stdfile;
    }

    public T Servers<T>(string key )
    {
        
        Type otype = typeof(T);
        string TableName = otype.Name;
        string col = string.Join(",", otype.GetProperties().Select(p => string.Format("[{0}]", p.Name)));
        string sqlstr = string.Format("select {0} from [{1}] where id={2}",col,TableName,key);

        T oObject =(T) Activator.CreateInstance(otype);
        try
        {
            con.Open();
            com = new SqlCommand(sqlstr, con);
            SqlDataReader reader = com.ExecuteReader();
            if (reader.Read())
            {
                foreach (var item in otype.GetProperties())
                {
                    string n = item.Name;
                    item.SetValue(oObject, reader[n], null);
                }
            }
            con.Close();
        }
        catch (Exception)
        {

            throw;
        }


        return oObject;
    }
    /// <summary>
    /// 获取数据只读数据集
    /// </summary>
    /// <param name="sqlstr">sql语句</param>
    /// <returns></returns>
    public SqlDataReader GetReader(string sqlstr)
    {
        try
        {
            con.Open();
            com = new SqlCommand(sqlstr, con);
            toreader = com.ExecuteReader();
        }
        catch (Exception e)
        {
            e.ToString();
            toreader = null;
            con.Close();
        }
        return toreader;
    }

    /// <summary>
    /// 关闭连接数据
    /// </summary>
    public void CloseCon()
    {
        con.Close();
    }

    /// <summary>
    /// 获取BulletedList数据集
    /// </summary>
    /// <param name="TableName">请输入表名</param>
    /// <param name="Text">要显示的字段</param>
    /// <param name="Value">值字段</param>
    /// <returns></returns>
    public BulletedList GetBulletedList(string TableName,Int32 Text=2,Int32 Value=1)
    {
        ListItem item;
        BulletedList bulletedList = new BulletedList();
        string sqlstr = "select * from "+ TableName;
        try
        {
            con.Open();
            com = new SqlCommand(sqlstr, con);
            toreader = com.ExecuteReader();
            while (toreader.Read())
            {
                item = new ListItem();
                item.Value = toreader.GetValue(Value).ToString();
                item.Text = toreader.GetValue(Text).ToString();
                bulletedList.Items.Add(item);
            }
        }
        catch
        {
            bulletedList = null;
            con.Close();
        }
        finally
        {
            con.Close();
        }
        return bulletedList;
    }

    /// <summary>
    /// 获取数据表
    /// </summary>
    /// <param name="TableName"></param>
    /// <returns></returns>
    public Table GetTable(string TableName)
    {
        System.Data.DataSet dataset = new System.Data.DataSet();
        Table NewTable=null;
        

        string sqlstr = "select * from "+TableName;
        try
        {
            con.Open();
            dataAdaper.Fill(dataset, TableName);


            con.Close();
        }
        catch (Exception)
        {
            con.Close();
            throw;
        }
        return NewTable;
    }

    /// <summary>
    /// 获取数据值
    /// </summary>
    /// <param name="TableName">数据表名称</param>
    /// <param name="ColNname">设定的数据列名</param>
    /// <param name="ColValue">设定的数据值</param>
    /// <param name="GetCol">要获取的列数</param>
    /// <returns></returns>
    public object GetValue(string TableName, string ColNname, string ColValue, int GetCol)
    {
        object obj = null;
        string sql = "select* from "+ TableName + " where ["+ ColNname + "] = '"+ ColValue + "'";

        try
        {
            con.Open();
            com = new SqlCommand(sql,con);
            toreader = com.ExecuteReader();
            if (toreader.Read())
            {
                obj = toreader.GetValue(GetCol);
            }
            con.Close();
        }
        catch
        {
            con.Close();
        }
        return obj;
    }
}