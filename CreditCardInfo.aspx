<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreditCardInfo.aspx.cs" Inherits="CreditCardInfo" EnableEventValidation="false"%>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>






.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {

}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
    .auto-style3 {
        height: 53px;
    }
    .auto-style6 {
        width: 352px;
    }
    .auto-style7 {
        width: 90px;
    }
    </style>


<h2 style="text-align:center" class="auto-style3">Checkout Form</h2>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="/action_page.php">
      
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname">&nbsp;
              <table class="responsive-textbox">
                  <tr>
                      <td class="auto-style6">
            <label for="fname">First Name&nbsp;</label></td>
                      <td class="auto-style7">Last Name</td>
                      <td>

                          <asp:Label ID="lbl_name" runat="server"></asp:Label>
 
                      </td>
                  </tr>
                  <tr>
                      <td class="auto-style6"><asp:TextBox ID="TextBoxFirstname" runat="server" style="background-color: #ffffb3;color: black;" Width="313px"></asp:TextBox></td>
                      <td colspan="2"><asp:TextBox ID="TextBoxLastname" runat="server" style="background-color: #ffffb3;color: black;" Width="313px"></asp:TextBox>

            

                      </td>
                  </tr>
              </table>
              </label>
              &nbsp;&nbsp;

            

            <label for="email"><i class="fa fa-envelope"></i> Email&nbsp;&nbsp;&nbsp;
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please put in a valid email" ForeColor="Red" ControlToValidate="TextBoxEmail"></asp:RequiredFieldValidator>
              </label>
              &nbsp;<asp:TextBox ID="TextBoxEmail" runat="server" style="background-color: #ffffb3; color: black;"></asp:TextBox>

            <label for="adr"><i class="fa fa-address-card-o"></i> Address&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please put in address" ForeColor="Red" ControlToValidate="TextBoxAddress"></asp:RequiredFieldValidator>
              </label>
              &nbsp;<asp:TextBox ID="TextBoxAddress" runat="server" style="background-color: #ffffb3; color: black;"></asp:TextBox>

            <label for="city"><i class="fa fa-institution"></i> City&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please put in city" ForeColor="Red" ControlToValidate="TextBoxCity"></asp:RequiredFieldValidator>
              </label>
              &nbsp;<asp:TextBox ID="TextBoxCity" runat="server" style="background-color: #ffffb3; color: black;"></asp:TextBox>

            <div class="row">
              <div class="col-50">
                <label for="state">Country&nbsp;&nbsp;
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dropdownlist" ErrorMessage="Please put in your country" ForeColor="Red"></asp:RequiredFieldValidator>
                  </label>
                  &nbsp;<asp:DropDownList ID="dropdownlist" name="shipping_country" runat="server" Height="35px" Width="256px">
                            <asp:ListItem Value="">Select a country窶ｦ</asp:ListItem>
                            <asp:ListItem Value="AX">ﾃ・and Islands</asp:ListItem>
                            <asp:ListItem Value="AF">Afghanistan</asp:ListItem>
                            <asp:ListItem Value="AL">Albania</asp:ListItem>
                            <asp:ListItem Value="DZ">Algeria</asp:ListItem>
                            <asp:ListItem Value="AD">Andorra</asp:ListItem>
                            <asp:ListItem Value="AO">Angola</asp:ListItem>
                            <asp:ListItem Value="AI">Anguilla</asp:ListItem>
                            <asp:ListItem Value="AQ">Antarctica</asp:ListItem>
                            <asp:ListItem Value="AG">Antigua and Barbuda</asp:ListItem>
                            <asp:ListItem Value="AR">Argentina</asp:ListItem>
                            <asp:ListItem Value="AM">Armenia</asp:ListItem>
                            <asp:ListItem Value="AW">Aruba</asp:ListItem>
                            <asp:ListItem Value="AU">Australia</asp:ListItem>
                            <asp:ListItem Value="AT">Austria</asp:ListItem>
                            <asp:ListItem Value="AZ">Azerbaijan</asp:ListItem>
                            <asp:ListItem Value="BS">Bahamas</asp:ListItem>
                            <asp:ListItem Value="BH">Bahrain</asp:ListItem>
                            <asp:ListItem Value="BD">Bangladesh</asp:ListItem>
                            <asp:ListItem Value="BB">Barbados</asp:ListItem>
                            <asp:ListItem Value="BY">Belarus</asp:ListItem>
                            <asp:ListItem Value="PW">Belau</asp:ListItem>
                            <asp:ListItem Value="BE">Belgium</asp:ListItem>
                            <asp:ListItem Value="BZ">Belize</asp:ListItem>
                            <asp:ListItem Value="BJ">Benin</asp:ListItem>
                            <asp:ListItem Value="BM">Bermuda</asp:ListItem>
                            <asp:ListItem Value="BT">Bhutan</asp:ListItem>
                            <asp:ListItem Value="BO">Bolivia</asp:ListItem>
                            <asp:ListItem Value="BQ">Bonaire, Saint Eustatius and Saba</asp:ListItem>
                            <asp:ListItem Value="BA">Bosnia and Herzegovina</asp:ListItem>
                            <asp:ListItem Value="BW">Botswana</asp:ListItem>
                            <asp:ListItem Value="BV">Bouvet Island</asp:ListItem>
                            <asp:ListItem Value="BR">Brazil</asp:ListItem>
                            <asp:ListItem Value="IO">British Indian Ocean Territory</asp:ListItem>
                            <asp:ListItem Value="VG">British Virgin Islands</asp:ListItem>
                            <asp:ListItem Value="BN">Brunei</asp:ListItem>
                            <asp:ListItem Value="BG">Bulgaria</asp:ListItem>
                            <asp:ListItem Value="BF">Burkina Faso</asp:ListItem>
                            <asp:ListItem Value="BI">Burundi</asp:ListItem>
                            <asp:ListItem Value="KH">Cambodia</asp:ListItem>
                            <asp:ListItem Value="CM">Cameroon</asp:ListItem>
                            <asp:ListItem Value="CA">Canada</asp:ListItem>
                            <asp:ListItem Value="CV">Cape Verde</asp:ListItem>
                            <asp:ListItem Value="KY">Cayman Islands</asp:ListItem>
                            <asp:ListItem Value="CF">Central African Republic</asp:ListItem>
                            <asp:ListItem Value="TD">Chad</asp:ListItem>
                            <asp:ListItem Value="CL">Chile</asp:ListItem>
                            <asp:ListItem Value="CN">China</asp:ListItem>
                            <asp:ListItem Value="CX">Christmas Island</asp:ListItem>
                            <asp:ListItem Value="CC">Cocos (Keeling) Islands</asp:ListItem>
                            <asp:ListItem Value="CO">Colombia</asp:ListItem>
                            <asp:ListItem Value="KM">Comoros</asp:ListItem>
                            <asp:ListItem Value="CG">Congo (Brazzaville)</asp:ListItem>
                            <asp:ListItem Value="CD">Congo (Kinshasa)</asp:ListItem>
                            <asp:ListItem Value="CK">Cook Islands</asp:ListItem>
                            <asp:ListItem Value="CR">Costa Rica</asp:ListItem>
                            <asp:ListItem Value="HR">Croatia</asp:ListItem>
                            <asp:ListItem Value="CU">Cuba</asp:ListItem>
                            <asp:ListItem Value="CW">Curaﾃ㌢o</asp:ListItem>
                            <asp:ListItem Value="CY">Cyprus</asp:ListItem>
                            <asp:ListItem Value="CZ">Czech Republic</asp:ListItem>
                            <asp:ListItem Value="DK">Denmark</asp:ListItem>
                            <asp:ListItem Value="DJ">Djibouti</asp:ListItem>
                            <asp:ListItem Value="DM">Dominica</asp:ListItem>
                            <asp:ListItem Value="DO">Dominican Republic</asp:ListItem>
                            <asp:ListItem Value="EC">Ecuador</asp:ListItem>
                            <asp:ListItem Value="EG">Egypt</asp:ListItem>
                            <asp:ListItem Value="SV">El Salvador</asp:ListItem>
                            <asp:ListItem Value="GQ">Equatorial Guinea</asp:ListItem>
                            <asp:ListItem Value="ER">Eritrea</asp:ListItem>
                            <asp:ListItem Value="EE">Estonia</asp:ListItem>
                            <asp:ListItem Value="ET">Ethiopia</asp:ListItem>
                            <asp:ListItem Value="FK">Falkland Islands</asp:ListItem>
                            <asp:ListItem Value="FO">Faroe Islands</asp:ListItem>
                            <asp:ListItem Value="FJ">Fiji</asp:ListItem>
                            <asp:ListItem Value="FI">Finland</asp:ListItem>
                            <asp:ListItem Value="FR">France</asp:ListItem>
                            <asp:ListItem Value="GF">French Guiana</asp:ListItem>
                            <asp:ListItem Value="PF">French Polynesia</asp:ListItem>
                            <asp:ListItem Value="TF">French Southern Territories</asp:ListItem>
                            <asp:ListItem Value="GA">Gabon</asp:ListItem>
                            <asp:ListItem Value="GM">Gambia</asp:ListItem>
                            <asp:ListItem Value="GE">Georgia</asp:ListItem>
                            <asp:ListItem Value="DE">Germany</asp:ListItem>
                            <asp:ListItem Value="GH">Ghana</asp:ListItem>
                            <asp:ListItem Value="GI">Gibraltar</asp:ListItem>
                            <asp:ListItem Value="GR">Greece</asp:ListItem>
                            <asp:ListItem Value="GL">Greenland</asp:ListItem>
                            <asp:ListItem Value="GD">Grenada</asp:ListItem>
                            <asp:ListItem Value="GP">Guadeloupe</asp:ListItem>
                            <asp:ListItem Value="GT">Guatemala</asp:ListItem>
                            <asp:ListItem Value="GG">Guernsey</asp:ListItem>
                            <asp:ListItem Value="GN">Guinea</asp:ListItem>
                            <asp:ListItem Value="GW">Guinea-Bissau</asp:ListItem>
                            <asp:ListItem Value="GY">Guyana</asp:ListItem>
                            <asp:ListItem Value="HT">Haiti</asp:ListItem>
                            <asp:ListItem Value="HM">Heard Island and McDonald Islands</asp:ListItem>
                            <asp:ListItem Value="HN">Honduras</asp:ListItem>
                            <asp:ListItem Value="HK">Hong Kong</asp:ListItem>
                            <asp:ListItem Value="HU">Hungary</asp:ListItem>
                            <asp:ListItem Value="IS">Iceland</asp:ListItem>
                            <asp:ListItem Value="IN">India</asp:ListItem>
                            <asp:ListItem Value="ID">Indonesia</asp:ListItem>
                            <asp:ListItem Value="IR">Iran</asp:ListItem>
                            <asp:ListItem Value="IQ">Iraq</asp:ListItem>
                            <asp:ListItem Value="IM">Isle of Man</asp:ListItem>
                            <asp:ListItem Value="IL">Israel</asp:ListItem>
                            <asp:ListItem Value="IT">Italy</asp:ListItem>
                            <asp:ListItem Value="CI">Ivory Coast</asp:ListItem>
                            <asp:ListItem Value="JM">Jamaica</asp:ListItem>
                            <asp:ListItem Value="JP">Japan</asp:ListItem>
                            <asp:ListItem Value="JE">Jersey</asp:ListItem>
                            <asp:ListItem Value="JO">Jordan</asp:ListItem>
                            <asp:ListItem Value="KZ">Kazakhstan</asp:ListItem>
                            <asp:ListItem Value="KE">Kenya</asp:ListItem>
                            <asp:ListItem Value="KI">Kiribati</asp:ListItem>
                            <asp:ListItem Value="KW">Kuwait</asp:ListItem>
                            <asp:ListItem Value="KG">Kyrgyzstan</asp:ListItem>
                            <asp:ListItem Value="LA">Laos</asp:ListItem>
                            <asp:ListItem Value="LV">Latvia</asp:ListItem>
                            <asp:ListItem Value="LB">Lebanon</asp:ListItem>
                            <asp:ListItem Value="LS">Lesotho</asp:ListItem>
                            <asp:ListItem Value="LR">Liberia</asp:ListItem>
                            <asp:ListItem Value="LY">Libya</asp:ListItem>
                            <asp:ListItem Value="LI">Liechtenstein</asp:ListItem>
                            <asp:ListItem Value="LT">Lithuania</asp:ListItem>
                            <asp:ListItem Value="LU">Luxembourg</asp:ListItem>
                            <asp:ListItem Value="MO">Macao S.A.R., China</asp:ListItem>
                            <asp:ListItem Value="MK">Macedonia</asp:ListItem>
                            <asp:ListItem Value="MG">Madagascar</asp:ListItem>
                            <asp:ListItem Value="MW">Malawi</asp:ListItem>
                            <asp:ListItem Value="MY">Malaysia</asp:ListItem>
                            <asp:ListItem Value="MV">Maldives</asp:ListItem>
                            <asp:ListItem Value="ML">Mali</asp:ListItem>
                            <asp:ListItem Value="MT">Malta</asp:ListItem>
                            <asp:ListItem Value="MH">Marshall Islands</asp:ListItem>
                            <asp:ListItem Value="MQ">Martinique</asp:ListItem>
                            <asp:ListItem Value="MR">Mauritania</asp:ListItem>
                            <asp:ListItem Value="MU">Mauritius</asp:ListItem>
                            <asp:ListItem Value="YT">Mayotte</asp:ListItem>
                            <asp:ListItem Value="MX">Mexico</asp:ListItem>
                            <asp:ListItem Value="FM">Micronesia</asp:ListItem>
                            <asp:ListItem Value="MD">Moldova</asp:ListItem>
                            <asp:ListItem Value="MC">Monaco</asp:ListItem>
                            <asp:ListItem Value="MN">Mongolia</asp:ListItem>
                            <asp:ListItem Value="ME">Montenegro</asp:ListItem>
                            <asp:ListItem Value="MS">Montserrat</asp:ListItem>
                            <asp:ListItem Value="MA">Morocco</asp:ListItem>
                            <asp:ListItem Value="MZ">Mozambique</asp:ListItem>
                            <asp:ListItem Value="MM">Myanmar</asp:ListItem>
                            <asp:ListItem Value="NA">Namibia</asp:ListItem>
                            <asp:ListItem Value="NR">Nauru</asp:ListItem>
                            <asp:ListItem Value="NP">Nepal</asp:ListItem>
                            <asp:ListItem Value="NL">Netherlands</asp:ListItem>
                            <asp:ListItem Value="AN">Netherlands Antilles</asp:ListItem>
                            <asp:ListItem Value="NC">New Caledonia</asp:ListItem>
                            <asp:ListItem Value="NZ">New Zealand</asp:ListItem>
                            <asp:ListItem Value="NI">Nicaragua</asp:ListItem>
                            <asp:ListItem Value="NE">Niger</asp:ListItem>
                            <asp:ListItem Value="NG">Nigeria</asp:ListItem>
                            <asp:ListItem Value="NU">Niue</asp:ListItem>
                            <asp:ListItem Value="NF">Norfolk Island</asp:ListItem>
                            <asp:ListItem Value="KP">North Korea</asp:ListItem>
                            <asp:ListItem Value="NO">Norway</asp:ListItem>
                            <asp:ListItem Value="OM">Oman</asp:ListItem>
                            <asp:ListItem Value="PK">Pakistan</asp:ListItem>
                            <asp:ListItem Value="PS">Palestinian Territory</asp:ListItem>
                            <asp:ListItem Value="PA">Panama</asp:ListItem>
                            <asp:ListItem Value="PG">Papua New Guinea</asp:ListItem>
                            <asp:ListItem Value="PY">Paraguay</asp:ListItem>
                            <asp:ListItem Value="PE">Peru</asp:ListItem>
                            <asp:ListItem Value="PH">Philippines</asp:ListItem>
                            <asp:ListItem Value="PN">Pitcairn</asp:ListItem>
                            <asp:ListItem Value="PL">Poland</asp:ListItem>
                            <asp:ListItem Value="PT">Portugal</asp:ListItem>
                            <asp:ListItem Value="QA">Qatar</asp:ListItem>
                            <asp:ListItem Value="IE">Republic of Ireland</asp:ListItem>
                            <asp:ListItem Value="RE">Reunion</asp:ListItem>
                            <asp:ListItem Value="RO">Romania</asp:ListItem>
                            <asp:ListItem Value="RU">Russia</asp:ListItem>
                            <asp:ListItem Value="RW">Rwanda</asp:ListItem>
                            <asp:ListItem Value="ST">Sﾃ｣o Tomﾃｩ and Prﾃｭncipe</asp:ListItem>
                            <asp:ListItem Value="BL">Saint Barthﾃｩlemy</asp:ListItem>
                            <asp:ListItem Value="SH">Saint Helena</asp:ListItem>
                            <asp:ListItem Value="KN">Saint Kitts and Nevis</asp:ListItem>
                            <asp:ListItem Value="LC">Saint Lucia</asp:ListItem>
                            <asp:ListItem Value="SX">Saint Martin (Dutch part)</asp:ListItem>
                            <asp:ListItem Value="MF">Saint Martin (French part)</asp:ListItem>
                            <asp:ListItem Value="PM">Saint Pierre and Miquelon</asp:ListItem>
                            <asp:ListItem Value="VC">Saint Vincent and the Grenadines</asp:ListItem>
                            <asp:ListItem Value="SM">San Marino</asp:ListItem>
                            <asp:ListItem Value="SA">Saudi Arabia</asp:ListItem>
                            <asp:ListItem Value="SN">Senegal</asp:ListItem>
                            <asp:ListItem Value="RS">Serbia</asp:ListItem>
                            <asp:ListItem Value="SC">Seychelles</asp:ListItem>
                            <asp:ListItem Value="SL">Sierra Leone</asp:ListItem>
                            <asp:ListItem Value="SG" Selected="True">Singapore</asp:ListItem>
                            <asp:ListItem Value="SK">Slovakia</asp:ListItem>
                            <asp:ListItem Value="SI">Slovenia</asp:ListItem>
                            <asp:ListItem Value="SB">Solomon Islands</asp:ListItem>
                            <asp:ListItem Value="SO">Somalia</asp:ListItem>
                            <asp:ListItem Value="ZA">South Africa</asp:ListItem>
                            <asp:ListItem Value="GS">South Georgia/Sandwich Islands</asp:ListItem>
                            <asp:ListItem Value="KR">South Korea</asp:ListItem>
                            <asp:ListItem Value="SS">South Sudan</asp:ListItem>
                            <asp:ListItem Value="ES">Spain</asp:ListItem>
                            <asp:ListItem Value="LK">Sri Lanka</asp:ListItem>
                            <asp:ListItem Value="SD">Sudan</asp:ListItem>
                            <asp:ListItem Value="SR">Suriname</asp:ListItem>
                            <asp:ListItem Value="SJ">Svalbard and Jan Mayen</asp:ListItem>
                            <asp:ListItem Value="SZ">Swaziland</asp:ListItem>
                            <asp:ListItem Value="SE">Sweden</asp:ListItem>
                            <asp:ListItem Value="CH">Switzerland</asp:ListItem>
                            <asp:ListItem Value="SY">Syria</asp:ListItem>
                            <asp:ListItem Value="TW">Taiwan</asp:ListItem>
                            <asp:ListItem Value="TJ">Tajikistan</asp:ListItem>
                            <asp:ListItem Value="TZ">Tanzania</asp:ListItem>
                            <asp:ListItem Value="TH">Thailand</asp:ListItem>
                            <asp:ListItem Value="TL">Timor-Leste</asp:ListItem>
                            <asp:ListItem Value="TG">Togo</asp:ListItem>
                            <asp:ListItem Value="TK">Tokelau</asp:ListItem>
                            <asp:ListItem Value="TO">Tonga</asp:ListItem>
                            <asp:ListItem Value="TT">Trinidad and Tobago</asp:ListItem>
                            <asp:ListItem Value="TN">Tunisia</asp:ListItem>
                            <asp:ListItem Value="TR">Turkey</asp:ListItem>
                            <asp:ListItem Value="TM">Turkmenistan</asp:ListItem>
                            <asp:ListItem Value="TC">Turks and Caicos Islands</asp:ListItem>
                            <asp:ListItem Value="TV">Tuvalu</asp:ListItem>
                            <asp:ListItem Value="UG">Uganda</asp:ListItem>
                            <asp:ListItem Value="UA">Ukraine</asp:ListItem>
                            <asp:ListItem Value="AE">United Arab Emirates</asp:ListItem>
                            <asp:ListItem Value="GB">United Kingdom (UK)</asp:ListItem>
                            <asp:ListItem Value="US">United States (US)</asp:ListItem>
                            <asp:ListItem Value="UY">Uruguay</asp:ListItem>
                            <asp:ListItem Value="UZ">Uzbekistan</asp:ListItem>
                            <asp:ListItem Value="VU">Vanuatu</asp:ListItem>
                            <asp:ListItem Value="VA">Vatican</asp:ListItem>
                            <asp:ListItem Value="VE">Venezuela</asp:ListItem>
                            <asp:ListItem Value="VN">Vietnam</asp:ListItem>
                            <asp:ListItem Value="WF">Wallis and Futuna</asp:ListItem>
                            <asp:ListItem Value="EH">Western Sahara</asp:ListItem>
                            <asp:ListItem Value="WS">Western Samoa</asp:ListItem>
                            <asp:ListItem Value="YE">Yemen</asp:ListItem>
                            <asp:ListItem Value="ZM">Zambia</asp:ListItem>
                            <asp:ListItem Value="ZW">Zimbabwe</asp:ListItem>
                        </asp:DropDownList>
              </div>

              <div class="col-50">
                <label for="zip">Postal Code&nbsp;&nbsp;
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBoxPostalCode" ErrorMessage="Please put in your postal code" ForeColor="Red"></asp:RequiredFieldValidator>
                  </label>
                  &nbsp;<asp:TextBox ID="TextBoxPostalCode" runat="server" style="background-color: #ffffb3; color: black;" Height="29px" TextMode="Number" Width="284px"></asp:TextBox>
                  <br />
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment&nbsp;
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="RadioButtonList1" ErrorMessage="Please select payment method" ForeColor="Red"></asp:RequiredFieldValidator>
              </h3>
            <label for="fname">Accepted Cards</label>
              <asp:RadioButtonList ID="RadioButtonList1" runat="server" Width="190px">
                  <asp:ListItem>PayPal</asp:ListItem>
                  <asp:ListItem>Credit Card</asp:ListItem>
                  <asp:ListItem>Debit Card</asp:ListItem>
                  <asp:ListItem>Cash On Delivery</asp:ListItem>
              </asp:RadioButtonList>
              <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
            </div>

            <label for="cname">Name on Card&nbsp;&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBoxNameOnCard" ErrorMessage="Please put in name on card" ForeColor="Red"></asp:RequiredFieldValidator>
              </label>&nbsp;<asp:TextBox ID="TextBoxNameOnCard" runat="server" style="background-color: #ffffb3; color: black;"></asp:TextBox>

             <label for="ccnum">Credit card number&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBoxCardNo" ErrorMessage="Please put in credit card number" ForeColor="Red"></asp:RequiredFieldValidator>
              </label>
