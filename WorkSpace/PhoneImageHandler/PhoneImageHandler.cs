using System.IO;
using System.Web;
using System.Globalization;
using System;
using System.Web.SessionState;
using System.Configuration;
//using System.Web.Configuration;
//using System.Net.Configuration;

/// <summary>
/// If user has come from selected external referrer sites, show a different phone number image.
/// 
/// NRM internal testing:
/// - make a simple test site in IIS on your own machine with just a.html in it.  
/// - Edit the page to refer to the development site using the .../localhost:1234/ format
/// - browse to it using http://machinename/a.html  ie, not using localhost.
/// - click the links and your dev copy should fire and be debuggable.
/// 
/// </summary>

namespace CrownEstimate.PhoneImageHandler
{
    public class PhoneImageHandler : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(System.Web.HttpContext ctx)
        {
            // ctx.Response.StatusCode = 404;   // Easy way to tell if it is working, all images will not be found...
            // return;

            HttpRequest req = ctx.Request;
            string path = req.PhysicalPath.ToLower();
            string extension = null;

            // if referring domain was external, and the image is one of the ones to swap, then do the swap.
            string referDomain = (HttpContext.Current.Session["referer"] as string ?? req.Url.Host).ToLower();
            if (( ConfigurationManager.AppSettings.Get("ExternalDomains") ??"").Contains( referDomain ) ) //req.Url.Host.ToLower()
            {
                if (CultureInfo.InvariantCulture.CompareInfo.Compare( Path.GetFileName(path), "phone.gif", CompareOptions.IgnoreCase) == 0
                    || CultureInfo.InvariantCulture.CompareInfo.Compare(Path.GetFileName(path), "call-us-header.gif", CompareOptions.IgnoreCase) == 0
                    || CultureInfo.InvariantCulture.CompareInfo.Compare(Path.GetFileName(path), "call-us.jpg", CompareOptions.IgnoreCase) == 0
                    || CultureInfo.InvariantCulture.CompareInfo.Compare(Path.GetFileName(path), "call-free.gif", CompareOptions.IgnoreCase) == 0
                    || CultureInfo.InvariantCulture.CompareInfo.Compare(Path.GetFileName(path), "call-free.jpg", CompareOptions.IgnoreCase) == 0)
                {
                    path = path.Replace(".jpg", "-a.jpg");
                    path = path.Replace(".gif", "-a.gif");
                }
            }
            
            string contentType = null;
            extension = Path.GetExtension(path).ToLower();
            switch (extension)
            {
                case ".gif":
                    contentType = "image/gif";
                    break;
                case ".jpg":
                    contentType = "image/jpeg";
                    break;
                case ".png":
                    contentType = "image/png";
                    break;
                default:
                    throw new NotSupportedException("Unrecognized image type.");
            } 
            
            if (!File.Exists(path))
            {                
                ctx.Response.StatusCode = 404;
                //ctx.Response.Status = "Image not found";
            }
            else
            {
                ctx.Response.StatusCode = 200;
                ctx.Response.ContentType = contentType;
                ctx.Response.WriteFile(path);
            }
        }

        public bool IsReusable { get { return true; } }
    }

}