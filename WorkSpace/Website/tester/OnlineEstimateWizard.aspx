﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnlineEstimateWizard.aspx.cs" Inherits="OnlineEstimateWizard" EnableEventValidation="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"> 
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Get a Quote | Crown Relocations | New Zealand Moving Company | Furniture Movers | International Relocations | Storage | House Removals</title>
	<meta name="description" content="Crown Relocations is a Furniture Moving Company specialising in Local, Domestic, International Relocations and Corporate Transfers. " />
	<link rel="stylesheet" type="text/css" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=OldCrownMainStyles">
	
	<!--[if !IE]>
		<link rel="stylesheet" type="text/css" href="http://www.crown.kudosweb.com/CMSPages/GetResource.ashx?stylesheetname=CrownMediaQueriesStyles">
	<![endif]-->
	<!--[if IE]>
		<link rel="stylesheet" type="text/css" href="http://www.crown.kudosweb.com/CMSPages/GetResource.ashx?stylesheetname=CrownMediaQueriesQuotePages">
	<![endif]-->
	
	
	<!--[if IE 8]>
	<style type="text/css">
	.items-listing td img
		{
			width: auto !important;
		}

	</style>
	<![endif]-->


	<!--[if IE 7]>
	<style type="text/css">
		.Animter1v1
			{
				margin-top: -192px !important;    
			}
		 .Animter2
			{
				margin-top: -89px !important;    
			}
			
			.w_ContainerImage2
			{
				padding-top: 0px;
				margin-top: -95px;
			}
			.w_ContainerImage1v1
			{
				margin-top: -195px;
			}

	</style>
	<![endif]-->



	<script src="http://code.jquery.com/jquery-latest.js"></script>
	
	<script type="text/javascript" src="/js/tinyfader.js"></script>
	<script language="JavaScript" type="text/javascript" src="//www.crownrelo.com/relo/scripts/s_code_nz.js"></script>
	
	<!--[if lt IE 9]>
	<script src="http://www.crownrelo.co.nz/CrownRelocations/js/css3-mediaqueries.js"></script>
	<![endif]-->

	<script type="text/javascript">

		var _gaq = _gaq || [];
		_gaq.push(['_setAccount', 'UA-484517-1']);
		_gaq.push(['_trackPageview']);

		(function() {
			var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
			ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
			var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
		})();

	</script>
	<link rel="stylesheet" type="text/css" href="new-styles.css">
</head>
<body>
<form id="form1" runat="server"> 
<div class="OnlineEstimateOnly">   
<div class="QuickQuoteOnSite">   
<div class="rounded-content quick quote clearfix">        
<asp:Panel ID="pnlWizard" CssClass="PanelWizard" Visible="true" runat="server">
	<div class="primary-content clearfix">
		<h1>Full Quote</h1>
			   <div class="quote-nav clearfix">
			   <div id="LoginLinkStep1Only" runat="server" visible="false">                
					<a href="http://www.crownrelo.co.nz/Get-a-Quote/Full-Quote/Login-Page.aspx" target="_top" class="LoginLinkForStep">
						<img src="images/login-btn.png" alt="Login to complete your saved quotation" />
					</a>                
				</div>
			<asp:ImageButton ID="btnAddRemoveRooms" runat="server" OnClick="btnAddRemoveRooms_Click" ImageUrl="~/images/go-back-arrow.jpg" AlternateText="Add/Remove Rooms"  EnableViewState="false" CssClass="AddRemoveRoomsLinkForStep" />
			<asp:ImageButton ID="btnPrintThisList" runat="server" OnClientClick="Omniture_DownloadTracker()" OnClick="btnPrintThisList_Click" ImageUrl="~/images/print-arrow.jpg" AlternateText="Print this list" EnableViewState="false" CssClass="PrintLinkOnSteps"  />
		</div>






