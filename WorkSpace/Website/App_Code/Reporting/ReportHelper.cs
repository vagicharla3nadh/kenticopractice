using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using FAC.ReportViewer.Comms;
using FAC.ReportViewer;
using FAC.ReportViewer.Web;

namespace CrownEstimates.Reporting
{
    public class ReportHelper
    {
        #region Public Constants

        public const string REPORT_HOUSE_FULL = "HouseFull";
        public const string REPORT_HOUSE_BLANK = "HouseBlank";
        public const string REPORT_ROOM_BLANK = "RoomBlank";
        public const string REPORT_ROOM_NONBLANK = "RoomFull";
        public const string REPORT_CROWN = "Crown";
        #endregion

        public static MemoryStream GenerateReport(string ReportCode, int? QuoteID, int? RoomID)
        {
            QueryStringEncoder qse = CreateQuerryStringEncoder(ReportCode, QuoteID, RoomID);

            using (var report = new Microsoft.Reporting.WebForms.LocalReport())
            {
                RenderResults rr = ReportProcessor.CreateReport(new FAC.ReportViewer.Web.LocalReport(report), qse);

                return new MemoryStream(rr.Data);
            }
        }

        public static MemoryStream GenerateReportNew(string ReportCode, int? QuoteID, int? RoomID, string ServiceSelected, string OtherServiceSelected, string ToCity)
        {
            QueryStringEncoder qse = CreateQuerryStringEncoderNew(ReportCode, QuoteID, RoomID, ServiceSelected, OtherServiceSelected, ToCity);

            using (var report = new Microsoft.Reporting.WebForms.LocalReport())
            {
                RenderResults rr = ReportProcessor.CreateReport(new FAC.ReportViewer.Web.LocalReport(report), qse);

                return new MemoryStream(rr.Data);
            }
        }

        public static void GenerateReportAndSendToBrowser(Page page, string ReportCode, int? QuoteID, int? RoomID)
        {
            QueryStringEncoder qse = CreateQuerryStringEncoder(ReportCode, QuoteID, RoomID);
            (new ReportViewerManager(page)).ProcessReport(qse);
        }

        public static DataTable CreateReportMetaDataDataTable()
        {
            DataTable table = new DataTable("Report");
            table.Columns.Add(new DataColumn("ReportCode", typeof(string)));
            table.Columns.Add(new DataColumn("CompanyID", typeof(short)));
            table.Columns.Add(new DataColumn("ReportName", typeof(string)));
            table.Columns.Add(new DataColumn("DataSource", typeof(string)));
            table.Columns.Add(new DataColumn("FileName", typeof(string)));
            table.Columns.Add(new DataColumn("Parameters", typeof(string)));
            table.Columns.Add(new DataColumn("Security", typeof(string)));
            table.Columns.Add(new DataColumn("UpdatedOn", typeof(DateTime)));
            table.Columns.Add(new DataColumn("UpdatedBy", typeof(string)));

            string houseFullQuerry = @"
            SELECT cast(qr.RoomID as varchar(3)) + '-' +cast(qr.RoomNo as varchar(3)) as RoomGroup,
                r.RoomName  + ' ' + CASE WHEN qr.RoomNo <= 1 then '' ELSE cast(qr.RoomNo as varchar(3)) END as RoomNameNumber, *
            FROM QuotesInventory qi			-- HouseFull or Crown
            INNER JOIN QuotesRooms qr ON qi.QuotesRoomID = qr.QuoteRoomID
            INNER JOIN Inventory i ON i.InventoryID = qi.InventoryID
            INNER JOIN Rooms r ON qi.RoomID = r.RoomID
			INNER JOIN Quotes q on q.QuoteID = qr.QuoteID
			INNER join RoomsInventory ri on qi.InventoryID = ri.InventoryID and qi.RoomID = ri.RoomID
            WHERE qr.QuoteID = @QuoteID
            ORDER BY r.ordinal, qr.RoomNo, ri.ordinal";
            string houseBlankQuerry = @"
            SELECT cast(qr.RoomID as varchar(3)) + '-' +cast(qr.RoomNo as varchar(3)) as RoomGroup,
                r.RoomName  + ' ' + CASE WHEN qr.RoomNo <= 1 then '' ELSE cast(qr.RoomNo as varchar(3)) END as RoomNameNumber, *
            FROM RoomsInventory ri  -- HouseBlank
            INNER JOIN QuotesRooms qr ON ri.RoomID = qr.RoomID
            INNER JOIN Inventory i ON i.InventoryID = ri.InventoryID
            INNER JOIN Rooms r ON ri.RoomID = r.RoomID
			RIGHT JOIN Quotes q on q.QuoteID = qr.QuoteID
            WHERE qr.QuoteID = @QuoteID
            ORDER BY r.ordinal, qr.RoomNo, ri.ordinal";
            string roomBlankQuerry = @"
             SELECT cast(qr.RoomID as varchar(3)) + '-' +cast(qr.RoomNo as varchar(3)) as RoomGroup,
                r.RoomName  + ' ' + CASE WHEN qr.RoomNo <= 1 then '' ELSE cast(qr.RoomNo as varchar(3)) END as RoomNameNumber, *
            FROM Rooms r 		  -- RoomBlank
            INNER JOIN QuotesRooms qr ON r.RoomID = qr.RoomID
			RIGHT JOIN Quotes q on q.QuoteID = qr.QuoteID
            WHERE qr.QuoteID = @QuoteID
            ORDER BY r.ordinal, qr.RoomNo";
            string roomNonBlankQuerry = @"
	        SELECT * FROM Quotes q          -- RoomFull
	        INNER JOIN QuotesRooms qr on qr.QuoteID = q.QuoteID
	        INNER JOIN Rooms r on qr.RoomID = r.RoomID
	        INNER JOIN RoomsInventory ri on ri.RoomID = r.RoomID
	        INNER JOIN Inventory i on ri.InventoryID = i.InventoryID
	        WHERE q.QuoteID = @QuoteID and r.RoomID = @RoomID
            ORDER BY r.ordinal, ri.ordinal";
            string crownQuerry = houseFullQuerry;



            AddRowToReportDataTable(table, REPORT_HOUSE_FULL, houseFullQuerry);
            AddRowToReportDataTable(table, REPORT_HOUSE_BLANK, houseBlankQuerry);
            AddRowToReportDataTable(table, REPORT_ROOM_BLANK, roomBlankQuerry);
            AddRowToReportDataTable(table, REPORT_ROOM_NONBLANK, roomNonBlankQuerry);
            AddRowToReportDataTable(table, REPORT_CROWN, crownQuerry);

            return table;
        }

