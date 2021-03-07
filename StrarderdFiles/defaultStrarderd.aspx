<%@ Page Title="" Language="C#" MasterPageFile="~/sonMasterPage.master" AutoEventWireup="true" CodeFile="defaultStrarderd.aspx.cs" 
    Inherits="StrarderdFiles_defaultStrarderd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style/starderdFilesStyle.css" rel="stylesheet" />
    <script src="../script/users.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <%-- 标题区 --%>
    <div class="stdfile_titles" id="stdfile_titles">
        <div class="fileTitle" onclick="clicktitle(this)">
            <asp:Image cssclass="fl" ID="Image1" runat="server" ImageUrl="~/img/logo.ico" />
            <h1 class="fl">工地试验室专项解决方案</h1>
        </div>
    </div>
    <div class="clr"></div>

    <%-- 搜索区 --%>
   <div class="div_search">
       <input id="Text_Search" type="text" placeholder="请输入规范名称或者规范代号" runat="server"/>
            <asp:Button ID="Button_seatch" runat="server" Text="搜    索" Height="31px" Width="125px" Font-Names="微软雅黑" OnClick="Button_seatch_Click" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*搜索内容不能为空"   Font-Size="12px" ForeColor="Red" SetFocusOnError="true"
        ControlToValidate="Text_Search" Display="Dynamic"></asp:RequiredFieldValidator>

   </div>
   
    <%-- 类别区 --%>
    <div id="link" runat="server" class="link">
        <%--<div class="clr"></div>--%>
    </div>

   <%-- 按钮区 --%>
    <div class="buttons">
        <asp:Button ID="Button_load" CssClass="button fl" runat="server" Text="我要上传规范到站点" OnClick="Button_load_Click" /> 
        <div id="mid" class="fl"></div>
        <asp:Button ID="Button_new"  CssClass="button fl" runat="server" Text="前往工标网查询最新标准" OnClick="Button_new_Click" /> 
    </div>
    <div class="clr"></div>
</asp:Content>

