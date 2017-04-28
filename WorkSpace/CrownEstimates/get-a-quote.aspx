<%@ Page Language="C#" AutoEventWireup="true" CodeFile="get-a-quote.aspx.cs" Inherits="get_a_quote" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Get a Quote | Crown Relocations | New Zealand Moving Company | Furniture Movers | International Relocations | Storage | House Removals</title>
    <meta name="description" content="Crown Relocations is a Furniture Moving Company specialising in Local, Domestic, International Relocations and Corporate Transfers. " />

    <script src="http://code.jquery.com/jquery-latest.js"></script>
      	
    <script type="text/javascript" src="/js/tinyfader.js"></script>
	<script language="JavaScript" type="text/javascript" src="//www.crownrelo.com/relo/scripts/s_code_nz.js"></script>

    <link rel="stylesheet" type="text/css" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=CrownMainStyles">
    
    <!--[if !IE]>
		<link rel="stylesheet" type="text/css" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=CrownMediaQueriesStyles">
	<![endif]-->
    <!--[if IE]>
		<link rel="stylesheet" type="text/css" href="http://www.crownrelo.co.nz/CMSPages/GetResource.ashx?stylesheetname=CrownMediaQueriesQuotePages">
	<![endif]-->
	
</head>
<body>

<div class="rounded-content quick quote clearfix">
<div class="GetAQuote">
<form id="form1" runat="server">
        <div id="container_Quote">        
                <div id="content_Quote">
                                <div id="left_Quote">
                                <div id="left-content_Quote">                                
                                    <asp:ValidationSummary ID="vs1" runat="server" ValidationGroup="ResumeEstimate" CssClass="validationSummary" />
                                        <div class="validationSummary"><asp:Literal ID="litMessage" runat="server" EnableViewState="false" /></div>
                                    <asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="txtResumeEmail" ValidationGroup="ResumeEstimate" Display="None" ErrorMessage="Please enter an email address<br />" />
                                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtPassword"  ValidationGroup="ResumeEstimate" Display="None" ErrorMessage="Please enter your password<br />" />
                                    <asp:RegularExpressionValidator ID="rev1" runat="server"  ControlToValidate="txtResumeEmail" ValidationGroup="ResumeEstimate" Display="None" ErrorMessage="Please enter a valid email address of the form email@host.domain" />
                                                        <h1>Full Quote</h1>
                                                        <p>Follow our simple 4 step process to get the most accurate quote of your relocation costs.<br />
                                                        <a href="http://www.crownrelo.co.nz/Get-a-Quote/Full-Quote.aspx" target="_top">Click here to proceed without login</a></p>
                                                  <div class="LoginBox" style="width: 300px;border: 1px solid #C00;padding: 25px;border-radius: 12px;">
                                                        <h2>Returning User?</h2>
                                                        <br />
                                                        <table width="100%">
                                                            <tr>
                                                                <td>Email:&nbsp;</td>
                                                                <td><asp:TextBox ID="txtResumeEmail" runat="server" MaxLength="100" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td>Password:&nbsp;</td>
                                                                <td><asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="20" /></td>
                                                            </tr>
                                                            <tr>                                                                
                                                                <td align="right" colspan="2">
                                                                <asp:Button Text="Submit" ID="btnResumeOnlineEstimate" runat="server" ValidationGroup="ResumeEstimate" OnClick="btnResumeOnlineEstimate_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>       
                                                        </div>
                                    </div>
                                </div>
                <!-- left ends -->
                </div>
                <br /><br /><br /><br /><br /><br />
        <!-- content ends -->        
        </div>
<!-- container ends -->
</form>
</div>
</div> 
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
