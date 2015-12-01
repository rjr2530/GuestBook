<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressBook.aspx.cs" Inherits="SimpleAddressBook.AddressBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Address Book</title>
    <style type="text/css">
        h1 {
            background-color: #3399FF;
            text-align: center;
            font-size: 50px;
        }
        body {
            width: 80%;
            margin-left: auto;
            margin-right:auto;
        }
        .gridStyle {
            width: 100%;
        }
        .notFound {
            color: #FF0000;
            font-size: 30px;
        }
        .welcome {
            font-weight: bold;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Label runat="server" ID="UserLabel" CssClass="welcome"></asp:Label>
        &nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Logout</asp:LinkButton>
&nbsp;<h1>&nbsp;Address Book</h1>
        <p>
            <asp:Label ID="contactNotFoundLabel" runat="server" CssClass="notFound" Text="Contact not found" Visible="False"></asp:Label>
            <asp:GridView ID="contactGridView" runat="server" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" CssClass="gridStyle"
                 DataKeyNames="AddressID" OnRowDeleting="contactGridView_RowDeleting" AutoGenerateEditButton="True" OnRowCancelingEdit="contactGridView_RowCancelingEdit" OnRowEditing="contactGridView_RowEditing"  OnRowUpdating="contactGridView_RowUpdating">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#3399FF" Font-Bold="True" ForeColor="Black" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#99CCFF" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                <Columns>
                    <asp:BoundField DataField="AddressID" HeaderText="Address ID" Visible="false" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Phone" HeaderText="Phone" ItemStyle-HorizontalAlign ="Center" >
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-HorizontalAlign="Center">
<ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </p>
        <p>
            <asp:Label ID="Label1" runat="server" Text="Find contact by last name: "></asp:Label>
&nbsp;<asp:TextBox ID="findTextBox" runat="server" Height="19px"  Width="160px"></asp:TextBox>
        &nbsp;<asp:Button ID="findButton" runat="server" OnClick="findButton_Click" Text="Find" Width="77px" />
        &nbsp;<br />
            <br />
            <asp:Button ID="browseButton" runat="server" OnClick="browseButton_Click" Text="Browse All" />
        &nbsp;&nbsp;&nbsp;
            <asp:Button ID="addContactButton" runat="server" OnClick="addContactButton_Click" Text="Add Contact" />
        </p>
    
    </div>
    </form>
</body>
</html>
