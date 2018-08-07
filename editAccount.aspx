<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editAccount.aspx.cs" Inherits="editAccount" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="margin:30px 10%;">
         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
         <asp:Panel ID="PanelEdit" runat="server">
     
         <h2>Account Management</h2>Address :
         <asp:TextBox ID="txt_Address" runat="server"></asp:TextBox>
         <br />
         <br />
         PostalCode :
         <asp:TextBox ID="txt_Code" runat="server"></asp:TextBox>
         <br />
         <br />
         Old Password :
         <asp:TextBox ID="txt_old" runat="server" TextMode="Password"></asp:TextBox>
         <asp:Label ID="lbl_Wrong" runat="server"></asp:Label>
         <br />
         <br />
         New Password :
         <asp:TextBox ID="txt_new" runat="server" TextMode="Password"></asp:TextBox>
             <ajaxToolkit:PasswordStrength ID="txt_new_PasswordStrength" runat="server" BehaviorID="txt_new_PasswordStrength" TargetControlID="txt_new" />
         <asp:Label ID="lbl_New" runat="server"></asp:Label>
         <br />
         <br />
         confirm Password :
         <asp:TextBox ID="txt_Confirm" runat="server" TextMode="Password"></asp:TextBox>
         <asp:Label ID="lbl_Confirm" runat="server"></asp:Label>
         <br />
         <br />
         <asp:Button ID="btn_ChangePassword" runat="server" OnClick="btn_ChangePassword_Click" Text="Update" />
&nbsp;<br />
    </asp:Panel>
         <asp:Panel ID="PanelView" runat="server">
             <h2>Account Detail</h2>

             <p>
                 Email :
                 <asp:Label ID="lbl_Email" runat="server"></asp:Label>
             </p>
             <p>
                 Date Of Birth :
                 <asp:Label ID="lbl_DOB" runat="server"></asp:Label>
             </p>
             <p>
                 Gender :
                 <asp:Label ID="lbl_Gender" runat="server"></asp:Label>
             </p>
             <p>
                 Address :
                 <asp:Label ID="lbl_Address" runat="server"></asp:Label>
             </p>
             <p>
                 Postelcode :
                 <asp:Label ID="lbl_Postelcode" runat="server"></asp:Label>
             </p>
             <p>
                 <asp:Button ID="btn_Edit" runat="server" OnClick="btn_Edit_Click" Text="Edit" />
             </p>

         </asp:Panel>
     </div>
</asp:Content>

