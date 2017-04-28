using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for CrownEstimatesBasePage
/// </summary>
public class CrownEstimatesBasePage : System.Web.UI.Page
{
    public const string EmailRegXValidation = "\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";

    #region Session Variables
    public int SessionQuoteID
    {
        get
        {
            int? sessionQuoteId = (int?)Session["QuoteID"];

            if (!sessionQuoteId.HasValue)
                Response.Redirect("get-a-quote.aspx?Relogin=1"); //user has potentially completed wizard and then hit back button

            return sessionQuoteId.Value;
        }
        set { Session["QuoteID"] = value; }
    }
    public int? SessionQuoteIDNullable
    {
        get { return (int?)Session["QuoteID"]; }
        set { Session["QuoteID"] = value; }
    }
    public void ClearSessionQuoteID()
    {
        Session["QuoteID"] = null;
    }

    #endregion

    public string FormatValidationMessage(string message)
    {
        return string.Format("<ul><li>{0}</li></ul>", message);
    }

    private static string _dealsContactUsMailToEmailAddress;
    private static string _dealsContactUsMailToCC;
    public string CreateMailToHyperlink(string dealRef)
    {
        if (_dealsContactUsMailToEmailAddress == null)
            _dealsContactUsMailToEmailAddress = WebConfigurationManager.AppSettings["DealsContactUsMailToEmailAddress"];

        if (_dealsContactUsMailToCC == null)
            _dealsContactUsMailToCC = WebConfigurationManager.AppSettings["DealsContactUsMailToCC"];

        return String.Format("<a href=\"mailto:{0}?subject={1} &cc={2}\" class=\"enquire\">Contact Us</a>", _dealsContactUsMailToEmailAddress, dealRef, _dealsContactUsMailToCC);
    }

    protected string FormatDate(DateTime? date)
    {
        return date.HasValue ? date.Value.ToString("d MMM yyyy") : string.Empty;
    }

    public string MakeReportLink(string ReportCode, int QuoteID, int? RoomID, string linkText)
    {
        string onclick = @"
onClick=""
var s=s_gi(s_account); 
s.linkTrackVars='eVar12,events'; 
s.linkTrackEvents='event8'; 
s.eVar12='" + linkText + @"'; 
s.events='event8'; 
s.tl(this,'o','Document Download'); "" 

";

        return String.Format("<a href=\"{0}\" {2} class=\"whitelink\">{1}</a>", GetReportNavigateUrl(ReportCode, QuoteID, RoomID), linkText, onclick);
    }
    public string GetReportNavigateUrl(string ReportCode, int QuoteID, int? RoomID)
    {
        return String.Format("Report.aspx?ReportCode={0}&QuoteID={1}&RoomID={2}", ReportCode, QuoteID, RoomID);
    }
}