<asp:Wizard ID="w" runat="server" OnActiveStepChanged="w_ActiveStepChanged" DisplaySideBar="false">
		<WizardSteps>
			<asp:WizardStep ID="ws1" runat="server" Title="Your Details">            
			<div class="content-section content-section-step1 details clearfix">
					<div class="details-form-Width">
						 <table class="details-form">
				  <tr class="ValidationTr">
					<td colspan="2">
					   <asp:ValidationSummary ID="vs1" runat="server" CssClass="validationSummary"/>
					
					   <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtFirstName"  CssClass="FieldValidator"  Display="None" ErrorMessage="Please enter a first name" />
					   <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtDayPhone"   CssClass="FieldValidator"  Display="None" ErrorMessage="Please enter a day time phone number" />
					   <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtEmail"    CssClass="FieldValidator"    Display="None" ErrorMessage="Please enter an email address" />
					   <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtMovingOutDate"  CssClass="FieldValidator" Display="None" ErrorMessage="Please enter an approximate Moving Out date" />
					
					   <asp:RegularExpressionValidator ID="regv1" runat="server" ControlToValidate="txtEmail" CssClass="FieldValidator"  Display="None" ErrorMessage="Please enter a valid email address of the form. (e.g. name@yourwebsite.com" EnableViewState="false"/> 
					   <asp:CustomValidator ID="cv1" runat="server" Display="None" ControlToValidate="txtDayPhone" CssClass="FieldValidator"  OnServerValidate="ValidatePhone" ErrorMessage="Please ensure Day Phone contains only numbers and starts with 0."/>
					</td>
				  </tr>
				  <tr>
					<td colspan="2"><h2>Your Details:</h2></td>                    
				  </tr>
				  <tr>
						<td>
							<label>First Name:</label><span class="mandatory">*</span>
							<asp:TextBox ID="txtFirstName" runat="server" MaxLength="20" CssClass="QuoteTextBoxField" Text="Gitesh" />
						</td>
						
						<td>
							<label>Surname:</label>
							<asp:TextBox ID="txtSurname" runat="server" MaxLength="50" CssClass="QuoteTextBoxField" Text="Shah" />
						</td>
				  </tr>
				  <tr>
					<td>
						<label>Day Phone:</label><span class="mandatory">*</span>
						<asp:TextBox ID="txtDayPhone" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" Text="09555555" />
					</td>
					<td>
						<label>Email:</label><span class="mandatory">*</span>
						<asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="QuoteTextBoxField" Text="gitesh@kudosweb.com" />
					</td>
				  </tr>
				  
				  <tr>
					<td colspan="2"><h2>Delivery Details:</h2></td>
				  </tr>                  
				  <tr>
					<td>
						<label>Approximate Moving Out Date</label><span class="mandatory">*</span>
						<asp:TextBox ID="txtMovingOutDate" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" Text="09/08/09"/>
					</td>
					
					<td>
						<label>Preferred Delivery Date</label>
						<asp:TextBox ID="txtDeliveryDate" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" Text="09/08/09"/>
					</td>
				  </tr>
					<td><h2>Moving From:</h2></td>
					<td><h2>Moving To:</h2></td>
				  </tr>
				  <tr>
					<td>
					<table>
						<tbody>
							<tr>
								<td>
								<label>Street:</label>
						<asp:TextBox ID="txtStreetFrom" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" />
								</td>
							</tr>
							<tr>
								<td>
								<label>Suburb:</label>
						<asp:TextBox ID="txtSuburbFrom" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" />
								</td>
							</tr>
							<tr>
								<td>
								 <label>Town/City:</label>
						<asp:TextBox ID="txtCityFrom" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" />
								</td>
							</tr>
							<tr>
								<td>
								<label>Country:</label>
					<asp:DropDownList ID="ddCountryFrom" runat="server" EnableViewState="false" CssClass="CountriesDropdown">
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
							</tr>
						</tbody>
					</table>
						
					</td>
					<td>
						<table>
							<tbody>
								<tr>
									<td>
									 <label>Street:</label>
						<asp:TextBox ID="txtStreetTo" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" />
									</td>
								</tr>
								<tr>
									<td>
									<label>Surburb:</label>
						<asp:TextBox ID="txtSuburbTo" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" />
									</td>
								</tr>
								<tr>
									<td>
									<label>Town/City:</label>
						<asp:TextBox ID="txtCityTo" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" />
									</td>
								</tr>
								  <tr>
								<td>
								<label>Country:</label>
					<asp:DropDownList ID="ddCountryFromRight" runat="server" EnableViewState="false" CssClass="CountriesDropdown">
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
							</tr>

							</tbody>
						</table>
					   
					</td>
				  </tr>
				 
				</table>
				
					</div>
				</div>
			</asp:WizardStep>
			<asp:WizardStep ID="ws2" runat="server" Title="Room Selection">
			<div class="content-section content-section-step2 details">

			<p><asp:Literal ID="litPrintBlankHouseInventory" runat="server"/></p>
			

			<div class="header clearfix">
					<div class="title">
						<h2>Select Rooms below:</h2>
						<span>
							<asp:ValidationSummary ID="vs2" runat="server" CssClass="validationSummary"/>
							<asp:CustomValidator ID="cv2" runat="server" Display="None" OnServerValidate="ValidateSelectedRooms" ErrorMessage="Please select at least one room"/>
						</span>
					</div>                    
			</div>
  
			 <div class="items-listing">
					  <asp:Repeater ID="rpRoomSelect" runat="server" OnItemCreated="rpRoomSelectRepeater_ItemCreated">
						<HeaderTemplate>
						  <table>
						</HeaderTemplate>
						<ItemTemplate>
						  <asp:Literal ID="litRowStart" runat="server"/>
						   <td>  
												   
								 <asp:HiddenField id="hdRoomProfileID" runat="server" Value='<%# Eval("RoomProfileID")%>'/>
								 <asp:HiddenField id="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>'/>
								 <asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
								 <img src="/images/RoomNames/<%# Eval("RoomID")%>.png" alt="<%#Eval("RoomName")%>">
								 <p class="Step2RoomName"><asp:Label ID="litRoomName" runat="server" Text='<%#Eval("RoomName")%>' Visible="false" /><%#Eval("RoomName")%></p>
															
									 <asp:DropDownList ID="ddNumberOfRooms" CssClass="Dropdowns1" runat="server" EnableViewState="false">
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
			 </div>

			</div>
			</asp:WizardStep>
			<asp:WizardStep ID="ws3" runat="server" Title="Household Inventory">
		   <div class="content-section content-section-step3 clearfix">
					
				<div class="header clearfix">
					<div class="title">
						<h1><asp:Literal ID="litRoom" runat="server" /></h1>
						<span>Select items in the room</span>
					</div>                    

				</div>
				<div class="items-listing clearfix">                          
							<asp:Repeater ID="rpItemsRepeater" runat="server" OnItemCreated="rpItemsRepeater_ItemCreated">
								<HeaderTemplate>
								  <table>                                  
								</HeaderTemplate>
								<ItemTemplate>
								  
								  <asp:Literal ID="litRowStart" runat="server" />                                  
								   <td>                                   		
												<img  alt='<%# Eval("InventoryName")%>' title='<%# Eval("InventoryDescription")%>' src='<%# FormatImageURL((string) Eval("ImageFileName"))%>' />
												<p class="Step3RoomName"><%# Eval("InventoryName")%></p>	
												<asp:HiddenField ID="hdQuoteInventoryID" runat="server" Value='<%# Eval("QuoteInventoryID")%>' />
												<asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
												<asp:HiddenField ID="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>' />
												<asp:HiddenField ID="hdInventoryID" runat="server" Value='<%# Eval("InventoryID")%>' />
												<asp:HiddenField ID="hdQuotesRoomID" runat="server" Value='<%# Eval("QuotesRoomID")%>' />
												<asp:DropDownList ID="ddNumberOfItems" CssClass="Dropdowns2" runat="server" EnableViewState="false">
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
									   
								   </td>                                   
								  <asp:Literal ID="litRowEnd" runat="server"/> 
								</ItemTemplate>
								<FooterTemplate>
								  </table>
								</FooterTemplate>
							</asp:Repeater>                           
						</div>    
					  </div>    
						  <asp:Repeater ID="rpCartons" runat="server">
								<HeaderTemplate>
								<div class="carton-options">
								<h2>Packing Cartons required for this room</h2>
								  <table>
								  <tbody>                                   
								</HeaderTemplate>
								<ItemTemplate>
								   <tr>
								   <td>
												<img alt='<%# Eval("InventoryName")%>' title='<%# Eval("InventoryDescription")%>' src='<%# FormatImageURL((string) Eval("ImageFileName"))%>' />
												<p class="Step3RoomName" valign="middle"><%# Eval("InventoryName")%></p>	
												<asp:HiddenField ID="hdQuoteInventoryID" runat="server" Value='<%# Eval("QuoteInventoryID")%>' />
												<asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
												<asp:HiddenField ID="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>' />
												<asp:HiddenField ID="hdInventoryID" runat="server" Value='<%# Eval("InventoryID")%>' />
												<asp:HiddenField ID="hdQuotesRoomID" runat="server" Value='<%# Eval("QuotesRoomID")%>' />
												<asp:DropDownList ID="ddNumberOfItems" CssClass="Dropdowns3" runat="server" EnableViewState="false">
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
									   
								   
								  </tr> 
								</ItemTemplate>
								<FooterTemplate>
								  </tbody>
								  </table>                                  

								  </div>
								</FooterTemplate>
							</asp:Repeater>
						  
			</asp:WizardStep>
			<asp:WizardStep ID="ws4" runat="server" Title="Summary / Review">
			<div class="content-section content-section-step4 details clearfix">              
			  <br />
			  <span class="pdf"><asp:Literal ID="litPrintFullHouseInventoryLink" runat="server"/></span>
			  <br /><br />
			  <h2>Comments for consultant:</h2>
			  <%--<asp:ValidationSummary ID="vs3" runat="server" CssClass="validationSummary"/>--%>
			  <asp:CustomValidator ID="cv3" runat="server" ControlToValidate="txtConsultantComments" OnServerValidate="ValidateConsultantComments" ErrorMessage="Comments must be shorter than 1000 characters"/>

			  <div class="ConsultantComments">
					<table width="100%">
					  <tr>
						<td><asp:TextBox ID="txtConsultantComments" runat="server" TextMode="MultiLine" Rows="8" Width="80%"/></td>
					  </tr>
					  <tr>
						<td align="left" ><asp:CheckBox ID="chkSendCopyTo" runat="server" />&nbsp;<asp:Label ID="lbSendCopyTo" runat="server" /></td>
					  </tr>
					</table>
					<%--<captcha:CaptchaControl id="cc1" runat="server" CaptchaMaxTimeout="720" CaptchaMinTimeout="3" CacheStrategy="Session"  CaptchaBackgroundNoise="Extreme" CaptchaFontWarping="Medium" ></captcha:CaptchaControl>--%>
			   </div>
			   </div>
			</asp:WizardStep>
		</WizardSteps>		
	</asp:Wizard>
 

	

	</div>




	<div class="secondary-content">
	<div class="NavigationButtons NavigationButtonsTop">
		<table width="100%">
		<tr><td align="left">
		   <asp:ImageButton ID="btnBackTop" runat="server" OnClick="btnBack_Click" ImageUrl="~/images/Back.jpg" AlternateText="Back" CausesValidation="false" EnableViewState="false" />
		   </td><td>
		   <asp:ImageButton ID="btnSaveTop" runat="server" OnClick="btnSave_Click" ImageUrl="~/images/Save.jpg" AlternateText="Save" EnableViewState="false"  CssClass="silentooltip" OnClientClick="_gaq.push(['_trackEvent', 'Full Quote Form', 'Form Saved']);" /> 
		   </td><td align="right">
		   <asp:ImageButton ID="btnNextTop" runat="server" OnClick="btnNext_Click" ImageUrl="~/images/Next.jpg" AlternateText="Next" EnableViewState="false"  CssClass="silentooltip" />
		   </td><td align="right">
		   <asp:ImageButton ID="btnSendNowTop" runat="server" OnClick="btnSendNow_Click" AlternateText="Send now" ImageUrl="~/images/Send.jpg" EnableViewState="false"  CssClass="silentooltip" OnClientClick="_gaq.push(['_trackEvent', 'Full Quote Form', 'Form Submitted']);" />          
		   </td></tr>
		</table>
		</div>
		<div class="clearfix"></div>
							<div class="ContainerHeader">                    

								<asp:Label runat="server" Text="Label 2" ID="SQLContainerValue" CssClass="Labels"  Visible="false" />    
								<asp:Label runat="server" Text="Label 2" ID="ContainersFull" CssClass="Labels" Visible="false" />

								<span id="Container1LabelTop" runat="server" visible="false">Volume Estimator</span>
								<span id="TruckAnimater1" runat="server" visible="false">                                        
									<img src="/images/Big-Container.jpg" alt="Animated Container" class="ContainerImage1" />
									<span class="Animater1_Width">        
										<img src="/images/container-animate.png" alt="Truck Animater" width="0" height="85px" class="Animter1" />
									</span>
									<asp:Label runat="server" Text="Label 2" ID="ContainerImage1" CssClass="Labels" Visible="false" />
									<span class="w_ContainerImage1">0</span>                                     
								</span>
								<span id="Container1LabelBottom" runat="server" visible="false"></span>   

								<span id="TruckAnimater2" runat="server" visible="false">        
								<span id="Container2LabelTop" runat="server" visible="false">Volume Estimator</span>
									<img src="/images/Big-Container.jpg" alt="Animated Container" class="ContainerImage1v1" />
									<span class="Animater1_Width">        
										<img src="/images/container-animate.png" alt="Truck Animater" width="0" height="85px" class="Animter1v1" />
									</span>
									<asp:Label runat="server" Text="100" ID="ContainerImage1v1" CssClass="Labels" Visible="false" />
									<span class="w_ContainerImage1v1">100%</span>    
		
									<img src="/images/Big-Container.jpg" alt="Animated Container" class="ContainerImage2" />
									<span class="Animater2_Width">        
										<img src="/images/container-animate.png" alt="Truck Animater" width="0" height="85px" class="Animter2" />
									</span>
									<asp:Label runat="server" Text="Label 2" ID="ContainerImage2" CssClass="Labels" Visible="false" />
									<span class="w_ContainerImage2"></span> 
									<span id="Container2LabelBottom" runat="server" visible="false"></span>   
								</span>
							</div>