        private static void AddRowToReportDataTable(DataTable reportDataTable, string reportCode, string reportQuerry)
        {
            DataRow row = reportDataTable.NewRow();
            row.ItemArray = new object[] { reportCode, 0, "Inventory Report", reportQuerry, "HouseInventory.rdlc", "<Parameters></Parameters>", "SYSADM", DateTime.Now, "Estimates" };
            reportDataTable.Rows.Add(row);
        }

        private static QueryStringEncoder CreateQuerryStringEncoder(string ReportCode, int? QuoteID, int? RoomID)
        {
            QueryStringEncoder qse = new QueryStringEncoder(true, ReportCode);
            qse.ReportExportFormat = ReportExportFormat.Pdf;

            qse.AddParameter("@ReportCode", ReportCode);
            qse.AddParameter("@QuoteID", QuoteID);
            qse.AddParameter("@RoomID", RoomID);

            qse.GetQueryString();//TODO is this line required? -gareth

            return qse;
        }

        private static QueryStringEncoder CreateQuerryStringEncoderNew(string ReportCode, int? QuoteID, int? RoomID, string ServiceSelected, string OtherServiceSelected, string ToCity)
        {

            QueryStringEncoder qse = new QueryStringEncoder(true, ReportCode);
            qse.ReportExportFormat = ReportExportFormat.Pdf;

            qse.AddParameter("@ReportCode", ReportCode);
            qse.AddParameter("@QuoteID", QuoteID);
            qse.AddParameter("@RoomID", RoomID);
            if (ServiceSelected != "")
                qse.AddParameter("@ServiceSelectedVisible", "True");
            else
                qse.AddParameter("@ServiceSelectedVisible", "False");
            if (OtherServiceSelected != "")
                qse.AddParameter("@OtherServiceVisible", "True");
            else
                qse.AddParameter("@OtherServiceVisible", "False");
            var SelService = ServiceSelected.TrimEnd(',').Split(',');
            var OthServ = OtherServiceSelected.TrimEnd(',').Split(',');
            string htmlServ = "", htmlOtherServ = "";

            htmlServ = "<ul>";
            htmlOtherServ = "<ul>";
            for (int i = 0; i < SelService.Length; i++)
            {
                htmlServ += "<li>" + SelService[i] + "&nbsp;</li>";
            }
            for (int i = 0; i < OthServ.Length; i++)
            {
                htmlOtherServ += "<li>" + OthServ[i] + "&nbsp;</li>";
            }
            htmlServ += "</ul>";
            htmlOtherServ += "</ul>";
            qse.AddParameter("@ServiceSelected", htmlServ);
            qse.AddParameter("@OtherServiceSelected", htmlOtherServ);
            qse.AddParameter("@ToCity", ToCity);




            qse.GetQueryString();//TODO is this line required? -gareth

            return qse;
        }
    }
}