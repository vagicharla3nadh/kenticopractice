using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FAC.Web.ImportFile;
using CrownEstimates.BusinessModel;
using System.Text;

namespace CrownEstimates.FileImports
{
    public class DealFileImporter : FileImporter
    {
        public bool IsDealNational { get; set; }

        protected override void Initialize()
        {
            base.Initialize();
        }

        protected override void ValidateRecord()
        {
            GetStringNull("Reference");
            GetString("Destination Region");
            GetString("Destination Port");
            GetDate("Date Closing");
            GetString("Departing From");

            base.ValidateRecord();
        }

        protected override FileImporterInternal.ProcessRecordResult ProcessRecord()
        {
            if (CurrentRecord.IsEmpty) return ProcessRecordResult.Skipped;

            Deals d = Deals.TryGet(GetStringNull("Reference")) ?? Deals.Create();

            d.DealRef = GetStringNull("Reference");
            d.DestinationRegion = GetString("Destination Region");
            d.DestinationPort = GetString("Destination Port");
            d.DateClosing = GetDate("Date Closing");
            d.DepartingFrom = GetString("Departing From");
            d.IsDealNational = IsDealNational;

            d.Save();

            return ProcessRecordResult.Added;
        }

        protected override void Complete()
        {
            base.Complete();
        }
    }
}