using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrownEstimates.BusinessModel;
using System.Web.Configuration;
using System.Text;

public partial class Crown_Express : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = EmailHelper.ValidateEmail(args.Value);

    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (!Page.IsValid)
        {            
            return;
        }
    

        EnquiryEmail ee = new EnquiryEmail();
        ee.FromAddress = txtEmail.Text;
        ee.Subject = string.Format("Small Move Enquiry ({0}) - ({1})", txtFrom.Text, txtTo.Text);
        ee.ToAddress = EmailHelper.CrownEmailAddress;
        ee.CustomerName = txtName.Text;

        StringBuilder sb = new StringBuilder();
        sb.AppendLine("Name:                " + txtName.Text);
        sb.AppendLine("Email:               " + txtEmail.Text);
        sb.AppendLine("Phone (day):         " + txtPhone.Text);        
        sb.AppendLine("Current Location:    " + txtFrom.Text);        
        sb.AppendLine("New Location:        " + txtTo.Text);
        sb.AppendLine("Date to uplift:      " + txtUplift.Text);
        sb.AppendLine("Items to move:       " + txtItems.Text);
        sb.AppendLine("");
        sb.AppendLine("Additional Info:     " + txtAdditionalInfo.Text);       
        ee.Body = sb.ToString();        
        //ee.Save();

        EmailHelper.SendPlainEmail(sb.ToString(), ee.Subject, ee.ToAddress, ee.FromAddress );

//        EmailHelper.SendPlainEmail(string.Format(@"Dear {0}
//
//Thank you for your enquiry via our Crown Relocations website. As a specialist in the provision of Settling in services, Crown is ideally positioned to assist you to settle when you first arrive in New Zealand. Our dedicated staff are trained to ensure the smoothest transition possible.
//
//We will be contacting you within the next 24 hours to discuss your needs, if there are any times that are inconvenient please let us know.
//
//Thank you for considering Crown Relocations, we look forward to speaking with you and to being of assistance.
//
//Kind regards from the team at Crown Relocations!
//        
//www.crownrelo.co.nz
//Freephone: 0508 227 696  (international callers phone: +64 9 415 7300).{1}Please do not reply to this email. This email was sent from an unattended mailbox.
//", ee.CustomerName, Environment.NewLine)
// , "Fresh Start - Crown Relocations", ee.FromAddress, ee.ToAddress);


               
        __confirmationPanel.Visible = true;
        __quetionnairePanel.Visible = false;


    
    }
}