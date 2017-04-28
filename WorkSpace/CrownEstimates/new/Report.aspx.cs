using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using FAC.ReportViewer.Comms;
using FAC.ReportViewer.Web;
using CrownEstimates.Reporting;

public partial class Report : CrownEstimatesBasePage
{
    #region Querry String Properties
    private int? QuoteID
    {
        get
        {
            if (String.IsNullOrEmpty(Request["QuoteID"]))
                return null;
            else
                return int.Parse(Request["QuoteID"]);
        }
    }

    private int? RoomID
    {
        get
        {
            if (String.IsNullOrEmpty(Request["RoomID"]))
                return null;
            else
                return int.Parse(Request["RoomID"]);
        }
    }

    private string ReportCode
    {
        get
        {
            if (String.IsNullOrEmpty(Request["ReportCode"]))
                return null;
            else
                return Request["ReportCode"];
        }
    }
    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
//            ReportHelper.GenerateReportAndSendToBrowser(this, ReportCode, QuoteID, RoomID);
        }
    }
}
