<%@ Page Title="" Language="C#" MasterPageFile="~/views/admin/BackEnd.Master" AutoEventWireup="true" CodeBehind="QTH.aspx.cs" Inherits="GUI.views.admin.QTH" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main_body" runat="server">
<div id="content">
    <div id="qlHang">

        <asp:DataList ID="DataListHang" runat="server">
            <ItemTemplate>
                <table cellpadding="0" cellspacing="0" class="auto-style1">
                    <tr>
                        <td>
                            <asp:Literal runat="server" Text='<%# Eval("HangName") %>'></asp:Literal>
                        </td>
                        <td>
                            <asp:Image runat="server" ImageUrl='<%# Eval("HangImage") %>'></asp:Image>
                        </td>
                        <td>
                            <asp:Literal runat="server" Text='<%# Eval("MoTa") %>'></asp:Literal>
                        </td>
                        <td>
                            <asp:Literal runat="server" Text='<%# Eval("SoLuong") %>'></asp:Literal>
                        </td>
                        <td>
                            <asp:HyperLink runat="server" NavigateUrl='<%# "Detail.aspx?HangID="+ Eval("HangID").ToString() %>'>Xem chi tiết</asp:HyperLink>
                        </td>
                        <td>
                           <asp:HyperLink runat="server" NavigateUrl='<%# "UpdateProduct.aspx?HangID="+ Eval("HangID").ToString() %>'>Sửa</asp:HyperLink>

                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>

    </div>
</div>
</asp:Content>
