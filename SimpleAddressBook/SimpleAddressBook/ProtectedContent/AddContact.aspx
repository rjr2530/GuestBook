<%@ Page Title="Add Contact" Language="C#" AutoEventWireup="true" CodeBehind="AddContact.aspx.cs" Inherits="SimpleAddressBook.AddContact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Page.Title</title>
    <style type="text/css">
        h1 {
            font-size: 50px;
            background-color: #3399FF;
            text-align: center;
        }
        body {
            width: 80%;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Add Contact</h1>
        <table cellspacing="5">
            <tr>
                <td>First Name:</td>
                <td>
                    <asp:TextBox ID="firstNameTextBox" runat="server" Width="155px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="firstNameRequiredFieldValidator" runat="server" ControlToValidate="firstNameTextBox" Display="Dynamic" ErrorMessage="Please enter a first name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Last Name:</td>
                <td>
                    <asp:TextBox ID="lastNameTextBox" runat="server" Width="155px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="lastNameRequiredFieldValidator" runat="server" ControlToValidate="lastNameTextBox" ErrorMessage="Please enter a last name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <asp:TextBox ID="phoneTextBox" runat="server" Width="155px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="phoneRegularExpressionValidator" runat="server" ControlToValidate="phoneTextBox" Display="Dynamic" ErrorMessage="Please enter phone number in correct format" ForeColor="Red" ValidationExpression="((\(\d{3}\) ?)|(\d{3}-))?\d{3}-\d{4}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" Width="155px"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="emailRegularExpressionValidator" runat="server" ControlToValidate="emailTextBox" Display="Dynamic" ErrorMessage="Please enter email in correct format" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:Button ID="submitButton" runat="server" OnClick="submitButton_Click" Text="Submit" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="clearButton" runat="server" Text="Clear" Width="61px" OnClick="clearButton_Click" />
    
    </div>
    </form>
</body>
</html>
