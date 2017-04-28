using System;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Net.Mail;
using System.Net.Configuration;
using System.Web.Configuration;
using System.Text;
using FAC.ReportViewer;
using System.IO;
using CrownEstimates.Reporting;
using CrownEstimates.BusinessModel;

using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using System.Text;

using System.Collections.Generic;
using System.Linq;

using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for LeadIntegration
/// </summary>
public class LeadIntegration
{
    private static string FromEmailAddress
    {
        get { return WebConfigurationManager.AppSettings.Get("FromEmailAddress"); }
    }

    public static string CrownEmailAddress
    {
        get { return WebConfigurationManager.AppSettings.Get("CrownEmailAddress"); }
    }

    public static void SendLeadToCrownGlobalSite(Quotes quote, string SubjectLine)
    {
        #region Initializing Variables
        MailMessage email = new MailMessage();
        StringBuilder sb = new StringBuilder();
        
        //string strURL = "http://wagd1.crownrelo.com/CrownGateway/create/webLead";//Staging Environment
        string strURL = "http://wag01.crownrelo.com/CrownGateway/create/webLead";//Live Environment

        string GetRoomData = null;
        string GetInventoryData = null;
        string ServiceDate = "";
        string DeliveryDate = "";
        string valuableInformationServiceDate = "";
        string valuableInformationDeliveryDate = "";
        string TotalInventory = "";

        try 
        { 
            ServiceDate = DateTime.Parse(quote.PickupDate).ToString("yyyy-MM-dd HH:mm:ss.fff");
        }
        catch
        {
            valuableInformationServiceDate = string.Format(", Service Date: {0}", quote.PickupDate);
        }

        try 
        { 
            DeliveryDate = DateTime.Parse(quote.DeliveryDate).ToString("yyyy-MM-dd HH:mm:ss.fff");
        }
        catch
        {
            valuableInformationDeliveryDate = string.Format(", Delivery Date: {0}", quote.DeliveryDate);
        }
        
        // string valuableInformation = string.Format("Comments: {0}, FromStreet: {1}, ToStreet: {2}, FromSuburb: {3}, ToSuburb: {4} {5} {6}", quote.Comments , quote.FromStreet, quote.ToStreet, quote.FromSuburb, quote.ToSuburb, valuableInformationServiceDate, valuableInformationDeliveryDate);
		
		string valuableInformation = string.Format("Comments: {0}, FromStreet: {1}, ToStreet: {2}, FromSuburb: {3}", quote.Comments, quote.FromStreet, quote.ToStreet, quote.FromSuburb);

        string date = quote.PickupDate;
        if (!String.IsNullOrEmpty(date)) date = "(" + date + ")";

        email.Subject = String.Format(SubjectLine + " {0} (#{1})", date, quote.QuoteId);

        #endregion
        try
        {
                #region Get Room & Inventory Data

                #region Get Room Details for Both type of Quotes

                if (!string.IsNullOrEmpty(quote.QuoteId.ToString()))
                {
                    GetRoomData = Environment.NewLine + "---Room Details---" + Environment.NewLine;
                    string ConnectionStringFromWebConfig = @"" + ConfigurationManager.ConnectionStrings["Standard"].ConnectionString + "";
                    SqlConnection cn = new SqlConnection(ConnectionStringFromWebConfig);
                    SqlDataAdapter da = new SqlDataAdapter("SELECT r.RoomName  + ' ' + CASE WHEN qr.RoomNo <= 1 then '' ELSE cast(qr.RoomNo as varchar(3)) END as RoomNameNumber FROM Rooms r INNER JOIN QuotesRooms qr ON r.RoomID = qr.RoomID RIGHT JOIN Quotes q on q.QuoteID = qr.QuoteID WHERE qr.QuoteID = '" + quote.QuoteId + "' ORDER BY r.ordinal, qr.RoomNo", cn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            GetRoomData += " " + ds.Tables[0].Rows[i]["RoomNameNumber"].ToString() + " ";
                        }
                    }
                }
                #endregion

                #region Get Inventory Details for Only Estimates
                //if (quote.QuoteType == Quotes.QuoteTypes.Estimate)
				if (quote.QuoteType == Quotes.QuoteTypes.Quote || quote.QuoteType == Quotes.QuoteTypes.Estimate)
                {//If it is an estimate (Big Form) - Get the Inventory Data
                    GetInventoryData = Environment.NewLine + Environment.NewLine + "---HouseHold Inventory Details---" + Environment.NewLine;
                    email.Attachments.Add(CreatePdfReportAttatchment(ReportHelper.REPORT_CROWN, quote.QuoteId));
                    string ConnectionStringFromWebConfig = @"" + ConfigurationManager.ConnectionStrings["Standard"].ConnectionString + "";
                    SqlConnection cn = new SqlConnection(ConnectionStringFromWebConfig);
                    SqlDataAdapter da = new SqlDataAdapter("SELECT r.RoomName  + ' ' + CASE WHEN qr.RoomNo <= 1 then '' ELSE cast(qr.RoomNo as varchar(3)) END as RoomNameNumber, Quantity, InventoryName FROM QuotesInventory qi INNER JOIN QuotesRooms qr ON qi.QuotesRoomID = qr.QuoteRoomID  INNER JOIN Inventory i ON i.InventoryID = qi.InventoryID INNER JOIN Rooms r ON qi.RoomID = r.RoomID INNER JOIN Quotes q on q.QuoteID = qr.QuoteID	INNER join RoomsInventory ri on qi.InventoryID = ri.InventoryID and qi.RoomID = ri.RoomID WHERE qr.QuoteID = '" + quote.QuoteId + "' ORDER BY r.ordinal, qr.RoomNo, ri.ordinal", cn);
                    DataSet ds = new DataSet();
                    da.Fill(ds);
                    if (ds.Tables[0].Rows.Count != 0)
                    {
                        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                        {
                            GetInventoryData += " " + ds.Tables[0].Rows[i]["RoomNameNumber"].ToString() + ":" + ds.Tables[0].Rows[i]["InventoryName"].ToString() + " (Quantity - " + ds.Tables[0].Rows[i]["Quantity"].ToString() + ") ";
                        }
                    }

                    GetInventoryData += Environment.NewLine + Environment.NewLine;

                    try
                    {
                        SqlDataAdapter daInventoryTotal = new SqlDataAdapter("SELECT ROUND(SUM(qi.Quantity * i.Dimension), 2) AS 'TotalInventory' FROM QuotesInventory qi INNER JOIN QuotesRooms qr ON qi.QuotesRoomID = qr.QuoteRoomID  INNER JOIN Inventory i ON i.InventoryID = qi.InventoryID INNER JOIN Rooms r ON qi.RoomID = r.RoomID INNER JOIN Quotes q on q.QuoteID = qr.QuoteID	INNER join RoomsInventory ri on qi.InventoryID = ri.InventoryID and qi.RoomID = ri.RoomID WHERE qr.QuoteID = '" + quote.QuoteId + "'", cn);
                        DataSet dsInventoryTotal = new DataSet();
                        daInventoryTotal.Fill(dsInventoryTotal);
                        if (dsInventoryTotal.Tables[0].Rows.Count != 0)
                        {
                            for (int i = 0; i < dsInventoryTotal.Tables[0].Rows.Count; i++)
                            {
                                TotalInventory = " Total Inventory: " + dsInventoryTotal.Tables[0].Rows[i]["TotalInventory"].ToString() + " ";
                            }
                        }
                    }
                    catch (Exception errTotalInventory)
                    {
                        email.Body = "Error 2189 - " + errTotalInventory.ToString();//Add response to the Email        
                        SendEmail(email, quote.Email, "gitesh@kudosweb.com");                        
                    }
				}
				//else
				//{//If it is an home visit request (Small Form)
				//	//email.Attachments.Add(CreatePdfReportAttatchment(ReportHelper.REPORT_ROOM_BLANK, quote.QuoteId));            
				//}
                #endregion

                #endregion

                #region Create XML DATA
                sb.AppendFormat("<HTTPRequestMessage><Header><MessageIdentification ID=\"pbiubs4523opdzvrudbwz255\" TimeStamp=\"2012-12-03 07:24:45:41 T12Z\" Expiry=\"mm\"/><ClientIdentification ID=\"ClientID\" UserID=\"userid\" Password=\"pwd\" authenticationToken=\"encryptedtoken\"/><MessageProcessing dataEncryption=\"false\" processortype=\"NotifySCPassback\" processedReceipt=\"true\" returnErrorToSender=\"true\"/><URLInfo httpServer=\"intranet.crownrelo.com\"/></Header><DataSet transaction=\"true\" requestType=\"New\" processorType=\"WebInitiationLead\"><DataObject name=\"WebLeadBO\" versionNo=\"1.0\">");
				sb.AppendFormat("<sourceServer>{0}</sourceServer>", "quote.crownrelo.co.nz");
				sb.AppendFormat("<sourceDatabasePath>{0}</sourceDatabasePath>", "http://quote.crownrelo.co.nz/CrownLeadXMLPost.aspx?id=" + quote.QuoteId.ToString());
				sb.AppendFormat("<sourceKey>{0}</sourceKey>", SubjectLine + quote.QuoteId.ToString());
				sb.AppendFormat("<leadSource>{0}</leadSource>", "Other");
                sb.AppendFormat("<likelyServiceDate><![CDATA[{0}]]></likelyServiceDate>", ServiceDate);
                sb.AppendFormat("<preferredDeliveryDate><![CDATA[{0}]]></preferredDeliveryDate>", DeliveryDate);
                sb.AppendFormat("<primaryDestination><![CDATA[{0}]]></primaryDestination>", "New Zealand");
                sb.AppendFormat("<destinationCity><![CDATA[{0}]]></destinationCity>", quote.ToStreet);
                sb.AppendFormat("<destinationState><![CDATA[{0}]]></destinationState>", "");
                sb.AppendFormat("<additionalComments><![CDATA[{0}]]></additionalComments>", "Other Leads: Crown Website NZ");
                sb.AppendFormat("<leadFrom><![CDATA[{0}]]></leadFrom>", "Client");
                sb.AppendFormat("</DataObject><DataObject name=\"WebValuableInfoBO\" versionNo=\"1.0\">");
                sb.AppendFormat("<customerType><![CDATA[{0}]]></customerType>", "Private Customer");
                sb.AppendFormat("<valuableInformation><![CDATA[{0}]]></valuableInformation>", valuableInformation );
                sb.AppendFormat("<Inventory><![CDATA[{0}]]></Inventory>", GetRoomData + GetInventoryData + TotalInventory);
                sb.AppendFormat("</DataObject><DataObject name=\"WebAddressBO\" versionNo=\"1.0\">");
                sb.AppendFormat("<country><![CDATA[{0}]]></country>", "New Zealand");
                sb.AppendFormat("<city><![CDATA[{0}]]></city>", quote.FromStreet);
                sb.AppendFormat("<state><![CDATA[{0}]]></state>", "");
                sb.AppendFormat("</DataObject><DataObject name=\"WebClientBO\" versionNo=\"1.0\">");
                sb.AppendFormat("<title><![CDATA[{0}]]></title>", "Mr.");
                sb.AppendFormat("<givenName><![CDATA[{0}]]></givenName>", quote.FirstName);
                sb.AppendFormat("<familyName><![CDATA[{0}]]></familyName>", quote.Surname);
                sb.AppendFormat("<primaryEmail><![CDATA[{0}]]></primaryEmail>", quote.Email);
                sb.AppendFormat("<workPhoneCountryCode><![CDATA[{0}]]></workPhoneCountryCode>", "");
                sb.AppendFormat("<workPhoneAreaCode><![CDATA[{0}]]></workPhoneAreaCode>", "");
                sb.AppendFormat("<workPhoneNo><![CDATA[{0}]]></workPhoneNo>", quote.DayPhone);
                sb.AppendFormat("<mobilePhoneCountryCode><![CDATA[{0}]]></mobilePhoneCountryCode>", "");
                sb.AppendFormat("<mobilePhoneAreaCode><![CDATA[{0}]]></mobilePhoneAreaCode>", "");
                sb.AppendFormat("<mobilePhoneNo><![CDATA[{0}]]></mobilePhoneNo>", quote.CellPhone);
                sb.AppendFormat("</DataObject></DataSet></HTTPRequestMessage>");
                #endregion

                string GetResponse = getWebRequest(new Uri(strURL), sb.ToString());
                //////Enable below lines to look at the Response code from Crown Global Site Lead Integration in an email
                sb.AppendFormat("<br /><br /><strong>Response From Crown Global Site</strong><br />");
                sb.AppendFormat(GetResponse);
                
                email.Body = sb.ToString();//Add response to the Email

                if (!GetResponse.ToString().Contains("<newLeadId>"))
                {//if there system throws an error send an email
                    SendEmail(email, quote.Email, "nz@crownrelo.com");
                    SendEmail(email, quote.Email, "gitesh@kudosweb.com");
                }          
        }
        catch (Exception err) {
            email.Body = err.ToString();//Add response to the Email
            SendEmail(email, quote.Email, "gitesh@kudosweb.com");
            SendEmail(email, quote.Email, "nz@crownrelo.com");
        }
    }

    public static void LeadNotSent(Quotes quote, string SubjectLine)
    {
        #region Initializing Variables
        MailMessage email = new MailMessage();
        StringBuilder sb = new StringBuilder();

        string date = quote.PickupDate;
        if (!String.IsNullOrEmpty(date)) date = "(" + date + ")";

        email.Subject = String.Format(SubjectLine + " {0} (#{1})", date, quote.QuoteId);

        #endregion

        try
        {
            sb.AppendFormat("Enquiry has been submitted from outside NZ/AUS or their was an error while submitting. Enquiry has not been submitted to lead system.");
            sb.AppendFormat("Quote ID:- " + quote.QuoteId);
            sb.AppendFormat(Environment.NewLine);
            sb.AppendFormat(Environment.NewLine);
            sb.AppendFormat("You will have to manually add this enquiry to the lead system.");
            email.Body = sb.ToString();//Add response to the Email
            
            SendEmail(email, quote.Email, "nz@crownrelo.com");
            SendEmail(email, quote.Email, "gitesh@kudosweb.com");
        }
        catch (Exception err)
        {
            email.Body = err.ToString();//Add response to the Email
            SendEmail(email, quote.Email, "gitesh@kudosweb.com");
            SendEmail(email, quote.Email, "nz@crownrelo.com");
        }
    }

    //Below code has been given by Crown for posting and getting their response
    public static string getWebRequest(Uri address, string postXML)
    {
        string rtn = "";

        for (int i = 1; i <= 5; i++)  //retry 5 times if not getting Response
        {
            HttpWebRequest request = WebRequest.Create(address) as HttpWebRequest;// Create the web request

            if (postXML.Length == 0)
            { //GET
                request.Method = "GET";
                request.ContentType = "application/x-www-form-urlencoded";
            }
            else
            {//POST
                byte[] requestBytes = Encoding.UTF8.GetBytes("requestXML=" + HttpContext.Current.Server.UrlEncode(postXML));
                request.Method = "POST";
                request.ContentLength = requestBytes.Length;
                request.ContentType = "application/x-www-form-urlencoded";//request.ContentType = "text/xml";  

                using (Stream requestStream = request.GetRequestStream())
                {
                    requestStream.Write(requestBytes, 0, requestBytes.Length);
                }
            }

            // Get response   
            using (HttpWebResponse response = request.GetResponse() as HttpWebResponse)
            {
                StreamReader reader = new StreamReader(response.GetResponseStream());// Get the response stream   

                rtn = reader.ReadToEnd();// Read the whole contents and return as a string   
            }

            if (rtn.Length > 0) break;
            if (i == 5) throw (new Exception("Unable to connect the data."));
        }

        return rtn;
    }

    public static bool SendEmail(MailMessage email, string fromEmailAddress, params string[] toAddresses)
    {
        email.DeliveryNotificationOptions = DeliveryNotificationOptions.None;

        if (toAddresses == null || toAddresses.Length <= 0)
            throw new Exception("Need an Email address to send email");

        SmtpClient client = new SmtpClient();

        email.From = new MailAddress(fromEmailAddress);

        // PhoneImageHandler change added this line:
        string referDomain = (HttpContext.Current.Session["referer"] as string ?? HttpContext.Current.Request.Url.Host).ToLower();
        if ((WebConfigurationManager.AppSettings.Get("ExternalDomains") ?? "").Contains(referDomain))
            email.Subject += " - referral from " + referDomain;

        foreach (string toAddress in toAddresses)
            email.To.Add(new MailAddress(toAddress));

        try
        {
            client.Send(email);
        }
        catch (SmtpFailedRecipientException ex)  //shouldnt happen as DeliveryNotificationOptions changed above
        {
            //  FAC.ApplicationBlocks.ExceptionManagement.ExceptionManager.Publish(ex);
            return false;
        }

        return true;
    }

    private static Attachment CreatePdfReportAttatchment(string reportCode, int quoteId)
    {
        string repname = "HouseList";
        MemoryStream stream = ReportHelper.GenerateReport(reportCode, quoteId, null);

        if (reportCode == ReportHelper.REPORT_CROWN) repname = "HouseholdInventory";
        if (reportCode == ReportHelper.REPORT_ROOM_BLANK) repname = "RoomsList";
        if (reportCode == ReportHelper.REPORT_HOUSE_FULL) repname = "HouseholdInventory";

        return new Attachment(stream, String.Format("{0}({1}).pdf", repname, quoteId), "application/pdf");
    }
}