using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class licensed_immigration_services : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["pagetitle"] = "licensed immigration services";
        Session["s.evar13"] = Session["pagetitle"] as string;
        Session["pagesection"] = "relonz:house moving:moving to new zealand";
        Session["pagesubsection"] = Session["pagesection"] as string + ":" + Session["pagetitle"] as string;
        Session["s.hier1"] = "relonz|house moving|moving to new zealand";
    }
}