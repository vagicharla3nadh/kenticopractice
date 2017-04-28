<%@ Page Title="Moving to NZ - Emails Administration" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="MovingToNZAdmin.aspx.cs" Inherits="admin_MovingToNZAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cph1" Runat="Server">

    <h2>Moving to NZ - Emails Administration</h2>
		
    <div>
        Created between <uc:DatePicker ID="calFrom" runat="server" /> And <uc:DatePicker ID="calTo" runat="server" />  
        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" />
    </div>  
    <br /> 
    <asp:Literal ID="litEmailSent" runat="server" EnableViewState="false" />
    <asp:GridView ID="gv" runat="server" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true" PageSize="50" onsorting="gv_Sorting" onpageindexchanging="gv_PageIndexChanging" EnableViewState="false" >
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btnResend" runat="server" Text="Resend" CommandArgument='<%#Eval("EmailID")%>' onclick="btnResend_Click" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EmailID" HeaderText="ID" SortExpression="EmailID"/>
                
            <asp:TemplateField ItemStyle-Width="100" HeaderText="From Email" SortExpression="FromAddress">
                <ItemTemplate>
                <%#FormatEmail(Eval("FromAddress") as string) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="SortCreatedOn" HtmlEncode="false" DataFormatString="{0:dd/MM/yy<br/>h:mm tt}" HeaderText="Created" SortExpression="SortCreatedOn" ItemStyle-Width="85px" />
                
            <asp:TemplateField HeaderText="Comments" SortExpression="Body">
                <ItemTemplate>
                <%#FormatComment(Eval("Body") as string) %>
                </ItemTemplate>
            </asp:TemplateField>
                
        </Columns>
        <RowStyle VerticalAlign="Top" />
        <HeaderStyle BorderColor="#3366cc" BorderStyle="Solid" BorderWidth="1px" BackColor="#e5ecf9" HorizontalAlign="Left"/>
        <AlternatingRowStyle BackColor="#F8F7F4"/>
    </asp:GridView>

</asp:Content>

