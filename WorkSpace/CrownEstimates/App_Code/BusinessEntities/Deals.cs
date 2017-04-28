using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FAC.BusinessDataAccess;
using System.Data;

namespace CrownEstimates.BusinessModel
{
    public class Deals : CrownEstimatesBusinessObject<Deals>
    {
        public const string DEPARTING_FROM_NORTH = "North Island";
        public const string DEPARTING_FROM_SOUTH = "South Island";

        #region Public Properties

        public int DealId { get; private set; }

        public string DealRef { get; set; }
        public string DestinationRegion { get; set; }
        public string DestinationPort { get; set; }
        public DateTime? DateClosing { get; set; }
        public string DepartingFrom { get; set; }
        public bool IsDealNational { get; set; }

        #endregion

        #region Get/Create

        private Deals(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static Deals Create()
        {
            return new Deals(DatabaseStatus.DoesNotExist);
        }


        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.Deals WHERE (DealID = @DealID)");

        public static Deals Get(int dealId)
        {
            Deals bo = new Deals(DatabaseStatus.Exists);
            bo.DealId = dealId;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        private static readonly ObjectPopulator _getByDealRefDataAccesser = new UserAwareObjectPopulator2("SELECT TOP 1 * FROM dbo.Deals WHERE (DealRef = @DealRef) ORDER BY DealID DESC");

        public static Deals TryGet(string dealRef)
        {
            Deals bo = new Deals(DatabaseStatus.Exists);
            bo.DealRef = dealRef;
            return _getByDealRefDataAccesser.TryToPopulateBusinessObject2(bo);
        }

        #endregion

        #region Insert / Update

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.Deals(DealRef, DestinationRegion, DestinationPort, DateClosing, DepartingFrom, IsDealNational)
VALUES(@DealRef, @DestinationRegion, @DestinationPort, @DateClosing, @DepartingFrom, @IsDealNational)");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.Deals 
SET DealRef = @DealRef, DestinationRegion = @DestinationRegion, DestinationPort = @DestinationPort, DateClosing = @DateClosing, DepartingFrom = @DepartingFrom, IsDealNational = @IsDealNational
WHERE (DealID = @DealID)");


        public override void Save()
        {
            Save(this, _insertDataAccesser, _updateDataAccesser);
            
            InvalidateDependancies();
        }

        public static void Delete(int dealId)
        {
            ExecuteNonQuery("DELETE FROM Deals WHERE DealID=@DealID", dealId);
        }
        #endregion

        #region GetLists (static)

        public static DataTable SelectDeals(string departingFrom, bool isDealNational)
        {
            SqlSearchQuerry sql = new SqlSearchQuerry();
            sql.Select.Append("SELECT *, isnull(dealref, '') + '-' + isnull(DepartingFrom,'?') + '-' + isnull(DestinationPort,'?') + '-'+ convert( varchar (12) , dateclosing , 113) AS dealRef2");
            sql.From.Append("FROM Deals");

            sql.Where.Add("DateClosing > @DateClosing", DateTime.Today);
            sql.Where.Add("IsDealNational = @IsDealNational", isDealNational);
            sql.Where.AddIfNotNull("DepartingFrom=@DepartingFrom", departingFrom);

            return GetDataTableCached(sql.ToString() + System.Environment.NewLine + " ORDER BY " + (isDealNational? "DepartingFrom" : "DateClosing"), sql.Parameters);
        }

        #endregion
    }
}