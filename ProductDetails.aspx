<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="ProductDetail" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        
        .auto-style4 {
            width: 367px;
        }

        .auto-style5 {
            height: 150px;
            text-align: left;
        }

        .auto-style6 {
            height: 33px;
            text-align: left;
        }

        .auto-style7 {
            height: 31px;
            text-align: left;
        }

        .starempty {
            background-image: url(img/starempty.png);
            width: 50px;
            height: 50px;
        }

        .starfilled {
            background-image: url(img/starfilled.png);
            width: 50px;
            height: 50px;
        }

        .starwaiting {
            background-image: url(img/starwaiting.png);
            width: 50px;
            height: 50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div style="margin: 30px 10%;">
                PRODUCT DETAILS<br />
                <table class="responsive-textbox">
                    <tr>
                        <td class="auto-style4" rowspan="4">
                            <asp:Image ID="img_Product" runat="server" Width="100%" />
                        </td>
                        <td class="auto-style6">
                            <asp:Label ID="lbl_ProdName" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">
                            <asp:Label ID="lbl_ProdDesc" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7">
                            $<asp:Label ID="lbl_Price" runat="server"></asp:Label>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td class="text-left">
                            <asp:Button ID="Btn_Add" runat="server" OnClick="Btn_Add_Click" Text="Add to Cart" Width="151px" />

                        &nbsp;
                            <asp:Button ID="btn_wish" runat="server" OnClick="btn_wish_Click" Text="Add to Wishlist" Width="168px" />

                        </td>
                    </tr>
                </table>

                <br />

                <p>
                    Product ID =
    <asp:Label ID="lbl_ProdID" runat="server"></asp:Label>
                </p>
                <p>
                    &nbsp;
                </p>
                <p>
                    &nbsp;
                </p>
                <h1>Reviews</h1>
                <div class="col-md-6">
                    <div style="margin-bottom: 10px;">
                        <h4>Name :</h4>
                        <asp:TextBox ID="txtName" runat="server" Width="80%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Please tell us your name." ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
                    <div style="margin-bottom: 10px;">
                        <h4>Comment :</h4>
                        <asp:TextBox ID="txtComment" runat="server" Height="83px" TextMode="MultiLine" Width="80%"></asp:TextBox>
                        <br />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtComment" ErrorMessage="Please share your opinion with us." ForeColor="Red" ValidationGroup="a"></asp:RequiredFieldValidator>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <ajaxToolkit:Rating ID="Rating1" runat="server" EmptyStarCssClass="starempty" FilledStarCssClass="starfilled" CurrentRating="0" MaxRating="5" StarCssClass="starempty" WaitingStarCssClass="starwaiting" Direction="LeftToRight" OnClick="Rating1_Click" AutoPostBack="False">
                            </ajaxToolkit:Rating>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    <br />
                    &nbsp;<br />
                    <br />
                    <asp:Label ID="lblRating" runat="server"></asp:Label>
                    <br />
                    &nbsp;<div style="margin-bottom: 10px;">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="a" />
                    </div>
                </div>
                <div class="col-md-6">
                    <asp:DataList ID="DataList1" runat="server" Height="99px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" Width="100%">
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <ItemStyle BackColor="White" />
                        <ItemTemplate>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lbl_Name" runat="server" Text='<%# Eval("Name") %>' Width="90%"></asp:Label>

                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;
          <asp:Image ID="Image1" runat="server" Height="16px" ImageUrl='<%# Eval("image") %>' Width="98px" />

                            <br />
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lbl_Comment" runat="server" Text='<%# Eval("Comment") %>'></asp:Label>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                    <br />
                    <asp:Button ID="btn_first" runat="server" Height="40px" OnClick="btn_first_Click" Text="&lt;&lt;" Width="52px" />
                    &nbsp;<asp:Button ID="btn_prev" runat="server" Height="40px" OnClick="btn_prev_Click" Text="&lt;" Width="52px" />
                    &nbsp;<asp:Button ID="btn_next" runat="server" Height="40px" OnClick="btn_next_Click" Text="&gt;" Width="52px" />
                    &nbsp;<asp:Button ID="btn_last" runat="server" Height="40px" OnClick="btn_last_Click" Text="&gt;&gt;" Width="52px" />
                </div>
            </div>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
</asp:Content>

