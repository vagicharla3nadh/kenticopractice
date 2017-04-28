using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using FAC.BusinessDataAccess.DatabaseVersioning;

[ContainsUpgradeActions]
public static class UpgradeScripts
{
    public static void AddUpgradeActions(VersionUpgrader.ActionList al)
    {
        // 1 is reserved for reports

        #region 2 February 2011

        al.Add("2.1", "CR", @"CREATE NONCLUSTERED INDEX [IX_RoomProfile_QuoteId_RoomID] ON [dbo].[RoomProfile] ([QuoteId] ASC, 	[RoomID] ASC)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
        al.Add("2.2", "CR", @"CREATE NONCLUSTERED INDEX [IX_QuotesInventory_QuotesRoomID_InventoryID] ON [dbo].[QuotesInventory] ( [QuotesRoomID] ASC, [InventoryID] ASC )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
        al.Add("2.3", "CR", @"CREATE NONCLUSTERED INDEX [IX_QuotesRooms_QuoteId_RoomID] ON [dbo].[QuotesRooms] ([QuoteId] ASC,	[RoomID] ASC)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]");
        al.Add("2.4", "CR", @"CREATE TABLE [dbo].[FileImport](
	[FileImportID] [int] IDENTITY(1,1) NOT NULL,
	[StartedOn] [datetime] NOT NULL,
	[CompletedOn] [datetime] NULL,
	[TypeCode] [varchar](10) NOT NULL,
	[NumberImported] [int] NOT NULL,
	[NumberRejected] [int] NOT NULL,
	[NumberToImport] [int] NOT NULL,
	[ImportStatus] [varchar](50) NOT NULL,
	[NumberExistingNotUpdated] [int] NOT NULL,
 CONSTRAINT [PK_FileImport] PRIMARY KEY CLUSTERED 
(
	[FileImportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]");


        #endregion

    }
}
