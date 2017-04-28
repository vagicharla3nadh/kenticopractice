using System;
using System.Collections.Generic;
using System.Text;
using FAC.BusinessDataAccess;
using System.Data;


namespace CrownEstimates.BusinessModel
{
    public class QuotesRooms : CrownEstimatesBusinessObject<QuotesRooms>
    {
        #region Public Properties

        public int QuoteRoomId { get; private set; }

        public int QuoteId { get; set; }
        public int RoomId { get; set; }
        public bool IsComplete { get; set; }
        public int RoomNo { get; set; }
        #endregion

        #region Get/Create

        private QuotesRooms(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static QuotesRooms Create()
        {
            return new QuotesRooms(DatabaseStatus.DoesNotExist);
        }


        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.QuotesRooms WHERE (QuoteRoomID = @QuoteRoomID)");
        public static QuotesRooms Get(int quoteRoomId)
        {
            QuotesRooms bo = new QuotesRooms(DatabaseStatus.Exists);
            bo.QuoteRoomId = quoteRoomId;
            _getDataAccesser.Execute(bo);
            return bo;
        }


        private static readonly ListRetriever _getListAccesser = new ListRetriever("SELECT * FROM dbo.QuotesRooms WHERE (QuoteID = @QuoteID) AND RoomID=@RoomID ORDER BY RoomNo desc");
        #endregion

        #region Insert / Update /Delete

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.QuotesRooms(QuoteID, RoomID, IsComplete, RoomNo)
VALUES(@QuoteID, @RoomID, @IsComplete, @RoomNo)
SELECT CAST(SCOPE_IDENTITY() AS INT) AS QuoteRoomID");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.QuotesRooms 
SET QuoteID = @QuoteID, RoomID = @RoomID, IsComplete = @IsComplete, RoomNo=@RoomNo
WHERE (QuoteRoomID = @QuoteRoomID)");


        public override void Save()
        {
            Save(this, _insertDataAccesser, _updateDataAccesser);
        }

        public void Delete()
        {
            Delete(QuoteRoomId);
        }
        public static void Delete(int quoteRoomID)
        {
            ExecuteNonQuery(@"DELETE FROM dbo.QuotesRooms WHERE (QuoteRoomID = @QuoteRoomID)
                              DELETE FROM dbo.QuotesInventory WHERE (QuotesRoomID = @QuoteRoomID)", quoteRoomID);
        }

        public static List<QuotesRooms> GetQuotesRoomsList(int quoteID, int RoomID)
        {
            return _getListAccesser.GetList(quoteID, RoomID);
        }

        #endregion

        #region GetLists (static)


        public static DataTable GetAllRooms(int QuoteID)
        {
            /*
                declare @QuoteID int
                set @quoteID = 1
             */
            return GetDataTable(@"
SELECT
	r.RoomID as RoomID,
	r.RoomName as RoomName,
	r.Ordinal as Ordinal,
    CASE WHEN qr.QuoteRoomID IS NULL THEN CAST(0 AS BIT) ELSE CAST(1 AS BIT) END AS RoomIsSelected,
	qr.QuoteRoomID as QuoteRoomID,
	qr.QuoteID as QuoteID,
	qr.IsComplete as IsComplete
FROM Rooms r  
	LEFT OUTER JOIN QuotesRooms qr ON r.RoomID = qr.RoomID AND qr.QuoteID = @QuoteID

ORDER BY ordinal", QuoteID);
        }

        public static DataTable GetSelectedRoomsForQuote(int quoteID)
        {
            return GetDataTable(@"
SELECT
	r.RoomID,
	r.RoomName,
	r.Ordinal,
    ISNULL((SELECT SUM(Quantity) FROM QuotesInventory WHERE QuotesRoomID=qr.QuoteRoomID), 0) AS ItemsSlected, 
    qr.RoomNo,
    qr.QuoteRoomID
FROM Rooms r INNER JOIN QuotesRooms qr ON r.RoomID = qr.RoomID AND qr.QuoteID = @QuoteID
ORDER BY r.Ordinal", quoteID);
        }


        #endregion
    }
}
