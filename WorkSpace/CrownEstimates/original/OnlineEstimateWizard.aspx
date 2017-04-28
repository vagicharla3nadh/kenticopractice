<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnlineEstimateWizard.aspx.cs" Inherits="OnlineEstimateWizard" EnableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Get a Quote | Crown Relocations | New Zealand Moving Company | Furniture Movers | International Relocations | Storage | House Removals</title>
    <meta name="description" content="Crown Relocations is a Furniture Moving Company specialising in Local, Domestic, International Relocations and Corporate Transfers. " />
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="style-wizards.css" type="text/css" media="screen" />
    <script type="text/javascript" src="js/tinyfader.js"></script>
<script language="JavaScript" type="text/javascript" src="//www.crownrelo.com/relo/scripts/s_code_nz.js"></script></head>
<body>
    <form id="form1" runat="server">
<div id="container">

<div id="header">

<div id="logo"><img src="images/logo.jpg" alt="Crown Relocations" /></div>
<div id="phone"><img src="images/phone.jpg" /></div>

<div id="nav">
<ul>
<li><a href="index.aspx">Home</a></li>
<li><a href="get-a-quote.aspx">Get a Quote</a></li>
<li><a href="moving-to-new-zealand.html">Moving to NZ</a></li>
<li><a href="moving-interisland.html">Moving Interisland</a></li>
<li><a href="moving-services.html">Moving Services</a></li>
<li><a href="special-deals.aspx">Special Deals</a></li>
<li><a href="about-us.html">About Us</a></li>
<li><a href="faq.html">FAQ</a></li>
<li><a href="contact.html">Contact Us</a></li>
</ul>
<p class="clear" />
<!-- nav ends -->
</div>

<!-- header ends -->
</div>


<div id="content">

<div id="left">

<div id="left-content">



<h1>Online Estimate</h1>

<!-- ######### -->

<asp:Panel ID="pnlWizard" Visible="true" runat="server">
    <div id="left-wide">

	<table width="90%" cellpadding="0" cellspacing="0" border="0">
	<tr valign="middle">
	<td width="180"><img src="images/key.gif" alt="key" width="168" height="60" border="0"/></td>
	<td><div class="smlcopy"><br/></div></td>	
	</tr>
	</table>
	
	<div class="tableborder">
	<table width="100%" cellpadding="0" cellspacing="0" border="0">
	<tr valign="top">
	<td width="170" style=" background-color:#cc0000; background-image:url(images/tile1.gif)">
	
	<div class="columntile">
		<div class="youarehere">&nbsp;</div>
		<div class="copy">
		<div class="subnav">
			<ul style="margin-left:1px;">
			<li <%=SetStepTabStyle(0)%> style="padding-bottom:0px;"><asp:LinkButton ID="btnStep1" runat="server" CommandArgument="0" Text="1. Your Details" OnClick="ChangeStep"/></li>
			<li <%=SetStepTabStyle(1)%> style="padding-bottom:0px;"><asp:LinkButton ID="btnStep2" runat="server" CommandArgument="1" Text="2. Room Selection" OnClick="ChangeStep"/></li>
			<li <%=SetStepTabStyle(2)%> style="padding-bottom:0px;"><asp:LinkButton ID="btnStep3" runat="server" CommandArgument="2" Text="3. Household Inventory" OnClick="ChangeStep"/></li>
			<asp:Repeater ID="rpRoomsRepeater" runat="server">
                <ItemTemplate>
                    <li id="TabListItem" runat="server">
                        <asp:LinkButton ID="btnRoom" runat="server" Text='<%#FormatRoomName((string) Eval("RoomName"), (int) Eval("RoomNo"))%>' CommandArgument='<%# Eval("QuoteRoomID")%>'  OnClick="btnRoom_Click"/>
                        <asp:HiddenField ID="hdSelectedItems" runat="server" Value='<%#Eval("ItemsSlected")%>' />
                    </li>
                </ItemTemplate>
            </asp:Repeater>
			<li <%=SetStepTabStyle(3)%>><asp:LinkButton ID="Step4LinkButton" runat="server" CommandArgument="3" Text="4. Review / Send" OnClick="ChangeStep"/></li>
            </ul>
		</div>
		</div>
	</div>	
	</td>
	<td class="dkred">
        <div class="panelnav">
            <asp:ImageButton ID="btnAddRemoveRooms" runat="server" OnClick="btnAddRemoveRooms_Click" ImageUrl="~/images/roomedit.gif" AlternateText="Add/Remove Rooms" width="152"  Height="35" EnableViewState="false" />
            <asp:ImageButton ID="btnPrintThisList" runat="server" OnClientClick="Omniture_DownloadTracker()" OnClick="btnPrintThisList_Click" ImageUrl="~/images/print.gif" AlternateText="Print this list" width="113" Height="35" EnableViewState="false"  />
        </div>
	<div class="padwizard">
