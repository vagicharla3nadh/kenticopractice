using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.Reporting;
using CrownEstimates.BusinessModel;
using FAC.Web.UI;

public partial class OnSiteQuoteRequest : CrownEstimatesWizardsBasePage
{

    #region Page Events

    protected override void OnInitComplete(EventArgs e)
    {
        regv1.ValidationExpression = EmailRegXValidation;

        base.OnInitComplete(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        w.StepNextButtonStyle.CssClass = "noDisplay";
        w.StartNextButtonStyle.CssClass = "noDisplay";
        w.FinishCompleteButtonStyle.CssClass = "noDisplay";
        w.FinishPreviousButtonStyle.CssClass = "noDisplay";

        //        Master.PageHeading = "Quote Request";

        if (!Page.IsPostBack)
        {
            //txtApproximateDateOfMove.Text = DEFAULT_APPROX_DATE;
            if (SessionQuoteIDNullable.HasValue)
                LoadYourDetails();
        }
    }

    private string omnitureEvents = "";
    private string omnitureFromCity = "";
    private string omnitureToCity = "";

    protected override void OnPreRender(EventArgs e)
    {
        ShowHideBackNextButtons();

        base.OnPreRender(e);

        InjectOmnitureScript();

        string scriptName = "Omniture_DownloadTracker";
        string script = @"
function Omniture_DownloadTracker()
{
    var s=s_gi(s_account);
    s.linkTrackVars='eVar12,events'; 
    s.linkTrackEvents='event8'; 
    s.eVar12='household inventory'; 
    s.events='event8'; 
    s.tl(this,'o','Document Download'); 
}
";

        if (!Page.ClientScript.IsClientScriptBlockRegistered(scriptName))
            Page.ClientScript.RegisterClientScriptBlock(typeof(string), scriptName, script, true);

    }

    #endregion

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
    s.pageName = ""relonz:house moving:{0}""
    s.server = """"
    s.channel = ""relonz:house moving""
    s.pageType = """"
    s.prop1 = ""relonz""
    s.prop2 = ""relonz:house moving:online estimate""
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
    s.eVar2 = ""relonz:house moving""
    s.eVar3 = ""relonz:house moving:online estimate""
    s.eVar4 = """"
    s.eVar5 = ""{1}""    
    s.eVar6 = ""{2}""    
    s.eVar7 = ""{3}""    
    s.eVar8 = ""{4}""    
    s.eVar9 = ""{5}""    
    s.eVar10 = ""{6}""    
    s.eVar11 = ""{7}""        
    /* Hierarchy Variables */
    s.hier1 = ""relonz|house moving|online estimate""
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
                "quote request wizard " + w.ActiveStepIndex.ToString(),
                omnitureFromCity,
                "New Zealand",
                omnitureToCity,
                "",
                "",
                "",
                "",
                "|quote request wizard",    // can put page number here I guess
                omnitureEvents
                )
                , false);

    }



    #region Wizard Events
    protected void w_ActiveStepChanged(object sender, EventArgs e)
    {
        LoadTab();
    }
    #endregion

    #region Button Events

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Save();

        if (w.ActiveStepIndex > 0)
            w.ActiveStepIndex--;

        ShowHideBackNextButtons();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
            Save();
    }
    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Save();

            if (w.ActiveStepIndex < w.WizardSteps.Count - 1)
                w.ActiveStepIndex++;

            ShowHideBackNextButtons();
        }
    }
    protected void btnSendNow_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) omnitureEvents = omnitureFromCity = omnitureToCity = "";

        if (Page.IsValid)
        {
            omnitureEvents = "event2";
            omnitureFromCity = txtCityFrom.Text;
            omnitureToCity = txtCityTo.Text;

            SaveRoomSelection(Quote);
            SaveSummaryReview(Quote);
            Quote.Save();

            EmailHelper.SendCompletedQuoteCrownEmail(Quote);

            Quote.CompletedOn = DateTime.Now;
            Quote.Save();

            ClearSessionQuoteID();

            //Server.Transfer("FinishedWizard.aspx?IsOnSiteQuoteRequest=1");
            pnlWizard.Visible = false;
            pnlWizardThankyou.Visible = true;
        }
    }
    #endregion

    #region Private Methods
    private void LoadTab()
    {
        ShowHideBackNextButtons();

        if (w.ActiveStepIndex == TAB_YOUR_DETAILS)
            LoadYourDetails();

        if (w.ActiveStepIndex == TAB_HOME_PROFILE)
        {
            LoadRoomSelection();
            LoadSummaryReview(Quote);
        }
    }

    private void Save()
    {
        if (w.ActiveStepIndex == TAB_YOUR_DETAILS)
        {
            if (!SessionQuoteIDNullable.HasValue)//new quote(hopefully)
                CreateQuote();

            SaveYourDetails(Quote);
        }

        if (w.ActiveStepIndex == TAB_HOME_PROFILE)
        {
            SaveRoomSelection(Quote);
            LoadRoomSelection(); //reload hidden grid fields etc
            SaveSummaryReview(Quote);
        }

        Quote.Save();
    }
    private void ShowHideBackNextButtons()
    {
        btnBack.Visible = true;
        btnNext.Visible = true;
        btnSendNow.Visible = false;

        if (w.ActiveStepIndex == TAB_YOUR_DETAILS)
            btnBack.Visible = false;

        if (w.ActiveStepIndex == w.WizardSteps.Count - 1)
        {
            btnNext.Visible = false;
            btnSendNow.Visible = true;
        }
    }
    #region Load/Save Tab

    private void LoadYourDetails()
    {
        txtFirstName.Text = Quote.FirstName;
        txtSurname.Text = Quote.Surname;
        txtDayPhone.Text = Quote.DayPhone;

        txtStreetFrom.Text = Quote.FromStreet;
        txtSuburbFrom.Text = Quote.FromSuburb;
        txtCityFrom.Text = Quote.FromCity;

        if (!String.IsNullOrEmpty(Quote.FromCountry))
            ListControlHelper.SetText(ddCountryFrom, Quote.FromCountry);

        txtStreetTo.Text = Quote.ToStreet;
        txtSuburbTo.Text = Quote.ToSuburb;
        txtCityTo.Text = Quote.ToCity;
        txtEmail.Text = Quote.Email;

        txtDeliveryDate.Text = Quote.DeliveryDate;
        txtMovingOutDate.Text = Quote.PickupDate;

        //        ctrlMovingInDate.ValueNullable = Quote.DeliveryDate;
        //        ctrlMovingOutDate.ValueNullable = Quote.PickupDate;
        //        txtApproximateDateOfMove.Text = String.IsNullOrEmpty(Quote.ApproximateMoveDate) ? DEFAULT_APPROX_DATE : Quote.ApproximateMoveDate; 
    }
    private void SaveYourDetails(Quotes q)
    {
        // Quotes q = (SessionQuoteIDNullable.HasValue) ? Quotes.Get(SessionQuoteIDNullable.Value) : Quotes.Create();
        q.FirstName = txtFirstName.Text;
        q.Surname = txtSurname.Text;
        q.DayPhone = txtDayPhone.Text;

        q.FromStreet = txtStreetFrom.Text;
        q.FromSuburb = txtSuburbFrom.Text;
        q.FromCity = txtCityFrom.Text;
        q.FromCountry = ddCountryFrom.SelectedValue;

        q.ToStreet = txtStreetTo.Text;
        q.ToSuburb = txtSuburbTo.Text;
        q.ToCity = txtCityTo.Text;
        q.Email = txtEmail.Text;

        q.PickupDate = txtMovingOutDate.Text;
        q.DeliveryDate = txtDeliveryDate.Text;
        //q.ApproximateMoveDate = EscapeDefault(txtApproximateDateOfMove.Text);
        q.QuoteType = Quotes.QuoteTypes.Quote;

        if (!SessionQuoteIDNullable.HasValue)
        {
            q.Save();
            SessionQuoteID = q.QuoteId;
        }
    }
    private void LoadRoomSelection()
    {
        rpRoomSelect.DataSource = RoomProfile.GetAllRooms(QuoteID);
        rpRoomSelect.DataBind();

        foreach (RepeaterItem item in rpRoomSelect.Items)
            SetQuantityDropDown(item, "ddNumberOfRooms");
    }
    private void SaveRoomSelection(Quotes quotes)
    {
        foreach (RepeaterItem item in rpRoomSelect.Items)
            SaveRoom(item);
    }

    private void LoadSummaryReview(Quotes q)
    {
        txtConsultantComments.Text = q.Comments;
    }
    private void SaveSummaryReview(Quotes q)
    {
        q.Comments = txtConsultantComments.Text;
        q.CopyToClient = false;
    }

    #endregion
    #endregion

    #region Validation
    protected void ValidateConsultantComments(object source, ServerValidateEventArgs args)
    {
        args.IsValid = (txtConsultantComments.Text.Length <= 1000);
    }
    protected void ValidateSelectedRooms(object source, ServerValidateEventArgs args)
    {
        args.IsValid = IsAtLeastOneRoomSelected(rpRoomSelect.Items);
    }
    protected void ValidatePhone(object source, ServerValidateEventArgs args)
    {
        TextBox txt = (TextBox)w.FindControl(((CustomValidator)source).ControlToValidate);
        args.IsValid = ValidatePhone(txt.Text);
    }
    #endregion

    protected void ChangeStep(object sender, EventArgs e)
    {
        if (Page.IsValid)
            ChangeTab(int.Parse(((LinkButton)sender).CommandArgument));
    }

    private void ChangeTab(int newTabId)
    {
        Save();
        w.ActiveStepIndex = newTabId;
        LoadTab();
    }

    public string SetStepTabStyle(int tab)
    {
        return SetStepTabStyle(tab, w.ActiveStepIndex);
    }

    protected void rpRoomSelectRepeater_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
        FormatRepeaterTable(2, rpRoomSelect.Items.Count, e);
    }


    protected void btnPrintThisList_Click(object sender, ImageClickEventArgs e)
    {
        Save();
        ReportHelper.GenerateReportAndSendToBrowser(this, ReportHelper.REPORT_HOUSE_BLANK, QuoteID, null);
    }
}