&nbsp;<asp:TextBox ID="TextBoxCardNo" runat="server" style="background-color: #ffffb3; color: black;" MaxLength="16"></asp:TextBox>

            <label for="expmonth">Card Expiry&nbsp;&nbsp;&nbsp;
              <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBoxCVV" ErrorMessage="Please put in Card Expiry Date" ForeColor="Red"></asp:RequiredFieldValidator>
              </label>
              &nbsp;<asp:TextBox ID="TextBoxExpire" runat="server" style="background-color: #ffffb3; color: black;" Height="25px" Width="285px" MaxLength="5">MM/YY</asp:TextBox>

         

              <br />

         

              <br />

         

              </div>
              <div class="col-50">
                <label for="cvv">CVV&nbsp;&nbsp;
                  <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBoxCVV" ErrorMessage="Please put in your CVV no." ForeColor="Red"></asp:RequiredFieldValidator>
                  </label>
                  &nbsp;<asp:TextBox ID="TextBoxCVV" runat="server" TextMode="Number" style="background-color: #ffffb3; color: black;" Height="25px" Width="281px" MaxLength="3"></asp:TextBox>
                  <br />
                  <br />
                  <br />
                <asp:CheckBox ID="CheckBox2"  runat="server" Text="Shipping address same as billing" />
              
              </div>
            </div>
          </div>
          
        </div>
      </form>
    </br>
    </br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
    <asp:Button ID="btn_Update" runat="server" Text="Update" OnClick="btn_Update_Click1"  />    
    </br>
    </div>
  </div>
  
</div>


</asp:Content>

