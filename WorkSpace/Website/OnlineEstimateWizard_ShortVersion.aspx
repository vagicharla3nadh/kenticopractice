﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnlineEstimateWizard_ShortVersion.aspx.cs" Inherits="OnlineEstimateWizardShortVersion" EnableEventValidation="false" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Get a Quote | Crown Relocations | New Zealand Moving Company | Furniture Movers | International Relocations | Storage | House Removals</title>
    <meta name="description" content="Crown Relocations is a Furniture Moving Company specialising in Local, Domestic, International Relocations and Corporate Transfers. " />
        
		<script type="text/javascript" src="http://www.crownrelo.co.nz/CrownRelocations/js/libs/jquery-1.7.2.min.js"></script>
		<link href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" type="text/css" rel="stylesheet"/>
		<script type="text/javascript" src="http://code.jquery.com/ui/1.9.2/jquery-ui.js" ></script>		
		<link rel="stylesheet" type="text/css" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=CrownSpecialDeals" />
		<style>
			p {
				margin:0;
			}
		</style>		

    <script type="text/javascript">
        // document.domain = "crownrelo.co.nz";
        document.domain = "crownrelo.co.nz";
    </script>


    <script type="text/javascript" src="/js/tinyfader.js"></script>
    <script language="JavaScript" type="text/javascript" src="//www.crownrelo.com/relo/scripts/s_code_nz.js"></script>
    
</head>
<body onload="redirect()">
<form id="form1" runat="server"> 

<%--
Uncomment this to make ajax work and also uncomment in the code behind.
<asp:ScriptManager EnablePartialRendering="true" ID="myScriptManager" runat="server"></asp:ScriptManager>
 <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" Visible="false">

 <ContentTemplate>
 <asp:Label ID="Label1" runat="server" /><br />
 <asp:Button ID="Button1" runat="server" Text="Update Both Panels" OnClick="Button1_Click" />
 <asp:Button ID="Button2" runat="server" Text="Update This Panel" OnClick="Button2_Click" />
 </ContentTemplate>

 </asp:UpdatePanel>

 <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" Visible="false">

    <ContentTemplate>
        <asp:Label ID="Label2" runat="server" ForeColor="red" />
    </ContentTemplate>
 
     <Triggers>
     <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
     </Triggers>

 </asp:UpdatePanel>--%>
 
<asp:Panel ID="pnlWizard" CssClass="PanelWizard" Visible="true" runat="server">

<div class="move-container-wrapper l-two-col">
			                            <div class="rooms-info l-two-col">
				                            <div class="room-type">
					                            <p class="white-text text23px">Rooms</p>
				                            </div>
				                            <div class="room-items">
					                            <p class="white-text text23px">Items</p>
				                            </div>
			                            </div>
                                                 <div class="rooms-info mc-interface l-two-col">
                                                    <div class="room-type">
        			                                    

 <asp:Repeater ID="rpRoomsRepeater" runat="server">                                
                                       <HeaderTemplate>
                                            <ul class="mc-rooms">
                                       </HeaderTemplate>
                                        <ItemTemplate>                
                                            <li id="TabListItem" runat="server">
                                                <asp:LinkButton ID="btnRoom" runat="server" Text='<%#FormatRoomName((string) Eval("RoomName"), (int) Eval("RoomNo"))%>' CommandArgument='<%# Eval("QuoteRoomID")%>'  OnClick="btnRoom_Click"/>
                                                <asp:HiddenField ID="hdSelectedItems" runat="server" Value='<%#Eval("ItemsSlected")%>' />
                                            </li>
                                        </ItemTemplate>                                                                                    
                                       <FooterTemplate>
                                                        </ul>                                            
                                       </FooterTemplate>                                       
                            </asp:Repeater>

                                 </div>
                            <div class="room-items">
                				<div class="room-items-listing">

