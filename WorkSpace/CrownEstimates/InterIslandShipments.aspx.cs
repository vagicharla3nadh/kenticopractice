using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CrownEstimates.BusinessModel;

public partial class InterIslandShipments : CrownEstimatesBasePage
{
    private string FromCity
    {
        get {return (Request["FromCity"])??"".Leftmost(30) ; }
    }
    private string ToCity
    {
        get {return (Request["ToCity"])??"".Leftmost(30); }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        _relocationSelectedLabel.Text = FromCity + "  to  " + ToCity;

        DataView dv = new DataView(LongHaulShipment.ListShipments(FromCity.ToLower(), ToCity.ToLower()));
        if (dv.Count <= 0)
        {
            _gridViewPanel.Visible = false;
            _noResultsPanel.Visible = true;
        }
        else
        {
            _gridViewPanel.Visible = true;
            _noResultsPanel.Visible = false;
        }

        __shipmentList.DataSource = dv;
        __shipmentList.DataBind();
    }
}

public static class OurExtensionMethods
{
    public static string Leftmost(this string text, int length)
    {
        if (text.Length > length) return text.Substring(0, length);
        return text;
    }
}
