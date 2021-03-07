<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="test_Default" %>

<%--<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>--%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        /*img {
            float:left;
            width:100%;
            height:100%;
            border-radius:8px; 
        }
        div {
            width:200px;
            text-align:center;
            margin:0px;
        }
        #frast {
            border:1px solid red;
            
        }
        #last {
            border:1px solid green;
            position:absolute;
            left:210px;
            top:10px;
        }*/
        img {
            padding:2px;
            border:1px solid green;
        }

        /*.one {
            background-color:orange;
            border:1px solid #ddd;
        }
        .oneitem {
            border:1px solid #00ff00;
            background-color:red;
            display:none;
            position:absolute;
        }
        .true {
            border:1px solid yellow;
            background-color:blue;
        }*/
    </style>
    <%--<link href="../style/MainStyle.css" rel="stylesheet" />
    <link href="../style/userStyle.css" rel="stylesheet" />--%>
    <script src="../script/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        var d = 0;
        var r = setInterval("$('#Button1').click()", 3000);
        //var count = 3;
        $(document).ready(function () {
            $(".one").mouseenter(function () {
                $(".oneitem", this).show();
            });
            $(".one").mouseleave(function () {
                $(".oneitem").hide();
            })





            //$("#frast").mo(function(){
            //    $("#last").mouseenter();
            //});
            //$("#frast").mousemove(function () {
            //    $("#last").hide();
            //})
            //$("#Button1").click(function () {
            //    d = (d + count - 1) % count;
            //    moves(d);             
            //});
            //$("#Button2").click(function () {
            //    d = (d + count + 1) % count;
            //    moves(d);
            //});
            //$("#outdisplay").mouseenter(function () {
            //    $("#control").fadeIn(500);
            //    clearInterval(r);
            //});
            //$("#outdisplay").mouseleave(function () {
            //    $("#control").fadeOut(500);
            //   var r= setInterval("$('#Button1').click()",3000);
            //});
        });
        //function moves(d) {
        //    var cc = -(d * 300);
        //    $("#imgs").animate({"left": cc }, 2000);
        //}
    </script>
</head>
<body>
    <form id="form1" runat="server">



       <%-- <div class="">
            <div class="one fl">第一层第一项
                <div class="oneitem">
                    <div class="true">第二层第一项1</div>
                    <div class="true">第二层第一项2</div>
                </div>
            </div>
            <div class="one fl">第一层第二项
                <div class="oneitem">
                    <div class="true">第二层第二项1</div>
                    <div class="true">第二层第二项2</div>
                </div>

            </div>
            <div class="one fl">第一层第三项
                <div class="oneitem">
                    <div class="true">第二层第三项1</div>
                    <div class="true">第二层第三项2</div>
                </div>
            </div>
            <div class="one fl" >第一层第四项
                <div class="oneitem">
                    <div class="true">第二层第四项1</div>
                    <div class="true">第二层第四项2</div>
                </div>
            </div>
        </div>
        <div class="clr"></div>
        <div>内容层参数</div>--%>
        <%--<div id="frast">第一层</div>
        <div id="last">第二次</div>--%>
        <%--轮播模块--%>
        <%--<div id="outdisplay" style="border:1px solid red;height:300px;width:300px;margin:10px; overflow:hidden">
            <div id="imgs" runat="server" style="width:900px;height:300px;position:relative;"></div>
        <div id = "control" style="border:1px solid green;position:relative;top:-144px;">
            <input id="Button1" type="button" value="左移" style="float:left;" />
            <input id="Button2" type="button" value="右移" style="float:right;" />
        </div>
        </div>--%>
        
    </form>
</body>
</html>
