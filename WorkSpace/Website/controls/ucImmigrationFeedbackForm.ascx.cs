using System.Text.RegularExpressions;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using CrownEstimates.BusinessModel;


public partial class controls_FeedbackForm : System.Web.UI.UserControl
{
    protected override void OnInit(EventArgs e)
    {
        emailRegexVal.ValidationExpression = CrownEstimatesBasePage.EmailRegXValidation;

        base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            __relativesYes.Items.Add(new ListItem("Yes", "Yes"));
            __relativesYes.Items.Add(new ListItem("No", "No"));
            __jobOfferYes.Items.Add(new ListItem("Yes", "Yes"));
            __jobOfferYes.Items.Add(new ListItem("No", "No"));
            __milYes.Items.Add(new ListItem("Yes", "Yes"));
            __milYes.Items.Add(new ListItem("No", "No"));
            __ownBusYes.Items.Add(new ListItem("Yes", "Yes"));
            __ownBusYes.Items.Add(new ListItem("No", "No"));
            __qualNZYes.Items.Add(new ListItem("Yes", "Yes"));
            __qualNZYes.Items.Add(new ListItem("No", "No"));
            __2yearsYes.Items.Add(new ListItem("Yes", "Yes"));
            __2yearsYes.Items.Add(new ListItem("No", "No"));
        }

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
                Session["pagesubsection"] as string,
                "",
                "",
                "",
                "",
                "",
                "",
                "",
                Session["s.hier1"] as string,
                events,
                Session["s.evar13"] as string,
                Session["pagesection"] as string                                            /*11*/,
                Session["pagesubsection"] as string                    /*12*/

                )
                , false);

        Session["pagetitle"] = Session["s.evar13"] = Session["pagesection"] = Session["s.hier1"] = "";

    }



    protected void __submit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {
            events = "";
            return;
        }
        events = "event3";
        string tit = "";
        if (this.Page.Title.Contains("Business")) tit = "Business";
        else if (this.Page.Title.Contains("Temporary")) tit = "Temporary Skilled";
        else if (this.Page.Title.Contains("Family")) tit = "Family";
        else if (this.Page.Title.Contains("Permanent")) tit = "Permanent Skilled";
        else if (this.Page.Title.Contains("Student")) tit = "Student";
        else if (this.Page.Title.Contains("Visitor")) tit = "Visitor";
        else tit = "";


        EnquiryEmail ee = new EnquiryEmail();
        ee.FromAddress = __email.Text;
        ee.Subject = string.Format("Immigration Enquiry - {0} ", tit);
        ee.ToAddress = EmailHelper.CrownEmailAddress;
        ee.CustomerName = __firstName.Text;

        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Your Name:             " + __firstName.Text  +" " + __surname.Text);
        sb.AppendLine("Your Email:            " + __email.Text);
        sb.AppendLine("Your Phone:            " + __phone.Text);
        sb.AppendLine("Date of Birth:         " + __dob.Text);        
        sb.AppendLine("Current Location:      " + __country.SelectedItem != null? __country.SelectedItem.Text : string.Empty);        
        sb.AppendLine("Occupation:            " + __occupation.SelectedValue);
        sb.AppendLine("Level of English:      " + __englishLevel.SelectedValue);

        sb.AppendLine("");
        
        
        sb.AppendLine("Relatives in NZ:       " + (string)(__relativesYes.SelectedValue));
        sb.AppendLine("Highest Qual.:         " + (string)(__highestQualification.SelectedValue));
        sb.AppendLine("NZ Qualification:      " + (string)(__qualNZYes.SelectedValue));
        sb.AppendLine("NZ Qual. details:      " + (string)(__nzQualification.Text));
        sb.AppendLine("Min 2 years work:      " + (string)(__2yearsYes.SelectedValue));
        sb.AppendLine("Job Offer in NZ:       " + (string)(__jobOfferYes.SelectedValue));
        sb.AppendLine("Owned own business:    " + (string)(__ownBusYes.SelectedValue));
        sb.AppendLine("$1 Million:            " + (string)(__milYes.SelectedValue));
        sb.AppendLine("");
        
        ee.Body = sb.ToString();        
        ee.Save();

        EmailHelper.SendMovingHomeEmail(ee);

       

        __confirmationPanel.Visible = true;
        __quetionnairePanel.Visible = false;


    }

    protected void cv1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = __qualNZYes.SelectedValue != "Yes" || (!string.IsNullOrEmpty(__nzQualification.Text));
    }

}