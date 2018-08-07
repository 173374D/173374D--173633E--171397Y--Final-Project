<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div style="margin: 30px 10%;">
            <h1>Contact Us</h1>
            <h4>Should you have any enquiries or problems you wish to address, please inform us and we will review it as fast as we can. Thank you for your time.</h4>
            <p>Subject :
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                    <asp:ListItem>Website</asp:ListItem>
                    <asp:ListItem>Product</asp:ListItem>
                    <asp:ListItem>Order</asp:ListItem>
                    <asp:ListItem>Bugs</asp:ListItem>
                    <asp:ListItem>Others</asp:ListItem>
                </asp:DropDownList>
            </p>
            <p>Email :
                <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please tell us your email." ForeColor="Red" ControlToValidate="txt_email"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:TextBox ID="txt_text" runat="server" Height="130px" TextMode="MultiLine" Width="60%"></asp:TextBox>
&nbsp;</p>
            <p>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please write down your problems." ForeColor="Red" ControlToValidate="txt_text"></asp:RequiredFieldValidator>
            </p>
            <p>
                <asp:Button ID="btn_Submit" runat="server" OnClick="btn_Submit_Click" Text="Submit" />
            </p>
        </div>
</asp:Content>

