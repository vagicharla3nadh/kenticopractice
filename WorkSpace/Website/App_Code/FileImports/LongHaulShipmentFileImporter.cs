using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using FAC.Web.ImportFile;
using CrownEstimates.BusinessModel;
using System.Text;

namespace CrownEstimates.FileImports
{
    public class LongHaulShipmentFileImporter : FileImporter
    {
        protected override void Initialize()
        {
            base.Initialize();
        }

        protected override void ValidateRecord()
        {
            GetStringNull("Reference");
            GetCity("From City");
            GetCity("To City");
            GetDate("Cut Off Day");
            GetDate("Arrival Day");
            GetInt32Null("Transit Time");

            base.ValidateRecord();
        }


        protected override FileImporterInternal.ProcessRecordResult ProcessRecord()
        {
            if (CurrentRecord.IsEmpty) return ProcessRecordResult.Skipped;

            LongHaulShipment lhs = LongHaulShipment.TryGet(GetStringNull("Reference")) ?? LongHaulShipment.Create();

            lhs.ShipmentRef = GetStringNull("Reference");
            lhs.FromCity = GetCity("From City");
            lhs.ToCity = GetCity("To City");
            lhs.CutoffDate = GetDate("Cut Off Day");
            lhs.ArrivalDate = GetDate("Arrival Day");
            lhs.TransitTime = GetInt32Null("Transit Time");

            lhs.Save();

            return ProcessRecordResult.Added;
        }

        protected override void Complete()
        {
            base.Complete();
        }


        private static string[] _validCities = new string[] { "Southland", "Otago", "Canterbury/West Coast", "Nelson/Marlborough", "Wellington", "Wanganui/Manawatu", "Hawkes Bay/Wairarapa", "Bay of Plenty", "Taranaki", "Waikato", "Auckland", "Northland" };
        
        private string GetCity(string columnName)
        {
            string city = GetString(columnName);

            foreach (var vc in _validCities)
                if (String.Compare(vc, city, true) == 0)
                    return vc;

            throw new InvalidDataException(String.Format("{0} is not a valid city, must be one of {1}", city, GetValidCities()));
        }

        private string GetValidCities()
        {
            StringBuilder sb = new StringBuilder();
            foreach (string c in _validCities)
            {
                if(sb.Length > 0) sb.Append(", ");

                sb.Append(c);
            }
            return sb.ToString();
        }
    }
}