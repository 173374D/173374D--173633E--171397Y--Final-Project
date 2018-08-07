<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 30px 10%;">
   <h1 class="form-group">Feedback</h1>
        <p class="form-group">&nbsp;</p>
      <p>Email : 
        <asp:TextBox ID="txt_name" runat="server"></asp:TextBox>
        &nbsp;</p>
        <p>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please tell us your email." ForeColor="Red" ControlToValidate="txt_name"></asp:RequiredFieldValidator>
        </p>
        <p>What was your first impression when you entered the website?</p>
        <asp:TextBox ID="txt_Q1" runat="server" Width="650px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please tell us your opinions." ForeColor="Red" ControlToValidate="txt_Q1"></asp:RequiredFieldValidator>
        <br />
        <p>How likely are you to recommend us to a friend or colleague?</p>
        <asp:TextBox ID="txt_Q2" runat="server" Width="650px"></asp:TextBox>
            <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please tell us your opinions." ForeColor="Red" ControlToValidate="txt_Q2"></asp:RequiredFieldValidator>
        <br />
        <p>What other products (or product features) would you like us to offer?</p>
        <asp:TextBox ID="txt_Q3" runat="server" Width="650px"></asp:TextBox>
        <br />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please tell us your opinions." ForeColor="Red" ControlToValidate="txt_Q3"></asp:RequiredFieldValidator>
        <br />
        <br />
        Please rate us.<asp:RadioButtonList ID="RadioButtonList1" runat="server" Height="23px" RepeatDirection="Horizontal" Width="427px">
            <asp:ListItem Selected="True">Very good</asp:ListItem>
            <asp:ListItem>Good</asp:ListItem>
            <asp:ListItem>Bad</asp:ListItem>
            <asp:ListItem>Very Bad</asp:ListItem>
        </asp:RadioButtonList>
        <br />
        <asp:Button ID="btn_Submit" runat="server" Text="Submit" OnClick="btn_Submit_Click" />
    </div>
</asp:Content>

