﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.BusinessModel;
using System.Data;
using System.Web.UI.HtmlControls;
using FAC.Web.UI;
using CrownEstimates.Reporting;

using System.Data.SqlClient;
using System.Configuration;

public partial class OnlineEstimateWizardShortVersion : CrownEstimatesWizardsBasePage
{
    #region Properties
    private int SelectedQuoteRoomID
    {
        get { return (int)ViewState["SelectedQuoteRoomID"]; }
        set { ViewState["SelectedQuoteRoomID"] = value; }
    }

        
    #endregion

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

        if (!Page.IsPostBack)
        {
//            txtApproximateDateOfMove.Text = DEFAULT_APPROX_DATE;
            if (SessionQuoteIDNullable.HasValue)
            {
                LoadYourDetails();
            }
        }

        if (SessionQuoteIDNullable.HasValue)
            litPrintFullHouseInventoryLink.Text = MakeReportLink(ReportHelper.REPORT_HOUSE_FULL, QuoteID, null, "Print Full HouseHold Inventory");
    }

    private string omnitureEvents = "";
    private string omnitureFromCity = "";
    private string omnitureToCity = "";


    protected override void OnPreRender(EventArgs e)
    {
        CheckContainers();
        
        ShowHideBackNextButtons();

        base.OnPreRender(e);

//        InjectOmnitureScript();

//        string scriptName = "Omniture_DownloadTracker";
//        string script = @"
//function Omniture_DownloadTracker()
//{
//    var s=s_gi(s_account);
//    s.linkTrackVars='eVar12,events'; 
//    s.linkTrackEvents='event8'; 
//    s.eVar12='household inventory'; 
//    s.events='event8'; 
//    s.tl(this,'o','Document Download'); 
//}
//";

//        if (!Page.ClientScript.IsClientScriptBlockRegistered(scriptName))
//            Page.ClientScript.RegisterClientScriptBlock(typeof(string), scriptName, script, true);

    }

    #endregion

    //Uncomment to make the Ajax work.
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    Label1.Text = DateTime.Now.ToLongTimeString();
    //    Label2.Text = DateTime.Now.ToLongTimeString();
    //    //test.Visible = false;
    //}
    //protected void Button2_Click(object sender, EventArgs e)
    //{
    //    //test.Visible = true;
    //    Label1.Text = DateTime.Now.ToLongTimeString();
    //}

    protected void CheckContainers()
    {
        if (w.ActiveStepIndex == TAB_HOUSEHOLD_INVENTORY)
        {            
            //SQLContainerValue.Visible = true;
            //Calculates the Truck Container Percentage
            string SQLQuoteID;
            string SQLDimensionAndQuantity;
            Double OneContainer;
            Double TotalValue;
            Double CalculatePercent;
            ContainersFull.Visible = false;
            ContainerImage1.Visible = false;
            ContainerImage2.Visible = false;
            TruckAnimater1.Visible = false;
            TruckAnimater2.Visible = false;

            SQLQuoteID = Quote.QuoteId.ToString();

            if (SQLQuoteID != "")
            {
				string ConnectionStringFromWebConfig = @"" + ConfigurationManager.ConnectionStrings["Standard"].ConnectionString + "";
				string sqlConnectString = ConnectionStringFromWebConfig;
                string sqlSelect = "SELECT CONVERT(varchar,SUM(I.Dimension * QI.Quantity),3) AS Total FROM  [CrownQuotation].[dbo].[QuotesInventory] QI,[CrownQuotation].[dbo].[Inventory] I WHERE QI.InventoryID = I.InventoryID AND QI.QuoteID = " + SQLQuoteID; //Your query goes here 
                SqlConnection sqlConnection = new SqlConnection(sqlConnectString);

                sqlConnection.Open();
                SqlCommand sqlCommand = new SqlCommand(sqlSelect, sqlConnection);
                sqlCommand.CommandTimeout = 0;
                SqlDataReader reader = null;
                reader = sqlCommand.ExecuteReader();
                reader.Read();
                SQLDimensionAndQuantity = reader["Total"].ToString();

                try
                {
                    sqlConnection.Close();
                }
                catch (Exception Exc)
                {
                    Console.WriteLine(Exc.ToString());
                }

                if (SQLDimensionAndQuantity != "")
                {
                    SQLContainerValue.Text = "Truck is more than 0 Percent";

                    OneContainer = 28;
                    TotalValue = Convert.ToDouble(SQLDimensionAndQuantity);
                    CalculatePercent = (TotalValue * 100) / OneContainer;


                    if (CalculatePercent > 89 && CalculatePercent < 106)//Capacity Warning
                    {
                        CapcityGood.Visible = false;
                        CapcityWarning.Visible = true;
                        CapcityOver.Visible = false;                        
                    }
                    else if (CalculatePercent > 105)//Capacity Over
                    {
                        CapcityGood.Visible = false;
                        CapcityWarning.Visible = false;
                        CapcityOver.Visible = true;                        
                    }
                    else//Capcity Good 
                    {
                        CapcityGood.Visible = true;
                        CapcityWarning.Visible = false;
                        CapcityOver.Visible = false;                        
                    }

                    if (CalculatePercent <= 100)
                    {                        
                        ContainersFull.Visible = false;
                        ContainerImage1.Visible = true;
                        ContainerImage1v1.Visible = false;
                        ContainerImage2.Visible = false;
                        TruckAnimater1.Visible = true;
                        //TruckAnimater2.Visible = false;
                        //Container1LabelTop.Visible = true;
                        Container1LabelBottom.Visible = true;
                        //Container2LabelTop.Visible = false;
                        Container2LabelBottom.Visible = false;
                        
                        ContainerImage1.Text = CalculatePercent.ToString("#0.00");
                    }
                    else if (CalculatePercent > 100 && CalculatePercent < 201)
                    {                        
                        ContainersFull.Visible = false;
                        ContainerImage1.Visible = true;
                        ContainerImage1v1.Visible = true;
                        ContainerImage2.Visible = true;
                        TruckAnimater1.Visible = true;
                        //TruckAnimater2.Visible = true;
                        //Container1LabelTop.Visible = false;
                        Container1LabelBottom.Visible = false;
                        //Container2LabelTop.Visible = true;
                        Container2LabelBottom.Visible = true;

                        ContainerImage1.Text = "100";
                        CalculatePercent = CalculatePercent - 100;

                        ContainerImage2.Text = CalculatePercent.ToString("#0.00");
                    }
                    else
                    {                        
                        //ContainersFull.Visible = true;
                        ContainerImage1.Visible = true;
                        ContainerImage1v1.Visible = true;
                        ContainerImage2.Visible = true;
                        TruckAnimater1.Visible = true;
                        //TruckAnimater2.Visible = true;
                        //Container1LabelTop.Visible = false;
                        Container1LabelBottom.Visible = false;
                        //Container2LabelTop.Visible = true;
                        Container2LabelBottom.Visible = true;

                        ContainerImage1.Text = "100";
                        //ContainerImage2.Text = "100";
                        //ContainersFull.Text = "Your Containers are full";
                    }

                }
                else
                {
                    SQLContainerValue.Text = "Cannot find any items for the Container. Container is 0 Percent";
                }

            }
            else
            {
                SQLContainerValue.Text = "QuoteID is not having a value";
            }

        }
        else
        {
            SQLContainerValue.Text = "You are not in Household Inventory tab";            
        }


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
            TaskCompleteID.InnerText = "";

            if (w.ActiveStepIndex == TAB_HOUSEHOLD_INVENTORY)
            {
                for (int i = rpRoomsRepeater.Items.Count-1; i > 0; i--)
                {
                    LinkButton lb = (LinkButton)rpRoomsRepeater.Items[i].FindControl("btnRoom");
                    int quoteRoomid = int.Parse(lb.CommandArgument);
                    if (quoteRoomid == SelectedQuoteRoomID && i-1 >= 0)
                    {
                        lb = (LinkButton)rpRoomsRepeater.Items[i-1].FindControl("btnRoom");
                        LoadRoomsSelectedForQuoteTabs();
                        LoadHouseHoldInventory(lb);
                        SelectedQuoteRoomID = int.Parse(lb.CommandArgument);
                        return;
                    }
                }
            }

            if (w.ActiveStepIndex > 0)
                w.ActiveStepIndex--;

            ShowHideBackNextButtons();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Save();
            TaskCompleteID.InnerText = "";
        }
    }

    protected void CompleteButton_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Save();
            TaskCompleteID.InnerText = "complete";
        }
    }

    protected void btnNext_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            Save();
            TaskCompleteID.InnerText = "";

            if (w.ActiveStepIndex == TAB_HOUSEHOLD_INVENTORY)
            {
                for (int i = 0; i < rpRoomsRepeater.Items.Count-1; i++)
                {
                    LinkButton lb = (LinkButton) rpRoomsRepeater.Items[i].FindControl("btnRoom");
                    int quoteRoomid = int.Parse(lb.CommandArgument);
                    if (quoteRoomid == SelectedQuoteRoomID && i + 1 <= rpRoomsRepeater.Items.Count - 1)
                    {
                        lb = (LinkButton)rpRoomsRepeater.Items[i+1].FindControl("btnRoom");
                        LoadRoomsSelectedForQuoteTabs();
                        LoadHouseHoldInventory(lb);
                        SelectedQuoteRoomID = int.Parse(lb.CommandArgument);
                        return;
                    }
                }
            }

            if (w.ActiveStepIndex < w.WizardSteps.Count - 1)
                w.ActiveStepIndex++;

            ShowHideBackNextButtons();
        }
    }
    protected void btnRoom_Click(object sender, EventArgs e)
    {
        TaskCompleteID.InnerText = "";
        LinkButton lb = (LinkButton)sender;
        SelectedQuoteRoomID = int.Parse(lb.CommandArgument);

        SaveHouseHoldInventory();
        LoadRoomsSelectedForQuoteTabs();
        LoadHouseHoldInventory(lb);        
    }
    protected void btnSendNow_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid) omnitureEvents = omnitureFromCity = omnitureToCity = "";

        else
        {
            omnitureEvents = "event1";
            omnitureFromCity = txtCityFrom.Text;
            omnitureToCity = txtCityTo.Text;

            SaveSummaryReview(Quote);
            //EmailHelper.SendCompletedQuoteCrownEmail(Quote);

            //if (chkSendCopyTo.Checked)
            //    EmailHelper.SendCompletedQuoteCustomerEmail(Quote);

            Quote.CompletedOn = DateTime.Now;
            Quote.Save();

            ClearSessionQuoteID();

            //Server.Transfer("FinishedWizard.aspx");
            pnlWizard.Visible = false;
            pnlWizardThankyou.Visible = true;
        }
    }

    protected void btnAddRemoveRooms_Click(object sender, ImageClickEventArgs e)
    {
        if(Page.IsValid)
        ChangeTab(TAB_HOME_PROFILE);
    }
    #endregion

    #region Private Methods
    private void LoadTab()
    {
        ShowHideBackNextButtons();

        if (w.ActiveStepIndex == TAB_YOUR_DETAILS)
            LoadYourDetails();

        if (w.ActiveStepIndex == TAB_HOME_PROFILE)
            LoadRoomSelection();


        if (w.ActiveStepIndex == TAB_HOUSEHOLD_INVENTORY)
        {
         
            LoadRoomsSelectedForQuoteTabs();
            if (rpRoomsRepeater.Items.Count > 0)
            {
                LinkButton lb = (LinkButton)rpRoomsRepeater.Items[0].FindControl("btnRoom");
                SelectedQuoteRoomID = int.Parse(lb.CommandArgument);
                LoadHouseHoldInventory(lb);
            }

        }
        else
        {
            rpRoomsRepeater.DataSource = null;
            rpRoomsRepeater.DataBind();
        }

        if (w.ActiveStepIndex == TAB_REVIEW_SEND)
            LoadSummaryReview(Quote);

    }
    private void LoadRoomsSelectedForQuoteTabs()
    {
        rpRoomsRepeater.DataSource = QuotesRooms.GetSelectedRoomsForQuote(QuoteID);
        rpRoomsRepeater.DataBind();
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
        }

        if (w.ActiveStepIndex == TAB_HOUSEHOLD_INVENTORY)
        {
           SaveHouseHoldInventory();
           LoadHouseHoldInventory(SelectedQuoteRoomID);
        }

        if (w.ActiveStepIndex == TAB_REVIEW_SEND)
            SaveSummaryReview(Quote);

        Quote.Save();
    }
	
    private void ShowHideBackNextButtons()
    {
        //Bottom Buttons
        btnBack.Visible = true;
        btnNext.Visible = true;
        btnSendNow.Visible = false;
        //Top Buttons
        //btnBackTop.Visible = true;
        //btnNextTop.Visible = true;
        //btnSendNowTop.Visible = false;

        //btnAddRemoveRooms.Visible = (w.ActiveStepIndex == TAB_HOUSEHOLD_INVENTORY || w.ActiveStepIndex == TAB_REVIEW_SEND);
        //btnPrintThisList.Visible = (w.ActiveStepIndex == TAB_HOME_PROFILE || w.ActiveStepIndex == TAB_HOUSEHOLD_INVENTORY);
        //lnkSkipThis.Visible = (w.ActiveStepIndex != TAB_YOUR_DETAILS);

        if (w.ActiveStepIndex == TAB_YOUR_DETAILS)
        {
            btnBack.Visible = false;
            //btnBackTop.Visible = false;
        }

        if (w.ActiveStepIndex == w.WizardSteps.Count - 1)
        {
            btnNext.Visible = false;
            btnSendNow.Visible = true;
            //btnNextTop.Visible = false;
            //btnSendNowTop.Visible = true;
        }
    }
    private void ResetRoomTabs(int selectedQuoteRoomID)
    {
        foreach (RepeaterItem room in rpRoomsRepeater.Items)
        {
            int quoteRoomID = int.Parse(((LinkButton)room.FindControl("btnRoom")).CommandArgument);
            int quantity = int.Parse(((HiddenField)room.FindControl("hdSelectedItems")).Value);

            HtmlControl li = (HtmlControl)room.FindControl("TabListItem");
            
            if (quoteRoomID == selectedQuoteRoomID)
                li.Attributes.Add("class", "room-selected active");
            else if (quantity > 0)
            {
                if (quoteRoomID % 2 == 0)
                {
                    li.Attributes.Add("class", "room-done even");
                }
                else
                {
                    li.Attributes.Add("class", "room-done odd");
                }
            }
            else            
            {
                if (quoteRoomID % 2 == 0)
                {
                    li.Attributes.Add("class", "room even");
                }
                else
                {
                    li.Attributes.Add("class", "room odd");
                }
            }
                
        }
    }
    #region Load/Save Tab

    private void LoadYourDetails()
    {
        txtFirstName.Text = Quote.FirstName;
        txtSurname.Text = Quote.Surname;
        txtDayPhone.Text = Quote.DayPhone;
        txtEmail.Text = Quote.Email;

        txtStreetFrom.Text = Quote.FromStreet;
        txtSuburbFrom.Text = Quote.FromSuburb;
        txtCityFrom.Text = Quote.FromCity;

        if (!String.IsNullOrEmpty(Quote.FromCountry))
            ListControlHelper.SetText(ddCountryFrom, Quote.FromCountry);

        txtStreetTo.Text = Quote.ToStreet;
        txtSuburbTo.Text = Quote.ToSuburb;
        txtCityTo.Text = Quote.ToCity;

        if (!String.IsNullOrEmpty(Quote.ToCountry))
            ListControlHelper.SetText(ddCountryFromRight, Quote.ToCountry);

        txtDeliveryDate.Text = Quote.DeliveryDate;
        txtMovingOutDate.Text = Quote.PickupDate;

//        ctrlMovingInDate.ValueNullable = Quote.DeliveryDate;
//        ctrlMovingOutDate.ValueNullable = Quote.PickupDate;
//        txtApproximateDateOfMove.Text = String.IsNullOrEmpty(Quote.ApproximateMoveDate) ? DEFAULT_APPROX_DATE : Quote.ApproximateMoveDate; 
    }
    private void SaveYourDetails(Quotes q)
    {
       // Quotes q = (SessionQuoteIDNullable.HasValue) ? Quote : Quotes.Create();
        q.FirstName = txtFirstName.Text;
        q.Surname = txtSurname.Text;
        q.DayPhone = txtDayPhone.Text;
        q.Email = txtEmail.Text;

        q.FromStreet = txtStreetFrom.Text;
        q.FromSuburb = txtSuburbFrom.Text;
        q.FromCity = txtCityFrom.Text;
        q.FromCountry = ddCountryFrom.SelectedItem != null? ddCountryFrom.SelectedItem.Text : string.Empty;

        q.ToStreet = txtStreetTo.Text;
        q.ToSuburb = txtSuburbTo.Text;
        q.ToCity = txtCityTo.Text;
        q.ToCountry = ddCountryFromRight.SelectedItem != null ? ddCountryFromRight.SelectedItem.Text : string.Empty;

        //q.PickupDate = ctrlMovingOutDate.ValueNullable;
        //q.DeliveryDate = ctrlMovingInDate.ValueNullable;
        //q.ApproximateMoveDate = EscapeDefault(txtApproximateDateOfMove.Text);

        q.PickupDate = txtMovingOutDate.Text;
        q.DeliveryDate = txtDeliveryDate.Text;

        q.QuoteType = Quotes.QuoteTypes.Estimate;

        if (!SessionQuoteIDNullable.HasValue)
        {            
            q.Save();
            //if (EmailHelper.SendNewQuotePasswordEmail(q))
            //    q.PasswordEmailSentOn = DateTime.Now;

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
    private void LoadHouseHoldInventory(LinkButton selected)
    {
        litRoom.Text = selected.Text;
        LoadHouseHoldInventory(int.Parse(selected.CommandArgument));

    }
    private void LoadHouseHoldInventory(int quoteRoomID)
    {
        ResetRoomTabs(quoteRoomID);

        rpItemsRepeater.DataSource = QuotesInventory.GetRoomInventoryItems(quoteRoomID);
        rpItemsRepeater.DataBind();

        foreach (RepeaterItem item in rpItemsRepeater.Items)
        SetQuantityDropDown(item, "ddNumberOfItems");

        rpCartons.DataSource = QuotesInventory.GetRoomInventoryCartons(quoteRoomID);
        rpCartons.DataBind();

        foreach (RepeaterItem item in rpCartons.Items)
            SetQuantityDropDown(item, "ddNumberOfItems");
    }
    private void SaveHouseHoldInventory()
    {
        foreach (RepeaterItem item in rpItemsRepeater.Items)
           SaveHouseHoldInventoryItem(item);

        foreach (RepeaterItem item in rpCartons.Items)
           SaveHouseHoldInventoryItem(item);
    }
    private void SaveHouseHoldInventoryItem(RepeaterItem item)
    {
        DropDownList ddNumberOfItems = (DropDownList)item.FindControl("ddNumberOfItems");

        string quoteInventoryID = ((HiddenField)item.FindControl("hdQuoteInventoryID")).Value;
        string quantityStr = ((HiddenField)item.FindControl("hdQuantity")).Value;
        int inventoryId = int.Parse(((HiddenField)item.FindControl("hdInventoryID")).Value);
        int quoteRoomId = int.Parse(((HiddenField)item.FindControl("hdQuotesRoomID")).Value);
        int oldQuantity = GetCurrentQuantityForQuoteRoom(quoteRoomId, inventoryId);
        int newQuantity = int.Parse(ddNumberOfItems.SelectedValue);

        if (newQuantity != oldQuantity)
        {
            if (newQuantity > 0) //new, update
            {
                QuotesInventory quoteInventory;
                if (String.IsNullOrEmpty(quoteInventoryID))
                {
                    quoteInventory = QuotesInventory.Create();

                    quoteInventory.QuoteId = QuoteID;
                    quoteInventory.RoomId = int.Parse(((HiddenField)item.FindControl("hdRoomID")).Value);
                    quoteInventory.InventoryId = inventoryId;
                    quoteInventory.QuotesRoomID = quoteRoomId;
                }
                else
                    quoteInventory = QuotesInventory.Get(int.Parse(quoteInventoryID));


                quoteInventory.Quantity = newQuantity;
                quoteInventory.Save();
            }
            else //delete
            {
                QuotesInventory.Delete(int.Parse(quoteInventoryID));
            }
        }
    }

    private DataTable _quoteInventoryItemForQuoteRoom;
    private DataTable _quoteInventoryCartonForQuoteRoom;
    private int GetCurrentQuantityForQuoteRoom(int quoteRoomId, int inventoryID)
    {
        if (_quoteInventoryItemForQuoteRoom == null)
            _quoteInventoryItemForQuoteRoom = QuotesInventory.GetRoomInventoryItems(quoteRoomId); 

        foreach(DataRow row in _quoteInventoryItemForQuoteRoom.Rows)
        {
            if( ((int)row["InventoryID"]) == inventoryID)
                return (row.IsNull("Quantity"))? 0 : (int) row["Quantity"];
        }

        if (_quoteInventoryCartonForQuoteRoom == null)
            _quoteInventoryCartonForQuoteRoom = QuotesInventory.GetRoomInventoryCartons(quoteRoomId);

        foreach (DataRow row in _quoteInventoryCartonForQuoteRoom.Rows)
        {
            if (((int)row["InventoryID"]) == inventoryID)
                return (row.IsNull("Quantity")) ? 0 : (int)row["Quantity"];
        }

        return 0;
    }



    private void LoadSummaryReview(Quotes q)
    {
        txtConsultantComments.Text = q.Comments;
        if (String.IsNullOrEmpty(chkSendCopyTo.Text))
            lbSendCopyTo.Text = String.Format("Send a copy to '{0}'", Quote.Email);
    }
    private void SaveSummaryReview(Quotes q)
    {
        q.Comments = txtConsultantComments.Text;
        q.CopyToClient = chkSendCopyTo.Checked;
    }
    #endregion
    #endregion

    #region Formating
    public string FormatImageURL(string fileName)
    {
        return "Images/InventoryImages/" + fileName;
    }
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
    protected void rpItemsRepeater_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
        //FormatRepeaterTable(6, rpItemsRepeater.Items.Count, e);
    }
    protected void rpRoomSelectRepeater_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
        FormatRepeaterTable(7, rpRoomSelect.Items.Count, e);
    }

    public string SetStepTabStyle(int tab)
    {
       return SetStepTabStyle(tab, w.ActiveStepIndex);
    }

    protected void btnPrintThisList_Click(object sender, ImageClickEventArgs e)
    {
        Save();
        //ReportHelper.GenerateReportAndSendToBrowser(this, ReportHelper.REPORT_HOUSE_BLANK, QuoteID, null);
    }
}