<div class="clearfix"></div>
		<ul class="NavigationSteps">
				<li class="RightMenuNumbers" <%=SetStepTabStyle(0)%>><asp:LinkButton ID="btnStep1" runat="server" CommandArgument="0" Text="1. Your Details" OnClick="ChangeStep"/></li>
				<li class="RightMenuNumbers" <%=SetStepTabStyle(1)%>><asp:LinkButton ID="btnStep2" runat="server" CommandArgument="1" Text="2. Room Selection" OnClick="ChangeStep"/></li>
				<li class="RightMenuNumbers" <%=SetStepTabStyle(2)%>><asp:LinkButton ID="btnStep3" runat="server" CommandArgument="2" Text="3. Household Inventory" OnClick="ChangeStep"/></li>
				<asp:Repeater ID="rpRoomsRepeater" runat="server">
					<ItemTemplate>
						<li id="TabListItem" runat="server">
							<asp:LinkButton ID="btnRoom" runat="server" Text='<%#FormatRoomName((string) Eval("RoomName"), (int) Eval("RoomNo"))%>' CommandArgument='<%# Eval("QuoteRoomID")%>'  OnClick="btnRoom_Click"/>
							<asp:HiddenField ID="hdSelectedItems" runat="server" Value='<%#Eval("ItemsSlected")%>' />
						</li>
					</ItemTemplate>
				</asp:Repeater>
				<li  class="RightMenuNumbers" <%=SetStepTabStyle(3)%>><asp:LinkButton ID="Step4LinkButton" runat="server" CommandArgument="3" Text="4. Review / Send" OnClick="ChangeStep"/></li>
		</ul>
		   
		<div class="RightSideComments red" runat="server" id="ws1Comment" visible="false"><strong>HOT TIP!</strong><p> Press the save button and you will be sent an email containing a password that will allow you to return later.</p></div>           
		<div class="RightSideComments red" runat="server" id="ws2Comment" visible="false">
			<strong>HOT TIPS!</strong>  <p><strong>Back:</strong> Return to previous page</p><p> <strong>Save:</strong> Save this session so you can complete the form later</p><p> <strong>Next:</strong> Save this session and move to the next page</p> <p><strong>Print: </strong> Generates a PDF for you to save or print. Ideal if you want to walk round the house to complete the form, then enter it here later </p>     
		</div>
		<div class="RightSideComments red" runat="server" id="ws3Comment" visible="false">
			<strong>HOT TIPS!</strong><p><strong>Back:</strong> Return to previous page</p><p> <strong>Save:</strong> Update your container(s) and save this session</p><p> <strong>Next:</strong> Save this session and move to the next page</p> <p><strong>Print: </strong> Generates a PDF for you to save or print. Ideal if you want to walk round the house to complete the form, then enter it here later </p><p><strong>Volume Estimator</strong> displays maximum of 2 full containers per inventory</p>
		</div>                       
		<div class="RightSideComments red" runat="server" id="ws4Comment" visible="false">
			<strong>Almost done!</strong><p><strong>Send:</strong> Please review your details and provide any further comments you wish to make then press Send</p><p> <strong>Print Full Household Inventory:</strong> This saves a PDF with the results of all your work, for future reference</p>
		</div>


		<div class="NavigationButtons">
		<table width="100%">
		<tr><td align="left">
		   <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/images/Back.jpg" AlternateText="Back" CausesValidation="false" EnableViewState="false" />
		   </td><td>
		   <asp:ImageButton ID="btnSave" runat="server" OnClick="btnSave_Click" ImageUrl="~/images/Save.jpg" AlternateText="Save" EnableViewState="false"  CssClass="silentooltip" OnClientClick="_gaq.push(['_trackEvent', 'Full Quote Form', 'Form Saved']);" /> 
		   </td><td align="right">
		   <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/images/Next.jpg" AlternateText="Next" EnableViewState="false"  CssClass="silentooltip" />
		   </td><td align="right">
		   <asp:ImageButton ID="btnSendNow" runat="server" OnClick="btnSendNow_Click" AlternateText="Send now" ImageUrl="~/images/Send.jpg" EnableViewState="false"  CssClass="silentooltip" OnClientClick="_gaq.push(['_trackEvent', 'Full Quote Form', 'Form Submitted']);" />          
		   </td></tr>
		</table>
		</div>

			<div class="SkipLink">
			   <a id="lnkSkipThis" runat="server" href="OnSiteQuoteRequest.aspx" class="whitelink" enableviewstate="false">Skip this step and get a Quick Quote instead.</a>
			</div>
	</div>            
	
			
	</asp:Panel>

