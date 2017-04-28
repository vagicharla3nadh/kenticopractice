using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using CrownEstimates.BusinessModel;
using System.Web.UI.WebControls;
using System.Data;
using FAC.Web.UI;

/// <summary>
/// Summary description for CrownEstimatesWizardsBasePage
/// </summary>
public class CrownEstimatesWizardsBasePage : CrownEstimatesBasePage
{

    #region Constants
    protected const int TAB_YOUR_DETAILS = 0;
    protected const int TAB_HOME_PROFILE = 1;
    protected const int TAB_HOUSEHOLD_INVENTORY = 2;
    protected const int TAB_REVIEW_SEND = 3;

    protected const string DEFAULT_APPROX_DATE = "Approximate Date";

    #endregion

    #region Private Properties/Fields
    protected int QuoteID
    {
        get { return SessionQuoteID; }
    }

    private Quotes _quote;
    protected Quotes Quote
    {
        get
        {
            if (_quote == null)
                _quote = Quotes.Get(QuoteID);

            return _quote;
        }
    }

    protected void CreateQuote()
    {
        _quote = Quotes.Create();
    }

    #endregion




    //protected void btnPrintThisList_Click(object sender, ImageClickEventArgs e)
    //{
    //    Save();
    //    ReportHelper.GenerateReportAndSendToBrowser(this, ReportHelper.REPORT_HOUSE_BLANK, QuoteID, null);
    //}

    //protected void Save()  { }


    public string FormatRoomName(string roomName, int roomNumber)
    {
        if (roomNumber < 2)
            return roomName;
        else
            return String.Format("{0} {1}", roomName, roomNumber);
    }

    protected void SetQuantityDropDown(RepeaterItem item, string dropDownId)
    {
        DropDownList dd = (DropDownList)item.FindControl(dropDownId);
        string quantity = ((HiddenField)item.FindControl("hdQuantity")).Value;

        if (!String.IsNullOrEmpty(quantity))
            ListControlHelper.SetValue(dd, quantity);
    }

    protected void SaveRoom(RepeaterItem room)
    {
        HiddenField hdRoomProfileID = (HiddenField)room.FindControl("hdRoomProfileID");
        HiddenField hdRoomID = (HiddenField)room.FindControl("hdRoomID");
        DropDownList dd = (DropDownList)room.FindControl("ddNumberOfRooms");

        int roomProfileID = (String.IsNullOrEmpty(hdRoomProfileID.Value)) ? 0 : int.Parse(hdRoomProfileID.Value);
        int roomId = int.Parse(hdRoomID.Value);

        int oldQuantity = GetCurrentQuantity(roomId);
        int newQuantity = int.Parse(dd.SelectedValue);

        if (newQuantity != oldQuantity)
        {
            if (newQuantity == 0)//delete
            {
                RoomProfile.Delete(roomProfileID);
            }
            else //insert/update
            {
                RoomProfile rp;
                if (roomProfileID == 0)
                {
                    rp = RoomProfile.Create();
                    rp.RoomId = roomId;
                    rp.QuoteId = QuoteID;
                    for (int i = 1; i <= newQuantity; i++)
                        CreateQuotesRoom(roomId, i);
                }
                else
                {
                    rp = RoomProfile.Get(roomProfileID);
                    List<QuotesRooms> quoteRooms = QuotesRooms.GetQuotesRoomsList(QuoteID, roomId);

                    if (newQuantity > quoteRooms.Count)
                    {
                        for (int i = quoteRooms.Count + 1; i <= newQuantity; i++)
                            CreateQuotesRoom(roomId, i);
                    }

                    if (newQuantity < quoteRooms.Count)
                    {
                        foreach (QuotesRooms qr in quoteRooms)
                        {
                            if (qr.RoomNo > newQuantity)
                                qr.Delete();
                        }
                    }
                }

                rp.Quantity = newQuantity;
                rp.Save();
            }
        }
    }

