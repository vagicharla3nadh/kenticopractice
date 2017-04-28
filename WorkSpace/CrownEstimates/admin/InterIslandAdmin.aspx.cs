using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.BusinessModel;
using FAC.Web.UI;
using FAC.Web.IO;
using CrownEstimates.FileImports;

public partial class admin_InterIslandAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDeals();
        }
        else
        {
            DateTime? dep = ctrlCutoffDate.Value;
            DateTime? arr = ctrlArrivalDate.Value;
            if (dep.HasValue && arr.HasValue && dep.Value != DateTime.MinValue && arr.Value != DateTime.MinValue)
                txtTransitTime.Text = ((TimeSpan)(arr.Value.Subtract(dep.Value))).Days.ToString();
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        int shipmentID = int.Parse(((LinkButton)sender).CommandArgument);

        LongHaulShipment d = LongHaulShipment.Get(shipmentID);
        LoadDealFields(d);
        btnCreateUpdate.Text = "Update Shipment";
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int dealID = int.Parse(((LinkButton)sender).CommandArgument);
        LongHaulShipment.Delete(dealID);
        LoadDeals();
    }

    private void LoadDeals()
    {
        gvDeals.DataSource = LongHaulShipment.ListAllShipments();
        gvDeals.DataBind();
    }


    protected void btnCreateUpdate_Click(object sender, EventArgs e)
    {
        if (String.IsNullOrEmpty(hdShipmentID.Value))
        {
            LongHaulShipment d = LongHaulShipment.Create();
            SetDealFields(d);
            d.Save();


            lbMessage.Text = "Shipment Created";
        }
        else
        {
            LongHaulShipment d = LongHaulShipment.Get(int.Parse(hdShipmentID.Value));
            SetDealFields(d);
            d.Save();

            lbMessage.Text = "Shipment Updated";
        }

        ClearForm();
        LoadDeals();
    }

    private void SetDealFields(LongHaulShipment d)
    {
        if (string.IsNullOrEmpty(ddFrom.SelectedValue))
            d.FromCity = txtDepartingFrom.Text;
        else
            d.FromCity = ddFrom.SelectedValue;

        d.ShipmentRef = txtDealRef.Text;
        if (d.ShipmentRef == null) d.ShipmentRef = " ";
        d.CutoffDate = ctrlCutoffDate.Value.Value;
        d.ArrivalDate = ctrlArrivalDate.Value.Value;

        if (string.IsNullOrEmpty(ddDestination.SelectedValue))
            d.ToCity = txtDestinationPort.Text;
        else
            d.ToCity = ddDestination.SelectedValue;

        int m; int.TryParse(txtTransitTime.Text, out m);
        d.TransitTime = m;
    }
    private void LoadDealFields(LongHaulShipment d)
    {
        hdShipmentID.Value = d.ShipmentID.ToString();
        ListControlHelper.SetValue(ddFrom, d.FromCity);
        txtDepartingFrom.Text = d.FromCity;
        txtDealRef.Text = d.ShipmentRef;
        ctrlCutoffDate.Value = d.CutoffDate;
        ctrlArrivalDate.Value = d.ArrivalDate;
        txtDestinationPort.Text = d.ToCity;
        ListControlHelper.SetValue(ddDestination, d.ToCity);
        txtTransitTime.Text = d.TransitTime.ToString();
    }

    private void ClearForm()
    {
        btnCreateUpdate.Text = "Create Shipment";
        hdShipmentID.Value = null;
        ctrlCutoffDate.Value = null;
        ctrlArrivalDate.Value = null;
        txtTransitTime.Text = null;

        foreach (TextBox txt in new TextBox[] { txtDealRef, txtDepartingFrom, txtDestinationPort })
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

        FileImporter fileImporter = new LongHaulShipmentFileImporter();

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

        lbImportMessage.Text = recordCount.ToString() + " Inter-island Shipments imported";

        LoadDeals();
    }
}