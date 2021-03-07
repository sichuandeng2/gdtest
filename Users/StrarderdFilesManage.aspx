<%@ Page Title="" Language="C#" MasterPageFile="~/UsersMasterPage.master" AutoEventWireup="true" CodeFile="StrarderdFilesManage.aspx.cs" Inherits="Users_StrarderdFilesManage" MaintainScrollPositionOnPostback="true" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style/userStyle.css" rel="stylesheet" />
    <script>
        function cancel() {
            document.getElementById("ContentPlaceHolder1_std_proup").style.display = "none";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <%--规范管理页--%>
    <div>
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
            <%--筛选区--%>
            <asp:Panel ID="Panel1" CssClass="selects" runat="server">
                规范范围：<asp:DropDownList ID="ddl_range" runat="server" AutoPostBack ="true"></asp:DropDownList>
                规范类别：<asp:DropDownList ID="ddl_class" runat="server" AutoPostBack="true"></asp:DropDownList>
                规范效力：<asp:DropDownList ID="ddl_force" runat="server" AutoPostBack="true"></asp:DropDownList>
                搜索：<asp:TextBox ID="txt_sfm_search" runat="server" CssClass="txt_sfm_search"></asp:TextBox>
                <asp:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" runat="server" Enabled="True" 
                    TargetControlID="txt_sfm_search" WatermarkText="请输入规范名称或者规范代号" WatermarkCssClass="selected" >
                </asp:TextBoxWatermarkExtender>
            </asp:Panel>
            <%--表格区--%>
            <asp:Panel ID="Panel2" runat="server">
                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSourcetostdfiles" ItemPlaceholderID="items">
                    <LayoutTemplate>
                        <div class="stdFile_head">
                            <div class="fl stdFile_s_index">规范代号</div>
                            <div class="fl stdFile_s_name">规范名称</div>
                            <div class="fl stdFile_f_size">文件大小</div>
                            <div class="fl stdFile_force">文件效力</div>
                            <div class="fl stdFile_range">使用范围</div>
                            <div class="fl stdFile_class">文件类型</div>
                            <div class="fl stdFile_f_update">上传日期</div>
                            <div class="fl stdFile_user">上传用户</div>
                            <div class="stdFile_btn fl">操作</div>
                            <div class="clr"></div>
                        </div>
                        <div id="items" runat="server"></div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="stdFile_body">
                            <div class="fl stdFile_s_index"><%#Eval("s_index")%></div>
                            <div class="fl stdFile_s_name"><%#Eval("s_name")%></div>
                            <div class="fl stdFile_f_size"><%#Eval("f_size","{0:n1}M")%></div>
                            <div class="fl stdFile_force"><%#Eval("force")%></div>
                            <div class="fl stdFile_range"><%#Eval("range")%></div>
                            <div class="fl stdFile_class"><%#Eval("class")%></div>
                            <div class="fl stdFile_f_update"><%#Eval("f_update","{0:yyyy-MM-dd}")%></div>
                            <div class="fl stdFile_user"><%#Eval("[user]")%></div>
                            <div class="stdFile_btn fl">
                                <asp:Button ID="stdfile_edit" runat="server" Text="编  辑" OnCommand="stdFile_edit" CommandArgument='<%#Eval("id") %>' />
                            </div>
                            <div class="clr"></div>
                        </div>
                    </ItemTemplate>
                    <ItemSeparatorTemplate>
                        <%--<hr class="hr" />--%>
                    </ItemSeparatorTemplate>
                    <EmptyDataTemplate>
                        <div class="EmptyData">
                            <h1>未找到该项数据文件</h1>
                        </div>
                    </EmptyDataTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourcetostdfiles" runat="server" ConnectionString="<%$ ConnectionStrings:toconnectionstring %>" 
                    SelectCommand="SELECT T_stdFile.id,
                        T_stdFile.s_index, T_stdFile.s_name, 
                    T_stdfile_force.force, T_stdfile_range.range, 
                    T_stdfile_class.class, T_Users.[user], 
                    T_stdFile.f_update, T_stdFile.f_downnum, 
                    T_stdFile.s_effcetdate, T_stdFile.s_releasedate, 
                    T_stdFile.f_upuser_id, T_stdFile.s_about, 
                    T_stdFile.s_range_id, T_stdFile.s_force_id, 
                    T_stdFile.s_class_id, T_stdFile.f_name, 
                    T_stdFile.f_size, T_stdFile.f_enable, 
                    T_stdFile.f_order, T_stdFile.f_delete, 
                    T_stdfile_class.cla_value, T_stdfile_force.for_value, 
                    T_stdfile_range.rag_value 
                    FROM T_stdFile 
                    INNER JOIN T_stdfile_class ON T_stdFile.s_class_id = T_stdfile_class.cla_value 
                    INNER JOIN T_stdfile_force ON T_stdFile.s_force_id = T_stdfile_force.for_value 
                    INNER JOIN T_stdfile_range ON T_stdFile.s_range_id = T_stdfile_range.rag_value 
                    INNER JOIN T_Users ON T_stdFile.f_upuser_id = T_Users.id 
                    WHERE (T_stdFile.f_delete = 0) 
                    AND (T_stdFile.f_enable = 1) 
                    AND (T_stdFile.s_range_id LIKE '%' + @ddl_range + '%') 
                    AND (T_stdFile.s_class_id LIKE '%' + @ddl_class + '%') 
                    AND (T_stdFile.s_force_id LIKE '%' + @ddl_force + '%')">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddl_range" DefaultValue="[^0]" Name="ddl_range" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddl_class" DefaultValue="[^0]" Name="ddl_class" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="ddl_force" DefaultValue="[^0]" Name="ddl_force" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:Panel>
            <%--弹出层--%>
            <asp:Panel ID="std_proup" runat="server" CssClass="stdFile_proup" Visible="false">
                <h2>规范管理文件编辑</h2>
                <div class="fl">
                    规范名称：<asp:TextBox ID="txt__edite_sname" runat="server"></asp:TextBox><br />
                    规范类型：<asp:DropDownList ID="ddl_edite_sclass" runat="server"></asp:DropDownList><br />
                    发布日期：<asp:TextBox ID="txt_edites_release" runat="server"></asp:TextBox><br />
                    文件名称：<asp:TextBox ID="txt_edites_fname" runat="server"></asp:TextBox><br />
                    上传日期：<asp:TextBox ID="txt_edites_fupdate" runat="server"></asp:TextBox><br />
                    显示序号 ：<asp:TextBox ID="txt_edite_order" runat="server"></asp:TextBox><br />
                    规范删除：<asp:CheckBox ID="ccb_edite_delete" runat="server" /><br />
                </div>
                <div class ="fr">
                    规范代号：<asp:TextBox ID="txt__edite_sindex" runat="server"></asp:TextBox><br />
                    规范范围：<asp:DropDownList ID="ddl_edite_range" runat="server"></asp:DropDownList><br />
                    规范效力：<asp:DropDownList ID="ddl_edite_force" runat="server"></asp:DropDownList><br />
                    规范大小：<asp:TextBox ID="txt_edite_fsize" runat="server"></asp:TextBox><br />
                    实施日期：<asp:TextBox ID="txt_edite_effcetdate" runat="server"></asp:TextBox><br />
                    上传用户：<asp:DropDownList ID="ddl_edite_user" runat="server"></asp:DropDownList><br />
                    规范启用：<asp:CheckBox ID="ccb_edite_enable" runat="server" /><br />
                </div>
                <div class="clr"></div>

                关于规范：<asp:TextBox ID="txt_edite_about" runat="server" TextMode="MultiLine" Width="500px" 
                    Height="100px" ></asp:TextBox><br />

                <asp:Button ID="btn_edite_save" runat="server" Text="保存" OnClick="btn_edite_save_Click" Width="100px" Height="26px" />
                <%--<asp:Button ID="btn_edite_cancel" runat="server" Text="取消" OnClick="btn_edite_cancel_Click"  OnClientClick="cancel()" Width="100px" Height="26px"/>--%>
                <input id="Button1" type="button" onclick="cancel()" value="取消" style=" Width:100px; Height:26px"  />
            </asp:Panel>
    </div>

</asp:Content>

