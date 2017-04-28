using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.BusinessModel;

public partial class get_a_quote : CrownEstimatesBasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            rev1.ValidationExpression = EmailRegXValidation;

            if (!String.IsNullOrEmpty(Request["Relogin"]))
                litMessage.Text = FormatValidationMessage("Please login again");
        }
    }

    protected void btnResumeOnlineEstimate_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            int? quoteID = Quotes.GetQuoteIDFromEmailPassword(txtResumeEmail.Text, txtPassword.Text);

            if (quoteID.HasValue)
            {
                Quotes.FlagInactiveQuotesAsCompleted();

                SessionQuoteID = quoteID.Value;
                Response.Redirect("OnlineEstimateWizard.aspx");
            }
            else
            {
                litMessage.Text = FormatValidationMessage("Password is invalid, or perhaps your Online Estimate is Completed or Purged from the system.");
                txtPassword.Text = string.Empty;
            }
        }
    }
}