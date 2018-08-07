<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewCart" %>
<%@ MasterType VirtualPath="~/MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
         <div style="margin:30px 10%;">
    <asp:GridView ID="gv_CartView" runat="server" DataKeyNames="ItemID" OnRowCommand="gv_CartView_RowCommand" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="Product ID" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="tb_Quantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:TextBox>
                    <br />
                    <asp:LinkButton ID="btn_Remove" runat="server" CommandArgument='<%# Eval("ItemID") %>' CommandName="Remove">Remove</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Product_Price" DataFormatString="{0:C}" HeaderText="Unit Price" />
            <asp:BoundField DataField="TotalPrice" DataFormatString="{0:C}" HeaderText="Price" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:GridView>
    <br />
    Total Price =
             $<asp:Label ID="lbl_TotalPrice" runat="server"></asp:Label>
    <br />
    <br />
    <asp:Label ID="lbl_Error" runat="server"></asp:Label>
    <br />
    <asp:Button ID="btn_update" runat="server" OnClick="btn_update_Click" Text="Update Cart" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btn_clear" runat="server" OnClick="btn_clear_Click" Text="Clear Cart" />
&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btn_Back" runat="server" OnClick="btn_Back_Click" Text="Back" />
             <br />
             <br />
             <asp:Button ID="btn_Check" runat="server" OnClick="Button1_Click" Text="Proceed To Checkout" />
             </div>
</asp:Content>