    protected void SaveRoomNew(DataTable rooms)
    {
        foreach (DataRow row in rooms.Rows)
        {
            
            int roomId = Convert.ToInt32(row["RoomId"]);
            int roomProfileID = GetRoomProfileID(roomId);
            int oldQuantity = GetCurrentQuantity(roomId);
            
            int newQuantity = Convert.ToInt32(row["RoomNo"]);

            if (newQuantity != oldQuantity)
            {
                if (newQuantity == 0)//delete
                {
                    RoomProfile.Delete(roomProfileID);
                }
                else //insert/update
                {
                    RoomProfile rp;
                    if (roomProfileID == 0)
                    {
                        rp = RoomProfile.Create();
                        rp.RoomId = roomId;
                        rp.QuoteId = QuoteID;
                        for (int i = 1; i <= newQuantity; i++)
                            CreateQuotesRoom(roomId, i);
                    }
                    else
                    {
                        rp = RoomProfile.Get(roomProfileID);
                        List<QuotesRooms> quoteRooms = QuotesRooms.GetQuotesRoomsList(QuoteID, roomId);

                        if (newQuantity > quoteRooms.Count)
                        {
                            for (int i = quoteRooms.Count + 1; i <= newQuantity; i++)
                                CreateQuotesRoom(roomId, i);
                        }

                        if (newQuantity < quoteRooms.Count)
                        {
                            foreach (QuotesRooms qr in quoteRooms)
                            {
                                if (qr.RoomNo > newQuantity)
                                    qr.Delete();
                            }
                        }
                    }

                    rp.Quantity = newQuantity;
                    rp.Save();
                }
            }
        }
    }

    private DataTable _rooms;
    private int GetCurrentQuantity(int roomId)
    {
        if (_rooms == null)
            _rooms = RoomProfile.GetAllRooms(QuoteID);

        foreach (DataRow row in _rooms.Rows)
        {
            int id = (int)row["RoomID"];
            if (id == roomId)
                return (int)row["Quantity"];
        }

        return 0;
    }

    private int GetRoomProfileID(int roomId)
    {
        if (_rooms == null)
            _rooms = RoomProfile.GetAllRooms(QuoteID);

        foreach (DataRow row in _rooms.Rows)
        {
            int id = (int)row["RoomID"];
            if (id == roomId && row["RoomProfileID"] != null && !String.IsNullOrWhiteSpace(row["RoomProfileID"].ToString()))
                return (int)row["RoomProfileID"];
        }

        return 0;
    }

    private void CreateQuotesRoom(int roomId, int roomNo)
    {
        QuotesRooms qr = QuotesRooms.Create();

        qr.QuoteId = QuoteID;
        qr.RoomId = roomId;
        qr.IsComplete = false;
        qr.RoomNo = roomNo;

        qr.Save();
    }

    protected string SetStepTabStyle(int tab, int activeTab)
    {
        //ugly due to web designer requiring the id of the selected tab to be 'selected' inorder for style to work properly

        if (tab < activeTab)
            return "class='done'";
        else if (tab == activeTab)
            return "id='selected'";
        else
            return string.Empty;
    }

    protected void FormatRepeaterTable(int width, int count, RepeaterItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            if (count % width == 0)
                ((Literal)e.Item.FindControl("litRowStart")).Text = "<tr>";
            if (count % width == (width - 1))
                ((Literal)e.Item.FindControl("litRowEnd")).Text = "</tr>";
        }
    }

    protected bool IsAtLeastOneRoomSelected(RepeaterItemCollection items)
    {
        foreach (RepeaterItem item in items)
        {
            DropDownList ddNumberOfRooms = (DropDownList)item.FindControl("ddNumberOfRooms");
            int rooms = int.Parse(ddNumberOfRooms.SelectedValue);

            if (rooms > 0)
                return true;
        }

        return false;
    }


    protected bool ValidatePhone(string phone)
    {
        if (String.IsNullOrEmpty(phone))
            return true;

        if (phone[0] != '0')
            return false;

        foreach (char c in phone.ToCharArray())
        {
            if (c != ' ' && !Char.IsDigit(c))
                return false;
        }

        return true;
    }


    protected string EscapeDefault(string val)
    {
        if (String.IsNullOrEmpty(val))
            return null;

        if (val.Trim().Equals(DEFAULT_APPROX_DATE))
            return null;

        return val;
    }
}