<asp:Wizard ID="w" runat="server" SideBarStyle-VerticalAlign="Top" Width="100%" OnActiveStepChanged="w_ActiveStepChanged" DisplaySideBar="false">
        <WizardSteps>
            <asp:WizardStep ID="ws1" runat="server" Title="Your Details">
                <table>
                  <tr>
                    <td colspan="7">
                       <asp:ValidationSummary ID="vs1" runat="server" CssClass="validationSummary"/>
                    
                       <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtFirstName"  Display="None" ErrorMessage="Please enter a first name" />
                       <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtDayPhone"   Display="None" ErrorMessage="Please enter a day time phone number" />
                       <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtEmail"      Display="None" ErrorMessage="Please enter an email address" />
                       <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtMovingOutDate" Display="None" ErrorMessage="Please enter an approximate Moving Out date" />
                    
                       <asp:RegularExpressionValidator ID="regv1" runat="server" ControlToValidate="txtEmail" Display="None" ErrorMessage="Please enter a valid email address of the form email@host.domain" EnableViewState="false"/> 
                       <asp:CustomValidator ID="cv1" runat="server" Display="None" ControlToValidate="txtDayPhone" OnServerValidate="ValidatePhone" ErrorMessage="Please ensure Day Phone contains only numbers and starts with 0."/>
                    </td>
                  </tr>
                  <tr>
                    <td colspan="3"><h4>Your Details:</h4></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                  <tr>
                    <td nowrap="nowrap"><label>First Name:</label></td>
                    <td><span class="mandatory">*</span></td>
                    <td><asp:TextBox ID="txtFirstName" runat="server" MaxLength="20"/></td>
                    <td>&nbsp;</td>
                    <td><label>Surname:</label></td>
                    <td></td>
                    <td><asp:TextBox ID="txtSurname" runat="server" MaxLength="50"/></td>
                  </tr>
                  <tr>
                    <td nowrap="nowrap"><label>Day Phone:</label></td>
                    <td><span class="mandatory">*</span></td>
                    <td><asp:TextBox ID="txtDayPhone" runat="server" MaxLength="30"/></td>
                    <td>&nbsp;</td>
                    <td><label>Email:</label></td>
                    <td><span class="mandatory">*</span></td>
                    <td><asp:TextBox ID="txtEmail" runat="server" MaxLength="100"/></td>
                  </tr>
                  
                  <tr>
                    <td colspan="7">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="3"><h4>Approximate Moving Out Date:</h4></td>
                    <td>&nbsp;</td>
                    <td colspan="3"><h4>Preferred Delivery Date:</h4></td>
                  </tr>
                  <tr>
                    <td></td>
                    <td><span class="mandatory">*</span></td>
                    <td><asp:TextBox ID="txtMovingOutDate" runat="server" MaxLength="30"/></td>
                    <td>&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td><asp:TextBox ID="txtDeliveryDate" runat="server" MaxLength="30"/></td>
                  </tr>
                  <tr>
                    <td colspan="7">&nbsp;</td>
                  </tr>
                  <tr>
                    <td colspan="3"><h4>Moving From:</h4></td>
                    <td>&nbsp;</td>
                    <td colspan="3"><h4>Moving To:</h4></td>
                  </tr>
                  <tr>
                    <td><label>Street:</label></td>
                    <td></td>
                    <td><asp:TextBox ID="txtStreetFrom" runat="server" MaxLength="30"/></td>
                    <td>&nbsp;</td>
                    <td><label>Street:</label></td>
                    <td></td>
                    <td><asp:TextBox ID="txtStreetTo" runat="server" MaxLength="30"/></td>
                  </tr>
                  <tr>
                    <td><label>Suburb:</label></td>
                    <td></td>
                    <td><asp:TextBox ID="txtSuburbFrom" runat="server" MaxLength="30"/></td>
                    <td>&nbsp;</td>
                    <td><label>Surburb:</label></td>
                    <td></td>
                    <td><asp:TextBox ID="txtSuburbTo" runat="server" MaxLength="30"/></td>
                  </tr>
                  <tr>
                    <td><label>Town/City:</label></td>
                    <td></td>
                    <td><asp:TextBox ID="txtCityFrom" runat="server" MaxLength="30"/></td>
                    <td>&nbsp;</td>
                    <td><label>Town/City:</label></td>
                    <td></td>
                    <td><asp:TextBox ID="txtCityTo" runat="server" MaxLength="30"/></td>
                  </tr>
                  <tr>
                    <td><label>Country:</label></td>
                    <td></td>
                    <td><asp:DropDownList ID="ddCountryFrom" runat="server" EnableViewState="false" Width="155px">
                        <asp:ListItem Value="1" Text="New Zealand"/>
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
                    <td>&nbsp;</td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>
                </table>
                <p style="color:White"> HOT TIP! Press the save button and you will be sent an email containing a password that will allow you to return later.</p>
            </asp:WizardStep>
            <asp:WizardStep ID="ws2" runat="server" Title="Room Selection">
            
              <p><asp:Literal ID="litPrintBlankHouseInventory" runat="server"/></p>
            
              <h4>Select Rooms below:</h4>
              
              <asp:ValidationSummary ID="vs2" runat="server" CssClass="validationSummary"/>
              <asp:CustomValidator ID="cv2" runat="server" Display="None" OnServerValidate="ValidateSelectedRooms" ErrorMessage="Please select at least one room"/>
              
                      <asp:Repeater ID="rpRoomSelect" runat="server" OnItemCreated="rpRoomSelectRepeater_ItemCreated">
                        <HeaderTemplate>
                          <table cellpadding="5">
                        </HeaderTemplate>
                        <ItemTemplate>
                          <asp:Literal ID="litRowStart" runat="server"/>
                           <td>                           
                                 <asp:HiddenField id="hdRoomProfileID" runat="server" Value='<%# Eval("RoomProfileID")%>'/>
                       		     <asp:HiddenField id="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>'/>
                       		     <asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
                                 <asp:Label ID="litRoomName" runat="server" Text='<%#Eval("RoomName")%>'  />                          
                                 &nbsp;
                           </td>
                           <td>
                                     <asp:DropDownList ID="ddNumberOfRooms" runat="server" EnableViewState="false">
                                        <asp:ListItem Text="0" />
                                        <asp:ListItem Text="1" />
                                        <asp:ListItem Text="2" />
                                        <asp:ListItem Text="3" />
                                        <asp:ListItem Text="4" />
                                        <asp:ListItem Text="5" />
                                        <asp:ListItem Text="6" />
                                        <asp:ListItem Text="7" />
                                        <asp:ListItem Text="8" />
                                        <asp:ListItem Text="9" />
                                        <asp:ListItem Text="10" />
                                     </asp:DropDownList>&nbsp;
                           </td>
                          <asp:Literal ID="litRowEnd" runat="server"/> 
                        </ItemTemplate>
                        <FooterTemplate>
                          </table>
                        </FooterTemplate>
                    </asp:Repeater>
                       
            <p style="color:White">HOT TIP! You can print out a full contents list for your selected rooms prior to completing the online estimate, use the print button above. Press save to return later.</p>     
            </asp:WizardStep>
            <asp:WizardStep ID="ws3" runat="server" Title="Household Inventory">
            
                <h4><asp:Literal ID="litRoom" runat="server" /></h4>
                          <table width="100%">
                           <tr>
                            <td valign="top">
                            <asp:Repeater ID="rpItemsRepeater" runat="server" OnItemCreated="rpItemsRepeater_ItemCreated">
                                <HeaderTemplate>
                                  <table width="100%">
                                    <tr>
                                      <td colspan="3">Select items in the room:</td>
                                    </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                  <asp:Literal ID="litRowStart" runat="server"/>
                                   <td style=" width:90;" valign="top">
                                   		<div class="imagebg">
				                                <img  alt='<%# Eval("InventoryName")%>' title='<%# Eval("InventoryDescription")%>' src='<%# FormatImageURL((string) Eval("ImageFileName"))%>' />
				                                <div class="smlcopy"><%# Eval("InventoryName")%></div>	
					                            <asp:HiddenField ID="hdQuoteInventoryID" runat="server" Value='<%# Eval("QuoteInventoryID")%>' />
                                                <asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
                                                <asp:HiddenField ID="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>' />
                                                <asp:HiddenField ID="hdInventoryID" runat="server" Value='<%# Eval("InventoryID")%>' />
                                                <asp:HiddenField ID="hdQuotesRoomID" runat="server" Value='<%# Eval("QuotesRoomID")%>' />
                                                <asp:DropDownList ID="ddNumberOfItems" runat="server" EnableViewState="false">
                                                        <asp:ListItem Text="0" />
                                                        <asp:ListItem Text="1" />
                                                        <asp:ListItem Text="2" />
                                                        <asp:ListItem Text="3" />
                                                        <asp:ListItem Text="4" />
                                                        <asp:ListItem Text="5" />
                                                        <asp:ListItem Text="6" />
                                                        <asp:ListItem Text="7" />
                                                        <asp:ListItem Text="8" />
                                                        <asp:ListItem Text="9" />
                                                        <asp:ListItem Text="10" />
                                                        <asp:ListItem Text="11" />
                                                        <asp:ListItem Text="12" />
                                                        <asp:ListItem Text="13" />
                                                        <asp:ListItem Text="14" />
                                                        <asp:ListItem Text="15" />
                                                        <asp:ListItem Text="16" />
                                                        <asp:ListItem Text="17" />
                                                        <asp:ListItem Text="18" />
                                                        <asp:ListItem Text="19" />
                                                        <asp:ListItem Text="20" />
                                                    </asp:DropDownList>
		                                </div>
                                   </td>
                                  <asp:Literal ID="litRowEnd" runat="server"/> 
                                </ItemTemplate>
                                <FooterTemplate>
                                  </table>
                                </FooterTemplate>
                            </asp:Repeater>
                            </td>
                          
                          <td valign="top" align="center" style="border-left:1px #FFCC00 solid; padding-left:5px;">
                          
                              <asp:Repeater ID="rpCartons" runat="server">
                                <HeaderTemplate>
                                  <table width="100%">
                                    <tr>
                                      <td>Packing Cartons required for this room:</td>
                                    </tr>
                                </HeaderTemplate>
                                <ItemTemplate>
                                   <tr>
                                   <td valign="top">
                                   		<div class="imagebg">
				                                <img alt='<%# Eval("InventoryName")%>' title='<%# Eval("InventoryDescription")%>' src='<%# FormatImageURL((string) Eval("ImageFileName"))%>' />
				                                <div class="smlcopy"><%# Eval("InventoryName")%></div>	
					                            <asp:HiddenField ID="hdQuoteInventoryID" runat="server" Value='<%# Eval("QuoteInventoryID")%>' />
                                                <asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
                                                <asp:HiddenField ID="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>' />
                                                <asp:HiddenField ID="hdInventoryID" runat="server" Value='<%# Eval("InventoryID")%>' />
                                                <asp:HiddenField ID="hdQuotesRoomID" runat="server" Value='<%# Eval("QuotesRoomID")%>' />
                                                <asp:DropDownList ID="ddNumberOfItems" runat="server" EnableViewState="false">
                                                        <asp:ListItem Text="0" />
                                                        <asp:ListItem Text="1" />
                                                        <asp:ListItem Text="2" />
                                                        <asp:ListItem Text="3" />
                                                        <asp:ListItem Text="4" />
                                                        <asp:ListItem Text="5" />
                                                        <asp:ListItem Text="6" />
                                                        <asp:ListItem Text="7" />
                                                        <asp:ListItem Text="8" />
                                                        <asp:ListItem Text="9" />
                                                        <asp:ListItem Text="10" />
                                                        <asp:ListItem Text="11" />
                                                        <asp:ListItem Text="12" />
                                                        <asp:ListItem Text="13" />
                                                        <asp:ListItem Text="14" />
                                                        <asp:ListItem Text="15" />
                                                        <asp:ListItem Text="16" />
                                                        <asp:ListItem Text="17" />
                                                        <asp:ListItem Text="18" />
                                                        <asp:ListItem Text="19" />
                                                        <asp:ListItem Text="20" />
                                                    </asp:DropDownList>
		                                </div>
                                   </td>
                                  </tr> 
                                </ItemTemplate>
                                <FooterTemplate>
                                  </table>
                                </FooterTemplate>
                            </asp:Repeater>
                          
                          </td>
                          </tr>
                          </table>

              <p style="color:White">HOT TIP! Press save to return later.</p> 

            </asp:WizardStep>

            <asp:WizardStep ID="ws4" runat="server" Title="Summary / Review">
            
              <p style="color:White">Almost done!  Please click the link below to review your details.  Then, you can provide any further comments you wish to make&#8230;then press Send Now&#8230;</p>
              
              <span style="color:#FFFFFF;"><asp:Literal ID="litPrintFullHouseInventoryLink" runat="server"/></span>
              
              <h4>Comments for consultant:</h4>
              <asp:ValidationSummary ID="vs3" runat="server" CssClass="validationSummary"/>
              <asp:CustomValidator ID="cv3" runat="server" ControlToValidate="txtConsultantComments" OnServerValidate="ValidateConsultantComments" ErrorMessage="Comments must be shorter than 1000 characters"/>

              <div style=" text-align:center;">
                    <table width="100%">
                      <tr>
                        <td><asp:TextBox ID="txtConsultantComments" runat="server" TextMode="MultiLine" Rows="8" Width="80%"/></td>
                      </tr>
                      <tr>
                        <td align="left" nowrap="nowrap"><asp:CheckBox ID="chkSendCopyTo" runat="server" /><asp:Label ID="lbSendCopyTo" runat="server" /></td>
                      </tr>
                    </table>
                    <captcha:CaptchaControl id="cc1" runat="server" CaptchaMaxTimeout="720" CaptchaMinTimeout="3" CacheStrategy="Session"  CaptchaBackgroundNoise="Extreme" CaptchaFontWarping="Medium" ></captcha:CaptchaControl>
               </div>
            </asp:WizardStep>

        </WizardSteps>

