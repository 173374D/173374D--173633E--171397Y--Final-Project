<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdminContactUs.aspx.cs" Inherits="AdminContactUs" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="margin:30px 5%;">


        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>Category</asp:ListItem>
            <asp:ListItem>Website</asp:ListItem>
            <asp:ListItem>Product</asp:ListItem>
            <asp:ListItem>Order</asp:ListItem>
            <asp:ListItem>Bugs</asp:ListItem>
            <asp:ListItem>Others</asp:ListItem>
        </asp:DropDownList>
         <br />
         <br />
         From :
        <asp:TextBox ID="txt_from" runat="server"></asp:TextBox>
&nbsp;To :
        <asp:TextBox ID="txt_to" runat="server"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="btn_Search" runat="server" OnClick="btn_Search_Click" Text="Search" Width="96px" />
         <br />
         <br />


         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
             <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
             <Columns>
                 <asp:BoundField DataField="Email" HeaderText="Email" />
                 <asp:BoundField DataField="Category" HeaderText="Category" />
                 <asp:BoundField DataField="Concern" HeaderText="TextField" >
                 <ControlStyle Width="650px" />
                 <FooterStyle Width="650px" />
                 <HeaderStyle Width="650px" />
                 <ItemStyle Width="650px" />
                 </asp:BoundField>
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


     &nbsp;&nbsp;


     </div>
</asp:Content>

