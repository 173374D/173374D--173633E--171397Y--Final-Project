<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="css_Login" %>
<%@ MasterType VirtualPath="~/MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
        .auto-style3 {
            height: 51px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       
    <div style="margin:30px 10%;">
     <asp:Panel ID="Panel1" runat="server">
         <table class="nav-justified">
             <tr>
                 <td>
                     <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="False" Font-Overline="True" Font-Size="X-Large" Font-Strikeout="False" Font-Underline="True" Text="Account Login"></asp:Label>
                     <br />
                     <br />
                 </td>
             </tr>
             <tr>
                 <td>Email :
                     <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Pls Enter Email" ForeColor="#FF3300" ValidationGroup="a"></asp:RequiredFieldValidator>
                     <br />
                     <br />
                 </td>
             </tr>
             <tr>
                 <td class="auto-style1">Password :
                     <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPass" ErrorMessage="Pls Enter Password" ForeColor="#FF3300" ValidationGroup="a"></asp:RequiredFieldValidator>
                     <br />
                     <br />
                 </td>
             </tr>
             <tr>
                 <td>
                     <asp:Label ID="lblerr" runat="server"></asp:Label>
                     <br />
                     <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Register.aspx">Don&#39;t Have an Account, Register Now</asp:HyperLink>
                     <br />
                     <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/ForgotPass.aspx">Forgot Password?</asp:HyperLink>
                     <br />
                     <br />
                 </td>
             </tr>
             <tr>
                 <td class="auto-style3">
                     <asp:Button ID="btnLogin0" runat="server" Height="45px" OnClick="btnLogin_Click" Text="Login" ValidationGroup="a" />
                     &nbsp;&nbsp;
                    </td>
             </tr>
             <tr>
                 <td>
                     <br />
                     <br />
                     <br />
                 </td>
             </tr>
         </table>
    </asp:Panel>
   </div>
</asp:Content>

