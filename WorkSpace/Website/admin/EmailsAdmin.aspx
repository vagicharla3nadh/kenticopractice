<%@ Page Title="Emails Administration" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EmailsAdmin.aspx.cs" Inherits="admin_EmailsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph1" Runat="Server">

<h1>Emails Administration</h1>
		
<div>
    Created between <uc:DatePicker ID="calFrom" runat="server" /> And <uc:DatePicker ID="calTo" runat="server" /> Quote No <asp:TextBox ID="txtQuoteNo" runat="server" Columns="6"/> 
    <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" />
</div>  
<br /> 
<asp:Literal ID="litEmailSent" runat="server" EnableViewState="false" />
<asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="50" onsorting="gv_Sorting" onpageindexchanging="gv_PageIndexChanging" EnableViewState="false">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <asp:LinkButton ID="btnResend" runat="server" Text="Resend" CommandArgument='<%#Eval("QuoteID")%>' onclick="btnResend_Click" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="QuoteID" HeaderText="No" SortExpression="QuoteID"/>
        <asp:BoundField DataField="QuoteType" HeaderText="Q/E" SortExpression="QuoteType" />
        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
        <asp:TemplateField HeaderText="Email" SortExpression="Email">
            <ItemTemplate>
            <%#FormatEmail(Eval("Email") as string) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="DayPhone" HeaderText="Phone" SortExpression="DayPhone" />
        <asp:BoundField DataField="CreatedOn" HtmlEncode="false" DataFormatString="{0:dd/MM/yy<br/>h:mm tt}" HeaderText="Created" SortExpression="CreatedOn" ItemStyle-Width="85px" />
        <asp:BoundField DataField="CompletedOn" HtmlEncode="false" DataFormatString="{0:dd/MM/yy<br/>h:mm tt}" HeaderText="Completed" SortExpression="CompletedOn" ItemStyle-Width="85px" />
        <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
            <ItemTemplate>
            <%#FormatComment(Eval("Comments") as string) %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="FromCity" HeaderText="City" SortExpression="FromCity" />
        <asp:BoundField DataField="FromCountry" HeaderText="Country" SortExpression="FromCountry" />
    </Columns>
    <RowStyle VerticalAlign="Top" />
    <HeaderStyle BorderColor="#3366cc" BorderStyle="Solid" BorderWidth="1px" BackColor="#e5ecf9" HorizontalAlign="Left"/>
    <AlternatingRowStyle BackColor="#F8F7F4"/>
</asp:GridView>

</asp:Content>

