<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wishlist.aspx.cs" Inherits="ViewCart" %>
<%@ MasterType VirtualPath="~/MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style5 {
            width: 717px;
            float: left;
            height: 296px;
        }
        .auto-style6 {
            width: 32%;
        }
        .auto-style8 {
            width: 650px;
        }
        .auto-style11 {
            width: 650px;
            text-align: center;
            height: 84px;
        }
        .auto-style12 {
            width: 650px;
            text-align: center;
            height: 74px;
        }
        .auto-style13 {
            width: 650px;
            text-align: center;
            height: 25px;
        }
        .auto-style14 {
            width: 650px;
            text-align: center;
            height: 23px;
        }
        .auto-style15 {
            height: 276px;
            width: 489px;
        }
        .auto-style17 {
            height: 276px;
            width: 1070px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div style="margin:30px 10%;">
    <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
             <div class="auto-style5">
            <table class="responsive-textbox">
                <tr>
                    <td class="auto-style6">
                        <asp:LinkButton ID="LinkButton1" runat="server"  CommandArgument='<% #Eval("ItemID")%>' CommandName="viewdetail" Text='<%# Eval("Product_Name") %>'></asp:LinkButton>
                    </td>
                </tr>
            </table>
                 <table class="auto-style15">
                     <tr>
                         <td class="auto-style17" rowspan="5">
                             <asp:Image ID="Image1" runat="server" CssClass="zoom" Height="220px" ImageUrl='<%# Eval("Product_Image") %>' Width="82%" />
                         </td>
                         <td class="auto-style12">Stock left :
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("Stock_Level") %>'></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style11">Price :
                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("Product_Price") %>'></asp:Label>
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style13">&nbsp;</td>
                     </tr>
                     <tr>
                         <td class="auto-style14">
                             &nbsp;<asp:Button ID="btn_cart" runat="server"  CommandArgument='<% #Eval("ItemID")%>' CommandName="addcart" Height="44px" Text="Add To Cart" Width="148px" />
                             &nbsp;<asp:Button ID="Button1" runat="server" CommandArgument='<% #Eval("ItemID")%>' CommandName="Remove" Text="Remove" Width="97px" />
                         </td>
                     </tr>
                     <tr>
                         <td class="auto-style8">&nbsp;</td>
                     </tr>
                 </table>
                 </div>
        </ItemTemplate>
    </asp:DataList>
          </div>
</asp:Content>

