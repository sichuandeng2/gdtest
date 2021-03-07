<%@ Page Title="" Language="C#" MasterPageFile="~/UsersMasterPage.master" AutoEventWireup="true" CodeFile="UsersManage.aspx.cs" Inherits="Users_UsersManage" MaintainScrollPositionOnPostback="true" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style/MainStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--用户管理模块--%>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>

    <div>
        <%--功能区--%>
        <div class="user_func">

        <%--编辑弹出层--%>
        <asp:Panel ID="pl_popup" runat="server" Visible="false" >
        <div id="user_update" class="user_popup">
            <h2>用户信息编辑栏</h2>
            <%--用户名称--%>
            <div>
                <asp:Label ID="Label3" runat="server" Text="用户名称："></asp:Label>
                <asp:TextBox ID="txt_user_user" runat="server"></asp:TextBox>
            </div>
            <%--网络名称--%>
            <div>
                <asp:Label ID="Label2" runat="server" Text="网络名称："></asp:Label>
                <asp:TextBox ID="txt_user_name" runat="server"></asp:TextBox>
            </div>
            <%--用户密码--%>
            <div>
                <asp:Label ID="Label4" runat="server" Text="用户密码："></asp:Label>
                <asp:TextBox ID="txt_user_pwd" runat="server"></asp:TextBox>
            </div>
            <%--用户密码--%>
            <div>
                <asp:Label ID="Label1" runat="server" Text="用户权限："></asp:Label>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="SqlDataSource_admin" 
                    DataTextField="admin" DataValueField="id"></asp:DropDownList>
            </div>

            <%--用户锁定--%>
            <div >
                <asp:Label ID="Label5" runat="server" Text="用户锁定："></asp:Label>
                <asp:CheckBox ID="chk_user_lock" runat="server" Text="用户锁定"  CssClass="user_chk"  />
            </div>
            <%--按钮--%>
            <div>
                <asp:Button ID="btn_user_change" runat="server" Text="确  定" OnClick="btn_user_change_Click" Width="120px" Height="28px" />
                <br /><br />
                <asp:Button ID="btn_user_cancel" runat="server" Text="取  消" OnClick="btn_user_cancel_Click" Width="120px" Height="28px" />
            </div>
        </div>
    </asp:Panel>
        </div>

        <%--表格区域--%>
        <asp:ListView ID="ListView_UsersManage" runat="server" 
            DataSourceID="toconnectionstring" 
            ItemPlaceholderID="item" 
            DataKeyNames="id" OnSelectedIndexChanged="ListView_UsersManage_SelectedIndexChanged">
            <LayoutTemplate>
                <div class="um_head">
                    <div class="user_col">
                        <p class="user_acont fl">账号</p>
                    </div>
                    <div class="user_col">
                        <p class="user_name fl">用户名</p>
                    </div>
                    <div class="user_col">
                        <p class ="user_admin fl">用户权限</p>
                    </div>
                    <div class="user_col">
                        <p class ="user_newdate fl">创建日期</p>
                    </div>
                    <div class="user_col">
                        <p class ="user_lastdate fl">上一次登录</p>
                    </div>
                    <div class="user_col">
                        <p class="user_lock fl">用户锁定</p>
                    </div>
                    <div class="user_col">
                        <p class="user_button fl">功能按钮</p>
                    </div>
                    <div class="clr"></div>   
                </div>
                <div id="item" runat="server"></div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="um_table">
                    <div class="user_col"><p class="user_acont fl"> <%#Eval("user") %></p></div>
                    <div class="user_col"><p class="user_name fl"><%#Eval("name") %></p></div>
                    <div class="user_col"><p class ="user_admin fl"><%#Eval("admin") %></p></div>
                    <div class="user_col"><p class ="user_newdate fl"><%#Eval("newdate","{0:yyyy年MM月dd日}") %></p></div>
                    <div class="user_col"><p class ="user_lastdate fl"><%#Eval("lastdate","{0:yyyy年MM月dd日}") %></p></div>
                    <div class="user_col"><p class="user_lock fl" >

                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%#Eval("lockuser")%>' Enabled="false" Text="用户锁定" />
                    </div>
                     <div class="user_col">
                         <span class="user_button fl">
                            <asp:Button ID="btn_uer_edit" runat="server" Text="编  辑" CommandName='<%#Eval("id") %>' OnCommand="cmd_user_edit" 
                                CommandArgument='<%#Eval("id") %>'/>
                             <asp:Button ID="btn_uer_del" runat="server" Text="删  除" OnCommand="cmd_user_del" CommandArgument='<%#Eval("user") %>'/>
                            </span>
                     </div>
                    <div class="clr"></div>
                </div>
            </ItemTemplate>
            <ItemSeparatorTemplate>
                <hr style="margin:0px;" />
            </ItemSeparatorTemplate>
        </asp:ListView>


        <%-- 数据集 --%>
        <asp:SqlDataSource ID="toconnectionstring" 
            runat="server" 
            ConnectionString="<%$ ConnectionStrings:toconnectionstring %>" 
            SelectCommand="SELECT T_Users.id, T_Users.name, T_Users.[user], T_Users.pwd, T_admin.admin, T_Users.newdate, T_Users.lastdate, T_Users.lockuser, T_Users.admin AS Expr1, T_Users.[order], T_Users.[delete], T_admin.id AS Expr2 FROM T_admin INNER JOIN T_Users ON T_admin.id = T_Users.admin WHERE (T_Users.[delete] = 0)">
        </asp:SqlDataSource>

        <asp:SqlDataSource ID="SqlDataSource_admin" runat="server" ConnectionString="<%$ ConnectionStrings:toconnectionstring %>" 
            SelectCommand="SELECT * FROM [T_admin]"></asp:SqlDataSource>
    </div>
</asp:Content>

