<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductInsert.aspx.cs" Inherits="ProductInsert" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style4 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div style="margin: 30px 10%;">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <table class="responsive-textbox">
        <tr>
            <td>Product ID</td>
            <td>
                <asp:TextBox ID="tb_ProductID" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_ProductID" ErrorMessage="please give this product an ID" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Product Name</td>
            <td>
                <asp:TextBox ID="tb_ProductName" runat="server" Width="408px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_ProductName" ErrorMessage="please enter the product name" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Product Desc</td>
            <td>
                <asp:TextBox ID="tb_ProductDesc" runat="server" Height="98px" TextMode="MultiLine" Width="412px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_ProductDesc" ErrorMessage="please give this product some description" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>Unit Price</td>
            <td>
                <asp:TextBox ID="tb_UnitPrice" runat="server" Width="411px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="tb_UnitPrice" ErrorMessage="please enter the price for this product" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style4"></td>
            <td class="auto-style4">
                </td>
        </tr>
        <tr>
            <td>Stock Level</td>
            <td>
                <asp:TextBox ID="tb_StockLevel" runat="server" Width="411px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="tb_StockLevel" ErrorMessage="please enter the stock level" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Date Of Release</td>
            <td class="auto-style4">
                <asp:TextBox ID="tb_DOR" runat="server" Width="411px" TextMode="Date"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="tb_DOR_CalendarExtender" runat="server" BehaviorID="tb_DOR_CalendarExtender" TargetControlID="tb_DOR" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="tb_DOR" ErrorMessage="please enter the release date of this product" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Gender</td>
            <td class="auto-style4">
                <asp:DropDownList ID="tb_Gender" runat="server" Height="38px" Width="411px">
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="tb_Gender" ErrorMessage="please enter which gender is this product most suitable for" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">Brand
            <td class="auto-style4">
                <asp:TextBox ID="tb_Brand" runat="server" Width="411px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="tb_Brand" ErrorMessage="please enter a type of brand this product" ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style4">
                &nbsp;</td>
        </tr>
        <tr>
            <td>Product Image</td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="FileUpload1" ErrorMessage="please import a picture." ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <br />
                <asp:Label ID="lbl_Result" runat="server" Text="&lt; &lt;  &gt; &gt;"></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="btn_Insert" runat="server" OnClick="btn_Insert_Click" Text="Insert" ValidationGroup="a" />
&nbsp;&nbsp;
                <asp:Button ID="btn_ProductView" runat="server" OnClick="btn_ProductView_Click" Text="View Product List" />
            </td>
        </tr>
    </table>
             </div>
</asp:Content>

