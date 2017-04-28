using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class shipment_of_household_goods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["pagetitle"] = "shipment of household goods";
        Session["s.evar13"] = Session["pagetitle"] as string;
        Session["pagesection"] = "relonz:house moving:moving to new zealand";
        Session["pagesubsection"] = Session["pagesection"] as string + ":" + Session["pagetitle"] as string;
        Session["s.hier1"] = "relonz|house moving|moving to new zealand";
    }
}