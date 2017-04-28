<%@ Page Title="Inter-island Administration" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="InterIslandAdmin.aspx.cs" Inherits="admin_InterIslandAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph1" Runat="Server">

<h1>Inter-island Administration</h1>

		
<table width="100%">
<tr>
    <td valign="top" style="width:50%">
        <h2>New Shipment</h2>
        <asp:Label ID="lbMessage" runat="server" EnableViewState="false" Font-Bold="true" ForeColor="red" /><br />
		
        <asp:HiddenField ID="hdShipmentID" runat="server" />
	
        From City:<br />
        <asp:DropDownList ID="ddFrom" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Auckland</asp:ListItem>
            <asp:ListItem>Bay of Plenty</asp:ListItem>
            <asp:ListItem>Taranaki</asp:ListItem>
            <asp:ListItem>Wellington</asp:ListItem>
            <asp:ListItem>Nelson/Marlborough</asp:ListItem>
            <asp:ListItem>Canterbury/West Coast</asp:ListItem>
            <asp:ListItem>Otago</asp:ListItem>
        </asp:DropDownList>
        &nbsp; -&nbsp; <asp:TextBox ID="txtDepartingFrom" runat="server" Width="140px"/><br />
        <br />            
        To City:<br />
        <asp:DropDownList ID="ddDestination" runat="server">
            <asp:ListItem></asp:ListItem>
            <asp:ListItem>Auckland</asp:ListItem>
            <asp:ListItem>Bay of Plenty</asp:ListItem>
            <asp:ListItem>Hawkes Bay/Wairarapa</asp:ListItem>
            <asp:ListItem>Taranaki</asp:ListItem>
            <asp:ListItem>Wellington</asp:ListItem>
            <asp:ListItem>Nelson/Marlborough</asp:ListItem>
            <asp:ListItem>Canterbury/West Coast</asp:ListItem>
            <asp:ListItem>Otago</asp:ListItem>
        </asp:DropDownList>
        &nbsp; -&nbsp;
        <asp:TextBox ID="txtDestinationPort" runat="server" Width="140px"/>            
        <br />
                       
        <br />
        Reference:<br />
        <asp:TextBox ID="txtDealRef" runat="server" Width="140px"/>
        <br />
            
        <br />
        <table> 
        <tr> 
            <td>Cutoff Date:</td>
            <td>Arrival Date:</td>
        </tr>
        <tr>
            <td><uc:DatePicker id="ctrlCutoffDate" runat="server" AutoPostBack="True"/></td>
            <td><uc:DatePicker id="ctrlArrivalDate" runat="server" AutoPostBack="True"/></td>
        </tr>      
        </table>
        <br />
        Transit Days: <asp:TextBox ID="txtTransitTime" runat="server" Width="140px"/>
        <br />
        <br />
        <asp:Button ID="btnCreateUpdate" runat="server" Text="Create Shipment" OnClick="btnCreateUpdate_Click" />
    </td>

    <td style="width:10px; border-left:1px solid lightgrey;"></td>
    <td style="width:10px;"></td>

    <td valign="top" style="width:50%;">
        <h2>Import Shipments</h2>
        <asp:Label ID="lbImportMessage" runat="server" EnableViewState="false" Font-Bold="true" ForeColor="red" />

        <table width="100%">
            <tr>
                <td>CSV File:</td>
                <td></td>
            </tr>
            <tr>
                <td colspan="2"><asp:FileUpload ID="fu" runat="server" Width="100%" EnableViewState="true" /></td>
            </tr>
            <tr><td colspan="2">&nbsp;</td></tr>
            <tr>
                <td></td>
                <td align="right"><asp:Button ID="btnImport" runat="server" Text="Import" OnClick="btnImport_Click" /></td>
            </tr>
        </table>      

        <br />
        <br />

        Csv File must contain the following columns:<br />
        Reference, From City, To City, Cut Off Day(d/MM/yyyy), Arrival Day(d/MM/yyyy), Transit Time

        
    </td>
</tr>
</table>
       
<br />
<br />
        
<h2>Current Shipments</h2>
 
<asp:GridView ID="gvDeals" runat="server" AutoGenerateColumns="False" Width="100%">
    <Columns>
        <asp:BoundField DataField="ShipmentID" HeaderText="ID" />
        <asp:BoundField DataField="ShipmentRef" HeaderText="Ref." />
        <asp:BoundField DataField="FromCity" HeaderText="Departing From" />
        <asp:BoundField DataField="ToCity" HeaderText="Destinations" />
        <asp:BoundField DataField="CutoffDate" HeaderText="Cutoff Date" DataFormatString="{0:dd/MM/yy}" HtmlEncode="False"/>
        <asp:BoundField DataField="ArrivalDate" HeaderText="Arrival Date" DataFormatString="{0:dd/MM/yy}" HtmlEncode="False"/>
        <asp:BoundField DataField="TransitTime" HeaderText="Transit Days" />
        <asp:TemplateField HeaderText="Actions">
        <ItemTemplate>
            <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("ShipmentID")%>' OnClick="btnEdit_Click"/>
            <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("ShipmentID")%>' OnClick="btnDelete_Click"/>
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <RowStyle VerticalAlign="Top" />
    <HeaderStyle BorderColor="#3366cc" BorderStyle="Solid" BorderWidth="1px" BackColor="#e5ecf9" HorizontalAlign="Left"/>
    <AlternatingRowStyle BackColor="#F8F7F4"/>
</asp:GridView> 

</asp:Content>

