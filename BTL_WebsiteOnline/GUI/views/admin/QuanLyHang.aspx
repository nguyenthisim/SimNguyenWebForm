<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuanLyHang.aspx.cs" Inherits="GUI.views.admin.QuanLyHang" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link href="../../contents/admincss/style.css" rel="stylesheet" />
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
            <div id="loc">
                Mã sản phẩm: 
                <asp:TextBox ID="txtSPID" runat="server" BorderColor="#FF3399" BorderStyle="Solid" Height="25px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Loại sản phẩm:
                <asp:DropDownList  ID="dropLoai" runat="server" DataSourceID="SqlDataSource1" DataTextField="LoaiHangName" DataValueField="LoaiHangID" Height="30px">
                </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLoc" runat="server" Text="Lọc" BackColor="#0000CC" BorderColor="#0000CC" Font-Bold="True" ForeColor="White" Height="30px" />
               
            </div>
            <div id="tkHang">
               <asp:Button runat="server" ID="btnThemsp" class="btnThemSP" OnClick="btnThemsp_Click" Text="Thêm sản phẩm" />               
            </div>
        </div>
      <br />
                        <asp:Label ID="lblThongbao" runat="server"></asp:Label>
        <asp:GridView ID="dtgHang" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" AllowPaging="True" AllowSorting="True" OnPageIndexChanged="Page_Load" OnPageIndexChanging="dtgHang_PageIndexChanging" PageSize="6" DataKeyNames="HangID" OnSelectedIndexChanged="dtgHang_SelectedIndexChanged" ViewStateMode="Enabled" OnPreRender="dtgHang_PreRender" OnSelectedIndexChanging="dtgHang_SelectedIndexChanging">
            <Columns>
                <asp:CommandField SelectText="Chọn" ShowSelectButton="True" />
                <asp:BoundField DataField="HangID" HeaderText="Mã hàng" />
                <asp:BoundField DataField="HangName" HeaderText="Tên sản phẩm" />
                <asp:ImageField DataImageUrlField="HangImage" HeaderText="Hình ảnh">
                    <ControlStyle Height="50px" Width="50px" />
                </asp:ImageField>
                <asp:BoundField DataField="Note" HeaderText="Note" />
                <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
                <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" />
                <asp:BoundField DataField="LoaiHangName" HeaderText="Loại sản phẩm" />
               
                <asp:CommandField HeaderText="Sửa" ShowEditButton="True" UpdateText="Lưu" />
                <asp:CommandField ShowDeleteButton="True" />
             
            </Columns>
            <Columns>
              <asp:TemplateField HeaderText="Chinh sua thong tin hang">
                   <ItemTemplate>
                       <div>
                           <div id="addSP">
                <table cellpadding="0" cellspacing="20" class="auto-style1">
                    <tr>
                        <td>Tên sản phẩm</td>
                        <td>
                            <asp:TextBox ID="txtTen" runat="server" Text='<%# Bind("HangName") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Mô tả</td>
                        <td>
                            <asp:TextBox ID="txtmota" runat="server" Text='<%# Bind("MoTa") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Note</td>
                        <td>
                            <asp:TextBox ID="txtnote" runat="server" Text='<%# Bind("Note") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Số lượng</td>
                        <td>
                            <asp:TextBox ID="txtsoluong" runat="server" Text='<%# Bind("SoLuong") %>'></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>Giá</td>
                        <td>
                            <asp:TextBox ID="txtgia" runat="server" Text='<%# Bind("DonGia") %>'></asp:TextBox>
                        </td>
                    </tr>                  
                </table>         
                           </div>
                       </div>
                   </ItemTemplate>
               </asp:TemplateField>
                </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
            <SortedAscendingCellStyle BackColor="#FEFCEB" />
            <SortedAscendingHeaderStyle BackColor="#AF0101" />
            <SortedDescendingCellStyle BackColor="#F6F0C0" />
            <SortedDescendingHeaderStyle BackColor="#7E0000" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionString %>" SelectCommand="SELECT * FROM [LoaiHang]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionString %>" SelectCommand="select count(*) from Hang"></asp:SqlDataSource>

    &nbsp;<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionString3 %>"
           UpdateCommand="Update Hang set HangName=@HangName,MoTa=@MoTa,Note=@Note,SoLuong=@SoLuong,DonGia=@DonGia where HangID=@HangID"
         DeleteCommand="Delete Hang where HangID=@HangID"></asp:SqlDataSource>
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
