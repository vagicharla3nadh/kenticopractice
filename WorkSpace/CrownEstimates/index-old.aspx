<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html class="no-js" lang="">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    <!-- Place favicon.ico in the root directory -->

    <link rel="stylesheet" href="Content/Styles/site-base.css" />
    <link rel="stylesheet" href="Content/Styles/site-type-reset.css" />
    <link rel="stylesheet" href="Content/Styles/site-type-icons.css" />
    <link rel="stylesheet" href="Content/Styles/site-layouts.css" />
    <link rel="stylesheet" href="Content/Styles/site-siteelements.css" />
    <link rel="stylesheet" href="Content/Styles/site-siteelements-buttons.css" />
    <link rel="stylesheet" href="Content/Styles/site-siteelements-listings.css" />
    <link rel="stylesheet" href="Content/Styles/dhtmlxmessage_dhx_skyblue.css" />
    <link rel="stylesheet" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=Crown-Styles-header" />
    <link rel="stylesheet" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=Crown-Styles-modules" />
    <link rel="stylesheet" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=Crown-Styles-footer" />


    <!--[if IE 8]>
			<link rel="stylesheet" type="text/css" href="site/styles/site-ie8.css">
		<![endif]-->

    <!--[if IE 7]>
			<link rel="stylesheet" type="text/css" href="site/styles/site-ie7.css">
		<![endif]-->

    <style type="text/css">
        .row {
            width: 1110px;
            max-width: none;
        }

        .main-header {
            background-color: #4baed3;
            margin-bottom: 50px;
        }

        .header-aside {
            text-align: right;
        }

        .header-phone {
            display: block;
            padding: 11px 0;
        }

        .box1 input[type="text"], .box textarea {
            display: inline-block;
            float: left;
            margin-right: 2px;
            padding: 3px 0;
            text-align: center;
            width: 24px;
        }

        .footer-phone {
            font-family: "Helvetica Neue","Helvetica",Helvetica,Arial,sans-serif;
            font-weight: normal;
        }

            .footer-phone a,
            .footer-phone a:hover,
            .footer-phone a:focus,
            .footer-phone a:visited {
                font-style: normal;
            }

        .footer-copyright-row .footer-nav,
        .footer-copyright-row .footer-copyright {
            float: none;
        }

        .content {
            padding: 0;
        }

        .validationSummary {
            border: 1px solid rgba(0, 0, 0, 0);
            border-radius: 4px;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #f2dede;
            border-color: #ebccd1;
            color: #a94442 !important;
        }
    </style>
