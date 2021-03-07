<%@ Page Title="" Language="C#" MasterPageFile="~/sonMasterPage.master" AutoEventWireup="true" CodeFile="searchStrarderdFile.aspx.cs" 
    Inherits="StrarderdFiles_searchStrarderdFile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../style/searchStarderdStyle.css" rel="stylesheet" />
    <script src="../script/users.js"></script>
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

    <%-- 搜索区 --%>
   <div class="div_Search">
       <input id="Text_Search" type="text" placeholder="请输入规范名称或者规范代号" runat="server" />
       <asp:Button ID="Button_Search" runat="server" Text="搜    索" OnClick="Button_Search_Click" />
       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*搜索内容不能为空"  Font-Size="12px" ForeColor="Red" SetFocusOnError="true"
        ControlToValidate="Text_Search"></asp:RequiredFieldValidator>
   </div>
    
    <%--筛选区--%>
    <div class="div_select">
        <asp:Label ID="Label1" runat="server" Text="级别筛选："></asp:Label>
        <asp:DropDownList ID="DropDownList1" runat="server">
            <asp:ListItem>全部选择</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="Label2" runat="server" Text="类别筛选："></asp:Label>
        <asp:DropDownList ID="DropDownList2" runat="server">
            <asp:ListItem>全部选择</asp:ListItem>
        </asp:DropDownList>
    </div>

    <%--结果区--%>
    <div class="resual">    
        <asp:ListView ID="ListView1" runat="server" ItemPlaceholderID="items" DataSourceID="SqlDataSourcetostdfiles">
            <LayoutTemplate>
                <div class="stdfiles">
                    <div class="stdfiles_id fl">ID</div>
                    <div class="stdfiles_index fl">规范代号</div>
                    <div class="stdfiles_name fl">规范名称</div>
                    <div class="stdfiles_class fl">规范类型</div>
                    <div class=" stdfiles_down fl">下载次数</div>
                    <div class=" stdfiles_update fl">上传日期</div>
                    <div class=" stdfiles_upusr fl">上传用户</div>
                    <div class="stdfiles_info fl">详细信息</div>
                    <div class="clr"></div>
                </div>
                <div id="items" runat="server"></div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="stdfiles">
                    <div class="stdfiles_id fl"><%#Eval("id") %></div>
                    <div class="stdfiles_index fl"><%#Eval("lable") %><%#"2" == Eval("for_value").ToString() ? "/T" : ""  %>&nbsp;<%#Eval("s_index")%>-<%#Eval("s_effcetdate","{0:yyyy}") %></div>
                    <div class="stdfiles_name fl"><%#Eval("s_name")%></div>
                    <div class="stdfiles_class fl"><%#Eval("class") %></div>
                    <div class=" stdfiles_down fl"><%#Eval("f_downnum") %></div>
                    <div class=" stdfiles_update fl"><%#Eval("s_releasedate","{0:yyyy-MM-dd}") %></div>
                    <div class=" stdfiles_upusr fl"><%#Eval("user") %></div>
                    <a class=" stdfiles_info fl" href="StdFilesInfo.aspx?down=<%#Eval("id") %>" >详细信息</a>
                    <div class="clr"></div>


                </div>
            </ItemTemplate>
            <EditItemTemplate>
                <h1>未找到相关数据</h1>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <div style="height:300px;vertical-align:middle;  text-align:center;display:table;">
                    <h1 style="margin:0px auto; display:inline-block">未找到相关数据</h1>
                </div>
            </EmptyDataTemplate>
        </asp:ListView>
        
        <asp:SqlDataSource ID="SqlDataSourcetostdfiles" runat="server" 
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
                    T_stdfile_range.rag_value ,T_stdfile_range.lable
                    FROM T_stdFile 
                    INNER JOIN T_stdfile_class ON T_stdFile.s_class_id = T_stdfile_class.cla_value 
                    INNER JOIN T_stdfile_force ON T_stdFile.s_force_id = T_stdfile_force.for_value 
                    INNER JOIN T_stdfile_range ON T_stdFile.s_range_id = T_stdfile_range.rag_value 
                    INNER JOIN T_Users ON T_stdFile.f_upuser_id = T_Users.id 
                    WHERE (T_stdFile.f_delete = 0) 
                    AND (T_stdFile.f_enable = 1) 
                    AND (T_stdfile_class.class LIKE '%' + @Test_search + '%') 
                    OR(T_stdfile_force.force LIKE '%' + @Test_search + '%') 
                    OR(T_stdfile_range.range LIKE '%' + @Test_search + '%') 
                    OR(T_stdFile.s_name LIKE '%' + @Test_search + '%') 
                    OR(T_stdFile.s_index LIKE '%' + @Test_search + '%') ">
            <SelectParameters>
                <asp:SessionParameter Name="Test_search" SessionField="url" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </div>



</asp:Content>

