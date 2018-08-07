<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="SignUp" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box}

/* Full-width input fields */
input[type=text], input[type=password] {
    width: 100%;
    padding: 15px;
    margin: 5px 0 22px 0;
    display: inline-block;
    border: none;
    background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
    background-color: #ddd;
    outline: none;
}

hr {
    border: 1px solid #f1f1f1;
    margin-bottom: 25px;
}

/* Set a style for all buttons */
button {
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    cursor: pointer;
    width: 100%;
    opacity: 0.9;
}

button:hover {
    opacity:1;
}

/* Extra styles for the cancel button */
.cancelbtn {
    padding: 14px 20px;
    background-color: #f44336;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtn, .signupbtn {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.container {
    padding: 16px;
}

/* Clear floats */
.clearfix::after {
    content: "";
    clear: both;
    display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
    .cancelbtn, .signupbtn {
       width: 100%;
    }

    body {font-family: Arial, Helvetica, sans-serif;}

form {
    border: 3px solid #f1f1f1;
    font-family: Arial;
    background-color: antiquewhite;
}

.container {
    padding: 10px;
    background-color: #e6f2ff;
}

input[type=text], input[type=submit] {
    width: 100%;
    padding: 12px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
}

input[type=checkbox] {
    margin-top: 16px;
}

input[type=submit] {
    background-color: #4CAF50;
    color: white;
    border: none;
}

input[type=submit]:hover {
    opacity: 0.8;
}
   
}

          .auto-style3 {
              margin-bottom: 22px;
          }

      </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<div class="container-login100" style="background-image: url('images/bg-01.jpg');">
  <div class="container">
    <h1>Sign Up</h1>
    <p>Please fill in this form to create an account.</p>
    <hr>

   <b>Email</b>
      <br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBoxEmail" ErrorMessage="Please key in email" ForeColor="Red"></asp:RequiredFieldValidator>
      <asp:TextBox ID="TextBoxEmail" runat="server" style="background-color: #ffffb3;
    color: black;" ></asp:TextBox>


      <b>
      <br />
      Password</b>
      <br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBoxPassword" ErrorMessage="Please key in password" ForeColor="Red"></asp:RequiredFieldValidator>
      <b>
      <asp:TextBox ID="TextBoxPassword" runat="server" style="background-color: #ffffb3
;
    color: black;" Textmode="Password"></asp:TextBox>
      <ajaxToolkit:PasswordStrength ID="TextBoxPassword_PasswordStrength" runat="server" BehaviorID="TextBoxPassword_PasswordStrength" TargetControlID="TextBoxPassword" />
      Repeat Password</b>
      <br />
      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBoxRepeatPassword" ErrorMessage="Please key in the same password" ForeColor="Red"></asp:RequiredFieldValidator>
      <asp:TextBox ID="TextBoxRepeatPassword" Textmode= "Password" runat="server" style="background-color: #ffffb3;color: black;"></asp:TextBox>


     
      <b>Date Of Birth</b>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBoxDate" ErrorMessage="Please select date of birth" ForeColor="Red"></asp:RequiredFieldValidator>
      <br />
      <asp:TextBox ID="TextBoxDate" runat="server" TextMode="Date" style="background-color: #ffffb3
;
    color: black;"></asp:TextBox>


        &nbsp;<br />
      <br />
          
          <label for="Gender"></label>
          <b>Gender</b><br />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Please select a gender" ForeColor="Red"></asp:RequiredFieldValidator>
          <asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="0" CellSpacing="0" Font-Size="18px" Height="26px" RepeatDirection="Horizontal" Width="213px">
              <asp:ListItem>Female</asp:ListItem>
              <asp:ListItem>Male</asp:ListItem>
          </asp:RadioButtonList>
     

              <br />
     
      
      <div class="clearfix">
          <b>Address<br />
          </b>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxAddress" ErrorMessage="Please enter details" ForeColor="Red"></asp:RequiredFieldValidator>
      <asp:TextBox ID="TextBoxAddress" runat="server" style="background-color:#ffffb3;
    color: black;"></asp:TextBox>
</div>

      <div class="clearfix">
          <b>Postal Code
          </b><br /><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBoxPostalCode" ErrorMessage="Please enter postal code" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<asp:TextBox ID="TextBoxPostalCode" runat="server" style="background-color: #ffffb3;
    color: black;"></asp:TextBox>
      
        
          </div>
      <br />
          <div class="clearfix">
   
        <asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="73px" Width="350px">
            <asp:ListItem>Remember Me</asp:ListItem>
            <asp:ListItem>Receive EXCLUSIVE UStora offers and updates</asp:ListItem>
              </asp:CheckBoxList>
    
  </div>

      
      <br />
      <br />
      
    <p>By creating an account you agree to our <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Terms.aspx">Terms & Conditions</asp:HyperLink></p>

    <div class="clearfix">
     
        <asp:Button ID="Button1" runat="server" Text="Cancel" Width="442px" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                
      
        <asp:Button ID="Button2" runat="server" Text="Sign Up" Width="442px" OnClick="Button2_Click" />
     </div>
    </div>
  </div>
        </asp:Panel>
    <asp:Panel ID="Panel2" runat="server">
            <table class="auto-style3">
        <tr>
            <td class="auto-style4"><h4>&nbsp;&nbsp; Enter Your Mobile Number</h4></td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="311px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td>
                <asp:Button ID="Button4" runat="server" OnClick="ButtonOTP_Click" Text="Send OTP" />
            </td>
        </tr>
    </table>
    </asp:Panel>
    <asp:Panel ID="Panel3" runat="server">
                <table class="auto-style5">
        <tr>
            <td class="auto-style7">
                <h4>&nbsp;&nbsp; OTP Number</h4>
            </td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="311px"></asp:TextBox>
            </td>
        </tr>
            <tr>
                <td class="auto-style8">
                   
                </td>
                <td>
                    <asp:Button ID="btn_verify" runat="server" OnClick="btn_verify_Click" Text="Verify" />
                </td>
            </tr>
     </table>
    </asp:Panel>
    <asp:Panel ID="Panel4" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    </asp:Panel>
</asp:Content>

