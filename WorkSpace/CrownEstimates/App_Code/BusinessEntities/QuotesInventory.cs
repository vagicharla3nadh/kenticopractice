using System;
using System.Collections.Generic;
using System.Text;
using FAC.BusinessDataAccess;
using System.Data;


namespace CrownEstimates.BusinessModel
{
    public class QuotesInventory : CrownEstimatesBusinessObject<QuotesInventory>
    {

        #region Public Properties

        public int QuoteInventoryId { get; private set; }

        public int QuoteId { get; set; }
        public int RoomId { get; set; }
        public int InventoryId { get; set; }
        public int Quantity { get; set; }
        public int QuotesRoomID { get; set; }

        #endregion

        #region Get/Create

        private QuotesInventory(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static QuotesInventory Create()
        {
            return new QuotesInventory(DatabaseStatus.DoesNotExist);
        }


        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.QuotesInventory WHERE (QuoteInventoryID = @QuoteInventoryID)");
        public static QuotesInventory Get(int quoteInventoryId)
        {
            QuotesInventory bo = new QuotesInventory(DatabaseStatus.Exists);
            bo.QuoteInventoryId = quoteInventoryId;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        #endregion

        #region Insert / Update /Delete

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.QuotesInventory(QuoteID, RoomID, InventoryID, Quantity, QuotesRoomID)
VALUES(@QuoteID, @RoomID, @InventoryID, @Quantity, @QuotesRoomID)
SELECT CAST(SCOPE_IDENTITY() AS INT) AS QuoteInventoryID");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.QuotesInventory 
SET QuoteID = @QuoteID, RoomID = @RoomID, InventoryID = @InventoryID, Quantity = @Quantity, QuotesRoomID=@QuotesRoomID
WHERE (QuoteInventoryID = @QuoteInventoryID)");


        public override void Save()
        {
            Save(this, _insertDataAccesser, _updateDataAccesser);
        }

        public static void Delete(int quoteInventoryID)
        {
            ExecuteNonQuery("DELETE FROM dbo.QuotesInventory WHERE (QuoteInventoryID = @QuoteInventoryID)", quoteInventoryID);
        }

        #endregion

        #region GetLists (static)

        public static System.Data.DataTable GetRoomInventoryItems(int QuotesRoomID)
        {
            //>99 = item, <=99=carton
            return GetDataTable(@"SELECT
    ri.RoomID,
    ri.Ordinal,
    i.InventoryName,
    i.InventoryID,  
    i.Dimension,
    i.ImageFilename,
    i.InventoryDescription,
    qi.QuoteID,
    qi.QuoteInventoryID,
    qi.Quantity, 
    @QuotesRoomID as QuotesRoomID
FROM QuotesRooms qr
    INNER JOIN QuotesInventory qi on qr.QuoteRoomID = qi.QuotesRoomID
    LEFT OUTER JOIN RoomsInventory ri on ri.RoomID = qi.RoomID and qi.inventoryid = ri.inventoryid
    INNER JOIN Inventory i on ri.inventoryID = i.inventoryid
WHERE QuoteRoomID = @QuotesRoomID and ri.Ordinal > 99

UNION

SELECT 
    ri.RoomID,
    ri.Ordinal,
    i.InventoryName,
    i.InventoryID,  
    i.Dimension,
    i.ImageFilename,
    i.InventoryDescription,
    qi.QuoteID,
    qi.QuoteInventoryID ,
    qi.Quantity, 
    @QuotesRoomID as QuotesRoomID
FROM QuotesRooms qr
    INNER JOIN RoomsInventory ri on ri.RoomID = qr.RoomID
    INNER JOIN Inventory i on ri.inventoryid = i.inventoryid
    LEFT JOIN QuotesInventory qi on qi.inventoryid = ri.inventoryid and qi.QuotesRoomID = qr.QuoteRoomID
WHERE QuoteRoomID = @QuotesRoomID and ri.Ordinal > 99 AND ri.inventoryid NOT IN (SELECT inventoryid from QuotesInventory WHERE QuotesRoomID = @QuotesRoomID)

ORDER BY ri.ordinal", QuotesRoomID);
        }

        public static DataTable GetRoomInventoryCartons(int QuotesRoomID)
        {
            //>99 = item, <=99=carton
            return GetDataTable(@"SELECT
    ri.RoomID,
    ri.Ordinal,
    i.InventoryName,
    i.InventoryID,  
    i.Dimension,
    i.ImageFilename,
    i.InventoryDescription,
    qi.QuoteID,
    qi.QuoteInventoryID,
    qi.Quantity, 
    @QuotesRoomID as QuotesRoomID
FROM QuotesRooms qr
    INNER JOIN QuotesInventory qi on qr.QuoteRoomID = qi.QuotesRoomID
    LEFT OUTER JOIN RoomsInventory ri on ri.RoomID = qi.RoomID and qi.inventoryid = ri.inventoryid
    INNER JOIN Inventory i on ri.inventoryID = i.inventoryid
WHERE QuoteRoomID = @QuotesRoomID and ri.Ordinal <= 99

UNION

SELECT 
    ri.RoomID,
    ri.Ordinal,
    i.InventoryName,
    i.InventoryID,  
    i.Dimension,
    i.ImageFilename,
    i.InventoryDescription,
    qi.QuoteID,
    qi.QuoteInventoryID,
    qi.Quantity as Quantity, 
    @QuotesRoomID as QuotesRoomID
FROM QuotesRooms qr
    INNER JOIN RoomsInventory ri on ri.RoomID = qr.RoomID
    INNER JOIN Inventory i on ri.inventoryid = i.inventoryid
    LEFT JOIN QuotesInventory qi on qi.inventoryid = ri.inventoryid and qi.QuotesRoomID = qr.QuoteRoomID
WHERE QuoteRoomID = @QuotesRoomID and ri.Ordinal <= 99 AND ri.inventoryid NOT IN (SELECT inventoryid from QuotesInventory WHERE QuotesRoomID = @QuotesRoomID)

ORDER BY ri.ordinal", QuotesRoomID);
        }

        #endregion
    }
}
