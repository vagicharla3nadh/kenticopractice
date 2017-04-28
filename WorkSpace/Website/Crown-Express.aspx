<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Crown-Express.aspx.cs" Inherits="Crown_Express"
    ValidateRequest="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Crown Express</title>
    <link rel="stylesheet" href="estyle.css" type="text/css" media="screen" />
    <script type="text/javascript">
<!--
        function MM_openBrWindow(theURL, winName, features) { //v2.0
            window.open(theURL, winName, features);
        }   

//-->
    </script>
</head>
<body>
    <div id="container">
        <div id="left">
            <div id="header">
                <div id="logo">
                    <img src="images/elogo.gif" alt="Crown Relocations" /></div>
                <div id="title">
                    <h1>
                        <em>CrownExpress</em></h1>
                    <h2>
                        Your <em>Small</em> Moving Specialist</h2>
                </div>
                <!-- title ends -->
            </div>
            <div id="nav">
                <ul>
                    <li><a href="http://www.crownrelo.co.nz/about-us.html" target="_blank">About Us</a></li>
                    <li><a href="#" onclick="MM_openBrWindow('http://www.crownrelo.co.nz/packing-standards/packing-standards1.html','packing','width=632,height=700')">
                        Packing</a></li>
                    <li><a href="http://www.crownrelo.co.nz/international-relocations/moving-overseas.html"
                        target="_blank">Overseas Moves</a></li>
                    <li><a href="http://www.crownrelo.co.nz/moving-interisland.html" target="_blank">Domestic
                        Moves</a></li>
                </ul>
                <!-- nav ends -->
            </div>
            <div id="content">
                <p>
                    Crown Express offers a service for moving smaller furniture items or even just one
                    item across town or around New Zealand.
                </p>
                <p>
                    Our Service:</p>
                <ul>
                    <li>We can pack your items or you can pack your own</li>
                    <li>Experienced moving professionals</li>
                    <li>A trusted brand managing your small move</li>
                    <li>Specialised packing options if needed</li>
                    <li>Flexible pricing either fixed price or hourly rate</li>
                    <li>Insurance cover available for full protection</li>
                </ul>
                <h3>
                    Affordable + Easy + Quality = Crown Express</h3>
                <p>
                    The main centres we operate in are Auckland, Hamilton, Tauranga, Hastings, Napier,
                    Palmerston North, New Plymouth, Wellington, Nelson, Christchurch and Dunedin.</p>
                <!-- content ends -->
            </div>
            <!-- left ends -->
        </div>
        <div id="right">
            <div id="phone">
                <img src="images/ephone.gif" alt="Call us - 0800 456 879" /></div>
            <p>
                Alternatively fill out our online form and we'll give you a free, no-obligation
                quote by the next working day.</p>
<asp:Panel ID="__quetionnairePanel" runat="server">
            <div id="forms">
                <form runat="server" id="emailform">
                <br />
                   <asp:ValidationSummary BackColor="Yellow" ForeColor="Red" ID="vs1" runat="server" />
                <h2>
                    Contact Details</h2>
                <p>
                    Name:<br />
                    <asp:TextBox runat="server" id="txtName" maxlength="50" name="" type="text" />
                    <asp:RequiredFieldValidator ForeColor="Yellow" ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtName" ErrorMessage="Please provide your name so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </p>
                <p>
                    Daytime Telephone:<br />
                    <asp:TextBox runat="server" id="txtPhone" maxlength="15" name="" type="text" />
                    <asp:RequiredFieldValidator ForeColor="Yellow" ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtPhone" ErrorMessage="Please provide a daytime phone number so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </p>
                <p>
                    Email Address:<br />
                    <asp:TextBox runat="server" id="txtEmail" maxlength="80" name="" type="text" />
                    <asp:RequiredFieldValidator ID="rfv2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please provide your email address so we can contact you." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="cv1" runat="server" ControlToValidate="txtEmail" ErrorMessage="This does not appear to be a valid email address." OnServerValidate="CustomValidator1_ServerValidate" SetFocusOnError="True">*</asp:CustomValidator>
                    </p>
                <h2>
                    Move Details</h2>
                <p>
                    Moving From:<br />
                    <asp:TextBox runat="server" id="txtFrom" maxlength="50" name="" type="text" />
                    <asp:RequiredFieldValidator ForeColor="Yellow" ID="rfv3" runat="server" ControlToValidate="txtFrom" ErrorMessage="Please provide the Current Location." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </p>
                <p>
                    Moving To:<br />
                    <asp:TextBox runat="server" id="txtTo" maxlength="50" name="" type="text" />
                    <asp:RequiredFieldValidator ForeColor="Yellow" ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTo" ErrorMessage="Please provide where to move the goods to." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </p>
                <p>
                    Preferred Uplift Date:<br />
                    <asp:TextBox runat="server" id="txtUplift" maxlength="50" name="" type="text" />
                    <asp:RequiredFieldValidator ForeColor="Yellow" ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUplift" ErrorMessage="Please provide the approximate date for the move." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </p>
                <p>
                    Items to be Moved<br />
                    <asp:TextBox runat="server" id="txtItems" maxlength="1000" name="" cols="10" rows="2"></asp:TextBox>
                    <asp:RequiredFieldValidator ForeColor="Yellow" ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtItems" ErrorMessage="Please provide a list of the items to move." SetFocusOnError="True">*</asp:RequiredFieldValidator>
                    </p>
                <p>
                    Additional Information:<br />
                    <asp:TextBox runat="server" id="txtAdditionalInfo" maxlength="1000" name="" cols="10"
                        rows="2"></asp:TextBox></p>
                <br />
                <p>
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
                </p>
                </form>
                <!-- forms ends -->   
             </div>
</asp:Panel>
   <asp:Panel ID="__confirmationPanel" Visible="false" runat="server"  BorderStyle="None" Font-Bold="True" ForeColor="#CC0000">
        <div id="thanks"><br />
            <p>Thank You!</p>
            <p>Your details have been sent to Crown Relocations.</p> <p>One of our team will be in touch with you soon. </p> 
        </div>
    </asp:Panel>
         
            <!-- right ends -->
        </div>
        <!-- container ends -->
    </div>
</body>
</html>
