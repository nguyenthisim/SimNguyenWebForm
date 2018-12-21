<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InsertHang.aspx.cs" Inherits="GUI.views.admin.InsertHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../contents/admincss/style.css" rel="stylesheet" />

  <style type="text/css">
    .auto-style1 {
        width: 100%;
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
                    <div id="qlHang">
        <div id="TQHang">
            <h2>Thêm sản phẩm mới</h2>         
        </div>
         <div id="addSP">
                <table cellpadding="0" cellspacing="20" class="auto-style1">
                    <tr>
                        <td>Tên sản phẩm</td>
                        <td>
                            <asp:TextBox ID="txtTen" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Hình ảnh</td>
                        <td>
                            <asp:FileUpload ID="FileUploadAnh" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td>Mô tả</td>
                        <td>
                            <asp:TextBox ID="txtmota" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Note</td>
                        <td>
                            <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Số lượng</td>
                        <td>
                            <asp:TextBox ID="txtsoluong" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Giá</td>
                        <td>
                            <asp:TextBox ID="txtgia" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Loại hàng</td>
                        <td>
                            <asp:DropDownList ID="dlsLoai" runat="server" DataSourceID="SqlDataSource1" DataTextField="LoaiHangName" DataValueField="LoaiHangID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionStringLoai %>" SelectCommand="SELECT * FROM [LoaiHang]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>Thương hiệu</td>
                        <td>
                            <asp:DropDownList ID="dlsthuonghieu" runat="server" DataSourceID="SqlDataSource2" DataTextField="ThuongHieuName" DataValueField="ThuongHieuID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionStringThuongHieu %>" SelectCommand="SELECT * FROM [ThuongHieu]"></asp:SqlDataSource>
                        </td>
                    </tr>
                    <tr>
                        <td>Nhà cung cấp</td>
                        <td>
                            <asp:DropDownList ID="dlsNhacungcap" runat="server" DataSourceID="SqlDataSource3" DataTextField="NhaCungCapName" DataValueField="NhaCungCapID">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionStringNhaCungCap %>" SelectCommand="SELECT * FROM [NhaCungCap]"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>         
             <div style="margin-left: 20px; margin-top:20px;"     >
                  <asp:Button ID="btnThem" runat="server" Text="Thêm" BackColor="#0066CC" Font-Bold="True" Font-Italic="False" Font-Names="Times New Roman" Font-Size="Large" ForeColor="White" Height="50px" ViewStateMode="Disabled" Width="100px" OnClick="btnThem_Click" />
                <asp:Button ID="btnNhapLai" runat="server" Text="Nhập lại" BackColor="#CC0099" Font-Bold="True" Font-Names="Times New Roman" ForeColor="White" Height="50px" Width="100px" />
             </div>              
        </div>
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
