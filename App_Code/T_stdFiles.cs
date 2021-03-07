using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// strarderdFiles 规范文件类
/// </summary>
public class T_stdFile
{
    //规范类属性
    public string s_name { get; set; }//规范名称
    public string s_index { get; set; }//规范代号
    public DateTime s_releasedate { get; set; }//发布日期
    public DateTime s_effcetdate { get; set; }//实施日期
    public string s_about { get; set; }//规范简介
    //public string s_keyword { get; set; }//关键词

    //枚举类字段  
    public string s_range_id { get; set; }//范围
    public string s_force_id { get; set; }//效力
    public string s_class_id { get; set; }//类型

    //文件类字段
    public int id { get; set; }//文件索引
    public double f_size{ get; set; } //文件大小
    public int f_downnum { get; set; }//下载次数
    public string f_name { get; set; }//文件名称
    public Int32 f_path_id { get; set; }//文件路径
    public int f_order { get; set; }//排序
    public Boolean f_enable { get; set; }//启用
    public DateTime f_update { get; set; }//上传日期
    public int f_upuser_id { get; set; }//上传用户
    public Boolean f_delete { get; set; }
    //private s_objcet s_object;//对象

    //枚举类声明
    public enum s_Range
    {
        国际标准 =1,
        国家标准,
        地方标准,
        行业标准,
        企业标准
    }//规范范围
    public enum s_Force
    {
        强制标准=1,
        推荐标准
    }//规范效力
    public enum s_Class
    {
        试验方法 =1,
        试验规程,
        验收标准,
        施工规范,
        技术规程,
        设计规范,
       
    } //规范类型
    public enum s_objcet
    {
        水 =1,
        水泥混凝土,
        沥青混泥土,
        水泥,
        粉煤灰,
        硅灰,
        石灰,
        细骨料,
        粗骨料,
        仪器设备,
        配合比,
        岩石,
        钢筋,
        公路,
        铁路,
        外加剂,
        防水材料,
        支座砂浆,
        压浆料,
        垫石
    }//面向对象

 
    /// <summary>
    /// 返回一个规范文件对象
    /// </summary>
    /// <param name="StdFile"></param>
    /// <returns></returns>
    public T_stdFile GetStdFile(T_stdFile StdFile)
    {
        To_Server server = new To_Server();
        StdFile = server.Servers<T_stdFile>(StdFile.id.ToString());

        //StdFile = server.Server(StdFile);
        return StdFile;
    }

    public Int32 UpData(string sql)
    {
        Int32 iss;
        To_Server ser = new To_Server();
        iss=ser.UpDate(sql);
        return iss;
    } 

}