<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ListingProduct.aspx.cs" Inherits="ProductView" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
            <div style="margin:30px 2.5%;">
                <asp:GridView ID="gvProduct" runat="server" AutoGenerateColumns="False" OnSelectedIndexChanged="gvProduct_SelectedIndexChanged" Width="100%" CellPadding="5" ForeColor="#333333" GridLines="None" Height="263px" DataKeyNames="Product_ID" OnRowCancelingEdit="gvProduct_RowCancelingEdit" OnRowEditing="gvProduct_RowEditing" OnRowUpdating="gvProduct_RowUpdating" OnRowCommand="gvProduct_RowCommand">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    <Columns>
                        <asp:BoundField DataField="Product_ID" HeaderText="ID" />
                        <asp:BoundField DataField="Product_Name" HeaderText="Prod Name" />
                        <asp:BoundField DataField="Product_Desc" HeaderText="Description">
                        <ControlStyle Width="500px" />
                        <FooterStyle Width="500px" />
                        <HeaderStyle Width="500px" />
                        <ItemStyle Width="500px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Unit_Price" HeaderText="Price" />
                        <asp:BoundField DataField="Stock_Level" HeaderText="Stock" />
                        <asp:BoundField DataField="Gender" HeaderText="Gender" />
                        <asp:BoundField DataField="DOR" HeaderText="Date Of Release" />
                        <asp:BoundField DataField="Brand" HeaderText="Brand" />
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="black" CommandArgument='<%# Eval("Product_ID") %>' Text='<%# Eval("Status") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:CommandField ShowEditButton="True" />
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
                &nbsp;<asp:Button ID="btn_prev" runat="server" Height="40px" OnClick="btn_prev_Click" Text="&lt;" Width="53px" />
                &nbsp;<asp:Button ID="btn_next" runat="server" Height="40px" OnClick="btn_next_Click" Text="&gt;" Width="53px" />
                &nbsp;<br />
                <br />
                <asp:Button ID="btn_AddProduct" runat="server" OnClick="btn_AddProduct_Click" Text="Add New Product" />
                <br />

            </div>
</asp:Content>

