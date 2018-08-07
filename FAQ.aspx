<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FAQ.aspx.cs" Inherits="HelpPage" %>
<%@ MasterType VirtualPath="~/MasterPage.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div class="container">
    <div class="panel-group" id="accordion">
        <div class="faqHeader">General questions</div>
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">How To Track Your Order</a>
                </h3>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
               <strong>     FOR MOBILE:
                    1. On the side menu, click on Order Tracking
                    2. Order details of your latest order will be displayed with item level order statuses
3. Scroll further down to view the list of your older orders. Click on each order to expand for tracking details 
                    FOR DESKTOP:
                   1. Hover above the icon and click on "Track My Orders". Key in your order number and corresponding email address.
                   If your package has been shipped, there would be a live tracking link where you can access detailed information about your order status.
                2. If you are logged in.. Click on "View order" for the order you want to track.
                   </strong>




                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">How to cancel an Order</a>
                </h3>
            </div>
            <div id="collapseTen" class="panel-collapse collapse">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
                  <strong>  If your order has yet to be shipped and you have changed your mind, follow these simple steps to request for an order cancellation!

                  STEP 1. Go to ‘My Account’ > ‘Orders & Tracking’ > find your order and click on ‘View/edit order’. 
                   STEP 2. Next, click on 'Cancel Items' and check the ‘Select All’ box before submitting your request by clicking on ‘Cancel Selected Items'.
                   
                    Unfortunately, if you have received an email saying that your "Order is On Its Way", we will not be able to accommodate any cancellation requests. Your package would have been handed over to the assigned delivery partner and we will not be able to make amendments.
                  If it is a 'Cash on Delivery' and you’re still keen on canceling the order, you may refuse to accept the parcel upon delivery and simply inform the rider that you have changed your mind. Once the item is back in our warehouse, you will be refunded via Store Credit if applicable.
            </strong>
                    </div>

            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">How to Exchange or Refund/Return</a>
            
                       </h3>
            </div>
            <div id="collapseEleven" class="panel-collapse collapse">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
                <ul>
                     <strong>   Ustora offers free and easy exchanges and refunds/returns – no questions asked! Ensure that your item fulfills the conditions below and is not in the Non-Exchangeable & Non-Refundable Items & Brands list. There are just 4 easy steps to exchange and/or refund/return online!
                   <li>    STEP 1. Ensure you're logged in to your USTORA account and go to "Returns" </li>
                    <li>   STEP 2. Find the order you wish to return, and click on 'Exchange & Return'. Then, select the item you with to exchange or return for refund </li>
                     <li>  STEP 3. Indicate your exchange or refund request
                            (a) If you're going for an exchange, click on 'Exchange':
                             (i) Choose your new preferred color (if available).
                             (ii) Choose your new preferred size.
                       (b) If you're going for a return to refund, click on 'Return' and select your reason for returning - we would like to know how we can improve! You can opt to be refunded via:
                         (i) ZALORA Store Credit to enjoy a cash and card-free experience during your next purchase with us!
                         (ii) Your original payment method by clicking on "Show More Refund Options" </li>
                     <li>  STEP 4: Review request & submit
                       You will receive a confirmation email on your return request which includes your ezyReturn tracking number. You can use this tracking number to track your return parcel by logging on to www.speedpost.com.sg. </li>
                     <li>  STEP 5. Pack your items back into our reusable ZALORA bag or any other suitable packaging. </li>
                <li>   STEP 6. Head to any SingPost POPStation with your return parcel and your ezyReturn tracking number, and print out your return label. If you are unsure how to print out your return label, follow Singspost's guideline here. Please ensure to paste your return label on your return parcel before dropping it off. 
                 Alternatively, you can print out the return label in your 'Return request' email if you prefer to drop off your returns over a SingPost counter. </li>
                  <li>    STEP 7. Lastly, look out for an email notification once we have received your return item(s) at the Warehouse!  </li>
                       
                        </strong> 
                    </ul>
                </div>
            </div>
        </div>

      
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Return Policy</a>
                </h3>
            </div>
            <div id="collapseTwo" class="panel-collapse collapse">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
                <strong>Exchanging for a different product is strictly not allowed; We recommend to return your original item for a refund and place a new order for the different product.</strong>
<strong style="text-decoration: underline;">Refunds Process :</strong>

<strong><p>Refunds are typically issued via your preferred refund method indicated while filling up the 'Online Exchange and Return' request. If a refund method is not selected, by default the mode of refund is your original payment method, except Cash on delivery which is via Wallet Credit.

Using the table below, see what refund options are available to you. You will receive an email notification once your refund is processed. </p>

    <asp:image runat="server" ImageUrl="~/img/Return policy SG.png"></asp:image>

<p>For Bank Transfer refund option*, please ensure that the following details are provided completely and correctly:  
Once your refund has been processed at ZALORA's end, you will receive an email notification from us.</p>

