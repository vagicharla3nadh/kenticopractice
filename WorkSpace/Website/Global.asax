<%@ Application Language="C#" %>
<%@ Import Namespace="FAC.Web.Exceptions" %>
<%@ Import Namespace="FAC.BusinessDataAccess" %>
<%@ Import Namespace="FAC.BusinessDataAccess.DatabaseVersioning" %>
<%@ Import Namespace="FAC.Web.Logging" %>
<%@ Import Namespace="FAC.Web.BusinessModel" %>

<script RunAt="server">

    private static Object lockObject = new Object();
    
    void Application_Start(object sender, EventArgs e)
    {
        TrySetup();
    }

    void Application_BeginRequest()
    {
        // Rarely on ICO1, sql server isn't quite ready after a server restart, so if at first you dont succeed....
        if (!DatabaseConfigurationStatus.Succeed)
        {
            lock (lockObject) // only bother getting the thread safe value if the non safe value if false, which should be rare
            {
                if (!DatabaseConfigurationStatus.Succeed) 
                    TrySetup();

                if (DatabaseConfigurationStatus.Succeed)
                    BusinessLog.LogMessage("Database Connection has been set on Application_BeginRequest");
            }
        } 
    }
    
    private void TrySetup()
    {
        
        try
        {
            BusinessLog.LogMessage(VersionUpgrader.UpgradeDatabaseNow("DBUpgrade"));
            BusinessDataAccess.SetDatabaseConfigEntry("Standard");

            DatabaseConfigurationStatus.Succeed = true;
        }
        catch (Exception ex)
        {
            DatabaseConfigurationStatus.Error = ex.Message;
            ExceptionManager.Publish(ex);

            return;
        }

        try { FAC.ReportViewer.DatabaseAccess.DatabaseConnectionString = ConfigurationManager.ConnectionStrings["Standard"].ConnectionString; }
        catch (Exception ex) { ExceptionManager.Publish(ex); }
        try { FAC.ReportViewer.DatabaseAccess.SetReportMetadata(CrownEstimates.Reporting.ReportHelper.CreateReportMetaDataDataTable()); }
        catch (Exception ex) { ExceptionManager.Publish(ex); }
        try { FAC.ReportViewer.ReportMetadata.ReportFileLocation = Server.MapPath("~") + "\\App_Code\\Reporting\\ReportDefinitions"; }
        catch (Exception ex) { ExceptionManager.Publish(ex); }

        try
        {
            UserConfiguration.SetupUserContexts();
            CurrentContext.SetupSetUserDelegate(u => { });
            CurrentContext.SetupGetUserDelegate(delegate { return new User(); } );
        }
        catch (Exception ex) { ExceptionManager.Publish(ex); throw; }
    }

    private class User : IUser
    {
        public short CompanyId { get { return -1; } }
        public string UserName { get { return "admin"; } }
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        ExceptionManager.LogWebApplicationError();
    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }
      
       
</script>

