using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.BusinessModel;
using System.Text.RegularExpressions;
using System.Data;

public partial class admin_EmailsAdmin : System.Web.UI.Page
{
    #region Properties
    private const int COMMENT_PREVIEW_LENGTH = 42;
    private DateTime DefaultFromDate { get { return DateTime.Today.AddDays(-7); } }
    private DateTime DefaultToDate { get { return DateTime.Today; } }

    private DataTable SearchResults
    {
        get { return (Session["EmailsAdmin_SearchResults"] as DataTable) ?? GetData(); }
        set { Session["EmailsAdmin_SearchResults"] = value; }
    }
    private string SortExpression
    {
        get { return (Session["EmailsAdmin_SortExpression"] as string); }
        set { Session["EmailsAdmin_SortExpression"] = value; }
    }
    #endregion

    #region Events

    protected override void OnInit(EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            calFrom.Value = DefaultFromDate;
            calTo.Value = DefaultToDate;
        }

        BindGrid();

        base.OnInit(e);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected override void OnPreRender(EventArgs e)
    {
        BindGrid();

        base.OnPreRender(e);
    }

    protected void gv_Sorting(object sender, GridViewSortEventArgs e)
    {
        if (!String.IsNullOrEmpty(SortExpression) && SortExpression.StartsWith(e.SortExpression))
        {
            if (SortExpression.EndsWith("ASC"))
                e.SortDirection = SortDirection.Descending;
            else if (SortExpression.EndsWith("DESC"))
                e.SortDirection = SortDirection.Ascending;
        }

        SortExpression = String.Format("{0} {1}", e.SortExpression, (e.SortDirection == SortDirection.Ascending) ? "ASC" : "DESC");
    }
    protected void gv_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gv.PageIndex = e.NewPageIndex;
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        SearchResults = GetData();
    }
    protected void btnResend_Click(object sender, EventArgs e)
    {
        int quoteId = int.Parse(((LinkButton)sender).CommandArgument);

        EmailHelper.SendCompletedQuoteCrownEmail(Quotes.Get(quoteId),"Crown Relocations - Full Quote Request");

        litEmailSent.Text = "<div style=\"color:Red;\">Email Resent</div><br/>";
    }
    #endregion

    #region Methods
    private void BindGrid()
    {
        DataView dv = new DataView(SearchResults);
        dv.Sort = SortExpression ?? "CreatedOn DESC";
        gv.DataSource = dv;
        gv.DataBind();
    }

    private DataTable GetData()
    {
        int? quoteId = null;
        int test;
        if (int.TryParse(txtQuoteNo.Text, out test))
            quoteId = test;

        return Quotes.ListQuotesForSearch(calFrom.Value, calTo.Value, quoteId);
    }



    public string FormatEmail(string email)
    {
        return Regex.Replace(email, "@", "<br/>@");
    }
    public string FormatComment(string comment)
    {
        if (String.IsNullOrEmpty(comment))
            return String.Empty;

        int previewLength = (comment.Length >= COMMENT_PREVIEW_LENGTH) ? COMMENT_PREVIEW_LENGTH : comment.Length;

        return String.Format("<span title=\"{0}\">{1}...</span>", Server.HtmlEncode(comment), comment.Substring(0, previewLength));
    }
    #endregion

}