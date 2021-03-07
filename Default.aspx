<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="test_Default" %>

<%--功能展示模块--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%--规范管理模块 --%>
<%--    <div class="sonmode">
        <h2>规范文件管理系统</h2>
        <p>规范下载&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;规范发布</p>
        <p></p>
        <img src="../img/ht.gif" />
    </div>--%>

     <%--试验方法模块 --%>
<%--    <div class="sonmode">
        <h2>试验检测工作方法管理</h2>
        <p>试验步骤共享&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;试验方法评价</p>
        <p>试验步骤注意事项&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             </p>
        <img src="../img/ht.gif" />
    </div>--%>

     <%--试验数据管理模块--%>
<%--    <div class="sonmode">
        <h2>工作中的试验检测数据管理系统</h2>
        <p>试验用空记录表模板&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;试验数据记录表</p>
        <p>保存的试验数据&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;             </p>
        <img src="../img/ht.gif" />
    </div>--%>
</asp:Content>

<%--功能实现模块 --%>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <div class="function">
        <div class="functionItme fl">
            <img src="../img/gb.gif" /><br />
                <div><a href="../StrarderdFiles/newStrarderdFile.aspx">规范发布</a></div>
                <div><a href="../StrarderdFiles/defaultStrarderd.aspx">规范下载</a></div>
                <div><a href="../Users/StrarderdFilesManage.aspx">规范管理</a></div>
        </div>
        <div class="functionItme fl">
            <img src="../img/gb.gif" />
                <div><a>试验查询</a></div>
                <div><a>试验管理</a></div>
                <div><a>试验分析</a></div>
        </div>
        <div class="functionItme fl">
            <img src="../img/gb.gif" />
                <div><a>资料下载</a></div>
                <div><a>试验保存</a></div>
                <div><a>试验打印</a></div>
        </div>
        <%--<div class="clr"></div>--%>
    </div>
</asp:Content>

