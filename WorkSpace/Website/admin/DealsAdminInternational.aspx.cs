using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.BusinessModel;
using FAC.Web.UI;
using CrownEstimates.FileImports;
using FAC.Web.IO;

public partial class admin_DealsAdminInternational : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDepartingFrom();
            LoadDeals();
        }
    }

    private void LoadDepartingFrom()
    {
        ddDepartingFrom.Items.Clear();
        ddDepartingFrom.Items.Add(new ListItem(Deals.DEPARTING_FROM_NORTH));
        ddDepartingFrom.Items.Add(new ListItem(Deals.DEPARTING_FROM_SOUTH));
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int dealID = int.Parse(((LinkButton)sender).CommandArgument);

        Deals d = Deals.Get(dealID);
        LoadDealFields(d);
        btnCreateUpdate.Text = "Update Shipment";
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int dealID = int.Parse(((LinkButton)sender).CommandArgument);
        Deals.Delete(dealID);
        LoadDeals();
    }

    private void LoadDeals()
    {
        gvDeals.DataSource = Deals.SelectDeals(null, false);
        gvDeals.DataBind();
    }


    protected void btnCreateUpdate_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(hdDealID.Value))
        {
            Deals d = Deals.Create();
            SetDealFields(d);
            d.Save();


            lbMessage.Text = "Shipment Created";
        }
        else
        {
            Deals d = Deals.Get(int.Parse(hdDealID.Value));
            SetDealFields(d);
            d.Save();

            lbMessage.Text = "Shipment Updated";
        }

        ClearForm();
        LoadDeals();
    }

    private void SetDealFields(Deals d)
    {
        d.DepartingFrom = ddDepartingFrom.SelectedValue;
        d.DealRef = txtDealRef.Text;
        d.DateClosing = ctrlDateClosing.Value;
        d.DestinationRegion = txtDestinationRegion.Text;
        d.DestinationPort = txtDestinationPort.Text;
        d.IsDealNational = false;
    }
    private void LoadDealFields(Deals d)
    {
        hdDealID.Value = d.DealId.ToString();
        ListControlHelper.SetValue(ddDepartingFrom, d.DepartingFrom);
        txtDealRef.Text = d.DealRef;
        ctrlDateClosing.Value = d.DateClosing;
        txtDestinationRegion.Text = d.DestinationRegion;
        txtDestinationPort.Text = d.DestinationPort;
    }

    private void ClearForm()
    {
        btnCreateUpdate.Text = "Create Shipment";
        hdDealID.Value = null;
        ddDepartingFrom.SelectedIndex = 0;
        ctrlDateClosing.Value = null;

        foreach (TextBox txt in new TextBox[] { txtDealRef, txtDestinationRegion, txtDestinationPort })
            txt.Text = string.Empty;
    }

    protected void btnImport_Click(object sender, EventArgs e)
    {
        byte[] csvData = fu.FileBytes;
        if (csvData.Length == 0)
        {
            lbImportMessage.Text = "You must select a csv file to import.";
            return;
        }

        FileImporter fileImporter = new  DealFileImporter();

        int recordCount;
        try
        {
            recordCount = fileImporter.ValidateData(csvData);
        }
        catch (Exception ex)
        {
            if (ex is FileImporter.InvalidDataException || ex is CsvParseException)
            {
                lbImportMessage.Text = ex.Message;
                return;
            }
            throw;
        }

        int fileImportId = fileImporter.StartImport(csvData, false);

        lbImportMessage.Text = recordCount.ToString() + " Deals imported";

        LoadDeals();
    }
}