</head>
<body>
    <!--[if lt IE 8]>
			<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
		<![endif]-->

    <!-- Add your site or application content here -->

    <form id="frmQuoteRequest" runat="server">

        <div class="main-header">
            <div class="row">
                <div class="col-inner">
                    <div class="header">
                        <a title="home" rel="home" href="http://www.crownrelo.co.nz/" class="main-logo">
                            <img src="http://www.crownrelo.co.nz/CrownRelocations/media/images/cr-logo.gif" alt="Crown Relocations NZ">
                        </a>
                        <div class="header-aside">
                            <span class="header-phone"><a href="tel:0508 227 696">0508 227 696</a></span>

                            <div class="btn-group header-btn-group">
                                <a class="btn" href="http://www.crownrelo.co.nz/">Back</a>
                            </div>
                            <a class="nav-btn" href="#">Menu</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-inner">
                <div id="divContent" runat="server">


                    <div class="content accordion" style="min-height: 327px">
                        <h1 class="content__title">How to get started</h1>
                        <ul class="five-listing">
                            <li>
                                <span class="number-rounded">1</span>
                                <h1>Tell us about you</h1>
                            </li>
                            <li>
                                <span class="number-rounded">2</span>
                                <h1>Tell us how you want to pack</h1>
                            </li>
                            <li>
                                <span class="number-rounded">3</span>
                                <h1>Tell us what you are moving</h1>
                            </li>
                           <li>
                                <span class="number-rounded">4</span>
                                <h1>Anything else we need to know</h1>
                            </li>
                            <li>
                                <h1>Your Done!</h1>
                            </li>
                        </ul>
                    </div>

                    <!-- 1 -->
                    <div class="content accordion">
                        <div class="accordion__header">
                            <div class="accordion-header__title">
                                <span class="number-rounded number-rounded--small">1</span>
                                <h1>Information</h1>
                            </div>
                            <div class="accordion-header__icon">
                                <span class="icon icon-arrow-down"></span>
                            </div>
                        </div>
                        <div class="accordion__body" style="min-height: 271px; padding: 28px 39px;">
                            <asp:ValidationSummary ID="vs1" runat="server" CssClass="validationSummary" />
                            <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtFirstName" CssClass="FieldValidator" Display="None" ErrorMessage="Please enter a first name" SetFocusOnError="true" />
                            <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtDayPhone" CssClass="FieldValidator" Display="None" ErrorMessage="Please enter a day time phone number" SetFocusOnError="true" />
                            <asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="txtEmail" CssClass="FieldValidator" Display="None" ErrorMessage="Please enter an email address" SetFocusOnError="true" />
                            <asp:RequiredFieldValidator ID="rfv4" runat="server" ControlToValidate="txtMovingOutDate" CssClass="FieldValidator" Display="None" ErrorMessage="Please enter an approximate Moving Out date" SetFocusOnError="true" />
                            <asp:RequiredFieldValidator ID="rfv5" runat="server" ControlToValidate="txtLocation" CssClass="FieldValidator" Display="None" ErrorMessage="Please enter your current location" SetFocusOnError="true" />
                            <asp:RequiredFieldValidator ID="rfv6" runat="server" ControlToValidate="txtMoveTo" CssClass="FieldValidator" Display="None" ErrorMessage="Please enter moving to" SetFocusOnError="true" />

                            <asp:RegularExpressionValidator ID="regv1" runat="server" ControlToValidate="txtEmail" CssClass="FieldValidator" Display="None" ErrorMessage="Please enter a valid email address of the form name@yourwebsite.com" EnableViewState="false" SetFocusOnError="true" />
                            <asp:CustomValidator ID="cv1" runat="server" Display="None" ControlToValidate="txtDayPhone" CssClass="FieldValidator" ValidateEmptyText="true" ClientValidationFunction="ValidatePhoneNumber" ErrorMessage="Please ensure day phone contains only numbers and starts with 0." SetFocusOnError="true" />
                            <div class="form-control form-control--medium" style="margin-right: 36px;">
                                <label>first name *</label>
                                <asp:TextBox ID="txtFirstName" runat="server" />
                            </div>

                            <div class="form-control form-control--medium" style="margin-right: 73px;">
                                <label>surname</label>
                                <asp:TextBox ID="txtSurname" runat="server" />
                            </div>

                             <div class="form-control form-control--normal form-control-media" >
                                <label>email *</label>
                                <asp:TextBox ID="txtEmail" runat="server" />
                            </div>
                            

                            <div class="clearfix"></div>
                            <br>


                           <div class="form-control form-control--medium" style="margin-right: 36px;">
                                <label>your current location *</label>
                                <asp:TextBox ID="txtLocation" runat="server" />
                            </div>

                            <div class="form-control form-control--medium" style="margin-right: 73px;">
                                <label>suburb</label>
                                <asp:TextBox ID="txtSuburb" runat="server" />
                            </div>

                            <div class="form-control form-control--normal form-control-media">
                                <label>moving to *</label>
                                <asp:TextBox ID="txtMoveTo" runat="server" />
                            </div>

                            <div class="clearfix"></div>
                            <br>

                            <div class="form-control form-control--medium" style="margin-right: 352px;">
                                <label>day phone *</label>
                                <asp:TextBox ID="txtDayPhone" runat="server" />
                            </div>

                            <div class="form-control form-control--normal form-control-media-small">
                                <label>when are you moving? *</label>
                                <asp:TextBox ID="txtMovingOutDate" runat="server" />
                            </div>

                        </div>
                        <div class="accordion__footer">
                        </div>
                    </div>


                    <!-- 2 -->
                    <div class="content accordion">
                        <div class="accordion__header">
                            <div class="accordion-header__title">
                                <span class="number-rounded number-rounded--small">2</span>
                                <h1>Select the services you require</h1>
                            </div>
                            <div class="accordion-header__icon">
                                <span class="icon icon-arrow-down"></span>
                            </div>
                        </div>
                        <div class="accordion__body" style="min-height: 380px">
                            <div class="big-input">
                                <div class="big-input__image big-input__image--q1"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkPBO" runat="server" />
                                    <label for="chkPBO"><span></span></label>
                                    <span style="display: table-cell">Packed By Owner</span>
                                </div>
                            </div>
                            <div class="big-input">
                                <div class="big-input__image big-input__image--q2"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkPPC" runat="server" />
                                    <label for="chkPPC"><span></span></label>
                                    <span style="display: table-cell">Professional Packing By Crown</span>
                                </div>
                            </div>
                            <div class="big-input">
                                <div class="big-input__image big-input__image--q3"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkUnsure" runat="server" />
                                    <label for="chkUnsure"><span></span></label>
                                    <span style="display: table-cell">Unsure</span>
                                </div>
                            </div>
                            <div class="big-input">
                                <div class="big-input__image big-input__image--q4"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkSS" runat="server" />
                                    <label for="chkSS"><span></span></label>
                                    <span style="display: table-cell">Secure Storage</span>
                                </div>
                            </div>
                        </div>
                        <div class="accordion__footer">
                        </div>
                    </div>

                    <!-- 3 -->
                    <div class="content accordion">
                        <div class="accordion__header">
                            <div class="accordion-header__title">
                                <span class="number-rounded number-rounded--small">3</span>
                                <h1>Select the items you wish to move from your home</h1>
                            </div>
                            <div class="accordion-header__icon">
                                <span class="icon icon-arrow-down"></span>
                            </div>
                        </div>
                        <div class="accordion__body" style="min-height: 869px;">
                            <asp:ScriptManager ID="scriptmanager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server">
                                <ContentTemplate>

                                    <div class="accordion-body__content-left" id="roomlist">
                                        <ul class="sidemenu">

                                            <asp:DataList ID="RoomTypeDataList" runat="server" Width="99%" DataSourceID="RoomTypeDataSource" DataKeyField="RoomID"
                                                OnItemCommand="RoomTypeDataList_ItemCommand">
                                                <SelectedItemStyle BackColor="#CCCCCC"></SelectedItemStyle>

                                                <ItemTemplate>
                                                    <li <%# TRJavaScript(Container) %>>
                                                        <asp:HiddenField ID="hdnRoomID" Value='<%# Eval("RoomID") %>' runat="server" />

                                                        <div class="sidemenu__input">
                                                            <input id="chkRoomSel_<%# Eval("RoomID") %>" type="checkbox" <%# ReturnCheckBoxStatus(Convert.ToInt32(Eval("RoomID")), Container.ItemIndex)%> disabled="disabled" />
                                                            <label for="chkRoomSel_<%# Eval("RoomID") %>"><span></span></label>
                                                            <span id="room_<%# Eval("RoomID") %>"><%# Eval("RoomName") %></span>
                                                        </div>

                                                        <asp:Button
                                                            Style="display: none;"
                                                            CommandArgument='<%# DataBinder.Eval(Container.DataItem,"RoomID")%>'
                                                            ID="HiddenButton" runat="server" Text=""></asp:Button>
                                                    </li>
                                                </ItemTemplate>
                                            </asp:DataList>

                                        </ul>
                                    </div>

                                    <div class="accordion-body__content-right" id="invlist">
                                        <h5 style="color:#fff;font-family:helvetica;font-size:18px;padding:5px;">Please estimate the number of cartons you will need</h5>
                                        <asp:Repeater runat="server" ID="RoomInventoryCartoonsRepeater">
                                            <ItemTemplate>

                                                <asp:HiddenField ID="hdnInvID" Value='<%# Eval("InventoryID") %>' runat="server" />
                                                <div class="box1 box--big">
                                                    <div class="box__img">
                                                        <img src='<%# Eval("ImgUrl") %>' alt='<%# Eval("InventoryName") %>' />
                                                        <span>
                                                            <b></b>
                                                            <%# Eval("InventoryDescription") %>
                                                        </span>
                                                    </div>
                                                    <div class="box__control">
                                                        <p>
                                                            <strong><%# Eval("InventoryName") %></strong><br>
                                                        </p>
                                                        <asp:TextBox ID="txtInvCount" runat="server" Text="0" CssClass="box__input" />
                                                        <div class="box__input-up">
                                                            <a href="javascript:;"><span class="icon icon-arrow-down"></span></a>
                                                        </div>
                                                        <div class="box__input-down">
                                                            <a href="javascript:;"><span class="icon icon-arrow-up"></span></a>
                                                        </div>
                                                    </div>
                                                        
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <asp:Repeater runat="server" ID="RoomInventoryItemsRepeater">
                                            <ItemTemplate>
                                                <asp:HiddenField ID="hdnRoomID" Value='<%# Eval("RoomID") %>' runat="server" />
                                                <asp:HiddenField ID="hdnInvID" Value='<%# Eval("InventoryID") %>' runat="server" />
                                                <div class="box1 box--small">
                                                    <div class="box-small__container">
                                                        <div class="box__img">
                                                            <img src='<%# Eval("ImgUrl") %>' alt='<%# Eval("InventoryName") %>' />
                                                            <span class="tooltip">
                                                                <b></b>
                                                                <%# Eval("InventoryDescription") %>
                                                            </span>
                                                        </div>
                                                        <div class="box__control">
                                                            <asp:TextBox ID="txtInvCount" runat="server" Text="0" CssClass="box__input" />
                                                            <div class="box__input-up">
                                                                <a href="javascript:;"><span class="icon icon-arrow-down"></span></a>
                                                            </div>
                                                            <div class="box__input-down">
                                                                <a href="javascript:;"><span class="icon icon-arrow-up"></span></a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <asp:SqlDataSource ID="RoomsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBUpgrade %>" SelectCommand="GetRoomList" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                        <asp:SqlDataSource ID="InventoryCartoonsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DBUpgrade %>" SelectCommand="GetRoomInventoryCartoons" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>


                    <!-- other services you may require -->
                    <div class="content accordion">
                        <div class="accordion__header">
                            <div class="accordion-header__title">
                                <span class="number-rounded number-rounded--small">4</span>
                                <h1>Anything else we need to know</h1>
                            </div>
                            <div class="accordion-header__icon">
                                <span class="icon icon-arrow-down"></span>
                            </div>
                        </div>
                        <div class="accordion__body" style="min-height: 380px">
                            <div class="services">
                                <h1 class="content__sub-title">Other services you may require</h1>
                            </div>
                            <div class="big-input">
                                <div class="big-input__image big-input__image--p1"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkInsurance" runat="server" />
                                    <label for="chkInsurance"><span></span></label>
                                    <span style="display: table-cell">Insurance</span>
                                </div>
                            </div>
                            <div class="big-input">
                                <div class="big-input__image big-input__image--p2"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkPets" runat="server" />
                                    <label for="chkPets"><span></span></label>
                                    <span style="display: table-cell">Pets</span>
                                </div>
                            </div>
                            <div class="big-input">
                                <div class="big-input__image big-input__image--p3"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkVehicle" runat="server" />
                                    <label for="chkVehicle"><span></span></label>
                                    <span style="display: table-cell">Vehicle</span>
                                </div>
                            </div>
                            <div class="big-input">
                                <div class="big-input__image big-input__image--p4"></div>
                                <div class="big-input__input" style="display: table">
                                    <asp:CheckBox ID="chkPAC" runat="server" />
                                    <label for="chkPAC"><span></span></label>
                                    <span style="display: table-cell">Pre-arrival Clean</span>
                                </div>
                            </div>

                            <div style="clear:both" ></div>

                            <div class=" need-to-know">
                                <h1 class="content__sub-title">Anything else we need to know</h1>
                                <div class="textarea">
                                    <asp:TextBox ID="txtConsultantComments" runat="server" TextMode="MultiLine" placeholder="write any instructions here"></asp:TextBox><br />
                                    <asp:CustomValidator ID="cv3" runat="server" ControlToValidate="txtConsultantComments" ClientValidationFunction="ValidateConsultantComments" ErrorMessage="Comments must be shorter than 1000 characters" SetFocusOnError="true" />
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="content">
                        <div class="submit-container">
                            <h1 class=" submit-container__title">Great!</h1>
                            <h1 class=" submit-container__sub-title">All neccessary information completed.</h1>
                            <h1 class=" submit-container__sub-title">Go ahead and:</h1>
                            <div class="submit-container__button">
                                <asp:Button ID="btnSubmit" CssClass="submit-container-button__button" runat="server" Text="complete enquiry" CausesValidation="true"
                                    OnClientClick="return IsAllRoomSelected();" OnClick="btnSubmit_Click1" />
                            </div>

                        </div>
                    </div>
                </div>
                <div id="divThankyou" runat="server" visible="false">
                    <div class="content">
                        <p></p>
                        <h1>Thanks for completing the Quote Request.</h1>
                        <p>A Crown consultant will shortly review your details and either email or call you to arrange a time to come and discuss your needs.</p>
                        <p>In the meantime, if you have any further questions, feel free to contact one of our friendly representatives on 0508 227 696, or via the Live Chat facility on our web site.</p>
                        <p>We look forward to making your move a stress-free experience.</p>


                        <div class="special-tip">
                            <h2>Special Tip</h2>
                            <p>If you are moving overseas <a href="http://www.crownrelo.co.nz/Foreign-Exchange.aspx">click here</a> to transfer funds at super competitive exchange rates that the banks won't match.</p>
                        </div>


                        <p><a href="http://www.crownrelo.co.nz" class="whitelink" target="_parent">Return to Crown Home Page</a></p>

                    </div>
                </div>
            </div>
        </div>
        <!-- Wrapper -->

        <script data-main="Content/Scripts/main.js" src="Content/Scripts/require.js"></script>
        <script type="text/javascript" src="Content/Scripts/jquery.js"></script>
        <script type="text/javascript" src="Content/Scripts/mousehold.js"></script>
        <script type="text/javascript" src="Content/Scripts/dhtmlxmessage.js"></script>

        <script type="text/javascript">

            $(".box__input").keydown(function (e) {
                // Allow: backspace, delete, tab, escape, enter and .
                if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                    // Allow: Ctrl+A, Command+A
                    (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                    // Allow: home, end, left, right, down, up
                    (e.keyCode >= 35 && e.keyCode <= 40)) {
                    // let it happen, don't do anything
                    return;
                }
                // Ensure that it is a number and stop the keypress
                if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                    e.preventDefault();
                }
            });

            $('.icon-arrow-down').mousehold(function () {
                var txtvalue = parseInt($(this).closest("div.box__control").find("input[type=text]").val());
                if (!isNaN(txtvalue) && txtvalue > 0)
                    $(this).closest("div.box__control").find("input[type=text]").val(txtvalue - 1);
            });

            $('.icon-arrow-up').mousehold(function () {
                var txtvalue = parseInt($(this).closest("div.box__control").find("input[type=text]").val());
                if (!isNaN(txtvalue))
                    $(this).closest("div.box__control").find("input[type=text]").val(txtvalue + 1);
            });

            (function ($) {
                $('.accordion > .accordion__header').click(function () {
                    var elem = $(this);
                    elem.siblings('.accordion__body').slideToggle(900);
                    return false;
                });
            })(jQuery);

            function ValidatePhoneNumber(source, arguments) {

                if (arguments.Value == null || arguments.Value == "" || arguments.Value.substr(0, 1) != "0" || !$.isNumeric(arguments.Value)) {
                    arguments.IsValid = false;
                } else {
                    arguments.IsValid = true;
                }
            }

            function ValidateConsultantComments(source, arguments) {

                if (arguments.Value.length <= 1000) {
                    arguments.IsValid = true;
                } else {
                    arguments.IsValid = false;
                }
            }

            function IsAllRoomSelected() {

                var allSelected = true;
                $('input:checkbox[id*=chkRoomSel]').each(function () {
                    if (!$(this).is(':checked')) {
                        allSelected = false;
                    }
                });

                if (allSelected) return true;
                else {
                    dhtmlx.confirm({
                        title: "Rooms Confirmation",
                        ok: "Continue anyway", cancel: "Go back",
                        text: "We've noticed that not every room has been completed -  Are you happy to proceed or would you like to check the rooms again.",
                        callback: function (result) {
                            if (result && Page_ClientValidate()) {
                                __doPostBack('btnSubmit', '');
                            }
                        }
                    });

                    return false;
                }
                return false;
            }

            function RoomInvSelectionError() {

                dhtmlx.alert({
                    title: "Error Message",
                    type: "alert-error",
                    text: "You should select atleast one item from home inventory to proceed with quote request",
                    callback: function () {
                        return false;
                    }
                });

            }

            //On UpdatePanel Refresh

            var prm = Sys.WebForms.PageRequestManager.getInstance();

            if (prm != null) {

                prm.add_endRequest(function (sender, e) {

                    if (sender._postBackSettings.panelsToUpdate != null) {

                        $(".box__input").keydown(function (e) {
                            // Allow: backspace, delete, tab, escape, enter and .
                            if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
                                // Allow: Ctrl+A, Command+A
                                (e.keyCode == 65 && (e.ctrlKey === true || e.metaKey === true)) ||
                                // Allow: home, end, left, right, down, up
                                (e.keyCode >= 35 && e.keyCode <= 40)) {
                                // let it happen, don't do anything
                                return;
                            }
                            // Ensure that it is a number and stop the keypress
                            if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
                                e.preventDefault();
                            }
                        });

                        $('.icon-arrow-down').mousehold(function () {
                            var txtvalue = parseInt($(this).closest("div.box__control").find("input[type=text]").val());
                            if (!isNaN(txtvalue) && txtvalue > 0)
                                $(this).closest("div.box__control").find("input[type=text]").val(txtvalue - 1);
                        });

                        $('.icon-arrow-up').mousehold(function () {
                            var txtvalue = parseInt($(this).closest("div.box__control").find("input[type=text]").val());
                            if (!isNaN(txtvalue))
                                $(this).closest("div.box__control").find("input[type=text]").val(txtvalue + 1);
                        });

                    }

                });

            };

        </script>


        <div class="main-footer">
            <div class="row footer-row">
                <div class="clearfix col-inner">
                    <div class="footer-phone-social">
                        <h2 class="footer-phone">
                            <a href="tel:0508 227 696">0508 227 696</a>
                        </h2>
                        <div class="footer-social">
                            <a target="_blank" title="facebook" href="http://www.facebook.com/pages/Crown-Relocations-NZ/363472075184?ref=hl">
                                <img src="http://www.crownrelo.co.nz/CrownRelocations/media/images/Facebook-Footer.png" class="joqrgrwvkngohixnnqgz">
                            </a>
                            <a target="_blank" title="twitter" href="https://twitter.com/CrownReloNZ">
                                <img src="http://www.crownrelo.co.nz/CrownRelocations/media/images/Twitter-Footer.png" class="joqrgrwvkngohixnnqgz">
                            </a>
                            <a target="_blank" title="YouTube" href="http://www.youtube.com/user/CrownRelocationsNZ">
                                <img src="http://www.crownrelo.co.nz/CrownRelocations/media/images/YouTube-Footer.png" class="joqrgrwvkngohixnnqgz">
                            </a>
                            <!-- AddThis Button BEGIN -->
                            <div class="addthis_toolbox addthis_default_style ">
                                <a class="addthis_button_facebook addthis_button_preferred_1 at300b" title="Facebook" href="#"><span class="at4-icon aticon-facebook" style="background-color: rgb(48, 88, 145);"><span class="at_a11y">Share on facebook</span></span></a>
                                <a class="addthis_button_twitter addthis_button_preferred_2 at300b" title="Tweet" href="#"><span class="at4-icon aticon-twitter" style="background-color: rgb(44, 168, 210);"><span class="at_a11y">Share on twitter</span></span></a>
                                <a class="addthis_button_email addthis_button_preferred_3 at300b" target="_blank" title="Email" href="#"><span class="at4-icon aticon-email" style="background-color: rgb(115, 138, 141);"><span class="at_a11y">Share on email</span></span></a>
                                <a class="addthis_button_print addthis_button_preferred_4 at300b" title="Print" href="#"><span class="at4-icon aticon-print" style="background-color: rgb(115, 138, 141);"><span class="at_a11y">Share on print</span></span></a>
                                <a class="addthis_button_compact at300m" href="#"><span class="at4-icon aticon-compact" style="background-color: rgb(252, 109, 76);"><span class="at_a11y">More Sharing Services</span></span></a>
                                <a class="addthis_counter addthis_bubble_style"></a>
                                <div class="atclear"></div>
                            </div>
                            <script type="text/javascript">var addthis_config = { "data_track_addressbar": false };</script>
                            <script src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4e0be23d77c85a55" type="text/javascript"></script>
                            <!-- AddThis Button END -->
                        </div>
                    </div>
                    <a title="home" rel="home" href="/" class="footer-logo">
                        <img src="http://www.crownrelo.co.nz/CrownRelocations/media/images/cr-logo.gif" alt="Crown Relocations NZ">
                    </a>
                </div>
            </div>
            <div class="row footer-copyright-row">
                <div class="clearfix col-inner">
                    <p class="footer-nav">
                        <a href="/">Home</a> <a href="/OtherMenuPages/Site-map.aspx">Site Map</a> <a target="_blank" href="/CrownRelocations/media/pdf/termsandconditions.pdf">Terms &amp; Conditions</a>
                    </p>
                    <p class="footer-copyright">
                        &copy; 2013 <span>Crown Relocations</span> <em>website by <a target="_blank" href="http://www.kudosweb.com">Kudos Web</a></em>
                    </p>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
