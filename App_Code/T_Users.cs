using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Users 用户类
/// </summary>
public class T_Users
{
    //用户属性
    public Int32 id { get; set; }//索引
    public  string name { get; set; }//用户名称
    public  string user { get; set; }//用户名
    public  string pwd { get; set; }//用户密码
    //public  string img_path { get; set; }//头像图片路径  
    //public  string img_name{ get; set; }//头像图片名称
    public  Boolean lockuser;
    public Int32 admin { get; set; }//用户权限
    public enum Admin
    {
        管理员=1,
        用户=2
    }
    public DateTime newdate { get; set; }
    public DateTime lastdate { get; set; }


    /// <summary>
    /// 用户登录
    /// </summary>
    /// <param name="user">用户类型的对象</param>
    /// <returns>返回登录用户信息</returns>
    public T_Users longding(T_Users user) {

        //访问数据库
        To_Server toserver = new To_Server();
        //user = toserver.Server(user);
        user = toserver.Servers<T_Users>(user.id.ToString());
        return user;
    }

    public T_Users EnterUser(T_Users user)
    {
        To_Server toserver = new To_Server();
        user = toserver.Server(user);
        return user;
    }
    /// <summary>
    /// 用户编辑
    /// </summary>
    /// <param name="sqlstr">相关的sql语句</param>
    public void update (string sqlstr)
    {
        To_Server toserver = new To_Server();
        toserver.UpDate(sqlstr);
    }
    
}