<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TrackOrder.aspx.cs" Inherits="TrackOrder" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style3 {
            width: 100%;
            height: 151px;
        }

        .auto-style4 {
            height: 25px;
        }

        .auto-style5 {
            text-align: justify;
            height: 25px;
        }

        .auto-style9 {
            text-align: justify;
            height: 20px;
        }
        .auto-style10 {
            height: 20px;
        }
        .auto-style11 {
            height: 25px;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 30px 10%;">
        <asp:Panel ID="Panel1" runat="server">
        <h1>
            <asp:Label ID="Label1" runat="server" ForeColor="#6699FF" Text="Track Your Order"></asp:Label>
        </h1>
            <p>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                &nbsp;
                <asp:Button ID="btn_Search" runat="server" OnClick="btn_Search_Click" Text="Search" />
            </p>
            <p>
                &nbsp;</p>
        <p>
            <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand">
                <ItemTemplate>
                    <table class="auto-style3">
                        <tr>
                            <td class="auto-style4">Receipt ID :
                            <asp:Label ID="lbl_Receipt" runat="server" Text='<%# Eval("Receipt_ID") %>'></asp:Label>
                            </td>
                            <td class="auto-style4" rowspan="2"></td>
                        </tr>
                        <tr>
                            <td class="auto-style4">Date :
                            <asp:Label ID="lbl_Date" runat="server" Text='<%# Eval("Date") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="text-justify">
                                Number of items purchased :
                            <asp:Label ID="lbl_TQuantity" runat="server" Text='<%# Eval("TQuantity") %>'></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9">&nbsp;</td>
                            <td class="auto-style10">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style9"><b>Billing Infomation</b></td>
                            <td class="auto-style10"><b>Shipping Infomation</b></td>
                        </tr>
                        <tr>
                            <td class="auto-style5">
                                Name :
                                <asp:Label ID="billing_Firstname" runat="server" Text='<%# Eval("Billing_Firstname") %>'></asp:Label>
                                &nbsp;<asp:Label ID="billing_Lastname" runat="server" Text='<%# Eval("Billing_Lastname") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">
                                Name :
                                <asp:Label ID="shipping_firstname" runat="server" Text='<%# Eval("Shipping_Firstname") %>'></asp:Label>
                                &nbsp;<asp:Label ID="shipping_lastname" runat="server" Text='<%# Eval("Shipping_Lastname") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Company :
                                <asp:Label ID="billing_Company" runat="server" Text='<%# Eval("Billing_Company") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">Company :
                                <asp:Label ID="shipping_company" runat="server" Text='<%# Eval("Shipping_Company") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Billing Address 1 :
                                <asp:Label ID="billing_address_1" runat="server" Text='<%# Eval("Billing_Address_Line1") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">Shipping Address 1 :
                                <asp:Label ID="shipping_address_1" runat="server" Text='<%# Eval("Shipping_Address_Line1") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Billing Address 2 :
                                <asp:Label ID="billing_address_2" runat="server" Text='<%# Eval("Billing_Address_Line2") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">Shipping Address 2 :
                                <asp:Label ID="shipping_adrdress_2" runat="server" Text='<%# Eval("Shipping_Address_Line2") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">City :
                                <asp:Label ID="billing_city" runat="server" Text='<%# Eval("Billing_City") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">City :
                                <asp:Label ID="shipping_city" runat="server" Text='<%# Eval("Shipping_City") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">State :
                                <asp:Label ID="billing_state" runat="server" Text='<%# Eval("Billing_State") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">State :
                                <asp:Label ID="shipping_state" runat="server" Text='<%# Eval("Shipping_State") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Postal Code :
                                <asp:Label ID="billing_postcode" runat="server" Text='<%# Eval("Billing_Postcode") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">Postal Code :
                                <asp:Label ID="shipping_postcode" runat="server" Text='<%# Eval("Shipping_Postcode") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Email :
                                <asp:Label ID="email" runat="server" Text='<%# Eval("Billing_Email") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">Contact Number :
                                <asp:Label ID="phone" runat="server" Text='<%# Eval("Billing_Phone") %>'></asp:Label>
                            </td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style11">
                                <asp:Button ID="Btn_view" runat="server" Text="View Detail" CommandName="viewdetail" CommandArgument='<% #Eval("Receipt_ID")%>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style5">&nbsp;</td>
                            <td class="auto-style11">&nbsp;</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </p>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <asp:GridView ID="gv_CartView" runat="server" DataKeyNames="ItemID" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="Product ID" />
                    <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                            <br />
                            <asp:Label ID="lbl_nothing" runat="server"></asp:Label>
                            <br />
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
            Total Price = $<asp:Label ID="lbl_TotalPrice" runat="server"></asp:Label>
            <br />
            <br />
            <asp:Button ID="Btn_back" runat="server" OnClick="Btn_back_Click" Text="Back" />

        </asp:Panel>
    </div>
</asp:Content>

