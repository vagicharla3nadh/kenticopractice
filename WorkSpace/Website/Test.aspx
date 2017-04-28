<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <label> Quote ID: </label> &nbsp;&nbsp;&nbsp;  <asp:TextBox ID="txtQuoteId" runat="server"></asp:TextBox> &nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="rfvQuote" runat="server" ControlToValidate="txtQuoteId" ForeColor="Red" 
            ErrorMessage="Enter QuoteId" SetFocusOnError="true" Text="Enter QuoteId" />
        <br />
        <br />
        <asp:Button ID="btnUpdateQuote" runat="server" Text="Update Quote" OnClick="btnUpdateQuote_Click" />
    </div>
    </form>
</body>
</html>