<%--Thank you message Comes When you press send--%>

<asp:Panel ID="pnlWizardThankyou" CssClass="ThanksYouPanel" Visible="false" runat="server">
	   <p></p>
		<h1>Thanks for completing the Online Estimate.</h1>
		<p> A Crown consultant will shortly review your details and either email or call you with a quote within 24 hours.</p>
		<p> In the meantime, if you have any further questions, feel free to contact one of our friendly representatives on 0508 227 696.</p>
		<p>We look forward to making your move a stress-free experience.</p>

		<div class="special-tip">
			<h2>Special Tip</h2>
			<p>If you are moving overseas <a href="http://www.crownrelo.co.nz/Foreign-Exchange.aspx" target="_parent">click here</a> to transfer funds at super competitive exchange rates that the banks won't match.</p>
		</div>

		<p><a href="http://www.crownrelo.co.nz" class="whitelink" target="_parent">Return to Crown Home Page</a></p>


<!-- Google Code for Full Quote Conversion Page Starts --> 
<script type="text/javascript"> 
/* <![CDATA[ */ 
var google_conversion_id = 1066015500; 
var google_conversion_language = "en"; 
var google_conversion_format = "3"; 
var google_conversion_color = "ffffff"; 
var google_conversion_label = "2s2zCJDHsgMQjLao_AM"; 
var google_conversion_value = 0; 
/* ]]> */ 
</script> 
<script type="text/javascript" src="http://www.googleadservices.com/pagead/conversion.js"> 
</script> 
<noscript> 
<div style="display:inline;"> 
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1066015500/?value=0&amp;label=2s2zCJDHsgMQjLao_AM&amp;guid=ON&amp;script=0"/> 
</div> 
</noscript> 
<!-- Google Code for Full Quote Conversion Page Ends --> 



	</asp:Panel>

