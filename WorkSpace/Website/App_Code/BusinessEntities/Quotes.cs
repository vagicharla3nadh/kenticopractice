using System;
using System.Linq;
using System.Web;
using System.Data;
using System.Collections.Generic;
using FAC.BusinessDataAccess;
using System.Web.Configuration;

namespace CrownEstimates.BusinessModel
{
    public class Quotes : CrownEstimatesBusinessObject<Quotes>
    {
        public enum QuoteTypes { Quote = 'Q', Estimate = 'E' };

        #region Public Properties

        public int QuoteId { get; private set; }

        private string _quoteType;
        public QuoteTypes QuoteType
        {
            get { return StringToQuoteType(_quoteType); }
            set { _quoteType = T2NS(QuoteTypeToString(value)); }
        }
		//public string QuoteID { get; set; }
        public string FirstName { get; set; }
        public string Surname { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string DayPhone { get; set; }
        public string CellPhone { get; set; }
        public string FromStreet { get; set; }
        public string FromSuburb { get; set; }
        public string FromCity { get; set; }
        public string FromCountry { get; set; }        
        public string ToStreet { get; set; }
        public string ToSuburb { get; set; }
        public string ToCity { get; set; }
        public string ToCountry { get; set; }
        public string Comments { get; set; }
        public bool CopyToClient { get; set; }
        public DateTime CreatedOn { get; set; }
        public DateTime? CompletedOn { get; set; }
        public string PickupDate { get; set; }
        public string DeliveryDate { get; set; }
        public DateTime? PasswordEmailSentOn { get; set; }
        public bool IsPackedByOwner { get; set; }
        public bool IsProfessionalPackingforCrown { get; set; }
        public bool IsUnsure { get; set; }
        public bool IsSecureStorage { get; set; }
        public bool IsInsurenceRequired { get; set; }
        public bool IsPetsRequired { get; set; }
        public bool IsVehicleRequired { get; set; }
        public bool IsPreArrivalCleanRequired { get; set; }
      

        #endregion

        #region Get/Create

        private Quotes(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static Quotes Create()
        {
            Quotes q = new Quotes(DatabaseStatus.DoesNotExist);
            q.QuoteType = QuoteTypes.Estimate; //Default?
            q.CreatedOn = DateTime.Now;
            return q;
        }


        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.Quotes WHERE (QuoteID = @QuoteID)");
        public static Quotes Get(int quoteId)
        {
            Quotes bo = new Quotes(DatabaseStatus.Exists);
            bo.QuoteId = quoteId;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        #endregion

        #region Insert / Update

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.Quotes(QuoteType, FirstName, Surname, Email, Password, DayPhone, CellPhone, FromStreet, FromSuburb, FromCity, FromCountry, ToStreet, ToSuburb, ToCity, ToCountry, ApproximateMoveDate, Comments, CopyToClient, PickupDate, DeliveryDate, CreatedOn, UpdatedOn, CompletedOn, PasswordEmailSentOn,IsPackedByOwner,IsProfessionalPackingforCrown,IsUnsure,IsSecureStorage,IsInsurenceRequired,IsPetsRequired,IsVehicleRequired,IsPreArrivalCleanRequired)
VALUES(@QuoteType, @FirstName, @Surname, @Email, @Password, @DayPhone, @CellPhone, @FromStreet, @FromSuburb, @FromCity, @FromCountry, @ToStreet, @ToSuburb, @ToCity, @ToCountry, @ApproximateMoveDate, @Comments, @CopyToClient, @PickupDate, @DeliveryDate, GETDATE(), GETDATE(), @CompletedOn, @PasswordEmailSentOn, @IsPackedByOwner,@IsProfessionalPackingforCrown,@IsUnsure,@IsSecureStorage,@IsInsurenceRequired,@IsPetsRequired,@IsVehicleRequired,@IsPreArrivalCleanRequired)
SELECT CAST(SCOPE_IDENTITY() AS INT) AS QuoteID");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.Quotes 
SET QuoteType = @QuoteType, FirstName = @FirstName, Surname = @Surname, Email = @Email, Password = @Password, DayPhone = @DayPhone, CellPhone = @CellPhone, FromStreet = @FromStreet, FromSuburb = @FromSuburb, FromCity = @FromCity, FromCountry=@FromCountry, ToStreet=@ToStreet, ToSuburb = @ToSuburb, ToCity = @ToCity, ToCountry=@ToCountry, ApproximateMoveDate = @ApproximateMoveDate, Comments = @Comments, CopyToClient = @CopyToClient, PickupDate=@PickupDate, DeliveryDate=@DeliveryDate, CreatedOn=@CreatedOn, UpdatedOn = GETDATE(), CompletedOn = @CompletedOn, PasswordEmailSentOn=@PasswordEmailSentOn,
IsPackedByOwner = @IsPackedByOwner,IsProfessionalPackingforCrown =@IsProfessionalPackingforCrown,IsUnsure = @IsUnsure,IsSecureStorage = @IsSecureStorage,IsInsurenceRequired=@IsInsurenceRequired,
IsPetsRequired = @IsPetsRequired,IsVehicleRequired =@IsVehicleRequired ,IsPreArrivalCleanRequired=@IsPreArrivalCleanRequired
WHERE (QuoteID = @QuoteID)");


        public override void Save()
        {
            if (DatabaseStatus == DatabaseStatus.DoesNotExist)
                GeneratePassword();

            Save(this, _insertDataAccesser, _updateDataAccesser);
        }

        public static void FlagInactiveQuotesAsCompleted()
        {
            string xDaysStr = WebConfigurationManager.AppSettings.Get("FlagInactiveQuotesAsCompletedAfterXDays");

            int xdays = 30;
            if (!String.IsNullOrEmpty(xDaysStr))
                xdays = int.Parse(xDaysStr);

            DateTime beforeDate = DateTime.Now.AddDays(-1 * xdays);

            ExecuteNonQuery(@"UPDATE dbo.Quotes 
SET CompletedOn = CAST('1900' AS DATETIME)
WHERE CompletedOn IS NULL AND UpdatedOn < CAST(@BeforeDate AS DATETIME)", beforeDate);
        }

        #endregion

        #region privates
        private string QuoteTypeToString(QuoteTypes qt)
        {
            return qt.ToString();
        }
        private QuoteTypes StringToQuoteType(string qt)
        {
            if (qt.ToCharArray()[0] == QuoteTypes.Estimate.ToString().ToCharArray()[0]) return QuoteTypes.Estimate;
            else if (qt.ToCharArray()[0] == QuoteTypes.Quote.ToString().ToCharArray()[0]) return QuoteTypes.Quote;

            else throw new ArgumentException("Invalid QuoteType enum passed in.");

        }
        private void GeneratePassword()
        {
            //Six digit random number
            Password = new Random().Next(100000, 999999).ToString();
        }
        #endregion

        #region GetLists (static)

        public static int? GetQuoteIDFromEmailPassword(string email, string password)
        {
            DataTable quotes = GetDataTable("SELECT QuoteID FROM dbo.Quotes WHERE CompletedOn IS NULL AND Email=@Email AND Password=@Password", email, password);

            if (quotes.Rows.Count == 0)
                return null;

            if (quotes.Rows.Count > 1)
                throw new Exception(String.Format("More than one quote was returned for the email/password combination of {0}/{1}", email, password));


            return (int?)quotes.Rows[0]["QuoteID"];
        }

        public static DataTable ListQuotesForSearch(DateTime? dateFrom, DateTime? dateTo, int? quoteId)
        {
            if (dateTo.HasValue)
                dateTo = dateTo.Value.Date.AddDays(1);

            SqlSearchQuerry sql = new SqlSearchQuerry();

            sql.Select.Append(@"SELECT TOP 1000 QuoteID, QuoteType, ISNULL(FirstName + ' ', '') + Surname AS Name, Email, DayPhone, CreatedOn, CompletedOn, Comments, FromCity, FromCountry ");
            sql.From.Append("FROM Quotes");
            string orderBy = " ORDER BY CreatedOn DESC";

            if (quoteId.HasValue)
            {
                sql.Where.Add("QuoteID = @QuoteID");
                return GetDataTable(sql.ToString() + orderBy, quoteId.Value);
            }

            sql.Where.AddIfNotNull("CreatedOn >= @FromDate", dateFrom);
            sql.Where.AddIfNotNull("CreatedOn < @ToDate", dateTo);

            return GetDataTable(sql.ToString() + orderBy, sql.Parameters);
        }

        #endregion
    }
}
