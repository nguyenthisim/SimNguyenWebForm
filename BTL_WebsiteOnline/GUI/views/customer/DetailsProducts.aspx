<%@ Page Title="" Language="C#" MasterPageFile="~/views/customer/Layout.Master" AutoEventWireup="true" CodeBehind="DetailsProducts.aspx.cs" Inherits="GUI.views.customer.DetailsProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
       <div class="row">
               <!-- /.col-lg-9 -->
                <div class="col-lg-1"></div>
                <div class="col-lg-10">
               <asp:DataList ID="DataListDetail" runat="server">
                   <ItemTemplate>
                       <table cellpadding="0" cellspacing="0" class="nav-justified">
                           <tr>
                               <td style="width:250px;">
                                   <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HangImage") %>' ControlStyle-width="250px" ControlStyle-height="300px"/>
                               </td>
                               <td>
                                    <div class="chitiet">
                                        <h2>
                                            <asp:Literal ID="Literal1" runat="server"  Text='<%# Eval("HangName") %>'></asp:Literal>
                                        </h2>
                                        <br />
                                        Thương hiệu: 
                                          <asp:Literal ID="Literal2" runat="server"  Text='<%# Eval("ThuongHieuName") %>'></asp:Literal>
                                         SKU: <asp:Literal ID="Literal3" runat="server"  Text='<%# Eval("SKU") %>'></asp:Literal>
                                        <br /><br /><br />
                                        Giá:
                                        <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:c}",Eval("DonGia")) %>' style="color:red"></asp:Label>
                                        <br />
                                        <asp:Literal ID="Literal4" runat="server"  Text='<%# Eval("Note") %>'></asp:Literal>
                                        <br /><br />
                                        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" style="background-color:brown; color:white;" />

                                    </div>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="2">
                                   <div class="mota">
                                   <h3>THÔNG TIN SẢN PHẨM </h3><br />
                                    <h4>
                                    <asp:Literal ID="Literal6" runat="server"  Text='<%# Eval("HangName") %>'></asp:Literal>
                                    </h4>
                                  <asp:Literal ID="Literal5" runat="server"  Text='<%# Eval("MoTa") %>'></asp:Literal>
                                       </div>
                               </td>
                           </tr>
                       </table>
                   </ItemTemplate>
               </asp:DataList>
                    </div>
          </div> <%--End row chính--%>
</asp:Content>