</div>
</div>
</div>
</form>
<script>

	var ContainerJquery = jQuery.noConflict();
	(function ($) {
	
		$(document).ready(function () {
			
			

			var Container1value = $('#ContainerImage1').text();
			if (Container1value != "") {
				$('.Animter1').animate({
					width: Number(Container1value) + '%'
				}, 1500, function () {// Animation complete.                    
				});

				$('.w_ContainerImage1').text((Number(Container1value).toFixed(0)) + '%');
//                function increment() {
//                    $('.w_ContainerImage1').text(parseFloat($('.w_ContainerImage1').text()) + 1)//sets the base number + 1

//                    if (parseFloat($('.w_ContainerImage1').text()) < Container1value) //Sets the incremental number top limit
//                    {
//                        setTimeout(increment, 15)//Set timer for increment
//                    }
//                }
//                increment();
			}

			var Container1valuev1 = $('#ContainerImage1v1').text();
			var Container2value = $('#ContainerImage2').text();
			if (Container2value != "") {
				$('.Animter2').animate({
					width: Number(Container2value) + '%'
				}, 1500, function () {// Animation complete.
					
				});

				$('.w_ContainerImage2').text((Number(Container2value).toFixed(0)) + '%');
			}

			if (Container1valuev1 != "") {
				$('.Animter1v1').animate({
					width: Number(Container1valuev1) + '%'
				}, 1500, function () {// Animation complete.                    
				});
			}
		});
	})(ContainerJquery);    

</script>
</body>
</html>