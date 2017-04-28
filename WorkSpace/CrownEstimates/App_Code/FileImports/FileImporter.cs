using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using FAC.Web.ImportFile;
using System.IO;
using FAC.Web.Exceptions;

namespace CrownEstimates.FileImports
{
    public abstract class FileImporter : FileImporter2
    {
        protected override int BailOutPoint { get { return 1; } }

        public FileImporter() { }

        protected override string GetFileImportTypeCode()
        {
            return GetType().Name.Replace("FileImporter", string.Empty);
        }


        protected override void PublishException(Exception ex)
        {
            ExceptionManager.Publish(ex);
        }

        protected override Stream CreateDataStream(byte[] data)
        {
            MemoryStream ms = new MemoryStream(data, false);
            //try
            //{
            //    BufferedZipInputStream unzipper = new BufferedZipInputStream(ms, 4096);
            //    unzipper.GetNextEntry();
            //    return unzipper;
            //}
            //catch (ZipException ex)
            //{
            //    if (!ex.Message.StartsWith("Wrong Local header signature:"))
            //        throw;

            //    ms.Position = 0;
            return ms;
            //}
        }

        protected DateTime GetDate(string columnName)
        {
            string x = GetString(columnName);
            try
            {
                // if (!String.IsNullOrEmpty(x))
                return DateTime.ParseExact(x, "d/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            }
            catch (FormatException ex)
            {
                throw new InvalidDataException(String.Format("'{0}' is not in the correct date format, must be d/MM/yyyy", x), ex);
            }
        }

    }
}