<SideBarStyle VerticalAlign="Top"></SideBarStyle>
    </asp:Wizard>
    
    <div style=" text-align:right;">
       <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/images/back.gif" AlternateText="Back" Width="67" Height="35" CausesValidation="false" EnableViewState="false" />
       <asp:ImageButton ID="btnSave" runat="server" OnClick="btnSave_Click" ImageUrl="~/images/save.gif" AlternateText="Save" width="54" Height="35" EnableViewState="false" /> 
       <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/images/next.gif" AlternateText="Next" width="67" Height="35" EnableViewState="false" />
       <asp:ImageButton ID="btnSendNow" runat="server" OnClick="btnSendNow_Click" AlternateText="Send now" ImageUrl="~/images/sendnow.gif" Width="90"  Height="35" EnableViewState="false" />
    </div>
		     
		
	
	
	
	</div>
	</td>	
	</tr>
	</table>
	</div>
   </div>
    <div style=" text-align:center; padding-top:10px;">
       <a id="lnkSkipThis" runat="server" href="OnSiteQuoteRequest.aspx" class="whitelink" enableviewstate="false">Skip this step and get a Onsite Quote instead.</a>
    </div>
    </asp:Panel>
        
    
    <asp:Panel ID="pnlWizardThankyou" Visible="false" runat="server">
       <p></p>
        <p>Thanks for completing the Online Estimate.</p>
        <p> A Crown consultant will shortly review your details and either email or call you with a quote within 24 hours.</p>
        <p>Meantime, if you have any further questions, feel free to contact one of our friendly representatives on 0508 227 696, or via the Live Chat facility on our web site.</p>
        <p>We look forward to making your move a stress-free experience.</p>
        <p><a href="index.aspx" class="whitelink">Return to Crown Home Page</a></p>
    </asp:Panel>


