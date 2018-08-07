<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductView.aspx.cs" Inherits="Productviewing" %>
<%@ MasterType VirtualPath="~/MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 150px;
            height: 19px;
        }
        .auto-style4 {
            width: 150px;
            height: 76px;
        }
        .auto-style6 {
            text-align: left;
            height: 15px;
        }
        .auto-style7 {
            height: 20px;
        }
        .auto-style8 {
            height: 17px;
        }
* {
    box-sizing: border-box;
}

.zoom {
    padding: 50px;
    transition: transform .2s;
    width: 200px;
    height: 200px;
    margin: 0 auto;
}

.zoom:hover {
    -ms-transform: scale(1.5); /* IE 9 */
    -webkit-transform: scale(1.5); /* Safari 3-8 */
    transform: scale(1.5); 
}
        .auto-style9 {
            height: 19px;
            width: 8px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div style="margin:30px 10%;">
        <asp:TextBox ID="txt_Search" runat="server"></asp:TextBox>
&nbsp;<asp:Button ID="btn_search" runat="server"  Text="Search" OnClick="btn_search_Click" />
        <br />
        <br />
        <asp:LinkButton ID="btn_male" runat="server" OnClick="btn_male_Click">men</asp:LinkButton>
&nbsp;&nbsp;&nbsp;
        <asp:LinkButton ID="btn_female" runat="server" OnClick="btn_female_Click">women</asp:LinkButton>
        <br />
        <br />
 <asp:datalist id="DataList1" runat="server" onitemcommand="DataList1_ItemCommand" repeatlayout="Flow" repeatdirection="Horizontal" width="100%">
        <ItemTemplate>
             <div style="width:300px;float:left;">
            <table class="responsive-textbox">
                <tr>
                    <td class="auto-style6" colspan="2">
                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text='<%# Eval("Product_Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Image ID="Image1" runat="server" Height="276px" ImageUrl='<%# Eval("Product_Image") %>' Width="249px" CssClass="zoom" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style7" colspan="2">Stock left :
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("Stock_Level") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style8" colspan="2">Price : $<asp:Label ID="Label3" runat="server" Text='<%# Eval("Unit_Price") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Button ID="Button1" runat="server" CommandName="viewdetail" CommandArgument='<% #Eval("Product_ID")%>' Text="Select" />
                    </td>
                    <td class="auto-style3">
                        <asp:ImageButton ID="ImageButton1" runat="server" CommandName="addcart" CommandArgument='<% #Eval("Product_ID")%>' Height="42px" ImageUrl="~/img/addcart.png" Width="46px" />
                        &nbsp;
                        <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<% #Eval("Product_ID")%>' CommandName="wishlist" Height="42px" ImageUrl="~/img/heart.png" Width="46px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" colspan="2"></td>
                </tr>
            </table>
                 </div>
        </ItemTemplate>
    </asp:datalist>
    </div>
</asp:Content>

