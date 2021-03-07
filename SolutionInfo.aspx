<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SolutionInfo.aspx.cs" Inherits="SolutionInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>关于该方案</title>
    <link href="../style/starderdFilesStyle.css" rel="stylesheet" />
    <link href="style/MainStyle.css" rel="stylesheet" />
    <script src="script/users.js"></script>
    <style type="text/css">
        .div_info {
            margin-left:100px;
            font-size:16px;
        }
        .div_info p {
            margin:2px auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>

        <%-- 标题区 --%>
        <div class="stdfile_titles" id="stdfile_titles">
            <div class="fileTitle" onclick="clicktitle(this)">
                <asp:Image cssclass="fl" ID="Image1" runat="server" ImageUrl="~/img/logo.ico" />
                <h1 class="fl">工地试验室专项解决方案</h1>
            </div>
        </div>
        <div class="clr"></div>

        <%--方案简介--%>
        <div class="div_info">
            <p>项目名称：工地试验室专项解决方案</p>
            <p>方案简介：为了提高工地试验室试验检测工作的专业性和速度；</p>
            <p>面向问题：解决工地试验试验过程中遇到的试验方法多、试验标准多、仪器设备多、龄期管理复杂等相关技术问题；</p>
            <p>功能模块：规范管理、试验管理、仪器管理、数据管理、人员管理；</p>
            <p>研发平台：Asp.Net/.Net Framework 4.0 、C#、HTML5、JavaScript、jQuery1.9.1、CSS3.0；</p>
            <p>设计日期：2020年1月6日；</p>
            <p>研发日期：2020年1月10日；</p>
            <p>研发人员：四海联盟——北辰星拱ギ；</p>

            <p>内侧日期：</p>
            <p>公测日期：</p>
            <p>发布日期：</p>
            <p>最后修改：</p>
        </div>
        <%--返回首页--%>
        <div style="font-size:20px; width:120px; margin:16px auto;">
            <a href="Default.aspx" >点击返回首页</a>
        </div>

    </div>
    </form>
</body>
</html>
