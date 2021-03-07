<%@ Page Title="" Language="C#" MasterPageFile="~/sonMasterPage.master" AutoEventWireup="true" CodeFile="userDefault.aspx.cs" Inherits="Users_Default" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style/userStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--标题栏--%>
    <div class="usertitle">
        <h1>工地试验专项解决方案</h1>
    </div>

    <%--userslongding--%>
    <div class="userlongding">
        <div class="user">
            <asp:Label ID="Label1" runat="server" Text="用 户："></asp:Label>
            <input id="lduser" type="text" placeholder="请输入用户名" runat="server" />
        </div>
        <div class="pwd">
           <asp:Label ID="Label2" runat="server" Text="密 码："></asp:Label>
            <input id="ldpwd" type="password" placeholder="请输入用户密码" runat="server"  />
        </div>
        <div class="err">
            <asp:Label ID="l_err" runat="server" Text="用户名或密码错误！" Visible="False" CssClass="validator"></asp:Label>
        </div>
        <div class="button">
            <asp:Button ID="londoing" runat="server" Text="登 &nbsp; &nbsp; 录" OnClick="londoing_Click" />
        </div>
        <div class="link">
            <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <%--用户注册弹出层--%>
                    <input id="btn_newuser" type="button" runat="server" value="注  册" class="fl" style="height:20px; width:80px;margin:20px; font-size:10px;" />
                    <asp:ModalPopupExtender ID="Button1_ModalPopupExtender" runat="server" DynamicServicePath="" CancelControlID="btn_cancel" 
                        Enabled="True" TargetControlID="btn_newuser" PopupControlID="newuser_popup" BackgroundCssClass="user_popupback">
                    </asp:ModalPopupExtender>
                    <asp:Panel ID="newuser_popup" runat="server">
                        <div class="div_newuser_style">
                            <h2>用户信息编辑栏</h2>

                            <%--用户名称--%>
                            <div>
                                <asp:Label ID="Label3" runat="server" Text="用户名称："></asp:Label>
                                <asp:TextBox ID="txt_newuser_user" runat="server"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validator" Font-Size="12pt"  ValidationGroup="newuser"
                                    ErrorMessage="*用户名不能为空" ControlToValidate="txt_newuser_user" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                            </div>

                            <%--网络名称--%>
                            <div>
                                <asp:Label ID="Label4" runat="server" Text="网络名称："></asp:Label>
                                <asp:TextBox ID="txt_newuser_name" runat="server"></asp:TextBox><br />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="validator" Font-Size="12pt" ValidationGroup="newuser"
                                    ErrorMessage="*网络名称不能为空" ControlToValidate="txt_newuser_name" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                            </div>

                            <%--用户密码--%>
                            <div>
                                <asp:Label ID="Label5" runat="server" Text="用户密码："></asp:Label>
                                <asp:TextBox ID="txt_newuser_pwd" runat="server" TextMode="Password"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="validator" Font-Size="12pt" ValidationGroup="newuser"
                                    ErrorMessage="*用户密码不能为空" ControlToValidate="txt_newuser_pwd" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                <br />
                                <asp:Label ID="Label6" runat="server" Text="确认密码："></asp:Label>
                                <asp:TextBox ID="txt_newuser_enterpwd" runat="server" TextMode="Password"></asp:TextBox><br />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*用户密码不能为空" Font-Size="12pt" ValidationGroup="newuser"
                                    CssClass="validator" ControlToValidate="txt_newuser_enterpwd" Display="Dynamic" SetFocusOnError="True" ></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*两次密码不一致" CssClass="validator" ValidationGroup="newuser"
                                     ControlToValidate="txt_newuser_enterpwd" ControlToCompare="txt_newuser_pwd" Font-Size="12pt" Operator="Equal" Display="Dynamic" SetFocusOnError="True"></asp:CompareValidator>
                                <br />
                            </div>
                            <asp:Button ID="btn_newuser_enter" runat="server" Text="注  册" Height="28px" ValidationGroup="newuser" OnClick="btn_newuser_enter_Click" />
                            <input id="btn_cancel" type="button" value="取消"  style="height:28px"  />
                        </div>
                    </asp:Panel>

                </ContentTemplate>
            </asp:UpdatePanel>

            <a class="fr">忘记密码</a>
        </div>
    </div>
</asp:Content>

