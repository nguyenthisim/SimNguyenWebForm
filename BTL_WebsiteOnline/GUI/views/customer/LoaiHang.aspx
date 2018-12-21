<%@ Page Title="" Language="C#" MasterPageFile="~/views/customer/FrontEnd.Master" AutoEventWireup="true" CodeBehind="LoaiHang.aspx.cs" Inherits="GUI.views.customer.LoaiHang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">

    <asp:DataList ID="DataList1" runat="server" DataKeyField="HangID" RepeatColumns="2">
        <ItemTemplate>
          <table cellpadding="0" cellspacing="0" class="nav-justified" style="margin-bottom:5px;">
                <tr>
                    <td class="ttanh">
                        <div class="ttanh">
                               <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "DetailsProducts.aspx?HangID="+Eval("HangID").ToString() %>' ImageUrl='<%# Eval("HangImage") %>' ToolTip="Xem chi tiet..." ControlStyle-width="200px" ControlStyle-height="250px" ></asp:HyperLink>
                        </div>
                    </td>
                    <td>
                        <div class="ttin">
                             <h3>
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "DetailsProducts.aspx?HangID="+Eval("HangID").ToString() %>' Text='<%# Eval("HangName") %>'></asp:HyperLink></h3>
                        <br />
                        Giá:        
                        <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("DonGia") %>'>Đ</asp:Literal>
                  
                            <br /><br />
                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# "DetailsProducts.aspx?HangID="+Eval("HangID").ToString() %>'>Xem chi tiết...</asp:HyperLink>
                        <br />
                        <asp:Button ID="btnAdCart" runat="server" Text="Add Cart" CommandName="AddToCart" style="background-color:brown; color:white;" />
                        </div>
                       
                    </td>
                </tr>
            </table><br />
        </ItemTemplate>
    </asp:DataList>

</asp:Content>
