//点击标题打开函数

function clicktitle() {
    //window.open("../Default.aspx", true);
    window.location.href="../Default.aspx";
}
    //文件上传大小检测函数
function checkSize(obj_file) {
    var _size = obj_file.files[0].size;
    if (_size > 157286400) {
        alert("最大文件不能超过150M");
        $("#ContentPlaceHolder1_fileupl_stdfile_file").vla("");
        $("#ContentPlaceHolder1_fileupl_stdfile_file").focus();
        return false;
    }
    //alert(_size / 1024 / 1024);

}
