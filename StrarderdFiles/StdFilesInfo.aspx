<%@ Page Title="" Language="C#" MasterPageFile="~/sonMasterPage.master" AutoEventWireup="true" CodeFile="StdFilesInfo.aspx.cs" Inherits="StrarderdFiles_StdFilesInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style/starderdFilesStyle.css" rel="stylesheet" />
    <script src="../script/users.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <%-- 标题区 --%>
        <div>
            <div class="filesTitle" onclick="clicktitle()">
                <asp:Image cssclass="fl" ID="Image1" runat="server" ImageUrl="~/img/logo.ico"  />
                <h1 class="fl">工地试验室专项解决方案</h1>
            </div>
        </div>
        <div class="clr"></div>
        <%--表格区域--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="items" DataSourceID="SqlDataSourcetostdfile">
            <LayoutTemplate>
                <div id="items" runat="server"></div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="stdfile">
                    <h2 class="stdfile_name"><%#Eval("lable") %><%#"2" == Eval("for_value").ToString() ? "/T" : ""  %>&nbsp;<%#Eval("s_index")%>-<%#Eval("s_effcetdate","{0:yyyy}") %>&nbsp;&nbsp;《<%#Eval("s_name") %>》</h2>
                    <p class="stdfile_about">文件大小：<%#Eval("f_size") %>M</p>
                    <p class="stdfile_about">当前下载：<%#Eval("f_downnum") %>次</p> 
                    <p class="stdfile_about">文件来源：本文件由用户<%#Eval("user") %>于<%#Eval("f_update","{0:yyyy年MM月dd日}") %>上传</p>
                    <p class="stdfile_about">关于本规范：<%#Eval("s_about") %></p>
                    <iframe width="1000" height="800" src='../PDF.js/web/viewer.html?file=/DataFiles/StdFile/<%#Eval("f_name") %>'>'></iframe>
                    
                        <div class="stdfile_about">
                            规范下载：
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="down_buton">
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:LinkButton ID="LinkButton1" runat="server" Height="24px"
                                            OnCommand="down_click" 
                                            CommandArgument='<%#Eval("pat_path")%>' 
                                            CommandName='<%#Eval("f_name") %>' BorderStyle="Solid" 
                                            BaorderWidth="2px" BackColor="#DDDDDD" BorderColor="#999999"><%#Eval("s_name")%>下载</asp:LinkButton>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSourcetostdfile" runat="server" 
            ConnectionString="<%$ ConnectionStrings:toconnectionstring %>" 
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
                    T_stdfile_range.rag_value ,T_stdfile_range.lable,
                    T_stdfile_path.pat_path
                    FROM T_stdFile 
                    INNER JOIN T_stdfile_class ON T_stdFile.s_class_id = T_stdfile_class.cla_value 
                    INNER JOIN T_stdfile_force ON T_stdFile.s_force_id = T_stdfile_force.for_value 
                    INNER JOIN T_stdfile_range ON T_stdFile.s_range_id = T_stdfile_range.rag_value 
                    INNER JOIN T_stdfile_path ON T_stdFile.f_path_id = T_stdfile_path.pat_id
                    INNER JOIN T_Users ON T_stdFile.f_upuser_id = T_Users.id 
                    WHERE (T_stdFile.f_delete = 0) 
                    AND (T_stdFile.f_enable = 1) 
                    AND (T_stdfile.id = @down)">
            <SelectParameters>
                <asp:QueryStringParameter DefaultValue="27" Name="down" QueryStringField="down" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