<!-- ######### -->

</div>
</div>
<!-- left ends -->
</div>

<div id="right">

<!-- BEGIN LivePerson Button Code -->
<div id="chat-panel">
    <a id="_lpChatBtn" href='http://server.iad.liveperson.net/hc/64392397/?cmd=file&file=visitorWantsToChat&site=64392397&byhref=1&imageUrl=http://www.crownrelo.co.nz/images/livepersonchat' target='chat64392397' onclick="var s=s_gi(s_account);s.linkTrackVars='events'; s.linkTrackEvents='event4'; s.events='event4'; s.tl(this,'o','LiveHelp'); lpButtonCTTUrl = 'http://server.iad.liveperson.net/hc/64392397/?cmd=file&file=visitorWantsToChat&site=64392397&imageUrl=http://www.crownrelo.co.nz/images/livepersonchat&referrer='+escape(document.location); lpButtonCTTUrl = (typeof(lpAppendVisitorCookies) != 'undefined' ? lpAppendVisitorCookies(lpButtonCTTUrl) : lpButtonCTTUrl); window.open(lpButtonCTTUrl,'chat64392397','width=472,height=320,resizable=yes');return false;" >
        <img src='http://server.iad.liveperson.net/hc/64392397/?cmd=repstate&site=64392397&channel=web&&ver=1&imageUrl=http://www.crownrelo.co.nz/images/livepersonchat' name='hcIcon' border="0">
    </a>
