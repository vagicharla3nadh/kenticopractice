<%@ Page Language="C#" AutoEventWireup="true" CodeFile="get-a-quote.aspx.cs" Inherits="get_a_quote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Get a Quote | Crown Relocations | New Zealand Moving Company | Furniture Movers | International Relocations | Storage | House Removals</title>
    <meta name="description" content="Crown Relocations is a Furniture Moving Company specialising in Local, Domestic, International Relocations and Corporate Transfers. " />
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="style-wizards.css" type="text/css" media="screen" />
    <script type="text/javascript" src="js/tinyfader.js"></script>
<script language="JavaScript" type="text/javascript" src="//www.crownrelo.com/relo/scripts/s_code_nz.js"></script>

 <!--[if lt IE 9]>
		<script src="http://crown.kudosweb.com/CrownRelocations/js/css3-mediaqueries.js"></script>
 <![endif]-->


</head>
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



<h1>Get a Quote</h1>
       
    <asp:ValidationSummary ID="vs1" runat="server" ValidationGroup="ResumeEstimate" CssClass="validationSummary" />
    <div class="validationSummary"><asp:Literal ID="litMessage" runat="server" EnableViewState="false" /></div>
    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtResumeEmail" ValidationGroup="ResumeEstimate" Display="None" ErrorMessage="Please enter an email address<br />" />
    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtPassword"  ValidationGroup="ResumeEstimate" Display="None" ErrorMessage="Please enter your password<br />" />
    <asp:RegularExpressionValidator ID="rev1" runat="server"  ControlToValidate="txtResumeEmail" ValidationGroup="ResumeEstimate" Display="None" ErrorMessage="Please enter a valid email address of the form email@host.domain" />

    <p class="black-text">Use one of our great online options to get a FREE QUOTE for your forthcoming relocation:</p>
    <div id="online-estimate" style="text-align:left;">
        
        <h2 class="estimate-heading">Online Estimate</h2>
        <p>Follow our simple 4 step process to get the most accurate estimate of your relocation costs.<br />
        <a href="OnlineEstimateWizard.aspx">Click here to proceed</a></p>
  
        <h2 style="padding:5px 0px 5px 0px;">Returning User?</h2>
        <table border="0">
            <tr style="line-height:25px;">
                <td class="black-text">Email:</td>
                <td><asp:TextBox ID="txtResumeEmail" runat="server" MaxLength="100" Width="100%" /></td>
            </tr>
            <tr style="line-height:25px;">
                <td class="black-text">Password:&nbsp;</td>
                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20" Width="100%"/></td>
            </tr>
            <tr style="line-height:25px;">
                <td>&nbsp;</td>
                <td align="right"><asp:Button Text="Submit" ID="btnResumeOnlineEstimate" runat="server" ValidationGroup="ResumeEstimate" OnClick="btnResumeOnlineEstimate_Click" /></td>
            </tr>
        </table>
        <p>&nbsp;</p>
    </div>
    <div id="quote-request" style="text-align:left; word-spacing:normal;">
        <h2 class="quote-heading"> Quote Request</h2>
        <p>Send us your details and we will be in contact with you as soon as possible.<br /><a href="OnSiteQuoteRequest.aspx">Request a quote here</a></p>
    </div>
    <div class="cleardiv">
    </div>
    <div class="text-black" style="text-align: center;">
        
    </div>
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
</div>
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

     <!-- SiteCatalyst code version: H.19.4.
Copyright 1997-2009 Omniture, Inc. More info available at
http://www.omniture.com -->
<script language="JavaScript" type="text/javascript" src="//www.crownrelo.com/relo/scripts/s_code_nz.js"></script>
<script language="JavaScript" type="text/javascript"><!--
    /* You may give each page an identifying name, server, and channel on
    the next lines. */
    s.pageName = "relonz:house moving:get a quote"
    s.server = ""
    s.channel = "relonz:house moving"
    s.pageType = ""
    s.prop1 = "relonz"
    s.prop2 = "relonz:house moving:get a quote"
    s.prop3 = ""
    s.prop4 = ""
    s.prop5 = ""
    /* Conversion Variables */
    s.campaign = ""
    s.state = ""
    s.zip = ""
    s.events = ""
    s.products = ""
    s.purchaseID = ""
    s.eVar1 = "relonz"
    s.eVar2 = "relonz:house moving"
    s.eVar3 = "relonz:house moving:get a quote"
    s.eVar4 = ""
    s.eVar5 = ""
    s.eVar12 = ""
    /* Hierarchy Variables */
    s.hier1 = "relonz|house moving"
    /************* DO NOT ALTER ANYTHING BELOW THIS LINE ! **************/
    var s_code = s.t(); if (s_code) document.write(s_code)//--></script>
<script language="JavaScript" type="text/javascript"><!--
    if (navigator.appVersion.indexOf('MSIE') >= 0) document.write(unescape('%3C') + '\!-' + '-')
//--></script><noscript><a href="http://www.omniture.com" title="Web Analytics"><img
src="http://cwgrelonzprd.112.2O7.net/b/ss/cwgrelonzprd/1/H.19.4--NS/0?[AQB]&cdp=3&[AQE]"
height="1" width="1" border="0" alt="" /></a></noscript><!--/DO NOT REMOVE/-->
<!-- End SiteCatalyst code version: H.19.4. -->
</body>
</html>
