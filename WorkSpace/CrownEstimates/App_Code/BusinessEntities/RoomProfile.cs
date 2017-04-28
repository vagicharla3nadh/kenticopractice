using System;
using System.Collections.Generic;
using System.Text;

using FAC.BusinessDataAccess;
using System.Data;


namespace CrownEstimates.BusinessModel
{
    public class RoomProfile : CrownEstimatesBusinessObject<RoomProfile>
    {
        #region Public Properties

        public int RoomProfileId { get; private set; }

        public int RoomId { get; set; }
        public int QuoteId { get; set; }
        public int Quantity { get; set; }
        #endregion

        #region Get/Create

        private RoomProfile(DatabaseStatus databaseStatus) : base(databaseStatus) { }
        public static RoomProfile Create()
        {
            return new RoomProfile(DatabaseStatus.DoesNotExist);
        }


        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.RoomProfile WHERE (RoomProfileID = @RoomProfileID)");
        public static RoomProfile Get(int roomProfileId)
        {
            RoomProfile bo = new RoomProfile(DatabaseStatus.Exists);
            bo.RoomProfileId = roomProfileId;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        //private static readonly ObjectPopulator _getDataAccesserByQuoteIDRoomID = new ObjectPopulator("SELECT * FROM dbo.RoomProfile WHERE (QuoteID=@QuoteID AND RoomID=@RoomID)");
        //public static RoomProfile TryGet(int quoteId, int roomId)
        //{
        //    RoomProfile bo = new RoomProfile(DatabaseStatus.Exists);
        //    bo._quoteId = quoteId;
        //    bo._roomId = roomId;

        //    if (_getDataAccesserByQuoteIDRoomID.TryToPopulateBusinessObject(bo))
        //        return bo;
        //    else
        //        return null;
        //}

        #endregion

        #region Insert / Update

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.RoomProfile(RoomID, QuoteId, Quantity)
VALUES(@RoomID, @QuoteId, @Quantity)
");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.RoomProfile 
SET RoomID = @RoomID, QuoteId = @QuoteId, Quantity = @Quantity
WHERE (RoomProfileID = @RoomProfileID)");


        public override void Save()
        {
            Save(this, _insertDataAccesser, _updateDataAccesser);
        }

        public static void Delete(int roomProfileID)
        {
            ExecuteNonQuery(@"BEGIN TRANSACTION
DECLARE @@QuoteID INT
DECLARE @@RoomID  INT

SELECT @@QuoteId=QuoteID, @@RoomID=RoomID
FROM   dbo.RoomProfile
WHERE  (RoomProfileID = @RoomProfileID)

DELETE FROM dbo.RoomProfile WHERE (RoomProfileID = @RoomProfileID)
DELETE FROM dbo.QuotesRooms WHERE (QuoteID=@@QuoteID AND RoomID=@@RoomID)
DELETE FROM dbo.QuotesInventory WHERE (QuoteID=@@QuoteID AND RoomID=@@RoomID)

COMMIT TRANSACTION", roomProfileID);
        }
        #endregion

        #region GetLists (static)

        public static DataTable GetAllRooms(int quoteID)
        {
            return GetDataTable(@"SELECT r.RoomID, r.RoomName, r.Ordinal, rp.RoomProfileID, ISNULL(rp.Quantity, 0) AS Quantity
FROM Rooms r LEFT OUTER JOIN
     RoomProfile rp ON r.RoomID = rp.RoomID AND rp.QuoteID = @QuoteID
ORDER BY ordinal", quoteID);
        }

        #endregion
    }
}