</div>
<!-- END LivePerson Button code -->

<div id="get-quote-panel"></div>

<div id="special-deals-panel"><a href="special-deals.aspx"><img src="images/special-deals.jpg" alt="Special Deals" /></a></div>

<!-- right ends-->
</div>

<div id="grey">&nbsp;</div>

<div id="footer-links">

<div class="footer-panel">
<h3>NZ Relocation Services</h3>
<ul>
<li><a href="new-zealand-relocation-services/corporate-relocation.html">Corporate Relocation</a></li>
<li><a href="new-zealand-relocation-services/relocation-services.aspx">Relocation Services</a></li>
<li><a href="new-zealand-relocation-services/business-relocation.html">Business Relocation</a></li>
<li><a href="new-zealand-relocation-services/office-relocation.html">Office Relocation</a></li>
<li><a href="new-zealand-relocation-services/moving-house-checklist.html">Moving House Checklist</a></li>
<li><a href="new-zealand-relocation-services/moving-house-checklist.html">House Removals/Relocations</a></li>
<li><a href="new-zealand-relocation-services/packing-standards.html">Packing Standards</a></li>
<li><a href="new-zealand-relocation-services/furniture-moving-quotes.html">Furniture Moving Quotes</a></li>
<li><a href="new-zealand-relocation-services/relocation-calculator.html">Relocation Calculator</a></li>
</ul>
</div>
<div class="footer-panel">
<h3>Local Furniture Moving</h3>
<ul>
<li><a href="local-furniture-moving-services/local-house-relocation.html">Local House Relocation</a></li>

