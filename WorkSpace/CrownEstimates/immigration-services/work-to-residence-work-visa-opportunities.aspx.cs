using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class immigration_services_work_to_residence_work_visa_opportunities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["pagetitle"] = "work to residence work visa";
        Session["s.evar13"] = Session["pagetitle"] as string;
        Session["pagesection"] = "relonz:house moving:moving services";
        Session["pagesubsection"] = Session["pagesection"] as string + ":" + Session["pagetitle"] as string;
        Session["s.hier1"] = "relonz|house moving|moving services";
    }
}