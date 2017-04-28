using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using CrownEstimates.BusinessModel;
using System.Web.Configuration;


public partial class controls_FeedbackForm : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected override void OnPreRender(EventArgs e)
    {
       InjectOmnitureScript(); 
        base.OnPreRender(e);
    }
     

    private string events = "";

    protected void InjectOmnitureScript()
    {
        string scriptName = "Omniture";
        string script = @"
<!-- SiteCatalyst code version: H.19.4.
Copyright 1997-2009 Omniture, Inc. More info available at
http://www.omniture.com -->
<script language=""JavaScript"" type=""text/javascript"" src=""//www.crownrelo.com/relo/scripts/s_code_nz.js""></script>
<script language=""JavaScript"" type=""text/javascript""><!--
    /* You may give each page an identifying name, server, and channel on
    the next lines. */
    s.pageName = ""{0}""
    s.server = """"
    s.channel = ""relonz:house moving""
    s.pageType = """"
    s.prop1 = ""relonz""
    s.prop2 = ""{12}""
    s.prop3 = """"
    s.prop4 = """"
    s.prop5 = """"
    /* Conversion Variables */
    s.campaign = """"
    s.state = """"
    s.zip = """"
    s.events = ""{9}""
    s.products = """"
    s.purchaseID = """"
    s.eVar1 = ""relonz""
    s.eVar2 = ""{11}""
    s.eVar3 = ""{12}""
    s.eVar4 = """"
    s.eVar5 = ""{1}""    
    s.eVar6 = ""{2}""    
    s.eVar7 = ""{3}""    
    s.eVar8 = ""{4}""    
    s.eVar9 = ""{5}""    
    s.eVar10 = ""{6}""    
    s.eVar11 = ""{7}""    
    s.eVar13 = ""{10}"" 
    /* Hierarchy Variables */
    s.hier1 = ""{8}""
    /************* DO NOT ALTER ANYTHING BELOW THIS LINE ! **************/
    var s_code = s.t(); if (s_code) document.write(s_code)//--></script>
<script language=""JavaScript"" type=""text/javascript""><!--
    if (navigator.appVersion.indexOf('MSIE') >= 0) document.write(unescape('%3C') + '\!-' + '-')
//--></script><noscript><a href=""http://www.omniture.com"" title=""Web Analytics""><img
src=""http://cwgrelonzprd.112.2O7.net/b/ss/cwgrelonzprd/1/H.19.4--NS/0?[AQB]&cdp=3&[AQE]""
height=""1"" width=""1"" border=""0"" alt="""" /></a></noscript><!--/DO NOT REMOVE/-->
<!-- End SiteCatalyst code version: H.19.4. -->
";


        if (!Page.ClientScript.IsClientScriptBlockRegistered(scriptName))
            Page.ClientScript.RegisterClientScriptBlock(typeof(string), scriptName, string.Format(script,
                Session["pagetitle"] as string,
                "",
                "",
                "",
                __currentLocation.Text,
                __newCity.Text,
                "",
                "",
                Session["s.hier1"] as string,
                events,
                Session["s.evar13"] as string,
                Session["pagesection"] as string                                            /*11*/,
                Session["pagesubsection"] as string                    /*12*/

                )
                , false);

        Session["pagetitle"] =Session["s.evar13"] =Session["pagesection"] =Session["s.hier1"] = "";

    }



    protected void __submit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            events = "";
            return;
        }
        events = "event3";

        EnquiryEmail ee = new EnquiryEmail();
        ee.FromAddress = __email.Text;
        ee.Subject = string.Format("Moving To NZ Enquiry ({0}) - ({1})", __currentLocation.Text, __newCity.Text);
        ee.ToAddress = EmailHelper.CrownEmailAddress;
        ee.CustomerName = __name.Text;

        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Your Name:           " + __name.Text);
        sb.AppendLine("Your Email:          " + __email.Text);
        sb.AppendLine("Phone (evening):     " + __phoneEvening.Text);
        sb.AppendLine("Phone (mobile):      " + __phoneMobile.Text); 
        sb.AppendLine("Family Size:         " + __numberOfChildren.Value);
        sb.AppendLine("Current Location:    " + __currentLocation.Text);        
        sb.AppendLine("New Location:        " + __newCity.Text);
        sb.AppendLine("Arrival (permanent): " + __arrivalPermanent.Text);

        sb.AppendLine("");
        sb.AppendLine("Comments / Questions:");
        sb.AppendLine(__commentsQuestions.Text);

        ee.Body = sb.ToString();
        
        ee.Save();

        EmailHelper.SendMovingHomeEmail(ee);

        EmailHelper.SendPlainEmail(string.Format(@"Dear {0}

Thank you for your enquiry via our Crown Relocations website. As a specialist in the provision of Settling in services, Crown is ideally positioned to assist you to settle when you first arrive in New Zealand. Our dedicated staff are trained to ensure the smoothest transition possible.

We will be contacting you within the next 24 hours to discuss your needs, if there are any times that are inconvenient please let us know.

Thank you for considering Crown Relocations, we look forward to speaking with you and to being of assistance.

Kind regards from the team at Crown Relocations!
        
www.crownrelo.co.nz
Freephone: 0508 227 696  (international callers phone: +64 9 415 7300).{1}Please do not reply to this email. This email was sent from an unattended mailbox.
", ee.CustomerName, Environment.NewLine)
 , "Fresh Start - Crown Relocations", ee.FromAddress, ee.ToAddress);


               
        __confirmationPanel.Visible = true;
        __quetionnairePanel.Visible = false;


    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = EmailHelper.ValidateEmail(args.Value);

    }


}
