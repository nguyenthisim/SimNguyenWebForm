<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanTri.aspx.cs" Inherits="GUI.views.admin.QuanTri" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="../../contents/admincss/style.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 300px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="page">
        <div id="header">
            <div id="logo">
                <img src="../../contents/admincss/logo2.jpg" />
            </div>
            <div id="loginAdmin">               
                    <img src="../../contents/admincss/logo2.jpg" />                           
                    <span style="color:red;" id="txtName">SimNguyen
                       </span>              
            </div>
        </div> <%-- end header--%>
        <div id="main">
          <div id="mainLeft">
              <ul>
                  <li><a href="QuanTri.aspx">Databoard</a></li>
                  <li><a href="QuanLyHang.aspx">Quản Lý Hàng</a></li>
                  <li><a href="#">Quản Lý Order</a></li>
              </ul>
          </div><%-- end mainLeft--%>
            <div id="mainRight">
                <div id="content">
                   
                        <div id="info">
                            <h3>Họ Tên: NGUYỄN THỊ SIM</h3>
                            <h3>lớp: CNTT1-K10</h3>
                            <h3>Môn: ASP</h3>      
                        </div>
                  
                </div><%-- end content--%>
            </div><%-- end mainRight--%>
        </div><%-- end main--%>
        <div style="clear:both"></div>
        <div id="footer">
           <p> nguyen thị sinm</p>
            <p>Lienj hẹ 793ry2fnb</p>
        </div>
    </div><%-- end page--%>
    </form>
</body>
</html>
