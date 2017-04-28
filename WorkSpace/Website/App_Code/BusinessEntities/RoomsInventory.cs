using System;
using System.Collections.Generic;
using System.Text;
using FAC.BusinessDataAccess;


namespace CrownEstimates.BusinessModel
{
    public class RoomsInventory : CrownEstimatesBusinessObject<RoomsInventory>
    {
        #region Public Properties

        public int RoomInventoryId { get; private set; }

        public int RoomId { get; set; }
        public int InventoryId { get; set; }
        public int Ordinal { get; set; }
        #endregion

        #region Get/Create

        private RoomsInventory(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static RoomsInventory Create()
        {
            return new RoomsInventory(DatabaseStatus.DoesNotExist);
        }

        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.RoomsInventory WHERE (RoomInventoryID = @RoomInventoryID)");
        
        public static RoomsInventory Get(int roomInventoryId)
        {
            RoomsInventory bo = new RoomsInventory(DatabaseStatus.Exists);
            bo.RoomInventoryId = roomInventoryId;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        #endregion

        #region Insert / Update

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.RoomsInventory(RoomID, InventoryID, Ordinal)
VALUES(@RoomID, @InventoryID, @Ordinal)
SELECT CAST(SCOPE_IDENTITY() AS INT) AS RoomInventoryID");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.RoomsInventory 
SET RoomID = @RoomID, InventoryID = @InventoryID, Ordinal = @Ordinal
WHERE (RoomInventoryID = @RoomInventoryID)");


        public override void Save()
        {
            Save(this, _insertDataAccesser, _updateDataAccesser);
        }
        #endregion

        #region GetLists (static)
        #endregion
    }
}
