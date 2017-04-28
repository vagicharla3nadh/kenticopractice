<%@ Page Title="International Deals Administration" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="DealsAdminInternational.aspx.cs" Inherits="admin_DealsAdminInternational" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph1" Runat="Server">

    <h1>International Deals Administration</h1>

<table width="100%">
<tr>
    <td valign="top" style="width:50%">
	    <h2>New Shipment</h2>
		
        <asp:Label ID="lbMessage" runat="server" EnableViewState="false" Font-Bold="true" ForeColor="red" /><br />
		
        <asp:HiddenField ID="hdDealID" runat="server" />
		
        Departing From:<br />
        <asp:DropDownList ID="ddDepartingFrom" runat="server" Width="140px"/>
        <br />
        <br />
        Reference / Container No:<br />
        <asp:TextBox ID="txtDealRef" runat="server" Width="140px"/>
        <br />
        <br />
        Date Closing:<br />
        <uc:DatePicker id="ctrlDateClosing" runat="server"/>
        <br />
        Destination Region:<br />
        <asp:TextBox ID="txtDestinationRegion" runat="server" Width="140px"/>
        <br />
        <br />
        Destination Port:<br />
        <asp:TextBox ID="txtDestinationPort" runat="server" Width="140px"/>
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
        Reference, Destination Region, Destination Port, Date Closing(d/MM/yyyy), Departing From
        
    </td>
</tr>
</table>

    <br />
    <br />
        
    <h2>Current Shipments</h2>
 
    <asp:GridView ID="gvDeals" runat="server" AutoGenerateColumns="false" Width="740px">
    <Columns>
        <asp:BoundField DataField="DealRef" HeaderText="Ref/Container No." />
        <asp:BoundField DataField="DestinationRegion" HeaderText="Destination Region" />
        <asp:BoundField DataField="DestinationPort" HeaderText="Destination Port" />
        <asp:BoundField DataField="DateClosing" HeaderText="Date Closing" DataFormatString="{0:dd/MM/yy}" HtmlEncode="false"/>
        <asp:TemplateField HeaderText="Actions">
        <ItemTemplate>
            <asp:LinkButton ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Eval("DealID")%>' OnClick="btnEdit_Click"/>
            <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Eval("DealID")%>' OnClick="btnDelete_Click"/>
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <HeaderStyle BorderColor="#3366cc" BorderStyle="Solid" BorderWidth="1px" BackColor="#e5ecf9" HorizontalAlign="Left"/>
    <RowStyle VerticalAlign="Top" />
    </asp:GridView> 
         
</asp:Content>

