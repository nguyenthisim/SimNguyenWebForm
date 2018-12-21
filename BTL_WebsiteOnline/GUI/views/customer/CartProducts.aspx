<%@ Page Title="" Language="C#" MasterPageFile="~/views/customer/Layout.Master" AutoEventWireup="true" CodeBehind="CartProducts.aspx.cs" Inherits="GUI.views.customer.CartProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
     <div class="row">
                <div class="col-lg-9">
                     <table cellpadding="0" cellspacing="0" class="nav-justified">
                                 <tr>
                                    <td style="width:250px">
                                        <img src="../../images/products/DCHS1.jpg" />
                                    </td>
                                    <td>
                                        bạnhkslsnfclkls
                                    </td>
                                    <td>
                                        200000
                                    </td>
                                    <td>
                                        <input type="number" min="1" max="10" />
                                    </td>
                                </tr>
                         </table>
                   <%-- <asp:DataList ID="DataList1" runat="server">
                        <ItemTemplate>
                            <table cellpadding="0" cellspacing="0" class="nav-justified">
                                
                                <tr>
                                    <td>
                                   <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("HangImage") %>' ControlStyle-width="250px" ControlStyle-height="300px"/>
                                    </td>
                                    <td>
                                   <asp:Literal ID="Literal1" runat="server"  Text='<%# Eval("HangName") %>'></asp:Literal>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label1" runat="server" Text='<%# String.Format("{0:c}",Eval("DonGia")) %>' style="color:red"></asp:Label>
                                    </td>
                                    <td>
                                        <input type="number" min="1" max="10" />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>--%>
                </div>
              <div class="col-lg-3">
                  sấc
              </div>
          </div> <%--End row chính--%>
</asp:Content>
