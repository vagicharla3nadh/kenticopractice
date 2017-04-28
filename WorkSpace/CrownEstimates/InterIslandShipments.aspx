<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InterIslandShipments.aspx.cs" Inherits="InterIslandShipments" EnableViewState="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<style type="text/css">
<!--
body { 
font-family:arial, Helvetica, sans-serif;
line-height:20px;
font-size:14px;
color:#ce0002;
}

#left9 { 
text-align:right;
float:left;
width:270px; 
height:111px;
background-color:#f8f8f8;
padding-right:15px;
padding-top:10px;
}


#right9 { 
float:left;
width:245px;
}
-->
</style>

<head id="Head1" runat="server">
    <title>Inter Island</title>

    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" type="text/css" media="screen" href="style.css" />
    
<script language="JavaScript" type="text/javascript" src="//www.crownrelo.com/relo/scripts/s_code_nz.js"></script></head>
<body>
    <form id="form1" runat="server">
    
    
    <div> <p>&nobsp;</p>
        <p> 
        <asp:Label CssClass="red-row" ForeColor="White" ID="_relocationLabel" runat="server"  Text="Relocation Selected:"></asp:Label>        
        &nobsp;
        <asp:Label CssClass="red-row" ForeColor="White" ID="_relocationSelectedLabel" runat="server"  Text=""></asp:Label>        
        </p>
    </div>
    
    <asp:Panel ID="_gridViewPanel" runat="server" >
        <div>            
            <asp:GridView ID="__shipmentList" runat="server" AutoGenerateColumns="False" Width="100%"  CssClass="red-row"  ForeColor="White" GridLines="None" BorderStyle="None" EnableViewState="false" >
                <HeaderStyle CssClass="tablehdr"  />
                <Columns >
                    <asp:BoundField DataField="ShipmentID" HeaderText="ID" >
                        <HeaderStyle CssClass="tablehdr" Width="40px" />
                        <ItemStyle VerticalAlign="Top" />
                    </asp:BoundField>     

                    <asp:BoundField DataField="CutoffDate" HeaderText="Cutoff Date"  >
                        <HeaderStyle Width="80px" />
                        <ItemStyle VerticalAlign="Top" />
                    </asp:BoundField>     

                    <asp:BoundField DataField="ArrivalDate" HeaderText="Arrival Date"  >
                        <HeaderStyle Width="80px" />
                        <ItemStyle VerticalAlign="Top" />
                    </asp:BoundField>    
                     
                    <asp:BoundField DataField="TransitTime" HeaderText="Transit Time"  >
                        <HeaderStyle Width="80px" />
                        <ItemStyle VerticalAlign="Top" />
                    </asp:BoundField>    
                    
                    <asp:TemplateField HeaderStyle-Width="60px" HeaderText="Enquire">
                        <ItemTemplate>
                        <%# CreateMailToHyperlink((string) Eval("ShipmentRef2"))%>
                        </ItemTemplate>
                        <HeaderStyle CssClass="tablehdr" />
                    </asp:TemplateField>

                </Columns>
                <RowStyle CssClass="tablecellc"/>
                <AlternatingRowStyle CssClass="tablecelld"/>
            </asp:GridView>
        </div>
    </asp:Panel>
    
    <asp:Panel Visible ="false" ID="_noResultsPanel" runat="server" >
        <div id="left9"><p>&nbsp;</p><p>Please contact Crown for timing <br />and a free quotation.</p></div>
        <div id="right9"><img src="images/phone-number.gif" alt="Call Toll Free 0508 227 696" /></div>
    </asp:Panel>
    
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
