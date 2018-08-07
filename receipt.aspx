<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="receipt.aspx.cs" Inherits="receipt1" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 30px 2.5%;">
        <h3>&nbsp;Receipt</h3>
    <asp:GridView ID="gv_CartView" runat="server" DataKeyNames="ItemID" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Height="280px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="ItemID" HeaderText="Product ID" />
            <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
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
    
    <h3>&nbsp;</h3>
    <h3>&nbsp;Billing Details</h3>

    <asp:GridView ID="gv_details" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1342px" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Country"><ItemTemplate><%#Eval("UserCountry") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="First Name"><ItemTemplate><%#Eval("UserFirstName") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Last Name"><ItemTemplate><%#Eval("UserLastName") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Company"><ItemTemplate><%#Eval("UserCompany") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Address Line 1"><ItemTemplate><%#Eval("UserAddress1") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Address Line 2 "><ItemTemplate><%#Eval("UserAddress2") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="City"><ItemTemplate><%#Eval("UserCity") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="State"><ItemTemplate><%#Eval("UserState") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Postcode"><ItemTemplate><%#Eval("UserPostcode") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Email"><ItemTemplate><%#Eval("UserEmail") %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="Phone"><ItemTemplate><%#Eval("UserPhone") %></ItemTemplate></asp:TemplateField>
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

    <h4>Payment Method</h4>
    <p>
        <asp:TextBox ID="txtPayment" runat="server" ReadOnly="True"></asp:TextBox>
    </p><br />

    <br />

    <h3>&nbsp;Shipping Details</h3>
    <asp:GridView ID="gv_shipping" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1164px" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField HeaderText="Country" DataField="ShippingCountry" />
            <asp:BoundField HeaderText="First Name" DataField="ShippingFirstName" />
            <asp:BoundField HeaderText="Last Name" DataField="ShippingLastName" />
            <asp:BoundField DataField="ShippingCompany" HeaderText="Company" />
            <asp:BoundField HeaderText="Address Line 1" DataField="ShippingAddress1" />
            <asp:BoundField HeaderText="Address Line 2" DataField="ShippingAddress2" />
            <asp:BoundField HeaderText="City" DataField="ShippingCity" />
            <asp:BoundField HeaderText="State" DataField="ShippingState" />
            <asp:BoundField HeaderText="Postcode" DataField="ShippingPostcode" />
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
    <asp:Button ID="btnOk" runat="server" OnClick="btnOk_Click" Text="OK" />
    </div>
</asp:Content>

