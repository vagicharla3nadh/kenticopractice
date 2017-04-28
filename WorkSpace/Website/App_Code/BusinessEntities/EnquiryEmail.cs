using System;
using System.Collections.Generic;
using System.Text;
using FAC.BusinessDataAccess;
using System.Data;


namespace CrownEstimates.BusinessModel
{

    public class EnquiryEmail : CrownEstimatesBusinessObject<EnquiryEmail>
    {

        #region Public Properties
        public int EmailID { get; set; }
        public string FromAddress { get; set; }
        public string ToAddress { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CustomerName { get; set; }
        #endregion

        public EnquiryEmail() : base(DatabaseStatus.DoesNotExist) { }

        private EnquiryEmail(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static EnquiryEmail Create()
        {
            return new EnquiryEmail(DatabaseStatus.DoesNotExist);
        }

        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.EnquiryEmail WHERE (EmailID = @EmailID)");
        public static EnquiryEmail Get(int emailID)
        {
            EnquiryEmail bo = new EnquiryEmail(DatabaseStatus.Exists);
            bo.EmailID = emailID;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.EnquiryEmail(FromAddress, ToAddress, Subject, Body, CustomerName )
VALUES(@FromAddress, @ToAddress, @Subject, @Body, @CustomerName)");

        public override void Save()
        {
            Save(this, _insertDataAccesser, null);
        }

//        public static DataTable ListEmails(DateTime fromDate, DateTime toDate)
//        {

//            string sql = @"
//SELECT TOP 1000 EmailID, FromAddress, ToAddress, Subject, Body, 
//    convert( varchar(11), CreatedOn,  113) as CreatedOn, 
//    CreatedOn as SortCreatedOn, CustomerName
//
//FROM EnquiryEmail WHERE CreatedOn >= @FromDate AND CreatedOn <= @ToDate
//    ORDER BY CreatedOn";

//            return GetDataTable(sql, fromDate, toDate);
//        }

        public static DataTable ListEmailsNewestAtTop(DateTime? fromDate, DateTime? toDate)
        {

            string sql = @"
SELECT TOP 1000 EmailID, FromAddress, ToAddress, Subject, Body, 
    convert( varchar(11), CreatedOn,  113) as CreatedOn, 
    CreatedOn as SortCreatedOn, CustomerName

FROM EnquiryEmail WHERE CreatedOn >= @FromDate AND CreatedOn <= @ToDate
    ORDER BY CreatedOn DESC";

            return GetDataTable(sql, fromDate, toDate);
        }
    }

}