<li><a href="local-furniture-moving-services/local-furniture-movers-auckland.html">Local Furniture Movers in Auckland</a></li>
<li><a href="local-furniture-moving-services/local-furniture-movers-wellington.html">Local Furniture Movers in Wellington</a></li>
<li><a href="local-furniture-moving-services/local-furniture-christchurch.html">Local Furniture Movers in Christchurch</a></li>
</ul>
</div>
<div class="footer-panel">
<h3>Moving Around New Zealand</h3>
<ul>
<li><a href="moving-around-new-zealand/long-distance-moving-services.html">Long Distance Moving Services</a></li>
<li><a href="moving-around-new-zealand/moving-company-auckland.html">Moving Company Auckland</a></li>
<li><a href="moving-around-new-zealand/moving-company-wellington.html">Moving Company Wellington</a></li>
<li><a href="moving-around-new-zealand/moving-company-christchurch.html">Moving Company Christchurch</a></li>
<li><a href="moving-around-new-zealand/moving-company-dunedin.html">Moving Company Dunedin</a></li>
<li><a href="moving-around-new-zealand/special-deals.html">Special Deals</a></li>
<li><a href="moving-around-new-zealand/insurance-protection.html">Transit Protection</a></li>
<li><a href="moving-around-new-zealand/ancillary-services.html">Ancillary Services</a></li>
</ul>
</div>
<div class="footer-panel">
<h3>International Moving</h3>
<ul>
<li><a href="international-relocations/moving-overseas.html">Moving Overseas</a></li>
<li><a href="international-relocations/moving-to-australia.html">Moving to Australia</a></li>
<li><a href="international-relocations/moving-to-new-zealand.html">Moving to New Zealand</a></li>
<li><a href="international-relocations/shipment-of-your-household-goods.html">Shipment of your Household Goods</a></li>
<li><a href="international-relocations/marine-insurance.html">Marine Insurance</a></li>
<li><a href="international-relocations/ancillary-services.html">Ancillary Services</a></li>
</ul>
</div>



