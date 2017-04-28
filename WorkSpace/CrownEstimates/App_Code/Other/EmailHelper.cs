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

/// <summary>
/// Summary description for EmailHelper
/// </summary>
public class EmailHelper
{
    private static string FromEmailAddress
    {
        get { return WebConfigurationManager.AppSettings.Get("FromEmailAddress"); }
    }

    public static string CrownEmailAddress
    {
        get { return WebConfigurationManager.AppSettings.Get("CrownEmailAddress"); }
    }


    public static bool SendNewQuotePasswordEmail(Quotes quote, string SubjectLine = "")
    {
        MailMessage email = new MailMessage();
        email.Subject = String.Format(SubjectLine + " (#{0})", quote.QuoteId);

        StringBuilder sb = new StringBuilder();


        sb.AppendFormat("Hi {0},{1}{1}You can log back in and resume your Online Estimate at any time, right up until you have completed the wizard. {2}{3}Just visit http://www.crownrelo.co.nz/.{4}{6}You will need: {6} - Your email address {6} - Your password: {5}{6}{6}"
            , quote.FirstName.Trim(), Environment.NewLine, Environment.NewLine, Environment.NewLine, Environment.NewLine, quote.Password, Environment.NewLine);

        //        sb.AppendFormat("Please do not reply to this email. This email was sent from an unattended mailbox.{0}", Environment.NewLine);

        sb.Append(Environment.NewLine);
        sb.Append(@"Kind regards from the team at Crown Relocations!

www.crownrelo.co.nz
Freephone: 0508 227 696  (international callers phone: +64 9 415 7300).
Please do not reply to this email. This email was sent from an unattended mailbox.
");


        email.Body = sb.ToString();

        return SendEmail(email, FromEmailAddress, quote.Email); ;
    }

    public static bool SendCompletedQuoteCrownEmail(Quotes quote, string SubjectLine = "")
    {
        MailMessage email = new MailMessage();

        string date = quote.PickupDate;
        if (!String.IsNullOrEmpty(date)) date = "(" + date + ")";

        //if (quote.QuoteType == Quotes.QuoteTypes.Estimate)
        email.Subject = String.Format(SubjectLine + " {0} (#{1})", date, quote.QuoteId);
        //else
        //    email.Subject = String.Format(SubjectLine + " {0} (#{1})", date, quote.QuoteId);

        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("Customer Details:{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);

        sb.AppendFormat("{0} {1} {2}", quote.FirstName, quote.Surname, Environment.NewLine);
        sb.AppendFormat("Day: {0} Cell:{1} {2}", quote.DayPhone, quote.CellPhone, Environment.NewLine);
        sb.AppendFormat("Email: {0}{1}", quote.Email, Environment.NewLine);

        sb.Append(Environment.NewLine);

        sb.AppendFormat("From:{0}", Environment.NewLine);
        sb.AppendFormat("{0}, {1}, {2}, {3}{4}", quote.FromStreet, quote.FromSuburb, quote.FromCity, quote.FromCountry, Environment.NewLine);
        sb.Append(Environment.NewLine);

        sb.AppendFormat("To:{0}", Environment.NewLine);
        sb.AppendFormat("{0},{1}{2}", quote.ToSuburb, quote.ToCity, Environment.NewLine);
        sb.Append(Environment.NewLine);

        if (!String.IsNullOrEmpty(quote.Comments))
        {
            sb.Append(Environment.NewLine);
            sb.AppendLine("Comments from the customer:");
            sb.Append(quote.Comments);
        }

        email.Body = sb.ToString();

        if (quote.QuoteType == Quotes.QuoteTypes.Estimate)
            email.Attachments.Add(CreatePdfReportAttatchment(ReportHelper.REPORT_CROWN, quote.QuoteId));
        else
            email.Attachments.Add(CreatePdfReportAttatchment(ReportHelper.REPORT_ROOM_BLANK, quote.QuoteId));

        return SendEmail(email, quote.Email, CrownEmailAddress);
    }

    public static bool SendCompletedQuoteCrownEmailNew(Quotes quote, string SubjectLine = "")
    {
        MailMessage email = new MailMessage();

        string date = quote.PickupDate;
        if (!String.IsNullOrEmpty(date)) date = "(" + date + ")";

        //if (quote.QuoteType == Quotes.QuoteTypes.Estimate)
        email.Subject = String.Format(SubjectLine + " {0} (#{1})", date, quote.QuoteId);
        //else
        //    email.Subject = String.Format(SubjectLine + " {0} (#{1})", date, quote.QuoteId);

        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("Customer Details:{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);

        sb.AppendFormat("{0} {1} {2}", quote.FirstName, quote.Surname, Environment.NewLine);
        sb.AppendFormat("Day Phone: {0} {1}", quote.DayPhone, Environment.NewLine);
        sb.AppendFormat("Email: {0}{1}", quote.Email, Environment.NewLine);

        sb.Append(Environment.NewLine);

        sb.AppendFormat("From:{0}", Environment.NewLine);
        sb.AppendFormat("{0}{1}", quote.FromStreet, Environment.NewLine);
        sb.Append(Environment.NewLine);

        sb.AppendFormat("To:{0}", Environment.NewLine);
        sb.AppendFormat("{0}{1}", quote.ToStreet, Environment.NewLine);
        sb.Append(Environment.NewLine);

        if (!String.IsNullOrEmpty(quote.Comments))
        {
            sb.Append(Environment.NewLine);
            sb.AppendLine("Comments from the customer:");
            sb.Append(quote.Comments);
        }

        email.Body = sb.ToString();

        email.Attachments.Add(CreatePdfReportAttatchmentNew(ReportHelper.REPORT_CROWN, quote.QuoteId, GetServicesSelected(quote), GetOtherServiceSelected(quote), quote.ToStreet));

        //if (quote.QuoteType == Quotes.QuoteTypes.Estimate)
        //    email.Attachments.Add(CreatePdfReportAttatchmentNew(ReportHelper.REPORT_CROWN, quote.QuoteId, GetServicesSelected(quote), GetOtherServiceSelected(quote)));
        //else
        //    email.Attachments.Add(CreatePdfReportAttatchmentNew(ReportHelper.REPORT_CROWN, quote.QuoteId, GetServicesSelected(quote), GetOtherServiceSelected(quote)));

        return SendEmail(email, quote.Email, CrownEmailAddress);
    }

    public static bool SendCompletedQuoteCustomerEmail(Quotes quote, string SubjectLine = "")
    {
        MailMessage email = new MailMessage();
        email.Subject = String.Format(SubjectLine + " (#{0})", quote.QuoteId);

        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("Hi {0}{1}", quote.FirstName, Environment.NewLine);
        sb.Append(Environment.NewLine);
        sb.AppendFormat("Thanks for completing the Online Estimate. The Household Inventory you have provided is attached to this email.{0}", Environment.NewLine);
        sb.AppendFormat("You will need Adobe Reader to view it. (If you don’t have Adobe Reader, you can download it for free{0}", Environment.NewLine);
        sb.AppendFormat("here:  http://www.adobe.com/ ){0}", Environment.NewLine);
        sb.Append(Environment.NewLine);
        sb.AppendFormat("A Crown consultant will review your details and either email or call you with a quote within 24 hours.{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);

        sb.AppendFormat("In the meantime, if you have any further questions, feel free to contact one of our friendly representatives on 0508 227 696.{0}", Environment.NewLine);
        sb.AppendFormat("We look forward to making your move a stress-free experience.{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);
        //sb.Append(Environment.NewLine);
        //sb.AppendFormat("Regards from the team at Crown Relocations.{0}", Environment.NewLine);

        //sb.Append(Environment.NewLine);
        //sb.Append(Environment.NewLine);

        sb.Append(@"Kind regards from the team at Crown Relocations!

www.crownrelo.co.nz
Freephone: 0508 227 696  (international callers phone: +64 9 415 7300).
Please do not reply to this email. This email was sent from an unattended mailbox.
");


        email.Body = sb.ToString();

        email.Attachments.Add(CreatePdfReportAttatchment(ReportHelper.REPORT_HOUSE_FULL, quote.QuoteId));

        return SendEmail(email, FromEmailAddress, quote.Email);
    }

    public static bool SendCompletedQuoteCustomerEmailNew(Quotes quote, string SubjectLine = "")
    {
        MailMessage email = new MailMessage();
        email.Subject = String.Format(SubjectLine + " (#{0})", quote.QuoteId);

        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("Hi {0}{1}", quote.FirstName, Environment.NewLine);
        sb.Append(Environment.NewLine);
        sb.AppendFormat("Thanks for completing the Online Estimate. The Household Inventory you have provided is attached to this email.{0}", Environment.NewLine);
        sb.AppendFormat("You will need Adobe Reader to view it. (If you don’t have Adobe Reader, you can download it for free{0}", Environment.NewLine);
        sb.AppendFormat("here:  http://www.adobe.com/ ){0}", Environment.NewLine);
        sb.Append(Environment.NewLine);
        sb.AppendFormat("A Crown consultant will review your details and either email or call you with a quote within 24 hours.{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);

        sb.AppendFormat("In the meantime, if you have any further questions, feel free to contact one of our friendly representatives on 0508 227 696.{0}", Environment.NewLine);
        sb.AppendFormat("We look forward to making your move a stress-free experience.{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);
        //sb.Append(Environment.NewLine);
        //sb.AppendFormat("Regards from the team at Crown Relocations.{0}", Environment.NewLine);

        //sb.Append(Environment.NewLine);
        //sb.Append(Environment.NewLine);

        sb.Append(@"Kind regards from the team at Crown Relocations!

www.crownrelo.co.nz
Freephone: 0508 227 696  (international callers phone: +64 9 415 7300).
Please do not reply to this email. This email was sent from an unattended mailbox.
");


        email.Body = sb.ToString();

        email.Attachments.Add(CreatePdfReportAttatchmentNew(ReportHelper.REPORT_HOUSE_FULL, quote.QuoteId, GetServicesSelected(quote), GetOtherServiceSelected(quote), quote.ToStreet));

        return SendEmail(email, FromEmailAddress, quote.Email);
    }

    public static bool SendCompletedQuoteCustomerEmailWithoutAttachment(Quotes quote, string SubjectLine = "")
    {
        MailMessage email = new MailMessage();
        email.Subject = String.Format(SubjectLine + " (#{0})", quote.QuoteId);

        StringBuilder sb = new StringBuilder();

        sb.AppendFormat("Hi {0}{1}", quote.FirstName, Environment.NewLine);
        sb.Append(Environment.NewLine);
        sb.AppendFormat("Thanks for completing the Quick Quote. {0}", Environment.NewLine);
        sb.Append(Environment.NewLine);
        sb.AppendFormat("A Crown consultant will review your details and either email or call you with a quote within 24 hours.{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);
        sb.AppendFormat("In the meantime, if you have any further questions, feel free to contact one of our friendly representatives on 0508 227 696. We look forward to making your move a stress-free experience.{0}", Environment.NewLine);
        sb.Append(Environment.NewLine);
        
        sb.Append(@"Kind regards from the team at Crown Relocations!

www.crownrelo.co.nz
Freephone: 0508 227 696  (international callers phone: +64 9 415 7300).
Please do not reply to this email. This email was sent from an unattended mailbox.
");


        email.Body = sb.ToString();
        //email.Attachments.Add(CreatePdfReportAttatchment(ReportHelper.REPORT_HOUSE_FULL, quote.QuoteId));

        return SendEmail(email, FromEmailAddress, quote.Email);
    }

    private static Attachment CreatePdfReportAttatchment(string reportCode, int quoteId)
    {
        string repname = "HouseList";
        //Temp Remove Report Error

        MemoryStream stream = ReportHelper.GenerateReport(reportCode, quoteId, null);
        //MemoryStream stream = null;

        if (reportCode == ReportHelper.REPORT_CROWN) repname = "HouseholdInventory";
        if (reportCode == ReportHelper.REPORT_ROOM_BLANK) repname = "RoomsList";
        if (reportCode == ReportHelper.REPORT_HOUSE_FULL) repname = "HouseholdInventory";

        return new Attachment(stream, String.Format("{0}({1}).pdf", repname, quoteId), "application/pdf");
    }

    private static Attachment CreatePdfReportAttatchmentNew(string reportCode, int quoteId, string ServiceSelected, string OtherServiceSelected, string Tocity)
    {
        string repname = "HouseList";

        //Temp Remove Report Error
        //MemoryStream stream = null;
        MemoryStream stream = ReportHelper.GenerateReportNew(reportCode, quoteId, null, ServiceSelected, OtherServiceSelected, Tocity);

        if (reportCode == ReportHelper.REPORT_CROWN) repname = "HouseholdInventory";
        if (reportCode == ReportHelper.REPORT_ROOM_BLANK) repname = "RoomsList";
        if (reportCode == ReportHelper.REPORT_HOUSE_FULL) repname = "HouseholdInventory";

        return new Attachment(stream, String.Format("{0}({1}).pdf", repname, quoteId), "application/pdf");
    }

    private static bool SendEmail(MailMessage email, string fromEmailAddress, params string[] toAddresses)
    {
        email.DeliveryNotificationOptions = DeliveryNotificationOptions.None;

        if (toAddresses == null || toAddresses.Length <= 0)
            throw new Exception("Need a to address to send email");

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

    public static bool SendMovingHomeEmail(EnquiryEmail ee)
    {
        MailMessage email = new MailMessage();
        email.Subject = ee.Subject;
        email.Body = ee.Body;

        return SendEmail(email, ee.FromAddress, ee.ToAddress);
    }

    public static bool SendPlainEmail(string body, string subject, string toAddress, string fromAddress)
    {
        MailMessage email = new MailMessage();
        email.Subject = subject;
        email.Body = body;

        return SendEmail(email, fromAddress, toAddress);
    }

    public static bool ValidateEmail(string address)
    {
        // Copied from FAC:
        return System.Text.RegularExpressions.Regex.IsMatch(address, @"(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,3})");
    }

    public static string GetServicesSelected(Quotes quote)
    {
        string ServiceSelected = "";
        if (quote.IsPackedByOwner == true)
            ServiceSelected += "Packed By Owner ,";
        if (quote.IsProfessionalPackingforCrown == true)
            ServiceSelected += "Professional Packing for Crown ,";
        if (quote.IsUnsure == true)
            ServiceSelected += "Unsure ,";
        if (quote.IsSecureStorage == true)
            ServiceSelected += "Secure Storage";
        return ServiceSelected;
    }
    public static string GetOtherServiceSelected(Quotes quote)
    {
        string OtherServiceSelected = "";
        if (quote.IsInsurenceRequired == true)
            OtherServiceSelected += "Insurance ,";
        if (quote.IsPetsRequired == true)
            OtherServiceSelected += "Pets ,";
        if (quote.IsVehicleRequired == true)
            OtherServiceSelected += "Vehicle ,";
        if (quote.IsPreArrivalCleanRequired == true)
            OtherServiceSelected += "Pre-arrival Clean";
        return OtherServiceSelected;
    }


}
