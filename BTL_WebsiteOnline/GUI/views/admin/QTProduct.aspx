<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/BackEnd.Master" AutoEventWireup="true" CodeBehind="QTProduct.aspx.cs" Inherits="GUI.views.admin.QTProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">

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
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="HangID" PageSize="4">
    <Columns>
        <asp:BoundField DataField="HangName" HeaderText="Tên sản phẩm" />
        <asp:BoundField DataField="SKU" HeaderText="SKU" />
        <asp:BoundField DataField="MoTa" HeaderText="Mô tả" />
        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" />
        <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" />
        <asp:ImageField DataImageUrlField="HangImage" HeaderText="Hình ảnh">
            <ControlStyle Height="50px" Width="50px" />
        </asp:ImageField>
    </Columns>
    <PagerStyle HorizontalAlign="Center" />
</asp:GridView>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionString %>" SelectCommand="SELECT * FROM [LoaiHang]"></asp:SqlDataSource>
         </div>
</asp:Content>
