using System;
using System.Collections.Generic;
using System.Text;
using FAC.BusinessDataAccess;


namespace CrownEstimates.BusinessModel
{
    public class Rooms : CrownEstimatesBusinessObject<Rooms>
    {

        #region Public Properties

        public int RoomId { get; private set; }

        public string RoomName { get; set; }
        public int Ordinal { get; set; }
        #endregion

        #region Get/Create

        private Rooms(DatabaseStatus databaseStatus) : base(databaseStatus) { }

        public static Rooms Create()
        {
            return new Rooms(DatabaseStatus.DoesNotExist);
        }


        private static readonly ObjectPopulator _getDataAccesser = new UserAwareObjectPopulator2("SELECT * FROM dbo.Rooms WHERE (RoomID = @RoomID)");
        public static Rooms Get(int roomId)
        {
            Rooms bo = new Rooms(DatabaseStatus.Exists);
            bo.RoomId = roomId;
            _getDataAccesser.Execute(bo);
            return bo;
        }

        #endregion

        #region Insert / Update

        private static readonly ObjectPopulator _insertDataAccesser = new UserAwareObjectPopulator2(@"
INSERT INTO dbo.Rooms(RoomName, Ordinal)
VALUES(@RoomName, @Ordinal)
SELECT CAST(SCOPE_IDENTITY() AS INT) AS RoomID");

        private static readonly ObjectPopulator _updateDataAccesser = new UserAwareObjectPopulator2(@"
UPDATE dbo.Rooms 
SET RoomName = @RoomName, Ordinal = @Ordinal
WHERE (RoomID = @RoomID)");


        public override void Save()
        {
            Save(this, _insertDataAccesser, _updateDataAccesser);
        }
        #endregion

        #region GetLists (static)
        #endregion
    }
}