<p>Full Name as Registered with Bank Account : </p>
<p>Bank Name & Account Type : </p>
<p>Account Number : </p>
<p>Bank Code : </p>
<p>Branch Code : </p>

                </p></strong>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree">Return processing time</a>
                </h3>
            </div>
            <div id="collapseThree" class="panel-collapse collapse">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
                <p> <strong style="text-decoration: underline;"> REFUND PROCESSING TIME: </strong> </p>

<strong>Using the table below, see when you would receive your refund after your return item has been processed by our warehouse (or if you have cancelled your items online).  

Please note:

We are unable to accommodate any refund reversal requests for Wallet Credit if 30 days have past from the refund date.
Any refunded store credit that is used on a new order, can only be refunded as Wallet Credit - even if a different refund method is selected. 
Exchange orders are only refundable via Wallet Credit. </strong>
                   
    <asp:image runat="server" ImageUrl="~/img/Capture.PNG"></asp:image>

                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive">Warranty</a>
                </h3>
            </div>
            <div id="collapseFive" class="panel-collapse collapse">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
           <strong><p>Watch Warranty: </p>
<p>As warranty instructions and procedures may differ across brands, please refer to the respective brand/company’s website for detailed information. Please note that online warranty registration may be required for certain brands as stated in the product description. The general warranty for watches are as follows:

1. For warranty service at each individual brand's Service Center, please present the duly completed warranty certificate or the original receipt of purchase (ZALORA Invoice). If the warranty is applied to the problem of your watch, the product will be repaired or replaced at the sole discretion of the Service Center. Repairs will be free of charge if it proves to be defective in material or workmanship under normal use.

2. Warranty is only for the movement, hands, dials or manufacturing defect. This warranty is void if the watch has been damaged by accident, improper and rough treatment, negligence, normal wear and tear, water damage, unless marked as water-resistant, or other factors not due to defects in material or workmanship.

3. Warranty does not cover Lens, Case, Strap, and Bracelet that is damaged or worn.

4. Warranty does not cover unauthorized repair and/or modification.

5. The battery in a quartz watch is inserted into the watch at origin and may not last the length of warranty and therefore, is not covered by the warranty.

6. Any form of guarantee from the Brand are their responsibility. You may contact the Brand directly.</p></strong>
                    <br/>
                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix">Payment Security</a>
                </h3>
            </div>
            <div id="collapseSix" class="panel-collapse collapse">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
                   <strong><li>1. Credit Card Information Storage
All credit card information are securely encrypted and stored with our gateway Cybersource, which is a subordinate company by VISA. This gives a second layer of protection for customers credit card information.
 </li>
<li>
2. CVV Verification
When you submit your credit card information, including CVV, our job is to encrypt the info and security transmit to issuers for payment verification and approval. However, verification of the CVV is totally upon issuer's decision. However, we can help to raise the concern to issuers.
 </li>

<li>
3. Fulfilling PCI Compliance
USTORA Website is fully PCI (Payment Card Industry Data Security Standard) compliant and we also have sophisticated fraud tools and experienced fraud specialists screening our daily orders.</strong>
</li>               

                </div>
            </div>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading" style=" padding: 20px;">
                <h3 class="panel-title">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEight">Payment Options</a>
                </h3> 
            </div>
            <div id="collapseEight" class="panel-collapse collapse">
                <div class="panel-body" style ="background-color: #ffffb3; color: black;">
                    <strong><li>CASH ON DELIVERY (COD):

COD is an exclusive service we provide to our customers. We deliver through our logistics partners Ta-q-bin or Ninja Van. 

Please note that you need to pay the Cash On Delivery amount before opening your parcel and trying on your items. This is for security and anonymity purposes. If you don't like the products or the size doesn't fit for you, you can always return the items afterward.</strong>
              </li>
                    <li>
                        CREDIT CARD
                    </li>
                    <li>DEBIT CARD</li>
                    <li>PayPal</li>

                </div>
            </div>
        </div>
       
    </div>
</div>

<style>
    .faqHeader {
        font-size: 27px;
        margin: 20px;
    }

    .panel-heading [data-toggle="collapse"]:after {
        font-family: 'Glyphicons Halflings';
        content: "\e072"; /* "play" icon */
        float: right;
        color: #F58723;
        font-size: 18px;
        line-height: 22px;
        /* rotate "play" icon from > (right arrow) to down arrow */
        -webkit-transform: rotate(-90deg);
        -moz-transform: rotate(-90deg);
        -ms-transform: rotate(-90deg);
        -o-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }

    .panel-heading [data-toggle="collapse"].collapsed:after {
        /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
        -webkit-transform: rotate(90deg);
        -moz-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
        -o-transform: rotate(90deg);
        transform: rotate(90deg);
        color: #454444;
    }
</style>
</asp:Content>

