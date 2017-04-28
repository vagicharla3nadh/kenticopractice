using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.BusinessModel;

public partial class special_deals : CrownEstimatesBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        gvDealsNorth.DataSource = Deals.SelectDeals(Deals.DEPARTING_FROM_NORTH, false);
        gvDealsNorth.DataBind();

        gvDealsSouth.DataSource = Deals.SelectDeals(Deals.DEPARTING_FROM_SOUTH, false);
        gvDealsSouth.DataBind();

        gvDealsNational.DataSource = Deals.SelectDeals(null, true);
        gvDealsNational.DataBind();
    }
}