<asp:Wizard ID="w" runat="server" OnActiveStepChanged="w_ActiveStepChanged" DisplaySideBar="false">
        <WizardSteps>
            <asp:WizardStep ID="ws1" runat="server" Title="Your Details">     
            <div align="center">
                <img src="images/loading.gif" alt="loading" width="150px" height="150px" />
            </div>
            <div class="hidden">                    
                  <div class="ValidationTr">                    
                       <asp:ValidationSummary ID="vs1" runat="server" CssClass="validationSummary"/>                    
                       <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtFirstName"  CssClass="FieldValidator"  Display="None" ErrorMessage="Please enter a first name" />
                       <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtDayPhone"   CssClass="FieldValidator"  Display="None" ErrorMessage="Please enter a day time phone number" />
                       <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtEmail"    CssClass="FieldValidator"    Display="None" ErrorMessage="Please enter an email address" />
                       <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtMovingOutDate"  CssClass="FieldValidator" Display="None" ErrorMessage="Please enter an approximate Moving Out date" />                    
                       <asp:RegularExpressionValidator ID="regv1" runat="server" ControlToValidate="txtEmail" CssClass="FieldValidator"  Display="None" ErrorMessage="Please enter a valid email address of the form. (e.g. name@yourwebsite.com" EnableViewState="false"/> 
                       <asp:CustomValidator ID="cv1" runat="server" Display="None" ControlToValidate="txtDayPhone" CssClass="FieldValidator"  OnServerValidate="ValidatePhone" ErrorMessage="Please ensure Day Phone contains only numbers and starts with 0."/>                    
                  </div>    
                    <div class="CompulsoryClasses">                  
                        <asp:TextBox ID="txtFirstName" runat="server" MaxLength="120" CssClass="QuoteTextBoxField SDFirstName" Text="Crown Special Deals: " />
                        <asp:TextBox ID="txtSurname" runat="server" MaxLength="50" CssClass="QuoteTextBoxField" Text="Surname" />
                        <asp:TextBox ID="txtDayPhone" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" Text="090000000" />
                        <asp:TextBox ID="txtEmail" runat="server" MaxLength="100" CssClass="QuoteTextBoxField" Text="UserOnSpecialDeals@crownrelo.co.nz" />
                        <asp:TextBox ID="txtMovingOutDate" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" Text="09/09/2012" />
                    </div>
                        
                    <div class="NonCompulsoryClasses">                            
                    <asp:TextBox ID="txtDeliveryDate" runat="server" MaxLength="30" CssClass="QuoteTextBoxField" Visible="false" />
                    <asp:TextBox ID="txtStreetFrom" runat="server" MaxLength="30" CssClass="QuoteTextBoxField"  Visible="false" />
                    <asp:TextBox ID="txtStreetTo" runat="server" MaxLength="30" CssClass="QuoteTextBoxField"  Visible="false" />
                    <asp:TextBox ID="txtSuburbFrom" runat="server" MaxLength="30" CssClass="QuoteTextBoxField"  Visible="false" />
                    <asp:TextBox ID="txtSuburbTo" runat="server" MaxLength="30" CssClass="QuoteTextBoxField"  Visible="false" />
                    <asp:TextBox ID="txtCityFrom" runat="server" MaxLength="30" CssClass="QuoteTextBoxField"  Visible="false" />
                    <asp:TextBox ID="txtCityTo" runat="server" MaxLength="30" CssClass="QuoteTextBoxField"  Visible="false" />
                    <asp:DropDownList ID="ddCountryFrom" runat="server" EnableViewState="false" CssClass="CountriesDropdown">
                    <asp:ListItem Value="1" Text="New Zealand"/>                    
                    </asp:DropDownList>

                    <asp:DropDownList ID="ddCountryFromRight" runat="server" EnableViewState="false" CssClass="CountriesDropdown">
                    <asp:ListItem Value="1" Text="New Zealand"/>                    
                    </asp:DropDownList>


                    </div>                    
           </div>                
                <script type="text/javascript">
                    var AnotherJquery32 = jQuery.noConflict();
                    (function ($) {
                        var params = {};
                        var URLParams = "";
                        var ps = window.location.search.split(/\?|&/);
                        for (var i = 0; i < ps.length; i++) {
                            if (ps[i]) {
                                var p = ps[i].split(/=/);
                                params[p[0]] = p[1];
                                URLParams = URLParams + p[0] + '=' + p[1] + '&';
                            }
                        }

                        $('.SDFirstName').attr("value", "Crown Special Deals: " + params.SDID);
                    })(AnotherJquery32);
                </script>

                <script type="text/javascript">
                <!--
                    function redirect() {
                        document.getElementById('btnNext').click();
                    }               
                //-->
                </script>
            </asp:WizardStep>
            <%--Step 2--%>
            <asp:WizardStep ID="ws2" runat="server" Title="Room Selection">
            <div align="center">
                <img src="images/loading.gif" alt="loading" width="150px" height="150px" />
            </div>            
                    <asp:ValidationSummary ID="vs2" runat="server" CssClass="validationSummary"/>
                    <asp:CustomValidator ID="cv2" runat="server" Display="None" OnServerValidate="ValidateSelectedRooms" ErrorMessage="Please select at least one room"/>      		                    
                              <asp:Repeater ID="rpRoomSelect" runat="server" OnItemCreated="rpRoomSelectRepeater_ItemCreated">                        
                                <ItemTemplate>
                                  <asp:Literal ID="litRowStart" runat="server"/>                                                                                
                                         <asp:HiddenField id="hdRoomProfileID" runat="server" Value='<%# Eval("RoomProfileID")%>'/>
                       		             <asp:HiddenField id="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>'/>
                       		             <asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />                                 
                                         <asp:Label ID="litRoomName" runat="server" Text='<%#Eval("RoomName")%>' Visible="false" /> 
                                         <asp:DropDownList ID="ddNumberOfRooms" CssClass='hidden' runat="server" EnableViewState="false">                                                                                    
                                            <asp:ListItem Text="1" Selected="True" />                                        
                                            <asp:ListItem Text="0" />
                                         </asp:DropDownList>  
                                         <br />                         
                                  <asp:Literal ID="litRowEnd" runat="server"/> 
                                </ItemTemplate>                        
                            </asp:Repeater>                                 
            
                            <script>
                                    var AnotherJquery2 = jQuery.noConflict();           
                                    (function($){                                        
                                            $('#w_rpRoomSelect_ctl00_ddNumberOfRooms').val("1");
                                            $('#w_rpRoomSelect_ctl01_ddNumberOfRooms').val("1");
                                            $('#w_rpRoomSelect_ctl02_ddNumberOfRooms').val("1");
                                            $('#w_rpRoomSelect_ctl05_ddNumberOfRooms').val("1");
                                            $('#w_rpRoomSelect_ctl06_ddNumberOfRooms').val("1");                                            
                                            $('#w_rpRoomSelect_ctl08_ddNumberOfRooms').val("1");
                                            $('#w_rpRoomSelect_ctl09_ddNumberOfRooms').val("1");
                                            $('#w_rpRoomSelect_ctl12_ddNumberOfRooms').val("1");
                                            
                                             $('#w_rpRoomSelect_ctl03_ddNumberOfRooms').val("0");
                                             $('#w_rpRoomSelect_ctl04_ddNumberOfRooms').val("0");
                                             $('#w_rpRoomSelect_ctl07_ddNumberOfRooms').val("0");
                                             $('#w_rpRoomSelect_ctl10_ddNumberOfRooms').val("0");
                                             $('#w_rpRoomSelect_ctl11_ddNumberOfRooms').val("0");
                                    })(AnotherJquery2);
                            </script>

                             <script type="text/javascript">
                                <!--
                                     function redirect() {
                                         document.getElementById('btnNext').click();
                                     }
                                //-->
                            </script>

            </asp:WizardStep>

            <%--Step 3 Starts from Here--%>
            <asp:WizardStep ID="ws3" runat="server" Title="Household Inventory">           
                     <asp:Literal ID="litRoom" runat="server" Visible="false" />

                      <%--Cartons Listing--%>
                          <asp:Repeater ID="rpCartons" runat="server">                          
                                <ItemTemplate>
                                                
                            <div class="mc-item">
                                                <asp:HiddenField ID="hdQuoteInventoryID" runat="server" Value='<%# Eval("QuoteInventoryID")%>' />
                                                <asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
                                                <asp:HiddenField ID="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>' />
                                                <asp:HiddenField ID="hdInventoryID" runat="server" Value='<%# Eval("InventoryID")%>' />
                                                <asp:HiddenField ID="hdQuotesRoomID" runat="server" Value='<%# Eval("QuotesRoomID")%>' />                                                
							        <span class="mc-item-title-wrapper">
								        <span class="mc-item-title"><%# Eval("InventoryName")%>
                                        </span>
							        </span>
                                    <div class="ImageCropping">
                                    <img class="mc-item-image" alt='<%# Eval("InventoryName")%>' title='<%# Eval("InventoryDescription")%>' src='<%# FormatImageURL((string) Eval("ImageFileName"))%>' />
                                    </div>
                                    <span class="DropdownItemsBoxes hidden">
                                    <asp:DropDownList ID="ddNumberOfItems" runat="server" EnableViewState="false" CssClass='<%# Eval("InventoryID")%>'>
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
                                                        <asp:ListItem Text="21" />
                                                        <asp:ListItem Text="22" />
                                                        <asp:ListItem Text="23" />
                                                        <asp:ListItem Text="24" />
                                                        <asp:ListItem Text="25" />
                                                        <asp:ListItem Text="26" />
                                                        <asp:ListItem Text="27" />
                                                        <asp:ListItem Text="28" />
                                                        <asp:ListItem Text="29" />
                                                        <asp:ListItem Text="30" />
                                                        <asp:ListItem Text="31" />
                                                        <asp:ListItem Text="32" />
                                                        <asp:ListItem Text="33" />
                                                        <asp:ListItem Text="34" />
                                                        <asp:ListItem Text="35" />
                                                        <asp:ListItem Text="36" />
                                                        <asp:ListItem Text="37" />
                                                        <asp:ListItem Text="38" />
                                                        <asp:ListItem Text="39" />
                                                        <asp:ListItem Text="40" />                                                        
                                                        <asp:ListItem Text="41" />
                                                        <asp:ListItem Text="42" />
                                                        <asp:ListItem Text="43" />
                                                        <asp:ListItem Text="44" />
                                                        <asp:ListItem Text="45" />
                                                        <asp:ListItem Text="46" />
                                                        <asp:ListItem Text="47" />
                                                        <asp:ListItem Text="48" />
                                                        <asp:ListItem Text="49" />                                                        
                                                        <asp:ListItem Text="50" />
                                                        <asp:ListItem Text="51" />
                                                        <asp:ListItem Text="52" />
                                                        <asp:ListItem Text="53" />
                                                        <asp:ListItem Text="54" />
                                                        <asp:ListItem Text="55" />
                                                        <asp:ListItem Text="56" />
                                                        <asp:ListItem Text="57" />
                                                        <asp:ListItem Text="58" />
                                                        <asp:ListItem Text="59" />                                                        
                                                        <asp:ListItem Text="60" />
                                                        <asp:ListItem Text="61" />
                                                        <asp:ListItem Text="62" />
                                                        <asp:ListItem Text="63" />
                                                        <asp:ListItem Text="64" />
                                                        <asp:ListItem Text="65" />
                                                        <asp:ListItem Text="66" />
                                                        <asp:ListItem Text="67" />
                                                        <asp:ListItem Text="68" />
                                                        <asp:ListItem Text="69" />                                                        
                                                        <asp:ListItem Text="70" />
                                                        <asp:ListItem Text="71" />
                                                        <asp:ListItem Text="72" />
                                                        <asp:ListItem Text="73" />
                                                        <asp:ListItem Text="74" />
                                                        <asp:ListItem Text="75" />
                                                        <asp:ListItem Text="76" />
                                                        <asp:ListItem Text="77" />
                                                        <asp:ListItem Text="78" />
                                                        <asp:ListItem Text="79" />                                                        
                                                        <asp:ListItem Text="80" />
                                                        <asp:ListItem Text="81" />
                                                        <asp:ListItem Text="82" />
                                                        <asp:ListItem Text="83" />
                                                        <asp:ListItem Text="84" />
                                                        <asp:ListItem Text="85" />
                                                        <asp:ListItem Text="86" />
                                                        <asp:ListItem Text="87" />
                                                        <asp:ListItem Text="88" />
                                                        <asp:ListItem Text="89" />                                                        
                                                        <asp:ListItem Text="90" />
                                                        <asp:ListItem Text="91" />
                                                        <asp:ListItem Text="92" />
                                                        <asp:ListItem Text="93" />
                                                        <asp:ListItem Text="94" />
                                                        <asp:ListItem Text="95" />
                                                        <asp:ListItem Text="96" />
                                                        <asp:ListItem Text="97" />
                                                        <asp:ListItem Text="98" />
                                                        <asp:ListItem Text="99" />
                                                        <asp:ListItem Text="100" />
                                                    </asp:DropDownList>		
                             </span>
                             <input class="mc-item-spinner" id='spinnerBoxes-<%# Eval("InventoryID")%>' name="value" value="0" />            
							 <script type="text/javascript">
                                    var AnotherJquery = jQuery.noConflict();           
                                    (function($){
                                        $('#spinnerBoxes-<%# Eval("InventoryID")%>').spinner({ min: 0, max:100 });
                                        $(document).ready(function () {
                                            var ValueOnLoadBoxes<%# Eval("InventoryID")%> = $('.DropdownItemsBoxes .<%# Eval("InventoryID")%>').val();
                                            $('#spinnerBoxes-<%# Eval("InventoryID")%>').val(ValueOnLoadBoxes<%# Eval("InventoryID")%>); 
                                        });
                                        $(".ui-spinner-button").click(function() {
                                            var ValueOfBoxes<%# Eval("InventoryID")%> = $('#spinnerBoxes-<%# Eval("InventoryID")%>').val();
                                            $('.DropdownItemsBoxes .<%# Eval("InventoryID")%>').val(ValueOfBoxes<%# Eval("InventoryID")%>);                                                  
                                        });

                                        $('.ui-spinner-button').change(function() {
                                            
                                        });



                                    })(AnotherJquery);    
							        </script>
                           </div>                                                                                  
                                </ItemTemplate>                                
                            </asp:Repeater>


                            <asp:Repeater ID="rpItemsRepeater" runat="server" OnItemCreated="rpItemsRepeater_ItemCreated">                                
                                <ItemTemplate>                                  
                                <asp:Literal ID="litRowStart" runat="server" />                                                                                                                    					            
                                    <div class="mc-item">
                                    <asp:HiddenField ID="hdQuoteInventoryID" runat="server" Value='<%# Eval("QuoteInventoryID")%>' />
                                <asp:HiddenField ID="hdQuantity" runat="server" Value='<%# Eval("Quantity")%>' />
                                <asp:HiddenField ID="hdRoomID" runat="server" Value='<%# Eval("RoomID")%>' />
                                <asp:HiddenField ID="hdInventoryID" runat="server" Value='<%# Eval("InventoryID")%>' />
                                <asp:HiddenField ID="hdQuotesRoomID" runat="server" Value='<%# Eval("QuotesRoomID")%>' />
							        <span class="mc-item-title-wrapper">
								        <span class="mc-item-title"><%# Eval("InventoryName")%>
                                        </span>
							        </span>
                                    <div class="ImageCropping">
                                    <img class="mc-item-image" alt='<%# Eval("InventoryName")%>' title='<%# Eval("InventoryDescription")%>' src='<%# FormatImageURL((string) Eval("ImageFileName"))%>' />
                                    </div>
                                    <span class="DropdownItems hidden">
                                    <asp:DropDownList ID="ddNumberOfItems" runat="server" EnableViewState="false" CssClass='<%# Eval("InventoryID")%>'>
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
                                                        <asp:ListItem Text="21" />
                                                        <asp:ListItem Text="22" />
                                                        <asp:ListItem Text="23" />
                                                        <asp:ListItem Text="24" />
                                                        <asp:ListItem Text="25" />
                                                        <asp:ListItem Text="26" />
                                                        <asp:ListItem Text="27" />
                                                        <asp:ListItem Text="28" />
                                                        <asp:ListItem Text="29" />
                                                        <asp:ListItem Text="30" />
                                                        <asp:ListItem Text="31" />
                                                        <asp:ListItem Text="32" />
                                                        <asp:ListItem Text="33" />
                                                        <asp:ListItem Text="34" />
                                                        <asp:ListItem Text="35" />
                                                        <asp:ListItem Text="36" />
                                                        <asp:ListItem Text="37" />
                                                        <asp:ListItem Text="38" />
                                                        <asp:ListItem Text="39" />
                                                        <asp:ListItem Text="40" />                                                        
                                                        <asp:ListItem Text="41" />
                                                        <asp:ListItem Text="42" />
                                                        <asp:ListItem Text="43" />
                                                        <asp:ListItem Text="44" />
                                                        <asp:ListItem Text="45" />
                                                        <asp:ListItem Text="46" />
                                                        <asp:ListItem Text="47" />
                                                        <asp:ListItem Text="48" />
                                                        <asp:ListItem Text="49" />                                                        
                                                        <asp:ListItem Text="50" />
                                                        <asp:ListItem Text="51" />
                                                        <asp:ListItem Text="52" />
                                                        <asp:ListItem Text="53" />
                                                        <asp:ListItem Text="54" />
                                                        <asp:ListItem Text="55" />
                                                        <asp:ListItem Text="56" />
                                                        <asp:ListItem Text="57" />
                                                        <asp:ListItem Text="58" />
                                                        <asp:ListItem Text="59" />                                                        
                                                        <asp:ListItem Text="60" />
                                                        <asp:ListItem Text="61" />
                                                        <asp:ListItem Text="62" />
                                                        <asp:ListItem Text="63" />
                                                        <asp:ListItem Text="64" />
                                                        <asp:ListItem Text="65" />
                                                        <asp:ListItem Text="66" />
                                                        <asp:ListItem Text="67" />
                                                        <asp:ListItem Text="68" />
                                                        <asp:ListItem Text="69" />                                                        
                                                        <asp:ListItem Text="70" />
                                                        <asp:ListItem Text="71" />
                                                        <asp:ListItem Text="72" />
                                                        <asp:ListItem Text="73" />
                                                        <asp:ListItem Text="74" />
                                                        <asp:ListItem Text="75" />
                                                        <asp:ListItem Text="76" />
                                                        <asp:ListItem Text="77" />
                                                        <asp:ListItem Text="78" />
                                                        <asp:ListItem Text="79" />                                                        
                                                        <asp:ListItem Text="80" />
                                                        <asp:ListItem Text="81" />
                                                        <asp:ListItem Text="82" />
                                                        <asp:ListItem Text="83" />
                                                        <asp:ListItem Text="84" />
                                                        <asp:ListItem Text="85" />
                                                        <asp:ListItem Text="86" />
                                                        <asp:ListItem Text="87" />
                                                        <asp:ListItem Text="88" />
                                                        <asp:ListItem Text="89" />                                                        
                                                        <asp:ListItem Text="90" />
                                                        <asp:ListItem Text="91" />
                                                        <asp:ListItem Text="92" />
                                                        <asp:ListItem Text="93" />
                                                        <asp:ListItem Text="94" />
                                                        <asp:ListItem Text="95" />
                                                        <asp:ListItem Text="96" />
                                                        <asp:ListItem Text="97" />
                                                        <asp:ListItem Text="98" />
                                                        <asp:ListItem Text="99" />
                                                        <asp:ListItem Text="100" />
                                    </asp:DropDownList>		
                                    </span>
                                    <input class="mc-item-spinner" id='spinner-<%# Eval("InventoryID")%>' name="value" value="0" />            
                                    <script type="text/javascript">
                                    var AnotherJquery = jQuery.noConflict();           
                                    (function($){
                                        $('#spinner-<%# Eval("InventoryID")%>').spinner({ min: 0, max:100 });
                                        $(document).ready(function () {
                                            var ValueOnLoad<%# Eval("InventoryID")%> = $('.DropdownItems .<%# Eval("InventoryID")%>').val();
                                            $('#spinner-<%# Eval("InventoryID")%>').val(ValueOnLoad<%# Eval("InventoryID")%>); 
                                        });
                                        $(".ui-spinner-button").click(function() {
                                            var Valueof<%# Eval("InventoryID")%> = $('#spinner-<%# Eval("InventoryID")%>').val();
                                            $('.DropdownItems .<%# Eval("InventoryID")%>').val(Valueof<%# Eval("InventoryID")%>);                                            
                                        });
                                    })(AnotherJquery);    
							        </script>
                                    </div>                            
                                  <asp:Literal ID="litRowEnd" runat="server"/> 
                                </ItemTemplate>                                
                            </asp:Repeater>      
                         

                            <script type="text/javascript">
//                                function getUrlVars() {
//                                    var vars = [], hash;
//                                    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
//                                    for (var i = 0; i < hashes.length; i++) {
//                                        hash = hashes[i].split('=');
//                                        vars.push(hash[0]);
//                                        vars[hash[0]] = hash[1];
//                                    }
//                                    return vars;
//                                }
//                                var task = getUrlVars()["task"];
                               
                                    var AnotherJquery1 = jQuery.noConflict();           
                                    (function($){                                                                                        
                                            $(document).ready(function () {

                                            $('#rpRoomsRepeater_ctl04_btnRoom').text('Lounges & Rumpus');                                            
                                            $('#rpRoomsRepeater_ctl06_btnRoom').text('Bedrooms');                                            
                                            $('#rpRoomsRepeater_ctl07_btnRoom').text('Garage, Workshops & Sheds');    
                                            $('#rpRoomsRepeater_ctl06_TabListItem').removeClass('odd');    
                                            $('#rpRoomsRepeater_ctl06_TabListItem').addClass('even');    
                                            $('#rpRoomsRepeater_ctl07_TabListItem').removeClass('even');    
                                            $('#rpRoomsRepeater_ctl07_TabListItem').addClass('odd');    
                                            $('#rpRoomsRepeater_ctl08_TabListItem').removeClass('odd');    
                                            $('#rpRoomsRepeater_ctl08_TabListItem').addClass('even');

                                                var Container1value = $('#ContainerImage1').text();
                                                if (Container1value != "") {
                                                    $('.Animter1').animate({
                                                        width: Number(Container1value) + '%'
                                                    }, 1500, function () {// Animation complete.                    
                                                    });

                                                    $('.w_ContainerImage1').text((Number(Container1value).toFixed(0)) + '%');
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
                                                                                                
                                                var TaskCompleteID = $('#TaskCompleteID').text();
                                                if (TaskCompleteID == "complete") {
                                                    if ($('#CapcityGood').length) {
                                                            parent.ClosePopUp("CapcityGood"); 
                                                    }
                                                    else if($('#CapcityWarning').length)
                                                    {
                                                            parent.ClosePopUp("CapcityWarning"); 
                                                    }
                                                    else if($('#CapcityOver').length)
                                                    {
                                                           parent.ClosePopUp("CapcityOver"); 
                                                    }
                                                    else
                                                    {
                                                            parent.ClosePopUp("NothingSelected"); 
                                                    }                                                
                                                }

                                            });
                                            
                                        })(AnotherJquery1);
							 </script>
            </asp:WizardStep>
            <%--Step 4--%>
            <asp:WizardStep ID="ws4" runat="server" Title="Summary / Review">      		
              <asp:Literal ID="litPrintFullHouseInventoryLink" runat="server" Visible="false" />
              <asp:CustomValidator ID="cv3" runat="server" ControlToValidate="txtConsultantComments" OnServerValidate="ValidateConsultantComments" ErrorMessage="Comments must be shorter than 1000 characters"/>
              <asp:TextBox ID="txtConsultantComments" runat="server" TextMode="MultiLine" Rows="8" Width="80%" Visible="false" />
              <asp:CheckBox ID="chkSendCopyTo" runat="server" />&nbsp;<asp:Label ID="lbSendCopyTo" runat="server" Visible="false" />                             
            </asp:WizardStep>
        </WizardSteps>		
    </asp:Wizard>

                         </div>
			                                                </div>
                                                </div>                      

            <asp:ImageButton ID="CloseButtonOnTop" runat="server" OnClick="CompleteButton_Click" AlternateText="Complete Button" ImageUrl="~/images/Closebutton.jpg" EnableViewState="false" CssClass="close-move-container" />

          <div class="ce-interface span2">
				<div class="ce ce-good clearfix show" id="CapcityGood" runat="server" visible="true">
                <h3>Capacity Estimator</h3>
					<img class="Estimator" alt="Capacity Estimator Good" src="http://www.crownrelo.co.nz/CrownRelocations/media/images/capacity-estimator-good.jpg" />					
					<h1>Looking Good</h1>
				</div>
				<div class="ce ce-warn clearfix show" id="CapcityWarning" runat="server" visible="false">
                <h3>Capacity Estimator</h3>
					<img class="Estimator" alt="Capacity Estimator Warning" src="http://www.crownrelo.co.nz/CrownRelocations/media/images/capacity-estimator-warn.jpg" />					
					<h1>Getting Tight</h1>
				</div>
				<div class="ce ce-error clearfix show" id="CapcityOver" runat="server" visible="false">
                <h3>Capacity Estimator</h3>
					<img class="Estimator" alt="Capacity Estimator Over" src="http://www.crownrelo.co.nz/CrownRelocations/media/images/capacity-estimator-over.jpg" />					
					<h1>Over Capacity</h1>
				</div>      
                
                <%--Containers--%>
                            <div class="ContainerHeader">                    
                                <asp:Label runat="server" Text="Label 2" ID="SQLContainerValue" CssClass="Labels"  Visible="false" />    
                                <asp:Label runat="server" Text="Label 2" ID="ContainersFull" CssClass="Labels" Visible="false" />

                                <span id="TruckAnimater1" runat="server" visible="false">                                        
                                    <img src="/images/crown-sd-container.jpg" alt="Animated Container" class="ContainerImage1" />
                                    <span class="Animater1_Width">        
                                        <img src="/images/container-animate.png" alt="Truck Animater" width="0" height="46px" class="Animter1" />
                                    </span>
                                    <asp:Label runat="server" Text="Label 2" ID="ContainerImage1" CssClass="Labels hidden" Visible="false" />
                                    <span class="w_ContainerImage1 hidden">0</span>                                     
                                </span>
                                <span id="Container1LabelBottom" runat="server" visible="false"></span>   

                                <span id="TruckAnimater2" runat="server" visible="false">                                        
                                    <img src="/images/Big-Container.jpg" alt="Animated Container" class="ContainerImage1v1" />
                                    <span class="Animater1_Width">        
                                        <img src="/images/container-animate.png" alt="Truck Animater" width="0" height="85px" class="Animter1v1" />
                                    </span>
                                    <asp:Label runat="server" Text="100" ID="ContainerImage1v1" CssClass="Labels" Visible="false" />
                                    <span class="w_ContainerImage1v1">100%</span>    
        
                                    <img src="/images/Big-Container.jpg" alt="Animated Container" class="ContainerImage2 hidden" />
                                    <span class="Animater2_Width hidden">        
                                        <img src="/images/container-animate.png" alt="Truck Animater" width="0" height="85px" class="Animter2" />
                                    </span>
                                    <asp:Label runat="server" Text="Label 2" ID="ContainerImage2" CssClass="Labels hidden" Visible="false" />
                                    <span class="w_ContainerImage2"></span> 
                                    <span id="Container2LabelBottom" class="hidden" runat="server" visible="false"></span>   
                                </span>
                            </div>                            
                
        <%--Navigation Buttons on the Bottom--%>
        <div class="NavigationButtons1">
            <asp:ImageButton ID="btnBack" runat="server" OnClick="btnBack_Click" ImageUrl="~/images/quote-back.jpg" AlternateText="Back" CausesValidation="false" EnableViewState="false" Visible="false" CssClass="hidden" />
            <asp:ImageButton ID="btnSave" runat="server" OnClick="btnSave_Click" ImageUrl="~/images/quote-update.jpg" AlternateText="Save" EnableViewState="false"  CssClass="silentooltip" />
            <asp:ImageButton ID="btnNext" runat="server" OnClick="btnNext_Click" ImageUrl="~/images/quote-next.jpg" AlternateText="Next" EnableViewState="false"  CssClass="silentooltip hidden" Visible="false" />
            <asp:ImageButton ID="btnSendNow" runat="server" OnClick="btnSendNow_Click" AlternateText="Send now" ImageUrl="~/images/quote-sendnow.jpg" EnableViewState="false" CssClass="silentooltip hidden" Visible="false" />
            <br />
            <asp:ImageButton ID="CompleteButton" runat="server" OnClick="CompleteButton_Click" AlternateText="Complete Button" ImageUrl="~/images/ContinueButton.jpg" EnableViewState="false" />            
            <span class="hidden" runat="server" id="TaskCompleteID"></span>
        </div>	
                      
		</div>			
	</div>

                            
                            <%--Navigation Steps on Right Side--%>
		                        <ul class="NavigationSteps" runat="server" visible="false">
                                        <li class="RightMenuNumbers" <%=SetStepTabStyle(0)%>><asp:LinkButton ID="btnStep1" runat="server" CommandArgument="0" Text="1. Your Details" OnClick="ChangeStep" Visible="false"/></li>
                                        <li class="RightMenuNumbers" <%=SetStepTabStyle(1)%>><asp:LinkButton ID="btnStep2" runat="server" CommandArgument="1" Text="2. Room Selection" OnClick="ChangeStep" Visible="false"/></li>
                                        <li class="RightMenuNumbers" <%=SetStepTabStyle(2)%>><asp:LinkButton ID="btnStep3" runat="server" CommandArgument="2" Text="3. Household Inventory" OnClick="ChangeStep" Visible="false" /></li>                                        
                                        <li  class="RightMenuNumbers" <%=SetStepTabStyle(3)%>><asp:LinkButton ID="Step4LinkButton" runat="server" CommandArgument="3" Text="4. Review / Send" OnClick="ChangeStep" Visible="false" /></li>
                                </ul>
    </asp:Panel>

    <%--Thank you message Comes When you press send--%>
    <asp:Panel ID="pnlWizardThankyou" CssClass="ThanksYouPanel" Visible="false" runat="server"></asp:Panel>

</form>
<script type="text/javascript">
    var ContainerJquery = jQuery.noConflict();
    (function ($) {    
        if ($.browser.msie) {
            if ($.browser.version == "9.0") {
                $("body").addClass("IE9");
            } else if ($.browser.version == "8.0") {
                $("body").addClass("IE8");
            } else if ($.browser.version == "7.0") {
                $("body").addClass("IE7");
            }
        }
    })(ContainerJquery);

</script>
</body>
</html>