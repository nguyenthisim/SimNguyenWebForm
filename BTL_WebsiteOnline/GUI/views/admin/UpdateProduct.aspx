<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/BackEnd.Master" AutoEventWireup="true" CodeBehind="UpdateProduct.aspx.cs" Inherits="GUI.views.admin.UpdateProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link href="../../contents/admincss/style.css" rel="stylesheet" />

     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
    <div id="content">
     <div id="qlHang">       
         <div id="addSP">
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:DB_TikiNowConnectionString2 %>"
                  SelectCommand="SELECT * FROM [Hang]" UpdateCommand="Update Hang set HangName=@HangName, Mota=@MoTa,SoLuong=@SoLuong where HangID=@HangID" DeleteCommand="Delete Hang where HangID=@HangId">

             </asp:SqlDataSource>
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" DataKeyNames="HangID" DataSourceID="SqlDataSource1">
                 <Columns>
                     <asp:TemplateField>
                         <ItemTemplate>
                             <h2> <%# Eval("HangName") %></h2><br />
                             <p><%# Eval("MoTa") %> </p>
                             <p><%# Eval("DonGia") %></p>
                             <%# Eval("SoLuong") %>
                         </ItemTemplate>
                         <EditItemTemplate>
                             <b>Tên sản phẩm:</b><br />
                             <asp:TextBox runat="server" ID="txtTen" TextMode="MultiLine" Text='<%# Bind("HangName") %>'></asp:TextBox>
                             <b> Môta</b><br />
                              <asp:TextBox runat="server" ID="txtMT" TextMode="MultiLine" Text='<%# Bind("MoTa") %>'></asp:TextBox>
                             <b>So lượng:</b>
                           <asp:TextBox runat="server" ID="txtSL" TextMode="MultiLine" Text='<%# Bind("SoLuong") %>'></asp:TextBox>

                         </EditItemTemplate>
                     </asp:TemplateField>
                     <asp:CommandField ShowEditButton="true" CancelText="Hủy" EditText="Sửa" HeaderText="Sửa" UpdateText="Lưu" />
                     <asp:CommandField ShowDeleteButton="true" HeaderText="Xóa" DeleteText="Xóa" />
                 </Columns>
             </asp:GridView>
         </div>
    </div>
 </div>
</asp:Content>
