using System;
using System.Collections.Generic;
using System.Text;
using FAC.BusinessDataAccess;
using System.Data;


namespace CrownEstimates.BusinessModel
{

    public class LongHaulShipment : CrownEstimatesBusinessObject<LongHaulShipment>
    {
        #region Public Properties

        public int ShipmentID { get; private set; }

        public string ShipmentRef { get; set; }
        public string FromCity { get; set; }
        public string ToCity { get; set; }
        public DateTime CutoffDate { get; set; }
        public DateTime ArrivalDate { get; set; }
        public int? TransitTime { get; set; }

        #endregion


        #region Get/Create

        private LongHaulShipment(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static LongHaulShipment Create()
        {
            return new LongHaulShipment(DatabaseStatus.DoesNotExist);
        }

        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.longhaulshipment WHERE (ShipmentID = @ShipmentID)");
        
        public static LongHaulShipment Get(int shipmentID)
        {
            LongHaulShipment bo = new LongHaulShipment(DatabaseStatus.Exists);
            bo.ShipmentID = shipmentID;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        private static readonly ObjectPopulator _getByShipmentRefDataAccesser = new UserAwareObjectPopulator2("SELECT TOP 1 * FROM dbo.Longhaulshipment WHERE (ShipmentRef = @ShipmentRef) ORDER BY ShipmentID DESC");

        public static LongHaulShipment TryGet(string shipmentRef)
        {
            LongHaulShipment bo = new LongHaulShipment(DatabaseStatus.Exists);
            bo.ShipmentRef = shipmentRef;
            return _getByShipmentRefDataAccesser.TryToPopulateBusinessObject2(bo);
        }

        #endregion


        #region Insert / Update

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.LongHaulShipment(ShipmentRef, ToCity, FromCity, CutoffDate, ArrivalDate, TransitTime  )
VALUES(@ShipmentRef, @ToCity, @FromCity, @CutoffDate, @ArrivalDate, @TransitTime)");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.LongHaulShipment
SET ShipmentRef = @ShipmentRef, FromCity= @FromCity, ToCity = @ToCity, CutoffDate= @CutoffDate, ArrivalDate = @ArrivalDate, TransitTime = @TransitTime
WHERE (ShipmentID = @ShipmentID)");


        public override void Save()
        {
            Save(this, _insertDataAccesser, _updateDataAccesser);
        }

        public static void Delete(int shipmentID)
        {
            ExecuteNonQuery("DELETE FROM LongHaulShipment WHERE ShipmentID=@ShipmentID", shipmentID);
        }
        #endregion


        #region GetLists (static)

        public static DataTable ListShipments(string fromCity, string toCity)
        {
            if (String.IsNullOrEmpty(fromCity) || String.IsNullOrEmpty(toCity)) throw new ArgumentException("Either the From City or To City parameter was not provided.");

            // mapping to get around the Otago + Southland etc. where they want same data shown without typing it in...
            if (fromCity == "southland") fromCity = "otago";
            if (fromCity == "northland") fromCity = "auckland";
            if (fromCity == "waikato") fromCity = "bay of plenty";

            if (toCity == "southland") toCity = "otago";
            if (toCity == "northland") toCity = "auckland";
            if (toCity == "waikato") toCity = "bay of plenty";


            string sql = @"
SELECT ShipmentID, FromCity, ToCity,  
    convert( varchar(11), CutoffDate,  113) as CutoffDate, 
    CutoffDate as SortCutoffDate, 
    convert( varchar(11), ArrivalDate,  113) as ArrivalDate,
    ArrivalDate as SortArrivalDate,
    cast( ShipmentID as varchar(10)) as ShipmentRef, 
    ShipmentRef + '-' + isnull(FromCity,'?') + '-' + isnull(ToCity,'?') + '-'+ convert( varchar (12) , longhaulshipment.CutoffDate , 113) AS ShipmentRef2,
    cast( TransitTime  as varchar(2)) + ' days'  as TransitTime

FROM LongHaulShipment WHERE CutoffDate >= GETDATE()
    AND lowerFromCity=@FromCity
    AND lowerToCity = @ToCity
    ORDER BY SortCutoffDate";

            return GetDataTable(sql, fromCity, toCity);
        }

        public static DataTable ListAllShipments()
        {
            string sql = @"
SELECT *
FROM LongHaulShipment WHERE CutoffDate >= GETDATE()                
    ORDER BY CutoffDate";

            return GetDataTable(sql);
        }

//        public static DataTable ListDestinationCities(string fromCity)
//        {
//            if (String.IsNullOrEmpty(fromCity)) return null;// throw new ArgumentException("From City parameter was not provided.");

//            string sql = @"
//SELECT DISTINCT ToCity FROM LongHaulShipment WHERE CutoffDate >= GETDATE()
//    AND FromCity=@FromCity
//    GROUP BY ToCity ORDER BY ToCity ";

//            return GetDataTable(sql, fromCity);
//        }

//        public static DataTable ListSourceCities()
//        {
//            string sql = @"
//SELECT DISTINCT FromCity FROM LongHaulShipment WHERE CutoffDate >= GETDATE()                
//    ORDER BY FromCity ";

//            return GetDataTable(sql);
//        }


        #endregion
    }
}