<!-- footer links ends -->
</div>
<div id="grey">&nbsp;</div>
<div id="social-links" >
            <div class="facebook">
                <a href="http://www.facebook.com/pages/Crown-Relocations-NZ/363472075184"><img src="images/facebook.gif" alt="Facebook" /></a>
            </div>            
            <div class="plusone">
                <script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
                <g:plusone></g:plusone>
            </div>
            <div class="twitter" >
                <a href="http://twitter.com/CrownReloNZ"><img src="images/twitter.gif" alt="Twitter" /></a>
            </div>
        </div>



<!-- content ends -->
</div>

<p>&nbsp;</p>
<p>&nbsp;</p>


<!-- container ends -->

    </form>

    <!-- BEGIN Invitation Positioning  -->
    <script type="text/javascript">
        var lpPosY = 20;
        var lpPosX = 20;
    </script>
    <!-- END Invitation Positioning  -->

    <!-- BEGIN HumanTag Monitor. DO NOT MOVE! MUST BE PLACED JUST BEFORE THE /BODY TAG -->
    <script type="text/javascript" src="js/x.js"></script>

    <div name="mylayer" id="mylayer" style="z-index:90; position:absolute; visibility:hidden; left:10px; top:10px;">
        <table border="0" cellpadding="0" cellspacing="0">
            <tbody>
                <tr>
                    <td>
                        <a name="needRef" id="needRef" href="#" title="invitation popup window for live chat with an online representative" onclick="return hcAcceptCall()" target="_self" onmouseover='hcSetImageGo("need_help","need_help_on.gif",false)' onmouseout='hcSetImageGo("need_help","need_help_off.gif",true)'>
                            <img name="need_help" id="need_help" onload="hcFloatIconLoaded()" alt="invitation popup window for live chat with an online representative" style="display:block;" border="0"/>
                        </a>
                        <a href="#" onclick="return hcRejectCall()" target="_self" onmouseover='hcSetImageGo("need_close","close_on.gif",false)' onmouseout='hcSetImageGo("need_close","close_off.gif",true)'>
                            <img name="need_close" id="need_close" alt="Close Chat Invitation" style="display:block;" border="0"/>
                        </a>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- END HumanTag Monitor. DO NOT MOVE! MUST BE PLACED JUST BEFORE THE /BODY TAG -->

    <!-- BEGIN Google Analytics -->
    <script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E")); 
    </script> 
    <script type="text/javascript">
        try {
            var pageTracker = _gat._getTracker("UA-484517-1");
            pageTracker._trackPageview();
        } catch (err) { }
    </script> 
    <!-- END Google Analytics -->

    <!-- BEGIN LivePerson Monitor. -->
        <script type="text/javascript">            var lpMTagConfig = { 'lpServer': "server.iad.liveperson.net", 'lpNumber': "64392397", 'lpProtocol': "https" }; function lpAddMonitorTag(src) { if (typeof (src) == 'undefined' || typeof (src) == 'object') { src = lpMTagConfig.lpMTagSrc ? lpMTagConfig.lpMTagSrc : '/hcp/html/mTag.js'; } if (src.indexOf('http') != 0) { src = lpMTagConfig.lpProtocol + "://" + lpMTagConfig.lpServer + src + '?site=' + lpMTagConfig.lpNumber; } else { if (src.indexOf('site=') < 0) { if (src.indexOf('?') < 0) src = src + '?'; else src = src + '&'; src = src + 'site=' + lpMTagConfig.lpNumber; } }; var s = document.createElement('script'); s.setAttribute('type', 'text/javascript'); s.setAttribute('charset', 'iso-8859-1'); s.setAttribute('src', src); document.getElementsByTagName('head').item(0).appendChild(s); } if (window.attachEvent) window.attachEvent('onload', lpAddMonitorTag); else window.addEventListener("load", lpAddMonitorTag, false);</script>
    <!-- END LivePerson Monitor. -->

    
</body>
</html>
