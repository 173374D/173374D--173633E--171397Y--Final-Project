<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ThankYou.aspx.cs" Inherits="ThankYou" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>
        <asp:Label ID="Label1" runat="server" Font-Bold="True" ForeColor="#99CCFF" Text="Thank You For Your Purchase!"></asp:Label>
    </h1>
    <h3>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#99CCFF" Text="Details will be saved in your account"></asp:Label>
    </h3>
    <asp:Button ID="btnFront" runat="server" Text="Front Page" Width="218px" OnClick="btnFront_Click" />
    <asp:Button ID="btnContinue" runat="server" Text="Continue Shopping" Width="218px" OnClick="btnContinue_Click" />
&nbsp;&nbsp;<asp:Button ID="btnTrack" runat="server" OnClick="btnTrack_Click" Text="TRACK" />
&nbsp; 
</asp:Content>

