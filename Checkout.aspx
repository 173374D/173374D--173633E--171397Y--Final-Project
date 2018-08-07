<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout1" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Check Out</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="clear"></div>
    <div class="col-md-3">
    </div>



    <div id="customer_details" class="col2-set">
        <div class="col-1">
            <div class="woocommerce-billing-fields">
                <h3>Billing Details</h3>
                <p>&nbsp;</p>
                <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                    <label class="" for="billing_country">
                        Country
                        <abbr title="required" class="required">*</abbr>
                    </label>
                    <asp:DropDownList ID="billing_country" name="billing_country" runat="server">
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
                </p>

                <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                    First Name
                    <abbr title="required" class="required">*</abbr>
                    <asp:TextBox ID="billing_first_name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvFirstname" runat="server" ControlToValidate="billing_first_name" ErrorMessage="Please enter a First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;
                </p>

                <p id="billing_last_name_field" class="form-row form-row-last validate-required">
                    <label class="" for="billing_last_name">
                        Last Name
                        <abbr title="required" class="required">*</abbr>
                    </label>
                    <asp:TextBox ID="billing_last_name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvLastname" runat="server" ControlToValidate="billing_last_name" ErrorMessage="Please enter a Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <div class="clear"></div>

                <p id="billing_company_field" class="form-row form-row-wide">
                    <label class="" for="billing_company">Company Name</label>
                    <asp:TextBox ID="billing_company" runat="server"></asp:TextBox>
                    &nbsp;
                </p>

                <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                    <label class="" for="billing_address_1">
                        Address
                        <abbr title="required" class="required">*</abbr>
                    </label>
                    <asp:TextBox ID="billing_address_1" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvAddress1" runat="server" ControlToValidate="billing_address_1" ErrorMessage="Please enter an Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;
                </p>

                <p id="billing_address_2_field" class="form-row form-row-wide address-field">
                    <asp:TextBox ID="billing_address_2" runat="server"></asp:TextBox>
                    &nbsp;
                </p>

                <p id="billing_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                    <label class="" for="billing_city">
                        Town / City
                        <abbr title="required" class="required">*</abbr>
                    </label>
                    <asp:TextBox ID="billing_city" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvCity" runat="server" ControlToValidate="billing_city" ErrorMessage="Please enter a City Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;
                </p>

                <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                    <label class="" for="billing_state">State</label>
                    <asp:TextBox ID="billing_state" runat="server" Width="356px"></asp:TextBox>
                    &nbsp;
                </p>
                <p id="billing_postcode_field" class="form-row form-row-last address-field validate-required validate-postcode" data-o_class="form-row form-row-last address-field validate-required validate-postcode">
                    <label class="" for="billing_postcode">
                        Postcode
                        <abbr title="required" class="required">*</abbr>
                    </label>
                    <asp:TextBox ID="billing_postcode" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvPostcode" runat="server" ControlToValidate="billing_postcode" ErrorMessage="Please enter a Postcode" ForeColor="Red"></asp:RequiredFieldValidator>
                    &nbsp;
                </p>

                <div class="clear"></div>

                <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                    <label class="" for="billing_email">
                        Email Address
                        <abbr title="required" class="required">*</abbr>
                    </label>
                    <asp:TextBox ID="billing_email" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvEmail" runat="server" ControlToValidate="billing_email" ErrorMessage="Please enter a valid Email" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RevEmail" runat="server" ControlToValidate="billing_email" ErrorMessage="Please enter a valid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </p>

                <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                    <label class="" for="billing_phone">
                        Phone
                        <abbr title="required" class="required">*</abbr>
                    </label>
                    <asp:TextBox ID="billing_phone" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RfvPhone" runat="server" ControlToValidate="billing_phone" ErrorMessage="Please enter a Phone number" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <div class="clear"></div>




            </div>
        </div>

        <div class="col-2">
            <div class="woocommerce-shipping-fields">
                <h3 id="ship-to-different-address">Ship to a different address?
                                                <asp:CheckBox ID="ship_diff_address" runat="server" Text="[]" />
                    &nbsp;</h3>
                <div class="shipping_address" style="display: block;">
                    <p id="shipping_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                        <label class="" for="shipping_country">
                            Country
                            <abbr title="required" class="required">*</abbr>
                        </label>
                        <asp:DropDownList ID="shipping_country" name="shipping_country" runat="server">
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
                    </p>


                    <p id="shipping_first_name_field" class="form-row form-row-first validate-required">
                        <label class="" for="shipping_first_name">
                            First Name
                            <abbr title="required" class="required">*</abbr>
                        </label>
                        <asp:TextBox ID="shipping_first_name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvShippingfirstname" runat="server" ControlToValidate="shipping_first_name" Enabled="false" ErrorMessage="Please enter a First Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>

                    <p id="shipping_last_name_field" class="form-row form-row-last validate-required">
                        <label class="" for="shipping_last_name">
                            Last Name
                            <abbr title="required" class="required">*</abbr>
                        </label>
                        <asp:TextBox ID="shipping_last_name" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvShippinglastname" runat="server" ControlToValidate="shipping_last_name" Enabled="false" ErrorMessage="Please enter a Last Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>
                    <div class="clear"></div>

                    <p id="shipping_company_field" class="form-row form-row-wide">
                        <label class="" for="shipping_company">Company Name</label>
                        <asp:TextBox ID="shipping_company" runat="server"></asp:TextBox>
                    </p>

                    <p id="shipping_address_1_field" class="form-row form-row-wide address-field validate-required">
                        <label class="" for="shipping_address_1">
                            Address
                            <abbr title="required" class="required">*</abbr>
                        </label>
                        <asp:TextBox ID="shipping_address_1" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvShippingaddress1" runat="server" ControlToValidate="shipping_address_1" Enabled="false" ErrorMessage="Please enter an Address" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>

                    <p id="shipping_address_2_field" class="form-row form-row-wide address-field">
                        <asp:TextBox ID="shipping_address_2" runat="server"></asp:TextBox>
                    </p>

                    <p id="shipping_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                        <label class="" for="shipping_city">
                            Town / City
                            <abbr title="required" class="required">*</abbr>
                        </label>
                        <asp:TextBox ID="shipping_city" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvShippingcity" runat="server" ControlToValidate="shipping_city" Enabled="false" ErrorMessage="Please enter a City Name" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>

                    <p id="shipping_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                        <label class="" for="shipping_state">State</label>
                        <asp:TextBox ID="shipping_state" runat="server"></asp:TextBox>
                    </p>
                    <p id="shipping_postcode_field" class="form-row form-row-last address-field validate-required validate-postcode" data-o_class="form-row form-row-last address-field validate-required validate-postcode">
                        <label class="" for="shipping_postcode">
                            Postcode
                            <abbr title="required" class="required">*</abbr>
                        </label>
                        <asp:TextBox ID="shipping_postcode" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvShippingpostcode" runat="server" ControlToValidate="billing_first_name" Enabled="false" ErrorMessage="Please enter a Postcode" ForeColor="Red"></asp:RequiredFieldValidator>
                    </p>

                    <div class="clear"></div>

                </div>

            </div>

        </div>

    </div>
    <div style="margin: 30px 10%;">
    <h3 id="order_review_heading">Your order</h3>

    <div id="order_review" style="position: relative;">
        <div>
            <asp:GridView ID="gv_CartView" runat="server" DataKeyNames="ItemID" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Height="280px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="ItemID" HeaderText="Product ID" />
                    <asp:BoundField DataField="Product_Name" HeaderText="Product Name" />
                    <asp:TemplateField HeaderText="Quantity">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Product_Price" DataFormatString="{0:C}" HeaderText="Unit Price" />
                    <asp:BoundField DataField="TotalPrice" DataFormatString="{0:C}" HeaderText="Price" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <br />
            Total Price =
    <asp:Label ID="lbl_TotalPrice" runat="server"></asp:Label>
        </div>


        <div id="payment">
            <ul class="payment_methods methods">

                <li class="payment_method_paypal">
                    <asp:RadioButton GroupName="Payment" ID="RdoCredit" runat="server" Text="Credit Card" Checked="True" />

                </li>
                <li class="payment_method_paypal">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Card No."></asp:Label>
                    <asp:TextBox ID="txtCardno" runat="server" Height="16px" MaxLength="16" Width="372px"></asp:TextBox>
                    <asp:Label ID="lblCreditnumber" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                </li>
                <li class="payment_method_paypal">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" Text="Expiry (MM/YY)"></asp:Label>
                    <asp:TextBox ID="txtCardExpiration" runat="server" MaxLength="5"></asp:TextBox>
                    <asp:Label ID="lblExpiry" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="False" Text="CVV"></asp:Label>
                    <asp:TextBox ID="txtCardCvv" runat="server" MaxLength="3"></asp:TextBox>
                    <asp:Label ID="lblCvv" runat="server" Font-Bold="True" ForeColor="Red" Text="*"></asp:Label>
                </li>
            </ul>
            <p>
                <asp:RadioButton ID="rdoBankTransfer" GroupName="Payment" runat="server" Text="Bank Transfer" />
            </p>
            <p style="font-weight: bold">
                (Order will be processed once payment has been confirmed)
            </p>
            <div class="form-row place-order">

                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="PLACE ORDER" />



                <br />
                <br />
                <br />



            </div>

            &nbsp;<div class="clear"></div>

        </div>
    </div>
        </div>
</asp:Content>

