<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucImmigrationFeedbackForm.ascx.cs" Inherits="controls_FeedbackForm" %>

<asp:ScriptManager ID="sm1" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"></asp:ScriptManager>

<div id="movingnz-form">

    <asp:Panel ID="__quetionnairePanel" runat="server">   
        <h3>Your Details:</h3>
        
        <asp:ValidationSummary ID="vs1" runat="server" />
        
        <table border="0" cellspacing="0" cellpadding="0">
            <tr class="grey-row">
                <td>First Name:</td>
                <td><asp:TextBox ID="__firstName" MaxLength="50" runat="server" TabIndex="1"/></td>
                <td><asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="__firstName" ErrorMessage="Please provide your first name so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Surname:</td>
                <td><asp:TextBox ID="__surname" MaxLength="50" runat="server" TabIndex="2" Width="200px"/></td>
                <td><asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="__surname" ErrorMessage="Please provide your surname so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>                
            </tr>
            <tr class="grey-row">
                <td>Phone:<br />(include country and area code)</td>
                <td><asp:TextBox ID="__phone" MaxLength="30" runat="server" TabIndex="3" Width="200px"/></td>
                <td><asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="__phone" ErrorMessage="Please provide a contact phone number so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>                
            </tr>
            <tr>
                <td>Email:</td>
                <td><asp:TextBox ID="__email" MaxLength="100" runat="server" TabIndex="4" Width="200px"/></td>
                <td>
                    <asp:RegularExpressionValidator  ID="emailRegexVal" runat="server" ControlToValidate="__email" Display="Dynamic" ErrorMessage="Please enter a valid e-mail address." Text="*" />   
                    <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="__email" ErrorMessage="Please provide your email address so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr class="grey-row">
                <td>Date of Birth:</td>
                <td>
                   <asp:TextBox id="__dob" runat="server" MaxLength="1" style="text-align:justify; width:90px;" TabIndex="5"/>
                    <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/Calendar.png" CausesValidation="False" />                            
                    <ajaxtoolkit:calendarextender ID="CalendarExtender2" runat="server"  TargetControlID="__dob" PopupButtonID="ImageButton1" />
                    <ajaxtoolkit:maskededitextender ID="MaskedEditExtender2" runat="server" TargetControlID="__dob" Mask="99/99/9999" MessageValidatorTip="true" MaskType="Date" ErrorTooltipEnabled="True" UserDateFormat="DayMonthYear" CultureName="en-nz" EnableViewState="false"/>&nbsp;(dd/mm/yyyy)
                </td>
                <td><asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="__dob" ErrorMessage="Please provide your date of birth." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Country:</td>
                <td>
                    <asp:DropDownList ID="__country" runat="server" class="inputbox" TabIndex="6" Width="200px" EnableViewState="false" >                    
                        <asp:ListItem Value="" Text="Please Select"/>
                        <asp:ListItem Value="1" Text="South Africa"/>
                        <asp:ListItem Value="2" Text="Afghanistan"/>
                        <asp:ListItem Value="3" Text="Albania"/>
                        <asp:ListItem Value="4" Text="Algeria"/>
                        <asp:ListItem Value="5" Text="American Samoa"/>
                        <asp:ListItem Value="6" Text="Andorra"/>
                        <asp:ListItem Value="7" Text="Angola"/>
                        <asp:ListItem Value="8" Text="Anguilla"/>
                        <asp:ListItem Value="9" Text="Antarctica"/>
                        <asp:ListItem Value="10" Text="Antigua and Barbuda"/>
                        <asp:ListItem Value="11" Text="Argentina"/>
                        <asp:ListItem Value="12" Text="Armenia"/>
                        <asp:ListItem Value="13" Text="Aruba"/>
                        <asp:ListItem Value="14" Text="Ascension Island"/>
                        <asp:ListItem Value="15" Text="Australia"/>
                        <asp:ListItem Value="16" Text="Austria"/>
                        <asp:ListItem Value="17" Text="Azerbaijan"/>
                        <asp:ListItem Value="18" Text="Bahamas"/>
                        <asp:ListItem Value="19" Text="Bahrain"/>
                        <asp:ListItem Value="20" Text="Bangladesh"/>
                        <asp:ListItem Value="21" Text="Barbados"/>
                        <asp:ListItem Value="22" Text="Belarus"/>
                        <asp:ListItem Value="23" Text="Belgium"/>
                        <asp:ListItem Value="24" Text="Belize"/>
                        <asp:ListItem Value="25" Text="Benin"/>
                        <asp:ListItem Value="26" Text="Bermuda"/>
                        <asp:ListItem Value="27" Text="Bhutan"/>
                        <asp:ListItem Value="28" Text="Bolivia"/>
                        <asp:ListItem Value="29" Text="Bosnia and Herzegovina"/>
                        <asp:ListItem Value="30" Text="Botswana"/>
                        <asp:ListItem Value="31" Text="Bouvet Island"/>
                        <asp:ListItem Value="32" Text="Brazil"/>
                        <asp:ListItem Value="33" Text="British Indian Ocean Territory"/>
                        <asp:ListItem Value="34" Text="Brunei"/>
                        <asp:ListItem Value="35" Text="Bulgaria"/>
                        <asp:ListItem Value="36" Text="Burkina Faso"/>
                        <asp:ListItem Value="37" Text="Burundi"/>
                        <asp:ListItem Value="38" Text="Cambodia"/>
                        <asp:ListItem Value="39" Text="Cameroon"/>
                        <asp:ListItem Value="40" Text="Canada"/>
                        <asp:ListItem Value="41" Text="Cape Verde"/>
                        <asp:ListItem Value="42" Text="Cayman Islands"/>
                        <asp:ListItem Value="43" Text="Central African Republic"/>
                        <asp:ListItem Value="44" Text="Chad"/>
                        <asp:ListItem Value="45" Text="Chile"/>
                        <asp:ListItem Value="46" Text="China"/>
                        <asp:ListItem Value="47" Text="Christmas Island"/>
                        <asp:ListItem Value="48" Text="Cocos (Keeling) Islands"/>
                        <asp:ListItem Value="49" Text="Colombia"/>
                        <asp:ListItem Value="50" Text="Comoros"/>
                        <asp:ListItem Value="51" Text="Congo"/>
                        <asp:ListItem Value="52" Text="Congo (DRC)"/>
                        <asp:ListItem Value="53" Text="Cook Islands"/>
                        <asp:ListItem Value="54" Text="Costa Rica"/>
                        <asp:ListItem Value="55" Text="Côte d'Ivoire"/>
                        <asp:ListItem Value="56" Text="Croatia"/>
                        <asp:ListItem Value="57" Text="Cuba"/>
                        <asp:ListItem Value="58" Text="Cyprus"/>
                        <asp:ListItem Value="59" Text="Czech Republic"/>
                        <asp:ListItem Value="60" Text="Denmark"/>
                        <asp:ListItem Value="61" Text="Djibouti"/>
                        <asp:ListItem Value="62" Text="Dominica"/>
                        <asp:ListItem Value="63" Text="Dominican Republic"/>
                        <asp:ListItem Value="64" Text="Ecuador"/>
                        <asp:ListItem Value="65" Text="Egypt"/>
                        <asp:ListItem Value="66" Text="El Salvador"/>
                        <asp:ListItem Value="67" Text="Equatorial Guinea"/>
                        <asp:ListItem Value="68" Text="Eritrea"/>
                        <asp:ListItem Value="69" Text="Estonia"/>
                        <asp:ListItem Value="70" Text="Ethiopia"/>
                        <asp:ListItem Value="71" Text="Falkland Islands (Islas Malvinas)"/>
                        <asp:ListItem Value="72" Text="Faroe Islands"/>
                        <asp:ListItem Value="73" Text="Fiji Islands"/>
                        <asp:ListItem Value="74" Text="Finland"/>
                        <asp:ListItem Value="75" Text="France"/>
                        <asp:ListItem Value="76" Text="French Guiana"/>
                        <asp:ListItem Value="77" Text="French Polynesia"/>
                        <asp:ListItem Value="78" Text="French Southern and Antarctic Lands"/>
                        <asp:ListItem Value="79" Text="Gabon"/>
                        <asp:ListItem Value="80" Text="Gambia, The"/>
                        <asp:ListItem Value="81" Text="Georgia"/>
                        <asp:ListItem Value="82" Text="Germany"/>
                        <asp:ListItem Value="83" Text="Ghana"/>
                        <asp:ListItem Value="84" Text="Gibraltar"/>
                        <asp:ListItem Value="85" Text="Greece"/>
                        <asp:ListItem Value="86" Text="Greenland"/>
                        <asp:ListItem Value="87" Text="Grenada"/>
                        <asp:ListItem Value="88" Text="Guadeloupe"/>
                        <asp:ListItem Value="89" Text="Guam"/>
                        <asp:ListItem Value="90" Text="Guatemala"/>
                        <asp:ListItem Value="91" Text="Guernsey"/>
                        <asp:ListItem Value="92" Text="Guinea"/>
                        <asp:ListItem Value="93" Text="Guinea-Bissau"/>
                        <asp:ListItem Value="94" Text="Guyana"/>
                        <asp:ListItem Value="95" Text="Haiti"/>
                        <asp:ListItem Value="96" Text="Heard Island and McDonald Islands"/>
                        <asp:ListItem Value="97" Text="Honduras"/>
                        <asp:ListItem Value="98" Text="Hong Kong SAR"/>
                        <asp:ListItem Value="99" Text="Hungary"/>
                        <asp:ListItem Value="100" Text="Iceland"/>
                        <asp:ListItem Value="101" Text="India"/>
                        <asp:ListItem Value="102" Text="Indonesia"/>
                        <asp:ListItem Value="103" Text="Iran"/>
                        <asp:ListItem Value="104" Text="Iraq"/>
                        <asp:ListItem Value="105" Text="Ireland"/>
                        <asp:ListItem Value="106" Text="Isle of Man"/>
                        <asp:ListItem Value="107" Text="Israel"/>
                        <asp:ListItem Value="108" Text="Italy"/>
                        <asp:ListItem Value="109" Text="Jamaica"/>
                        <asp:ListItem Value="110" Text="Japan"/>
                        <asp:ListItem Value="111" Text="Jersey"/>
                        <asp:ListItem Value="112" Text="Jordan"/>
                        <asp:ListItem Value="113" Text="Kazakhstan"/>
                        <asp:ListItem Value="114" Text="Kenya"/>
                        <asp:ListItem Value="115" Text="Kiribati"/>
                        <asp:ListItem Value="116" Text="Korea"/>
                        <asp:ListItem Value="117" Text="Kuwait"/>
                        <asp:ListItem Value="118" Text="Kyrgyzstan"/>
                        <asp:ListItem Value="119" Text="Laos"/>
                        <asp:ListItem Value="120" Text="Latvia"/>
                        <asp:ListItem Value="121" Text="Lebanon"/>
                        <asp:ListItem Value="122" Text="Lesotho"/>
                        <asp:ListItem Value="123" Text="Liberia"/>
                        <asp:ListItem Value="124" Text="Libya"/>
                        <asp:ListItem Value="125" Text="Liechtenstein"/>
                        <asp:ListItem Value="126" Text="Lithuania"/>
                        <asp:ListItem Value="127" Text="Luxembourg"/>
                        <asp:ListItem Value="128" Text="Macao SAR"/>
                        <asp:ListItem Value="129" Text="Macedonia, Former Yugoslav Republic of"/>
                        <asp:ListItem Value="130" Text="Madagascar"/>
                        <asp:ListItem Value="131" Text="Malawi"/>
                        <asp:ListItem Value="132" Text="Malaysia"/>
                        <asp:ListItem Value="133" Text="Maldives"/>
                        <asp:ListItem Value="134" Text="Mali"/>
                        <asp:ListItem Value="135" Text="Malta"/>
                        <asp:ListItem Value="136" Text="Marshall Islands"/>
                        <asp:ListItem Value="137" Text="Martinique"/>
                        <asp:ListItem Value="138" Text="Mauritania"/>
                        <asp:ListItem Value="139" Text="Mauritius"/>
                        <asp:ListItem Value="140" Text="Mayotte"/>
                        <asp:ListItem Value="141" Text="Mexico"/>
                        <asp:ListItem Value="142" Text="Micronesia"/>
                        <asp:ListItem Value="143" Text="Moldova"/>
                        <asp:ListItem Value="144" Text="Monaco"/>
                        <asp:ListItem Value="145" Text="Mongolia"/>
                        <asp:ListItem Value="146" Text="Montserrat"/>
                        <asp:ListItem Value="147" Text="Morocco"/>
                        <asp:ListItem Value="148" Text="Mozambique"/>
                        <asp:ListItem Value="149" Text="Myanmar"/>
                        <asp:ListItem Value="150" Text="Namibia"/>
                        <asp:ListItem Value="151" Text="Nauru"/>
                        <asp:ListItem Value="152" Text="Nepal"/>
                        <asp:ListItem Value="153" Text="Netherlands"/>
                        <asp:ListItem Value="154" Text="Netherlands Antilles"/>
                        <asp:ListItem Value="155" Text="New Caledonia"/>
                        <asp:ListItem Value="156" Text="New Zealand"/>
                        <asp:ListItem Value="157" Text="Nicaragua"/>
                        <asp:ListItem Value="158" Text="Niger"/>
                        <asp:ListItem Value="159" Text="Nigeria"/>
                        <asp:ListItem Value="160" Text="Niue"/>
                        <asp:ListItem Value="161" Text="Norfolk Island"/>
                        <asp:ListItem Value="162" Text="North Korea"/>
                        <asp:ListItem Value="163" Text="Northern Mariana Islands"/>
                        <asp:ListItem Value="164" Text="Norway"/>
                        <asp:ListItem Value="165" Text="Oman"/>
                        <asp:ListItem Value="166" Text="Pakistan"/>
                        <asp:ListItem Value="167" Text="Palau"/>
                        <asp:ListItem Value="168" Text="Palestinian Authority"/>
                        <asp:ListItem Value="169" Text="Panama"/>
                        <asp:ListItem Value="170" Text="Papua New Guinea"/>
                        <asp:ListItem Value="171" Text="Paraguay"/>
                        <asp:ListItem Value="172" Text="Peru"/>
                        <asp:ListItem Value="173" Text="Philippines"/>
                        <asp:ListItem Value="174" Text="Pitcairn Islands"/>
                        <asp:ListItem Value="175" Text="Poland"/>
                        <asp:ListItem Value="176" Text="Portugal"/>
                        <asp:ListItem Value="177" Text="Puerto Rico"/>
                        <asp:ListItem Value="178" Text="Qatar"/>
                        <asp:ListItem Value="179" Text="Reunion"/>
                        <asp:ListItem Value="180" Text="Romania"/>
                        <asp:ListItem Value="181" Text="Russia"/>
                        <asp:ListItem Value="182" Text="Rwanda"/>
                        <asp:ListItem Value="183" Text="Samoa"/>
                        <asp:ListItem Value="184" Text="San Marino"/>
                        <asp:ListItem Value="185" Text="São Tomé and Príncipe"/>
                        <asp:ListItem Value="186" Text="Saudi Arabia"/>
                        <asp:ListItem Value="187" Text="Senegal"/>
                        <asp:ListItem Value="188" Text="Serbia, Montenegro"/>
                        <asp:ListItem Value="189" Text="Seychelles"/>
                        <asp:ListItem Value="190" Text="Sierra Leone"/>
                        <asp:ListItem Value="191" Text="Singapore"/>
                        <asp:ListItem Value="192" Text="Slovakia"/>
                        <asp:ListItem Value="193" Text="Slovenia"/>
                        <asp:ListItem Value="194" Text="Solomon Islands"/>
                        <asp:ListItem Value="195" Text="Somalia"/>
                        <asp:ListItem Value="196" Text="South Africa"/>
                        <asp:ListItem Value="197" Text="South Georgia and the South Sandwich Islands"/>
                        <asp:ListItem Value="198" Text="Spain"/>
                        <asp:ListItem Value="199" Text="Sri Lanka"/>
                        <asp:ListItem Value="200" Text="St. Helena"/>
                        <asp:ListItem Value="201" Text="St. Kitts and Nevis"/>
                        <asp:ListItem Value="202" Text="St. Lucia"/>
                        <asp:ListItem Value="203" Text="St. Pierre and Miquelon"/>
                        <asp:ListItem Value="204" Text="St. Vincent and the Grenadines"/>
                        <asp:ListItem Value="205" Text="Sudan"/>
                        <asp:ListItem Value="206" Text="Suriname"/>
                        <asp:ListItem Value="207" Text="Svalbard and Jan Mayen"/>
                        <asp:ListItem Value="208" Text="Swaziland"/>
                        <asp:ListItem Value="209" Text="Sweden"/>
                        <asp:ListItem Value="210" Text="Switzerland"/>
                        <asp:ListItem Value="211" Text="Syria"/>
                        <asp:ListItem Value="212" Text="Taiwan"/>
                        <asp:ListItem Value="213" Text="Tajikistan"/>
                        <asp:ListItem Value="214" Text="Tanzania"/>
                        <asp:ListItem Value="215" Text="Thailand"/>
                        <asp:ListItem Value="216" Text="Timor-Leste"/>
                        <asp:ListItem Value="217" Text="Togo"/>
                        <asp:ListItem Value="218" Text="Tokelau"/>
                        <asp:ListItem Value="219" Text="Tonga"/>
                        <asp:ListItem Value="220" Text="Trinidad and Tobago"/>
                        <asp:ListItem Value="221" Text="Tristan da Cunha"/>
                        <asp:ListItem Value="222" Text="Tunisia"/>
                        <asp:ListItem Value="223" Text="Turkey"/>
                        <asp:ListItem Value="224" Text="Turkmenistan"/>
                        <asp:ListItem Value="225" Text="Turks and Caicos Islands"/>
                        <asp:ListItem Value="226" Text="Tuvalu"/>
                        <asp:ListItem Value="227" Text="Uganda"/>
                        <asp:ListItem Value="228" Text="Ukraine"/>
                        <asp:ListItem Value="229" Text="United Arab Emirates"/>
                        <asp:ListItem Value="230" Text="United Kingdom"/>
                        <asp:ListItem Value="231" Text="United States"/>
                        <asp:ListItem Value="232" Text="United States Minor Outlying Islands"/>
                        <asp:ListItem Value="233" Text="Uruguay"/>
                        <asp:ListItem Value="234" Text="Uzbekistan"/>
                        <asp:ListItem Value="235" Text="Vanuatu"/>
                        <asp:ListItem Value="236" Text="Vatican City"/>
                        <asp:ListItem Value="237" Text="Venezuela"/>
                        <asp:ListItem Value="238" Text="Vietnam"/>
                        <asp:ListItem Value="239" Text="Virgin Islands"/>
                        <asp:ListItem Value="240" Text="Virgin Islands, British"/>
                        <asp:ListItem Value="241" Text="Wallis and Futuna"/>
                        <asp:ListItem Value="242" Text="Yemen"/>
                        <asp:ListItem Value="243" Text="Zambia"/>
                        <asp:ListItem Value="244" Text="Zimbabwe"/>
                    </asp:DropDownList>
                </td>
                <td><asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="__country" ErrorMessage="Please provide your Country." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr class="grey-row">
                <td>Occupation:</td>
                <td>
                    <asp:DropDownList ID="__occupation" runat="server"  class="inputbox" tabindex="7" Width="200px">
                        <asp:ListItem Selected="False" Value="" Text="Please Select"></asp:ListItem>  
                        <asp:ListItem Selected="false" Value="Agriculture and Related Industries" Text="Agriculture and Related Industries">Agriculture and Related Industries</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Administration" Text="Administration">Administration</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Computing and IT" Text="Computing and IT">Computing and IT</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Education" Text="Education">Education</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Engineering" Text="Engineering">Engineering</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Finance" Text="Finance">Finance</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Health" Text="Health">Health</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Hospitality and Entertainment" Text="Hospitality and Entertainment">Hospitality and Entertainment</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Legal" Text="Legal">Legal</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Sales and Marketing" Text="Sales and Marketing">Sales and Marketing</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Specialised Management" Text="Specialised Management">Specialised Management</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Student" Text="Student">Student</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Trade and Technical" Text="Trade and Technical">Trade and Technical</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Unemployed" Text="Unemployed">Unemployed</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Other" Text="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td><asp:RequiredFieldValidator ID="rfv7" runat="server" ControlToValidate="__occupation" ErrorMessage="Please provide your Occupation." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr >
                <td>Level of English:</td>
                <td>
                    <asp:DropDownList ID="__englishLevel" runat="server" class="inputbox" 
                        tabindex="8" Width="200px">                    
                        <asp:ListItem Selected="False" Value="">Please Select</asp:ListItem>
                        <asp:ListItem Selected="false" Value="English is my first language">English is my first language</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Fluent in English">Fluent in English</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Satisfactory or Adequate English">Satisfactory or Adequate English</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Little English">Little English</asp:ListItem>
                        <asp:ListItem Selected="false" Value="None of the above">None of the above</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td><asp:RequiredFieldValidator ID="rfv8" runat="server" ControlToValidate="__englishLevel" ErrorMessage="Please provide your level of English." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <h3>Can you or your spouse answer these questions:</h3>
        <table  border="0" cellspacing="0" cellpadding="0">
            <tr class="grey-row">
                <td>Do you have any relatives<br />in New Zealand?</td>
                <td><asp:RadioButtonList ID="__relativesYes" runat="server" RepeatDirection="Horizontal" TabIndex="9" /></td>
                <td><asp:RequiredFieldValidator ID="rfv9" runat="server" ControlToValidate="__relativesYes" ErrorMessage="Please indicate if you have relatives in NZ." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>What would be your<br />highest qualification?</td>
                <td>
                    <asp:DropDownList ID="__highestQualification" runat="server"  class="inputbox" 
                        tabindex="10">                    
                        <asp:ListItem Selected="false" Value="">Please Select</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Apprenticeship">Apprenticeship</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Trade qualification">Trade qualification</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Two year Diploma / Certificate">Two year Diploma / Certificate</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Three year Diploma / Certificate">Three year Diploma / Certificate</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Four year Diploma / Certificate">Four year Diploma / Certificate</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Information Technology Courses (any length)">Information Technology Courses (any length)</asp:ListItem>
                        <asp:ListItem Selected="false" Value="University Degree">University Degree</asp:ListItem>
                        <asp:ListItem Selected="false" Value="Masters Degree">Masters Degree</asp:ListItem>
                        <asp:ListItem Selected="false" Value="PHD">PHD</asp:ListItem>
                        <asp:ListItem Selected="false" Value="None of the Above">None of the Above</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td><asp:RequiredFieldValidator ID="rfv10" runat="server" ControlToValidate="__highestQualification" ErrorMessage="Please indicate your highest qualification." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr class="grey-row">
                <td>Do you hold a NZ<br />qualification?</td>
                <td><asp:RadioButtonList ID="__qualNZYes" runat="server" RepeatDirection="Horizontal" TabIndex="11"  /></td>
                <td><asp:RequiredFieldValidator ID="rfv11" runat="server" ControlToValidate="__qualNZYes" ErrorMessage="Please indicate if you have a NZ qualification." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>If yes to the NZ<br />qualification question,<br />please describe:</td>
                <td><asp:TextBox Rows="4" runat="server"  id="__nzQualification" cols="45" TabIndex="12" Width="278px"/></td>
                <td><asp:CustomValidator ID="cv1" runat="server" ControlToValidate="__qualNZYes" ErrorMessage="Please specify your NZ qualification." SetFocusOnError="True" onservervalidate="cv1_ServerValidate">*</asp:CustomValidator></td>
            </tr>
            <tr class="grey-row">
                <td>Do you have at least 2<br />years work experience?</td>
                <td><asp:RadioButtonList ID="__2yearsYes" runat="server" RepeatDirection="Horizontal" TabIndex="13" /></td>
                <td><asp:RequiredFieldValidator ID="rfv12" runat="server" ControlToValidate="__2yearsYes" ErrorMessage="Please indicate if you have at least 2 years work experience." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Do you have a job offer<br />in New Zealand?</td>
                <td><asp:RadioButtonList ID="__jobOfferYes" runat="server" RepeatDirection="Horizontal" TabIndex="14"/></td>
                <td><asp:RequiredFieldValidator ID="rfv13" runat="server" ControlToValidate="__jobOfferYes" ErrorMessage="Please indicate if you have a job offer in NZ." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr class="grey-row">
                <td>Have you ever owned<br />or do you currently own<br />a business?</td>
                <td><asp:RadioButtonList ID="__ownBusYes" runat="server" RepeatDirection="Horizontal" TabIndex="15" /> </td>
                <td><asp:RequiredFieldValidator ID="rfv14" runat="server" ControlToValidate="__ownBusYes" ErrorMessage="Please indicate if you own or have owned your own business." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Do you have at least NZ<br />$1 million to transfer to<br />NZ?</td>
                <td><asp:RadioButtonList ID="__milYes" runat="server" RepeatDirection="Horizontal" TabIndex="16" /></td>
                <td><asp:RequiredFieldValidator ID="rfv15" runat="server" ControlToValidate="__milYes" ErrorMessage="Please indicate if you will bring $1 million into NZ." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <p>
            &nbsp;<captcha:CaptchaControl CaptchaMaxTimeout="720" CaptchaMinTimeout="3" CacheStrategy="Session" id="CaptchaControl1" runat="server" CaptchaBackgroundNoise="Extreme" CaptchaFontWarping="Medium" ></captcha:CaptchaControl>
            <asp:Button ID="__submit" runat="server" Text="Submit" OnClick="__submit_Click" TabIndex="17" />
            <p>
            </p>
            <p>
            </p>
        </p>
  
    </asp:Panel>
    
    
    <asp:Panel ID="__confirmationPanel" Visible="false" runat="server" BackColor="#CCCCCC" BorderStyle="None" Font-Bold="True" ForeColor="#CC0000">
        <div id="thanks">
            <p>Thank You!</p>
            <p>Your details have been sent to Crown Relocations.</p>
            <p>One of our representatives will be in touch with you soon.</p>
        </div>
    </asp:Panel>
    
    
</div>
