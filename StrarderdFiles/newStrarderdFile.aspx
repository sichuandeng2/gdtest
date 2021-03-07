<%@ Page Title="" Language="C#" MasterPageFile="~/sonMasterPage.master" AutoEventWireup="true" CodeFile="newStrarderdFile.aspx.cs" Inherits="StrarderdFiles_newStrarderdFile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style/searchStarderdStyle.css" rel="stylesheet" />
    <script src="../script/users.js"></script>
    <script src="../script/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $("#ContentPlaceHolder1_txt_stdfile_release").attr("readonly", "readonly");
            $("#ContentPlaceHolder1_txt_stdfile_effect").attr("readonly", "readonly");
            $("#ContentPlaceHolder1_fileupl_stdfile_file").val("");
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%-- 标题区 --%>
    <div>
        <div class="filesTitle" onclick="clicktitle()">
            <asp:Image cssclass="fl" ID="Image1" runat="server" ImageUrl="~/img/logo.ico"  />
            <h1 class="fl">工地试验室专项解决方案</h1>
        </div>
    </div>
    <div class="clr"></div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <%--新增内容区--%>
    <div class="content">
        <table style="width: 75%;margin:20px auto;">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="规范名称："></asp:Label>
                    <asp:TextBox ID="txt_stdfile_name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*规范名称不能为空"
                        ControlToValidate="txt_stdfile_name" CssClass="Validators" Font-Size="12px" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="规范代号："></asp:Label>
                    <asp:TextBox ID="txt_stdfile_index" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*规范代号不能为空"
                         ControlToValidate="txt_stdfile_index" CssClass="Validators" Font-Size="12px" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="规范范围："></asp:Label>
                    <asp:DropDownList ID="drl_stdfile_range" runat="server" 
                        DataSourceID="SqlDataSourcetoitems" 
                        DataTextField="range" 
                        DataValueField="rag_value"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcetoitems" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:toconnectionstring %>" SelectCommand="SELECT * FROM [T_stdfile_range]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="Label4" runat="server" Text="规范效力："></asp:Label>
                    <asp:DropDownList ID="drl_stdfile_force" runat="server" DataSourceID="SqlDataSourcetoforce" 
                        DataTextField="force" DataValueField="for_value"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcetoforce" runat="server" ConnectionString="<%$ ConnectionStrings:toconnectionstring %>" SelectCommand="SELECT * FROM [T_stdfile_force]"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" Text="发布日期："></asp:Label>
                    <asp:TextBox ID="txt_stdfile_release" runat="server" ReadOnly="false"></asp:TextBox>

                    <asp:CalendarExtender ID="txt_stdfile_release_CalendarExtender" Format="yyyy年MM月dd日" 
                        runat="server" Enabled="True" TargetControlID="txt_stdfile_release">
                    </asp:CalendarExtender>

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*发布日期不能为空"
                         ControlToValidate="txt_stdfile_release" CssClass="Validators" Font-Size="12px" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
               
                <td>
                    <asp:Label ID="Label6" runat="server" Text="实施日期："></asp:Label>
                    <asp:TextBox ID="txt_stdfile_effect" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="txt_stdfile_effect_CalendarExtender" runat="server" 
                        Format="yyyy年MM月dd日" Enabled="True" TargetControlID="txt_stdfile_effect">
                    </asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*实施日期不能为空"
                         ControlToValidate="txt_stdfile_effect" CssClass="Validators" Font-Size="12px" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label7" runat="server" Text="规范分类："></asp:Label>
                    <asp:DropDownList ID="drl_stdfile_class" runat="server" DataSourceID="SqlDataSourcetoclass" 
                        DataTextField="class" DataValueField="cla_value"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSourcetoclass" runat="server" ConnectionString="<%$ ConnectionStrings:toconnectionstring %>" SelectCommand="SELECT * FROM [T_stdfile_class]"></asp:SqlDataSource>
                </td>
                <td>
                    <asp:Label ID="Label8" runat="server" Text="面向对象：" CssClass="fl"></asp:Label>
                    <asp:CheckBoxList ID="drl_stdfile_object" runat="server" CssClass="fl"></asp:CheckBoxList>
                </td>
            </tr>
            <tr >
                <td >
                    <asp:Label ID="Label9" runat="server" Text="规范简介：" CssClass="fl"></asp:Label>
                    <asp:TextBox ID="txt_stdfile_about" runat="server" Rows="10" style="margin-bottom: 0px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="*规范简介不能为空"
                         ControlToValidate="txt_stdfile_about" CssClass="Validators" Font-Size="12px" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
                <td >
                    <asp:Label ID="Label10" runat="server" Text="关键词：" CssClass="fl"></asp:Label>
                    <asp:TextBox ID="txt_stdfile_keyword" runat="server" Rows="10" style="margin-bottom: 0px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label11" runat="server" Text="图例：" Visible="False"></asp:Label>
                    <asp:FileUpload ID="fileupl_stdfile_image" runat="server" Visible="False" />
                </td>
                <td>
                    <asp:Label ID="Label12" runat="server" Text="文件上传：" ></asp:Label>
                    <asp:FileUpload ID="fileupl_stdfile_file" runat="server" onchange="checkSize(this)" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="*上传文件不能为空"
                         ControlToValidate="fileupl_stdfile_file" CssClass="Validators" Font-Size="12px" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>

    </div>

    <%--按钮区--%>
    <div class="buttons">
        <asp:Button ID="btn_stdfile_release" runat="server" Text="发布新规范到站点" OnClick="btn_stdfile_release_Click" />
    </div>

</asp:Content>

