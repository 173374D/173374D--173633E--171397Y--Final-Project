<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" UICulture="auto" Culture="Auto" EnableEventValidation="false" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style5 {
            height: 20px;
        }

        .auto-style6 {
            width: 97%;
            height: 158px;
        }

        .auto-style7 {
            width: 179px;
            text-align: center;
        }

        .auto-style8 {
            height: 32px;
        }
    .auto-style9 {
        height: 18px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="slider-area">
        <!-- Slider -->
        <div class="block-slider block-slider4">
            <ul class="" id="bxslider-home4">
                <li>
                    <img src="img/Seiko.jpg" alt="Slide">
                    <div class="caption-group">
                        <h2 class="caption title">SEIKO WATCHES
                        </h2>
                        <h4 class="caption subtitle">ALWAY ONE STEP AHEAD OF THE REST</h4>
                        <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                    </div>
                </li>
                <li>
                    <img src="img/fossil.jpg" alt="Slide">
                    <div class="caption-group">
                        <h2 class="caption title">FOSSIL WATCHES
                        </h2>
                        <h4 class="caption subtitle">FOSSIL WATCHES ARE PERFECT
                            <br />
                            FOR ANY OCCASION</h4>
                        <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                    </div>
                </li>
                <li>
                    <img src="img/apple.jpg" alt="Slide">
                    <div class="caption-group">
                        <h2 class="caption title">APPLES SMART WATCHES
                        </h2>
                        <h4 class="caption subtitle">THERE'S AN APPLE WATCH FOR EVERYONE</h4>
                        <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                    </div>
                </li>
                <li>
                    <img src="img/rolex.jpg" alt="Slide">
                    <div class="caption-group">
                        <h2 class="caption title">ROLEX WATCHES
                        </h2>
                        <h4 class="caption subtitle">A CROWN FOR EVERY ACHIEVEMENT</h4>
                        <a class="caption button-radius" href="#"><span class="icon"></span>Shop now</a>
                    </div>
                </li>
            </ul>
        </div>
        <!-- ./Slider -->
    </div>
    <!-- End slider area -->
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo1">
                        <i class="fa fa-refresh"></i>
                        <p>
                            <asp:Label ID="lbl_Return" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo2">
                        <i class="fa fa-truck"></i>
                        <p>
                            <asp:Label ID="lbl_Shipping" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo3">
                        <i class="fa fa-lock"></i>
                        <p>
                            <asp:Label ID="lbl_Payment" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo promo4">
                        <i class="fa fa-gift"></i>
                        <p>
                            <asp:Label ID="lbl_Product" runat="server"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End promo area -->

    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Latest Products</h2>
                        <div class="product-carousel">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/Omega_De_Ville_Prestige.jpg" alt="">
                                    <div class="product-hover">
                                        <a class="add-to-cart-link">
                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server"><ContentTemplate>
                                            <asp:Button ID="btn_1" runat="server" Text="" Width="100%" OnClick="btn_1_Click" /></ContentTemplate></asp:UpdatePanel></a>

                                    </div>
                                </div>

                                <h2><a href="ProductDetails.aspx?ProdID=4">Omega De Ville Prestige</a></h2>

                                <div class="product-carousel-price">
                                    <ins style="margin: auto 10px;">$14,450</ins>
                                    <asp:ImageButton runat="server" ImageUrl="~/img/heart.png" Width="13px" ID="btnwish1" OnClick="btnwish1_Click"></asp:ImageButton>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/Cartier_Panthere_de_Cartier.jpg" alt="">
                                    <div class="product-hover">
                                        <a class="add-to-cart-link">
                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server"><ContentTemplate>
                                            <asp:Button ID="btn_2" runat="server" Text="" OnClick="btn_2_Click" /> </ContentTemplate></asp:UpdatePanel></a>
                                               

                                    </div>
                                </div>
                                <h2><a href="ProductDetails.aspx?ProdID=2">Panthère de Cartier</a></h2>

                                <div class="product-carousel-price">
                                    <ins style="margin: auto 10px;">$5,500</ins><asp:ImageButton runat="server" ImageUrl="~/img/heart.png" Width="13px" ID="btnwish2" OnClick="btnwish2_Click"></asp:ImageButton>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/Fossil_FS5275.jpg" alt="">
                                    <div class="product-hover">
                                        <a class="add-to-cart-link"> <asp:UpdatePanel ID="UpdatePanel4" runat="server"><ContentTemplate>
                                            <asp:Button ID="btn_3" runat="server" Text="" Width="100%" OnClick="btn_3_Click" /></ContentTemplate></asp:UpdatePanel></a>


                                    </div>
                                </div>

                                <h2><a href="ProductDetails.aspx?ProdID=3">Fossil The Commuter-FS5275</a></h2>

                                <div class="product-carousel-price">
                                    <ins style="margin: auto 10px;">$95.00</ins><asp:ImageButton runat="server" ImageUrl="~/img/heart.png" Width="13px" ID="btnwish3" OnClick="btnwish3_Click"></asp:ImageButton>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/Apple_Juuk_Ligero_Cosmic_Grey.jpg" alt="">
                                    <div class="product-hover">
                                        <a class="add-to-cart-link"> <asp:UpdatePanel ID="UpdatePanel5" runat="server"><ContentTemplate>
                                            <asp:Button ID="btn_4" runat="server" Text="" Width="100%" OnClick="btn_4_Click" /></ContentTemplate></asp:UpdatePanel></a>

                                    </div>
                                </div>

                                <h2><a href=".ProductDetails.aspx?ProdID=1">Apple Juuk Ligero Cosmic Grey</a></h2>

                                <div class="product-carousel-price">
                                    <ins style="margin: auto 10px;">$119</ins><asp:ImageButton runat="server" ImageUrl="~/img/heart.png" Width="13px" ID="btnwish4" OnClick="btnwish4_Click"></asp:ImageButton>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/Rolex_submariner.jpg" alt="">
                                    <div class="product-hover">
                                        <a class="add-to-cart-link"> <asp:UpdatePanel ID="UpdatePanel6" runat="server"><ContentTemplate>
                                            <asp:Button ID="btn_5" runat="server" Text="" Width="100%" OnClick="btn_5_Click" /></ContentTemplate></asp:UpdatePanel></a>

                                    </div>
                                </div>

                                <h2><a href="ProductDetails.aspx?ProdID=5">The Submariner</a></h2>

                                <div class="product-carousel-price">
                                    <ins style="margin: auto 10px;">$18,070</ins><asp:ImageButton runat="server" ImageUrl="~/img/heart.png" Width="13px" ID="btnwish5" OnClick="btnwish5_Click"></asp:ImageButton>
                                </div>
                            </div>
                            <div class="single-product">
                                <div class="product-f-image">
                                    <img src="img/Seiko_SKX173.jpg" alt="">
                                    <div class="product-hover">
                                        <a class="add-to-cart-link"> <asp:UpdatePanel ID="UpdatePanel7" runat="server"><ContentTemplate>
                                            <asp:Button ID="btn_6" runat="server" Text="" Width="100%" OnClick="btn_6_Click" /></ContentTemplate></asp:UpdatePanel></a>

                                    </div>
                                </div>

                                <h2><a href="ProductDetails.aspx?ProdID=6">Automatic Dive Watch </a></h2>

                                <div class="product-carousel-price">
                                    <ins style="margin: auto 10px;">$250.00</ins><del style="margin: auto 10px;">$450.00</del><asp:ImageButton runat="server" ImageUrl="~/img/heart.png" Width="13px" ID="btnwish6" OnClick="btnwish6_Click"></asp:ImageButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End main content area -->

    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <div class="brand-list">
                            <img src="img/logo_Rolex.png" alt="">
                            <img src="img/logo_Seiko.png" alt="">
                            <img src="img/logo_Fossil.png" alt="">
                            <img src="img/logo_Omega.png" alt="">
                            <img src="img/logo_Corum.png" alt="">
                            <img src="img/logo_Cartier.png" alt="">
                            <img src="img/logo_Apple.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- End brands area -->

            <div style="margin: 10px 10%;">
                <div class="col-sm-4">
                    <asp:Label ID="lbl_popular" runat="server" Text=""></asp:Label>
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style7" rowspan="5">
                                        <asp:Image ID="Image2" runat="server" Height="162px" ImageUrl='<%# Eval("Product_Image") %>' Width="154px" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="viewdetail" CommandArgument='<% #Eval("Product_ID")%>' Text='<%# Eval("Product_Name") %>'></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Image ID="Image3" runat="server" Height="16px" Width="128px" ImageUrl="~/img/4.png" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Unit_Price") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Stock_Level") %>'></asp:Label>
                                        &nbsp;left</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" ImageUrl="~/img/addcart.png" Width="36px" CommandName="addart" CommandArgument='<% #Eval("Product_ID")%>' />
                                        &nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/img/heart.png" Width="36px" CommandName="wishlist" CommandArgument='<%# Eval("Product_ID") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:Button ID="btn_first" runat="server" Text="<<" OnClick="btn_first_Click" />
                    &nbsp;<asp:Button ID="btn_prev" runat="server" Text="<" OnClick="btn_prev_Click" />
                    &nbsp;<asp:Button ID="btn_next" runat="server" Text=">" OnClick="btn_next_Click" />
                    &nbsp;<asp:Button ID="btn_last" runat="server" Text=">>" OnClick="btn_last_Click" />
                </div>
                <div class="col-sm-4">
                         <asp:Label ID="lbl_Recommended" runat="server" Text=""></asp:Label>
                    <asp:DataList ID="DataList2" runat="server" RepeatColumns="1" OnItemCommand="DataList2_ItemCommand">
                        <ItemTemplate>
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style7" rowspan="5">
                                        <asp:Image ID="Image2" runat="server" Height="162px" ImageUrl='<%# Eval("Product_Image") %>' Width="154px" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="viewdetail1" CommandArgument='<% #Eval("Product_ID")%>' Text='<%# Eval("Product_Name") %>'></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style5">
                                        <asp:Image ID="Image3" runat="server" Height="16px" Width="128px" ImageUrl="~/img/4.png" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Unit_Price") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Stock_Level") %>'></asp:Label>
                                        &nbsp;left</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" ImageUrl="~/img/addcart.png" Width="36px" CommandName="addcart1" CommandArgument='<% #Eval("Product_ID")%>' />
                                        &nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/img/heart.png" Width="36px" CommandName="wishlist1" CommandArgument='<%# Eval("Product_ID") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:Button ID="btn_first1" runat="server" Text="<<" OnClick="btn_first1_Click" />
                    &nbsp;<asp:Button ID="btn_prev1" runat="server" Text="<" OnClick="btn_prev1_Click" />
                    &nbsp;<asp:Button ID="btn_next1" runat="server" Text=">" OnClick="btn_next1_Click" />
                    &nbsp;<asp:Button ID="btn_last1" runat="server" Text=">>" OnClick="btn_last1_Click" />
                </div>
                <div class="col-sm-4">
                           <asp:Label ID="lbl_recently" runat="server" Text=""></asp:Label>
                    <asp:DataList ID="DataList3" runat="server" RepeatColumns="1" OnItemCommand="DataList3_ItemCommand">
                        <ItemTemplate>
                            <table class="auto-style6">
                                <tr>
                                    <td class="auto-style7" rowspan="5">
                                        <asp:Image ID="Image2" runat="server" Height="162px" ImageUrl='<%# Eval("Product_Image") %>' Width="154px" />
                                    </td>
                                    <td>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="viewdetail2" CommandArgument='<% #Eval("Product_ID")%>' Text='<%# Eval("Product_Name") %>'></asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style9">
                                        <asp:Image ID="Image3" runat="server" Height="16px" Width="128px" ImageUrl="~/img/4.png" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style8">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Unit_Price") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Stock_Level") %>'></asp:Label>
                                        &nbsp;left</td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:ImageButton ID="ImageButton1" runat="server" Height="29px" ImageUrl="~/img/addcart.png" Width="36px" CommandName="addcart2" CommandArgument='<% #Eval("Product_ID")%>' />
                                        &nbsp;&nbsp;
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="29px" ImageUrl="~/img/heart.png" Width="36px" CommandName="wishlist2" CommandArgument='<%# Eval("Product_ID") %>' />
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <br />
                    <asp:Button ID="btn_first2" runat="server" Text="<<" OnClick="btn_first2_Click" />
                    &nbsp;<asp:Button ID="btn_prev2" runat="server" Text="<" OnClick="btn_prev2_Click" />
                    &nbsp;<asp:Button ID="btn_next2" runat="server" Text=">" OnClick="btn_next2_Click" />
                    &nbsp;<asp:Button ID="btn_last2" runat="server" Text=">>" OnClick="btn_last2_Click" />
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
    <br />
    <br />
    <br />
</asp:Content>

