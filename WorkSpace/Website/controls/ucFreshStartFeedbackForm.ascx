<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ucFreshStartFeedbackForm.ascx.cs" Inherits="controls_FeedbackForm" %>
<div id="movingnz-form">

    <asp:Panel ID="__quetionnairePanel" runat="server">
        <h3>Questionnaire</h3>
        <asp:ValidationSummary ID="vs1" runat="server" />
        <table border="0" cellspacing="0" cellpadding="0">
            <tr class="grey-row">
                <td>Your Name:</td>
                <td><asp:TextBox ID="__name" runat="server" MaxLength="50"/></td>
                <td><asp:RequiredFieldValidator ID="rfv1" runat="server" ControlToValidate="__name" ErrorMessage="Please provide your name so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td>Your Email Address:</td>
                <td><asp:TextBox ID="__email" runat="server" MaxLength="50"/><br /></td>
                <td valign="middle"><asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="__email" ErrorMessage="Please provide your email address so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
                <td><asp:CustomValidator ID="cv1" runat="server" ControlToValidate="__email" ErrorMessage="This does not appear to be a valid email address." OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator></td>
            </tr>
            <tr class="grey-row">
                <td>Phone (Evenings):</td>
                <td><asp:TextBox ID="__phoneEvening" runat="server" MaxLength="50"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Phone (Mobile):</td>
                <td><asp:TextBox ID="__phoneMobile" runat="server" MaxLength="50"/></td>
                <td></td>
            </tr>
           
            <tr>
                <td>Family Size:</td>
                <td>
                    <label>
                        <select id="__numberOfChildren" runat="server" name="select" size="1">
                            <option selected="selected">1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6 +</option>
                        </select>
                    </label>
                </td>
                <td></td>
            </tr>
            <tr class="grey-row">
                <td>Current City/Country:</td>
                <td><asp:TextBox ID="__currentLocation" runat="server" MaxLength="50"/></td>
                <td><asp:RequiredFieldValidator ID="rfv3" runat="server" ControlToValidate="__currentLocation" ErrorMessage="Please provide your Current Location (country and city preferred)." SetFocusOnError="True">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr class="grey-row">
                <td>New City (NZ):</td>
                <td><asp:TextBox ID="__newCity" runat="server" MaxLength="50"/></td>
                <td></td>
            </tr>
            <tr>
                <td>Arrival Date (Permanent):</td>
                <td><asp:TextBox ID="__arrivalPermanent" runat="server" MaxLength="50"/></td>
                <td></td>
            </tr>
        </table>
        
        <p><h3>Comments and/or questions?</h3></p>
        <p><label><asp:TextBox ID="__commentsQuestions" runat="server" MaxLength="2000" Rows="5" TextMode="MultiLine" Width="400px"/></label></p>
        <p>
            <captcha:CaptchaControl id="cc1" runat="server" CaptchaMaxTimeout="720" CaptchaMinTimeout="3" CacheStrategy="Session"  CaptchaBackgroundNoise="Extreme" CaptchaFontWarping="Medium" ></captcha:CaptchaControl>
			&nbsp;
            <label>&nbsp;</label>
            <asp:Button ID="__submit" runat="server" Text="Submit" OnClick="__submit_Click" />
        </p>
        <br />
    </asp:Panel>
    
    <asp:Panel ID="__confirmationPanel" Visible="false" runat="server" BackColor="#CCCCCC" BorderStyle="None" Font-Bold="True" ForeColor="#CC0000">
        <div id="thanks">
            <p>Thank You!</p>
            <p>Your details have been sent to Crown Relocations.</p> <p>One of our representatives will be in touch with you soon. </p> 
        </div>
    </asp:Panel>
    
</div>
