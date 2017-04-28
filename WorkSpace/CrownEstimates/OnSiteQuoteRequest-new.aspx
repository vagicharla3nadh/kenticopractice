<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OnSiteQuoteRequest-new.aspx.cs" Inherits="OnSiteQuoteRequest"
    EnableEventValidation="false" %>

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
    <style>
        .box__img img {
            margin-top: 15px;
        }
    </style>
    <!--[if IE 8]>
			<link rel="stylesheet" type="text/css" href="site/styles/site-ie8.css">
		<![endif]-->

    <!--[if IE 7]>
			<link rel="stylesheet" type="text/css" href="site/styles/site-ie7.css">
		<![endif]-->
    <!-- Google Tag Manager -->
    <script>(function (w, d, s, l, i) {
    w[l] = w[l] || []; w[l].push({
    'gtm.start':
    new Date().getTime(), event: 'gtm.js'
    }); var f = d.getElementsByTagName(s)[0],
    j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
    'https://www.googletagmanager.com/gtm.js?id=' + i + dl; f.parentNode.insertBefore(j, f);
    })(window, document, 'script', 'dataLayer', 'GTM-NTT246');</script>
    <!-- End Google Tag Manager -->
</head>
<body>
    <!-- Google Tag Manager (noscript) -->
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NTT246"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <!-- End Google Tag Manager (noscript) -->
    <!--[if lt IE 8]>
			<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
		<![endif]-->

    <!-- Add your site or application content here -->

    <form id="frmQuoteRequest" runat="server">
        <div class="wrapper">

            <div id="divContent" runat="server">


                <div class="content accordion" style="min-height: 327px">
                    <h1 class="content__title">How to get started</h1>
                    <ul class="four-listing">
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
                            <h1>Done!</h1>
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

                        <div class="form-control form-control--large form-control-media">
                            <label>your current location</label>
                            <asp:TextBox ID="txtLocation" runat="server" />
                        </div>

                        <div class="clearfix"></div>
                        <br>


                        <div class="form-control form-control--xlarge" style="margin-right: 146px;">
                            <label>email *</label>
                            <asp:TextBox ID="txtEmail" runat="server" />
                        </div>

                        <div class="form-control form-control--normal form-control-media">
                            <label>moving to:</label>
                            <asp:TextBox ID="txtMoveTo" runat="server" />
                        </div>

                        <div class="clearfix"></div>
                        <br>

                        <div class="form-control form-control--normal" style="margin-right: 242px;">
                            <label>day phone *</label>
                            <asp:TextBox ID="txtDayPhone" runat="server" />
                        </div>

                        <div class="form-control form-control--small form-control-media-small">
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

                                    <asp:Repeater runat="server" ID="RoomInventoryCartoonsRepeater">
                                        <ItemTemplate>

                                            <asp:HiddenField ID="hdnInvID" Value='<%# Eval("InventoryID") %>' runat="server" />
                                            <div class="box box--big">
                                                <div class="box__img">
                                                    <img src='<%# Eval("ImgUrl") %>' alt='<%# Eval("InventoryName") %>' title='<%# Eval("InventoryDescription") %>' />
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
                                            <div class="box box--small">
                                                <div class="box-small__container">
                                                    <div class="box__img">
                                                        <img src='<%# Eval("ImgUrl") %>' alt='<%# Eval("InventoryName") %>' title='<%# Eval("InventoryDescription") %>' />
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
                        <div class="contentnogap">
                            <div class="services">
                                <h1 class="content__sub-title">Other services you may require</h1>

                                <ul class="four-listing">
                                    <li>
                                        <div class="big-input__input">
                                            <asp:CheckBox ID="chkInsurance" runat="server" />
                                            <label for="chkInsurance"><span></span></label>
                                            <span>Insurance</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="big-input__input">
                                            <asp:CheckBox ID="chkPets" runat="server" />
                                            <label for="chkPets"><span></span></label>
                                            <span>Pets</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="big-input__input">
                                            <asp:CheckBox ID="chkVehicle" runat="server" />
                                            <label for="chkVehicle"><span></span></label>
                                            <span>Vehicle</span>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="big-input__input">
                                            <asp:CheckBox ID="chkPAC" runat="server" />
                                            <label for="chkPAC"><span></span></label>
                                            <span>Pre-arrival Clean</span>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>

                    <div class="content">
                        <div class=" need-to-know">
                            <h1 class="content__sub-title">Anything else we need to know</h1>
                            <div class="textarea">
                                <asp:TextBox ID="txtConsultantComments" runat="server" TextMode="MultiLine" placeholder="write any instructions here"></asp:TextBox><br />
                                <asp:CustomValidator ID="cv3" runat="server" ControlToValidate="txtConsultantComments" ClientValidationFunction="ValidateConsultantComments" ErrorMessage="Comments must be shorter than 1000 characters" SetFocusOnError="true" />
                            </div>

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
            <div id="divThankyou" runat="server" visible="false" style="font-size:16px;color: #666;">
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
                    dhtmlx.confrim({
                        title: "Error Message",
                        type: "alert-error",
                        text: "We’ve noticed that not every room has been completed -  Are you happy to proceed or would you like to check the rooms again.",
                        callback: function () {
                            return false;
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
                    text: "You should select atleast one item overall and also has to visit all the Room Types to proceed with Quote Request",
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

    </form>
</body>
</html>
